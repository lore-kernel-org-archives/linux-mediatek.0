Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05AE606A321
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 16:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R3V/aqMm;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ox4qw2Bl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=F33PfOK0msjzeBxtvP6gRqlD2SQxJhJCJJqwD2eVgsE=; b=R3V/aqMm0ypZnZBb7OzMFgNzUE
	CYCvRZmDnVZr0kRIweRdo5haky9UjxoXG7Rc0MszM0mjsffkwzV6D8Sjrnkp3wniX7ZexsEQqfYqU
	bbQnnMcD08ziI6NL6kn0Eeeky202aoP8a93CKFn4pmhWRl8E7ogRpNYeypy269P7QCpcVl1235+M3
	nAPIZIemP9stZQwhcOETrjzcKfsP0aJiuatLpdNPM2V2ZIHCkbsGx3kQqwUSlgYzD8bGcehtS51pc
	/Oq9RRz5tl8dEAGGJTP4twe/Zcffta7VZ+miupVxc0CLch20hDg4PW+aoaLE9TccH2s3IeRyRTY1M
	oUQrxW/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFs7-0000000AYaN-29M4;
	Wed, 25 Nov 2026 16:29:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrR-0000000AYOq-3e14
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 16:29:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so51024885e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 08:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624116; x=1796228916; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F33PfOK0msjzeBxtvP6gRqlD2SQxJhJCJJqwD2eVgsE=;
        b=ox4qw2BldEcNONUt17NbqI0nV1dJjcKUMhc9qmEf4LQM3U/t20BZhnH2iQBaO5CoN0
         6XMxHSPT7krkyCoUkqXHFXSjwEOnFgnKMnyAtNE7RUibp7b83Ot5miVCtM4PIu7RRhJ8
         raJg/v4I8Coea1GrFB52qTYoU1opvz/W5t/x1ef1mMA2gq8QlFDvHcHfNvZ+4wkE7k16
         yPDMfRRdu8V3urBui+kMMg2PtVMClhiwCm1/TpJFCE03zsErXilnqqPYsVVbk3b/4d08
         SipEmpeBpEd4rcGs+YTAmFKIZtKo8ZhH+ndQjN6t1PvU9anWwCzWXdOnrh1DiQTQrSFK
         27ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624116; x=1796228916;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F33PfOK0msjzeBxtvP6gRqlD2SQxJhJCJJqwD2eVgsE=;
        b=0rAUdeZJoo1BhVt3w1KjLDRhQBXntgmJclrnFFV0etomnhAGtQnbZqNcb4mNliDITf
         4HPPYeMtWP9PeQ3RVxd1eq45G5cLryEahELMpwQqNT6YrA3jbfd9RrA8f8xnnbEbnWR/
         ox1bjLCTA9u6JSDcwCZ1o2fpy/LrUeSQycOotkDGn2iSszdV5QZVll/wicUMLI0+kGcR
         bRrH1aOdOu9/oGfNJc7ufxSJWUn9RH2nX0Djw0xp1r8+Y4O8ePrwVV5KfLVjKD3jjFxH
         Uu4O0pxC81mmqDfLcRmoL8OD8HvZ9FNDWiHaZKrQkpYpyhErO2CgG+K3nf6bkoOSMl3c
         WiEA==
X-Forwarded-Encrypted: i=1; AL+hErGAE7RYFnTAKcMjNIsnhRaXbHQYPgcl6nHubpPag14/ZmSTUf0kDCdUEGJnPJmk1tHA1fbQdrA0FnGddkL07A==@lists.infradead.org
X-Gm-Message-State: APuU4Z/UEm5klqS/HZRqDK2Zd3HUijFNLcbI0iC+4K2tpDs1yop7/ltM
	Kk4Thh22A6tCbw8Hckh0y3GY6c3UAy3i1aTrNU2t4UGJts6azBINswrwK5J36O09kLk=
X-Gm-Gg: AZFdTZccFk6jQT2xB2GrHsu2eyWZwS/Y79YpyEv1aVCyjfzDoGQgqD6N4Z0iuujwE6U
	EGLp2hLct8l8FAptFGbGDz5WnKRoJuyTtbbcikugr637/AFmxCBcMjkrovjcR///+IhZrb/3TFj
	uQOvbZnAJJ3lMS8YiOb6h701dQ7NsoooDhVg3oRWRLTSHuaR6e3scdCQFlZMfItF7WFws2Yjkse
	xja0sc+pbuA0DnEZcqOi7dluag4q4o9A9mfuw2LnIw7ahToGIaUhLUDSupYz5EeefglVtBA1sB/
	Th5hZDCu5M4wWp+SSt5Uxcmb3s3uWOJ3GJDVB73Wxx64ThXpQP4ZevtXn9Qoe+SQJTlx//3FJzp
	WSSG8Nd4HhJQ37OB1jMmmtmoHkXLHdW9KHQ4PgLrG18CqnVn5UPEF1H+vDCG0Yz8JDJErTUolVk
	9BfwHXyKAx4UxUI5lh/sH/YpEtM2pCLQ+DO7jtFkEI2JTp3yT3Xn0htI3F3ZDFpFhU4w13TTmU7
	Xo6rbWQMQl958sodhl9ULDmyRc5sGQT8Z4WczTmv7x+eJHwqFj+w8KH5skipWcPPQFGxZHg9SdY
	wr4PTNihNVx40qbhiXZ9pwoc/L2ZYQF9+Sdjs2t9rihgNZafXeGG5B3gZMNu+sc+obE=
X-Received: by 2002:a05:600c:5395:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4bb8880e599mr376023745e9.8.1795624116009;
        Wed, 25 Nov 2026 08:28:36 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:35 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
Date: Wed, 25 Nov 2026 16:28:26 +0000
Message-Id: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBCF4avErBPUSqirRAvTqSbIQi2C6O5ZL
 T/437sgoCcM0GQXeDwo0OoSRJ6BmbQbkZFNBsmlEkIWTJuN2BIt4zgoXXHLy9pCyjePA53fVdv
 9Dns/o4nvHu77AVc++4JsAAAA
X-Change-ID: 20261123-acpi-mtd-0ef6a50d049d
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=7528;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=5meG2QA5zHmWMtBw+F49CrqQgn4FVKx2LdaJonRgfn8=;
 b=VsRd3x/iYztgIPcpTxO4VQupjJr1Sy2+c/9eTKQar8LJIPG9KJ1ebtAJORbrWf8vSzuEg1YpX
 faQork5qqUYCOdbRXiu56hLw5mIk8BvbvFb2W3hRkqwPWXFxr+5Gj8A
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_082846_217213_BAB0F523 
X-CRM114-Status: GOOD (  14.12  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series is converting lists that contain the *_device_id structs,
to make use of named initializers (which they do not use currently).
This work is part of the on going effort in the kernel associated with
device-ids [1]

The plan is to convert *_device_id::driver_data to have an anonymous
union, like it was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces for that field.
This effort is split per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member (which is not needed in the mtd subsystem)

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

Patches 1-3 implement the named initializer change.
Patched 4-10 are just churn to unify the list termination and can be dropped.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Pawel Zalewski (10):
      mtd: maps: pismo: Use named initializers for i2c_device_id
      mtd: spi-nor: Use named initializers for spi_device_id
      mtd: maps: int0800: Use named initializers for acpi_device_id
      mtd: spi-nor: Unify of_device_id list terminator
      mtd: devices: Unify *_device_id list terminator.
      mtd: nand: raw: Unify list terminator for *_device_id lists
      mtd: hyperbus: Unify list terminator for *_device_id lists
      mtd: maps: Unify list terminator for of_device_id lists
      mtd: nand: Unify list terminator for *_device_id lists
      mtd: parsers: Unify list terminator for of_device_id lists

 drivers/mtd/devices/docg3.c                        |  2 +-
 drivers/mtd/devices/mchp23k256.c                   |  4 +-
 drivers/mtd/devices/mchp48l640.c                   |  4 +-
 drivers/mtd/devices/mtd_dataflash.c                |  8 +--
 drivers/mtd/devices/mtd_intel_dg.c                 |  4 +-
 drivers/mtd/devices/phram.c                        |  2 +-
 drivers/mtd/devices/powernv_flash.c                |  2 +-
 drivers/mtd/devices/spear_smi.c                    |  2 +-
 drivers/mtd/devices/st_spi_fsm.c                   |  2 +-
 drivers/mtd/hyperbus/hbmc-am654.c                  |  2 +-
 drivers/mtd/hyperbus/rpc-if.c                      |  2 +-
 drivers/mtd/maps/int0800.c                         |  2 +-
 drivers/mtd/maps/lantiq-flash.c                    |  2 +-
 drivers/mtd/maps/physmap-versatile.c               |  4 +-
 drivers/mtd/maps/pismo.c                           |  4 +-
 drivers/mtd/maps/sun_uflash.c                      |  2 +-
 drivers/mtd/nand/ecc-mtk.c                         |  2 +-
 drivers/mtd/nand/ecc-mxic.c                        |  2 +-
 drivers/mtd/nand/ecc-realtek.c                     |  2 +-
 drivers/mtd/nand/onenand/onenand_omap2.c           |  2 +-
 drivers/mtd/nand/onenand/onenand_samsung.c         |  3 +-
 drivers/mtd/nand/raw/ams-delta.c                   |  7 +-
 drivers/mtd/nand/raw/arasan-nand-controller.c      |  2 +-
 drivers/mtd/nand/raw/atmel/nand-controller.c       |  4 +-
 drivers/mtd/nand/raw/atmel/pmecc.c                 |  4 +-
 drivers/mtd/nand/raw/brcmnand/bcm6368_nand.c       |  2 +-
 drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c        |  2 +-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c           |  2 +-
 drivers/mtd/nand/raw/brcmnand/brcmstb_nand.c       |  2 +-
 drivers/mtd/nand/raw/brcmnand/iproc_nand.c         |  2 +-
 drivers/mtd/nand/raw/cadence-nand-controller.c     |  3 +-
 drivers/mtd/nand/raw/davinci_nand.c                |  2 +-
 drivers/mtd/nand/raw/denali_dt.c                   |  2 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c               |  2 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c                |  2 +-
 drivers/mtd/nand/raw/fsl_upm.c                     |  2 +-
 drivers/mtd/nand/raw/fsmc_nand.c                   |  2 +-
 drivers/mtd/nand/raw/gpio.c                        |  2 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c         |  2 +-
 drivers/mtd/nand/raw/hisi504_nand.c                |  2 +-
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c    |  2 +-
 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c         |  2 +-
 drivers/mtd/nand/raw/ingenic/jz4740_ecc.c          |  2 +-
 drivers/mtd/nand/raw/ingenic/jz4780_bch.c          |  2 +-
 drivers/mtd/nand/raw/intel-nand-controller.c       |  2 +-
 drivers/mtd/nand/raw/loongson-nand-controller.c    |  2 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c                 |  2 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c                 |  2 +-
 drivers/mtd/nand/raw/marvell_nand.c                |  4 +-
 drivers/mtd/nand/raw/meson_nand.c                  |  2 +-
 drivers/mtd/nand/raw/mpc5121_nfc.c                 |  2 +-
 drivers/mtd/nand/raw/mtk_nand.c                    |  2 +-
 drivers/mtd/nand/raw/mxc_nand.c                    |  2 +-
 drivers/mtd/nand/raw/mxic_nand.c                   |  2 +-
 drivers/mtd/nand/raw/ndfc.c                        |  2 +-
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  |  2 +-
 drivers/mtd/nand/raw/omap_elm.c                    |  2 +-
 drivers/mtd/nand/raw/orion_nand.c                  |  2 +-
 drivers/mtd/nand/raw/pasemi_nand.c                 |  2 +-
 drivers/mtd/nand/raw/pl35x-nand-controller.c       |  2 +-
 drivers/mtd/nand/raw/plat_nand.c                   |  2 +-
 drivers/mtd/nand/raw/qcom_nandc.c                  |  2 +-
 drivers/mtd/nand/raw/rockchip-nand-controller.c    |  2 +-
 drivers/mtd/nand/raw/sh_flctl.c                    |  2 +-
 drivers/mtd/nand/raw/socrates_nand.c               |  2 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             |  2 +-
 drivers/mtd/nand/raw/sunxi_nand.c                  |  2 +-
 drivers/mtd/nand/raw/technologic-nand-controller.c |  2 +-
 drivers/mtd/nand/raw/tegra_nand.c                  |  2 +-
 drivers/mtd/nand/raw/vf610_nfc.c                   |  2 +-
 drivers/mtd/nand/raw/xway_nand.c                   |  2 +-
 drivers/mtd/nand/spi/core.c                        |  4 +-
 drivers/mtd/parsers/afs.c                          |  2 +-
 drivers/mtd/parsers/bcm47xxpart.c                  |  2 +-
 drivers/mtd/parsers/bcm63xxpart.c                  |  2 +-
 drivers/mtd/parsers/brcm_u-boot.c                  |  2 +-
 drivers/mtd/parsers/parser_imagetag.c              |  2 +-
 drivers/mtd/parsers/parser_trx.c                   |  2 +-
 drivers/mtd/parsers/qcomsmempart.c                 |  2 +-
 drivers/mtd/parsers/redboot.c                      |  2 +-
 drivers/mtd/parsers/scpart.c                       |  2 +-
 drivers/mtd/parsers/tplink_safeloader.c            |  2 +-
 drivers/mtd/spi-nor/controllers/hisi-sfc.c         |  2 +-
 drivers/mtd/spi-nor/controllers/nxp-spifi.c        |  2 +-
 drivers/mtd/spi-nor/core.c                         | 77 +++++++++++++++-------
 85 files changed, 153 insertions(+), 123 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-acpi-mtd-0ef6a50d049d

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>


