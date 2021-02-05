<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\PromotionRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ApiResource()
 * @ORM\Entity(repositoryClass=PromotionRepository::class)
 */
class Promotion
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=180)
     */
    private $code;

    /**
     * @ORM\Column(type="string", length=180)
     */
    private $category;

    /**
     * @ORM\Column(type="integer")
     */
    private $sale;

    /**
     * @ORM\Column(type="boolean")
     */
    private $usecode;

    /**
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCode(): ?string
    {
        return $this->code;
    }

    public function setCode(string $code): self
    {
        $this->code = $code;

        return $this;
    }

    public function getCategory(): ?string
    {
        return $this->category;
    }

    public function setCategory(string $category): self
    {
        $this->category = $category;

        return $this;
    }

    public function getSale(): ?int
    {
        return $this->sale;
    }

    public function setSale(int $sale): self
    {
        $this->sale = $sale;

        return $this;
    }

    public function getUsecode(): ?bool
    {
        return $this->usecode;
    }

    public function setUsecode(bool $usecode): self
    {
        $this->usecode = $usecode;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }
}
