Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62520CD98F2
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jun 2026 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+QfWqJpMHzqjlN+uo9udP0Tr71dK+AMMQweieefzuM=; b=OMPaAL0WJiiJZUz15aFjmT5XCg
	UmW2E21JOT8BkW2AcqxpjnLmBh+o/gkvgSeWVawxJRaBg0dZ4wANJRFEmyo3O0J+Wi1nnnt0iTAEj
	qN76HYKVK1tRdogxGcfgmE0+I/CZA7YJzZMI+y8P4H/SbDJXMY9J6ZgXSiw57Ry8MaS82eAhRHnE+
	473vvB5OuEws/jNeA0Eburk+tiR2ipLL0LlCAKlMtNRQ/HV5/Si7GFyLogjvZdkli2LiszswpEXNc
	cHPnZobJqyzcTCfhsQErLTqQyssUqPC1puJjCBrQoXNEJ9GXD22ZyF+Rmn8VPrR40Mwvq+NP3O5fo
	C18btb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbdFg-00000004wP0-45aC;
	Mon, 22 Jun 2026 11:55:44 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbdFe-00000004wOf-1q17
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jun 2026 11:55:43 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-9157b94a07aso447460185a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Jun 2026 04:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782129340; x=1782734140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+QfWqJpMHzqjlN+uo9udP0Tr71dK+AMMQweieefzuM=;
        b=sbdIT3XFHptk4zgnd38YVVNiOkwrVWgiEF9esJzvTs6H5lzt2knxjwu3gSN75l+tkP
         OeB4pjAMjBX74UYshqQOgnFekZ5pSuMVxEDtdT3Av2KXReZawvqTlC+GfiWIgWGxLsX/
         ulzv3wD//5mQ/zKMBQG6H7VYdFJm+fooM1wq+6vei0pX6E8ObKRLAI9qgUyHzWB+oyl3
         ZOs/9/Q6qz17jPzMFoXvXae5k/59jJtUAHkMKlIOMTslQBoVipj/aawQFSKg5zux6+V+
         WQOu97RXZ3UcIqfBaApmvb3eMxQxtmvD2m665AlEOvE3E/dvLjNSE8W7xeIyeSssjsX5
         UMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782129340; x=1782734140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o+QfWqJpMHzqjlN+uo9udP0Tr71dK+AMMQweieefzuM=;
        b=iIaXK8ZWaPmuRP+9Yq4Ig5CFN4EjBbV35GkM5sruIO2+n1osKC2Do4g2TuKXTZEGYI
         K6eQPSrQn4GGmAu+P2fxh9HQcwTsMPveMbZX1Jw5lLhEHTBWAqOWHLwVfhzk0evuEkZm
         p+s5dLbZCke561D5jc26UbgX5268JccG6gAtFsGUv4AwpC4OfXDJJqIxV+lapQGXYNZP
         HKszEh04UkRDGunPOdhQ1LKNoyYTuh74xl7LJ1VCJKgrE6kbyX23+7YkCweYEpoHICQs
         BRGYkMx6nH4ToF4L9xweaLh7xPxDKT9LcuKVllTAzCQXrv73MjpK/Ty9FE0R+bXMHcUc
         p/iw==
X-Forwarded-Encrypted: i=1; AFNElJ94+VZ2bR9LbF0i/V5Mz6xIFsKSEcw65TMNcTbXmusX0LazBzT+aDBf3AD4sA/zmcRKMJBR4YpDDfwudvNVgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/ziIj/XVNleYQM27zwSqz4/ZB9LcB4K490nN0nJHh+pMRMpfJ
	lyXMp4yWDAJhEDs/reOT93p0GAxwjXumC2ZJNLS0QNVpeHBT9Gw7fIQ=
X-Gm-Gg: AfdE7clms271Qen9a64N64NyQeRX5RkCyXzxEfLamZ3FumT5yOJPlpDDkpa5c43YpPH
	T3hEjpyfsIYU4zhI6NK260Fla200AV3KMql92biPa5d0vuvXRcBZKWNChNeeb+fqfYUOGiVzSRt
	rg3iSfmuObOTRNk8CKHoRM4mHK+eo+i9yTgSjmCJIG1vsemcYrG9+JEuBKgfzq4w04wzZQCpOlG
	POAxN+nbycsAC5AmT7kCvEcybiHoyrOjsYCQxeIW8E4L29qkZgDC/S8ADXYpseZtFJUTdAZoaLl
	80ZgPQI1YCkkJVNGhI5HD3+2xEdnkmJ1N5XQYTmo432E+FFfG61RaKbVR2NdpQd6DxafD/KIQ+U
	KwC7l0YeeTEvHop3Qd8SbUxBGwThoNddflGHrDFhQyI6RrGn+D1+xXpMI5VZ/haHNVU+b+EKScY
	/Z49k67hLA2/0+jlBmXcTIbWyZhAjlzlslLlkPTFjaBg==
X-Received: by 2002:a05:620a:2419:20b0:922:e670:9e83 with SMTP id af79cd13be357-922e6709ff3mr777571185a.42.1782129340108;
        Mon, 22 Jun 2026 04:55:40 -0700 (PDT)
Received: from matheus-note.localnet ([2804:7f0:bac3:7a3e:53ef:6965:d89d:38da])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-921db06174dsm903425485a.33.2026.06.22.04.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 04:55:39 -0700 (PDT)
From: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Markus Gothe <markus.gothe@genexis.eu>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: Re: [PATCH v5 16/16] pinctrl: airoha: add support of an7563 SoC
Date: Mon, 22 Jun 2026 08:55:33 -0300
Message-ID: <kNxYkw2WQ92M6zgbpnkZ0w@gmail.com>
In-Reply-To: <20260622113046.3619139-17-mikhail.kshevetskiy@iopsys.eu>
References: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
 <20260622113046.3619139-17-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_045542_577677_17CC0525 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Em segunda-feira, 22 de junho de 2026, =C3=A0s 08:30:46 Hor=C3=A1rio Padr=
=C3=A3o de Bras=C3=ADlia,=20
Mikhail Kshevetskiy escreveu:
> +/*
> + * shared - named RG_SW_TOD_1PPS_MODE on AN7563. Only the LAN LED mode
> + * bits and GSW_TOD_1PPS exist on AN7563 (no 2nd I2C, I2S or PON 1PPS).
> + */
> +#define REG_GPIO_2ND_I2C_MODE                  0x0214
> +#define GPIO_LAN3_LED1_MODE_MASK               BIT(10)
> +#define GPIO_LAN3_LED0_MODE_MASK               BIT(9)
> +#define GPIO_LAN2_LED1_MODE_MASK               BIT(8)
> +#define GPIO_LAN2_LED0_MODE_MASK               BIT(7)
> +#define GPIO_LAN1_LED1_MODE_MASK               BIT(6)
> +#define GPIO_LAN1_LED0_MODE_MASK               BIT(5)
> +#define GPIO_LAN0_LED1_MODE_MASK               BIT(4)
> +#define GPIO_LAN0_LED0_MODE_MASK               BIT(3)
> +#define GSW_TOD_1PPS_MODE_MASK                 BIT(1)
> +
> +/* shared */
> +#define REG_GPIO_SPI_CS1_MODE                  0x0218
> +#define GPIO_PCM_SPI_CS4_MODE_MASK             BIT(21)
> +#define GPIO_PCM_SPI_CS3_MODE_MASK             BIT(20)
> +#define GPIO_PCM_SPI_CS2_MODE_MASK             BIT(18)
> +#define GPIO_PCM_SPI_CS1_MODE_MASK             BIT(17)
> +#define GPIO_PCM_SPI_MODE_MASK                 BIT(16)
> +#define GPIO_PCM2_MODE_MASK                    BIT(13)
> +#define GPIO_PCM1_MODE_MASK                    BIT(12)
> +#define GPIO_PCM_INT_MODE_MASK                 BIT(9)
> +#define GPIO_PCM_RESET_MODE_MASK               BIT(8)
> +#define GPIO_SPI_QUAD_MODE_MASK                        BIT(4)
> +#define GPIO_SPI_CS4_MODE_MASK                 BIT(3)
> +#define GPIO_SPI_CS3_MODE_MASK                 BIT(2)
> +#define GPIO_SPI_CS2_MODE_MASK                 BIT(1)
> +#define GPIO_SPI_CS1_MODE_MASK                 BIT(0)
> +
> +#define REG_GPIO_PON_MODE                      0x021c
> +/*
> + * AN7563 specific: route the standalone pads to their GPIO function.
> + * 0: pad keeps its base function, 1: pad is GPIO<n>.
> + */
> +#define UART_RXD_GPIO_MODE_MASK                        BIT(22) /* GPIO37=
 */
> +#define UART_TXD_GPIO_MODE_MASK                        BIT(21) /* GPIO36
> */ +#define SPI_MISO_GPIO_MODE_MASK                        BIT(20) /*
> GPIO35 */ +#define SPI_MOSI_GPIO_MODE_MASK                        BIT(19)
> /* GPIO34 */ +#define SPI_CS_GPIO_MODE_MASK                  BIT(18) /*
> GPIO33 */ +#define SPI_CLK_GPIO_MODE_MASK                 BIT(17) /* GPIO=
32
> */ +#define I2C_SDA_GPIO_MODE_MASK                 BIT(16) /* GPIO31 */
> +#define I2C_SCL_GPIO_MODE_MASK                 BIT(15) /* GPIO30 */ +/*
> shared */
> +#define GPIO_PARALLEL_NAND_MODE_MASK           BIT(14)
> +#define GPIO_SGMII_MDIO_MODE_MASK              BIT(13)
> +#define SIPO_RCLK_MODE_MASK                    BIT(11)
> +/*
> + * Note: on AN7563 GPIO_PCIE_RESET{0,1} select the GPIO function of the
> + * PCIE_RESET pads (0: PCIe reset, 1: GPIO28/GPIO29).
> + */
> +#define GPIO_PCIE_RESET1_MASK                  BIT(10) /* GPIO29 */
> +#define GPIO_PCIE_RESET0_MASK                  BIT(9)  /* GPIO28 */
> +#define GPIO_HSUART_CTS_RTS_MODE_MASK          BIT(6)
> +#define GPIO_HSUART_MODE_MASK                  BIT(5)
> +#define GPIO_SIPO_MODE_MASK                    BIT(2)
> +#define GPIO_PON_MODE_MASK                     BIT(0)
> +
> +/* shared */
> +#define REG_NPU_UART_EN                                0x0224
> +#define JTAG_UDI_EN_MASK                       BIT(4)
> +#define JTAG_DFD_EN_MASK                       BIT(3)
> +
> +/* LED MAP - shared */
> +#define REG_LAN_LED0_MAPPING                   0x027c
> +#define REG_LAN_LED1_MAPPING                   0x0280
> +
> +#define LAN3_LED_MAPPING_MASK                  GENMASK(14, 12)
> +#define LAN3_PHY_LED_MAP(_n)                 =20
> FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, (_n)) +
> +#define LAN2_LED_MAPPING_MASK                  GENMASK(10, =F0=9F=98=8E
> +#define LAN2_PHY_LED_MAP(_n)                 =20
> FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, (_n)) +
> +#define LAN1_LED_MAPPING_MASK                  GENMASK(6, 4)
> +#define LAN1_PHY_LED_MAP(_n)                 =20
> FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, (_n)) +
> +#define LAN0_LED_MAPPING_MASK                  GENMASK(2, 0)
> +#define LAN0_PHY_LED_MAP(_n)                 =20
> FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, (_n)) +
> +/*
> + * CONF - shared.
> + * The AN7563 standalone IO conf registers use the same bit layout as
> + * EN7581 (UART1_TXD/RXD are named UART_TXD/RXD on AN7563).
> + */
> +#define REG_I2C_SDA_E2                         0x001c
> +#define SPI_MISO_E2_MASK                       BIT(14)
> +#define SPI_MOSI_E2_MASK                       BIT(13)
> +#define SPI_CLK_E2_MASK                                BIT(12)
> +#define SPI_CS0_E2_MASK                                BIT(11)
> +#define PCIE1_RESET_E2_MASK                    BIT(9)
> +#define PCIE0_RESET_E2_MASK                    BIT(8)
> +#define UART1_RXD_E2_MASK                      BIT(3)
> +#define UART1_TXD_E2_MASK                      BIT(2)
> +#define I2C_SCL_E2_MASK                                BIT(1)
> +#define I2C_SDA_E2_MASK                                BIT(0)
> +
> +#define REG_I2C_SDA_E4                         0x0020
> +#define SPI_MISO_E4_MASK                       BIT(14)
> +#define SPI_MOSI_E4_MASK                       BIT(13)
> +#define SPI_CLK_E4_MASK                                BIT(12)
> +#define SPI_CS0_E4_MASK                                BIT(11)
> +#define PCIE1_RESET_E4_MASK                    BIT(9)
> +#define PCIE0_RESET_E4_MASK                    BIT(8)
> +#define UART1_RXD_E4_MASK                      BIT(3)
> +#define UART1_TXD_E4_MASK                      BIT(2)
> +#define I2C_SCL_E4_MASK                                BIT(1)
> +#define I2C_SDA_E4_MASK                                BIT(0)
> +
> +#define REG_GPIO_L_E2                          0x0024
> +#define REG_GPIO_L_E4                          0x0028
> +
> +#define REG_I2C_SDA_PU                         0x0044
> +#define SPI_MISO_PU_MASK                       BIT(14)
> +#define SPI_MOSI_PU_MASK                       BIT(13)
> +#define SPI_CLK_PU_MASK                                BIT(12)
> +#define SPI_CS0_PU_MASK                                BIT(11)
> +#define PCIE1_RESET_PU_MASK                    BIT(9)
> +#define PCIE0_RESET_PU_MASK                    BIT(8)
> +#define UART1_RXD_PU_MASK                      BIT(3)
> +#define UART1_TXD_PU_MASK                      BIT(2)
> +#define I2C_SCL_PU_MASK                                BIT(1)
> +#define I2C_SDA_PU_MASK                                BIT(0)
> +
> +#define REG_I2C_SDA_PD                         0x0048
> +#define SPI_MISO_PD_MASK                       BIT(14)
> +#define SPI_MOSI_PD_MASK                       BIT(13)
> +#define SPI_CLK_PD_MASK                                BIT(12)
> +#define SPI_CS0_PD_MASK                                BIT(11)
> +#define PCIE1_RESET_PD_MASK                    BIT(9)
> +#define PCIE0_RESET_PD_MASK                    BIT(8)
> +#define UART1_RXD_PD_MASK                      BIT(3)
> +#define UART1_TXD_PD_MASK                      BIT(2)
> +#define I2C_SCL_PD_MASK                                BIT(1)
> +#define I2C_SDA_PD_MASK                                BIT(0)
> +
> +#define REG_GPIO_L_PU                          0x004c
> +#define REG_GPIO_L_PD                          0x0050
> +
> +#define REG_PCIE_RESET_OD                      0x018c
> +#define PCIE1_RESET_OD_MASK                    BIT(1)
> +#define PCIE0_RESET_OD_MASK                    BIT(0)
> +
> +/*
> + * PWM MODE CONF - shared.
> + * The AN7563 GPIO flash mode registers use the same layout as EN7581:
> + * REG_GPIO_FLASH_MODE_CFG covers GPIO0-15, REG_GPIO_FLASH_MODE_CFG_EXT
> + * covers GPIO16-31 (bits 0-15) and GPIO36+ (bits 16+). The SPI pads
> + * (GPIO32-35) have no flash mode configuration bit.
> + */
> +#define REG_GPIO_FLASH_MODE_CFG                        0x0034
> +#define GPIO15_FLASH_MODE_CFG                  BIT(15)
> +#define GPIO14_FLASH_MODE_CFG                  BIT(14)
> +#define GPIO13_FLASH_MODE_CFG                  BIT(13)
> +#define GPIO12_FLASH_MODE_CFG                  BIT(12)
> +#define GPIO11_FLASH_MODE_CFG                  BIT(11)
> +#define GPIO10_FLASH_MODE_CFG                  BIT(10)
> +#define GPIO9_FLASH_MODE_CFG                   BIT(9)
> +#define GPIO8_FLASH_MODE_CFG                   BIT(8)
> +#define GPIO7_FLASH_MODE_CFG                   BIT(7)
> +#define GPIO6_FLASH_MODE_CFG                   BIT(6)
> +#define GPIO5_FLASH_MODE_CFG                   BIT(5)
> +#define GPIO4_FLASH_MODE_CFG                   BIT(4)
> +#define GPIO3_FLASH_MODE_CFG                   BIT(3)
> +#define GPIO2_FLASH_MODE_CFG                   BIT(2)
> +#define GPIO1_FLASH_MODE_CFG                   BIT(1)
> +#define GPIO0_FLASH_MODE_CFG                   BIT(0)
> +
> +#define REG_GPIO_FLASH_MODE_CFG_EXT            0x0068
> +#define GPIO37_FLASH_MODE_CFG                  BIT(17)
> +#define GPIO36_FLASH_MODE_CFG                  BIT(16)
> +#define GPIO31_FLASH_MODE_CFG                  BIT(15)
> +#define GPIO30_FLASH_MODE_CFG                  BIT(14)
> +#define GPIO29_FLASH_MODE_CFG                  BIT(13)
> +#define GPIO28_FLASH_MODE_CFG                  BIT(12)
> +#define GPIO27_FLASH_MODE_CFG                  BIT(11)
> +#define GPIO26_FLASH_MODE_CFG                  BIT(10)
> +#define GPIO25_FLASH_MODE_CFG                  BIT(9)
> +#define GPIO24_FLASH_MODE_CFG                  BIT(8)
> +#define GPIO23_FLASH_MODE_CFG                  BIT(7)
> +#define GPIO22_FLASH_MODE_CFG                  BIT(6)
> +#define GPIO21_FLASH_MODE_CFG                  BIT(5)
> +#define GPIO20_FLASH_MODE_CFG                  BIT(4)
> +#define GPIO19_FLASH_MODE_CFG                  BIT(3)
> +#define GPIO18_FLASH_MODE_CFG                  BIT(2)
> +#define GPIO17_FLASH_MODE_CFG                  BIT(1)
> +#define GPIO16_FLASH_MODE_CFG                  BIT(0)
> +
> +#define AIROHA_PINCTRL_GPIO(gpio, mux_val)                     \
> +       {                                                       \
> +               .name =3D (gpio),                                 \
> +               .regmap[0] =3D {                                  \
> +                       AIROHA_FUNC_MUX,                        \
> +                       REG_GPIO_PON_MODE,                      \
> +                       (mux_val),                              \
> +                       (mux_val)                               \
> +               },                                              \
> +               .regmap_size =3D 1,                               \
> +       }
> +
> +#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)       \
> +       {                                                       \
> +               .name =3D (gpio),                                 \
> +               .regmap[0] =3D {                                  \
> +                       AIROHA_FUNC_PWM_EXT_MUX,                \
> +                       REG_GPIO_FLASH_MODE_CFG_EXT,            \
> +                       (mux_val),                              \
> +                       0                                       \
> +               },                                              \
> +               .regmap[1] =3D {                                  \
> +                       AIROHA_FUNC_MUX,                        \
> +                       REG_GPIO_PON_MODE,                      \
> +                       (smux_val),                             \
> +                       (smux_val)                              \
> +               },                                              \
> +               .regmap_size =3D 2,                               \
> +       }
> +
> +/* PWM */
> +#define AIROHA_PINCTRL_PWM(gpio, mux_val)                      \
> +       {                                                       \
> +               .name =3D (gpio),                                 \
> +               .regmap[0] =3D {                                  \
> +                       AIROHA_FUNC_PWM_MUX,                    \
> +                       REG_GPIO_FLASH_MODE_CFG,                \
> +                       (mux_val),                              \
> +                       (mux_val)                               \
> +               },                                              \
> +               .regmap_size =3D 1,                               \
> +       }
> +
> +#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)                  \
> +       {                                                       \
> +               .name =3D (gpio),                                 \
> +               .regmap[0] =3D {                                  \
> +                       AIROHA_FUNC_PWM_EXT_MUX,                \
> +                       REG_GPIO_FLASH_MODE_CFG_EXT,            \
> +                       (mux_val),                              \
> +                       (mux_val)                               \
> +               },                                              \
> +               .regmap_size =3D 1,                               \
> +       }
> +
> +#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)    \
> +       {                                                       \
> +               .name =3D (gpio),                                 \
> +               .regmap[0] =3D {                                  \
> +                       AIROHA_FUNC_PWM_EXT_MUX,                \
> +                       REG_GPIO_FLASH_MODE_CFG_EXT,            \
> +                       (mux_val),                              \
> +                       (mux_val)                               \
> +               },                                              \
> +               .regmap[1] =3D {                                  \
> +                       AIROHA_FUNC_MUX,                        \
> +                       REG_GPIO_PON_MODE,                      \
> +                       (smux_val),                             \
> +                       (smux_val)                              \
> +               },                                              \
> +               .regmap_size =3D 2,                               \
> +       }
> +
> +#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)      \
> +       {                                                               \
> +               .name =3D (gpio),                                        =
 \
> +               .regmap[0] =3D {                                         =
 \
> +                       AIROHA_FUNC_MUX,                                \
> +                       REG_GPIO_2ND_I2C_MODE,                          \
> +                       (mux_val),                                      \
> +                       (mux_val),                                      \
> +               },                                                      \
> +               .regmap[1] =3D {                                         =
 \
> +                       AIROHA_FUNC_MUX,                                \
> +                       REG_LAN_LED0_MAPPING,                           \
> +                       (map_mask),                                     \
> +                       (map_val),                                      \
> +               },                                                      \
> +               .regmap_size =3D 2,                                      =
 \
> +       }
> +
> +#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)      \
> +       {                                                               \
> +               .name =3D (gpio),                                        =
 \
> +               .regmap[0] =3D {                                         =
 \
> +                       AIROHA_FUNC_MUX,                                \
> +                       REG_GPIO_2ND_I2C_MODE,                          \
> +                       (mux_val),                                      \
> +                       (mux_val),                                      \
> +               },                                                      \
> +               .regmap[1] =3D {                                         =
 \
> +                       AIROHA_FUNC_MUX,                                \
> +                       REG_LAN_LED1_MAPPING,                           \
> +                       (map_mask),                                     \
> +                       (map_val),                                      \
> +               },                                                      \
> +               .regmap_size =3D 2,                                      =
 \
> +       }

These defines are similar to what we have in airoha-common.h, whatever is n=
ot=20
the same add the define with the prefix and the defines that exist only hav=
e a=20
different regmap, move to the add in the define parameter, do as was done i=
n=20
en7523



