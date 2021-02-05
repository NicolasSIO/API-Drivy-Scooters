<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\TrajetRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ApiResource()
 * @ORM\Entity(repositoryClass=TrajetRepository::class)
 */
class Trajet
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="datetime")
     */
    private $depart;

    /**
     * @ORM\Column(type="datetime")
     */
    private $arrivee;

    /**
     * @ORM\Column(type="integer")
     */
    private $time;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="trajets")
     * @ORM\JoinColumn(nullable=false)
     */
    private $username;


    /**
     * @ORM\Column(type="float")
     */
    private $cout;


    /**
     * @ORM\OneToOne(targetEntity=Evaluation::class, mappedBy="trajet", cascade={"persist", "remove"})
     */
    private $evaluation;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDepart(): ?\DateTimeInterface
    {
        return $this->depart;
    }

    public function setDepart(\DateTimeInterface $depart): self
    {
        $this->depart = $depart;

        return $this;
    }

    public function getArrivee(): ?\DateTimeInterface
    {
        return $this->arrivee;
    }

    public function setArrivee(\DateTimeInterface $arrivee): self
    {
        $this->arrivee = $arrivee;

        return $this;
    }

    public function getTime(): ?int
    {
        return $this->time;
    }

    public function setTime(int $time): self
    {
        $this->time = $time;

        return $this;
    }

    public function getUsername(): ?User
    {
        return $this->username;
    }

    public function setUsername(?User $username): self
    {
        $this->username = $username;

        return $this;
    }


    public function getCout(): ?float
    {
        return $this->cout;
    }

    public function setCout(float $cout): self
    {
        $this->cout = $cout;

        return $this;
    }


    public function getEvaluation(): ?Evaluation
    {
        return $this->evaluation;
    }

    public function setEvaluation(?Evaluation $evaluation): self
    {
        // unset the owning side of the relation if necessary
        if ($evaluation === null && $this->evaluation !== null) {
            $this->evaluation->setTrajet(null);
        }

        // set the owning side of the relation if necessary
        if ($evaluation !== null && $evaluation->getTrajet() !== $this) {
            $evaluation->setTrajet($this);
        }

        $this->evaluation = $evaluation;

        return $this;
    }
}
