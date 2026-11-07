Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8EF606A331
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nn3CV9AQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKUem8qx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3JSGrKkfasSjkXz6S7pS4jiVu0FeZWNudCsARugg3Tw=; b=Nn3CV9AQY5wI2QUjxWhzaabbtF
	Q8Cbhn8ukWGuJn4D5x5PT0h8h+CylKzd2DpT17X7uQu54JD4XaLMYyad7FE/nnKwa019zNvO+pOy4
	kJdeFMrav6AbCmvTcGq6tYKFMaKeobf05QhTpbUla56OlREUv4u8j9h+UbaqaucdM7d6e0df3yTaK
	p+EnTe6338NKBx8O+CfX/ETFr5flbLq7BPh1WK3Y/TtbE9v97ubxmMtlrQw/rw2xp2aX1CT6R7Qeq
	zauL6U4QrxVdNE+Dp67tatzcw12zPcLVO2okSQEy2YCGi+cW/bi5E/iiHo0IjcTKEs+LZ8++Ihi7N
	8jF7Fm1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTR-0000000ESj0-0CZQ;
	Sat, 07 Nov 2026 10:16:37 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTF-0000000ESYz-3pbw
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 10:16:33 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-847ac7ccd85so904539a34.3
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 02:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046584; x=1794651384; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3JSGrKkfasSjkXz6S7pS4jiVu0FeZWNudCsARugg3Tw=;
        b=pKUem8qxeRfDV5TS/xLFNEY8iwVt3GSyU2TAE76T8XqH1vccM9HcGo+ddfngpUa+eX
         vdSqF3buiZMqamGSYzc69wZ8ZgMXAKcYHyZC7Fc63INDYe0BsSqFKTamFxqkRkI+ZXGF
         M+2HTvG/mBrjkglWmmprdYeOGNJmAIXoh/eqVj+qeR/1tnDhsk89z1bgZEb4KjYq9l/h
         OyArDu/vHpODny2FWJfCHySbvp3y+JjEnXus7PpMo014eMQHTQFnB4WmtJN5nyHjqM87
         8EoGaO9s/3QAi+dTG3oWw2yyEE+pav8cl7Pxx5yGBKC9PjOJN0YgFpY7u3i75rx6QZdT
         4gXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046584; x=1794651384;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3JSGrKkfasSjkXz6S7pS4jiVu0FeZWNudCsARugg3Tw=;
        b=0tAD/AJS6HTzp7rprubYEnWjwjBbtGJ/5AWwLyX4/juXIxMxUyrij4+GlD0RJg9kBZ
         awfCZEshj+rV0kepn7bz0E12AVmP/gFWaCWNieuBuXDocCqexSVp9KBRLFs4lxqVbLdf
         MwEMAtc4YFa/vrPKgDZws/ThNeQO6cw9n5xTaMq3lBRQoerm6bnJOcJqQNLpgctfLWf4
         2/SnEPQJo1EnADg11ImFh2AwusynLpdnjC4f2hy1K9pUKUxhB6O8dZ5uCbS2xlzIqlPi
         gaZkeYgAg/Pe8nToiPa74kWptiu6vS0vwxWmt3mYtFAhGdvoVhWwXH0oJtUkLqHU5r3h
         nRzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzt5a3iv00uLWOlbPzKQRKFNxW0Nh/xbRXH84gm2fjJuV7Nf4bFR1Ou4BV6ZFki3b9jmN/2fPUoA3gY8WB38A==@lists.infradead.org
X-Gm-Message-State: APuU4Z9c3jFYWmvNaSugCp/Z92SaVrFy5wL+GU/9tDS/URIjQwd/OSkG
	9hZEFUyMzYE+zMMqI/mITdhyJUVOqp66sHY9y9jovCu5qq9LRFf72IzQ
X-Gm-Gg: AYBFou1DdkjSz10sJjXaqv7EECTjpB9QKD8NwIEvHPEKSG+oMHQOXIsU2PW6wMH4sXv
	kgheFaeTyw3C+wJH6ECiWA5TYdJOtOy41oXQIjHPlgvjmDe4qzpKFlwivQonXuyLZUge/AwE1Iq
	VhX46FUHdsm/6w3/AwNrs3M+m3MtdY4QDGi5fBSKVkk7aqrGrh0LLbwnvaPpHUvzp+6T4K+meVF
	jQvg5v/QDnUr6eK92hXk8vhSGLeNKEO2GeDCSyq2GhF9CjLbyqrbZYgoANa1lwxI2yFrHny09CQ
	LxnXD68fyrN/KRxeOirYypQ1D4Rb4kxL9vQRF1XX6FWe4xmta0zTIPuL1lvaF41KLthmQJ/SBtv
	46wViRogmFtSTJk9Wm6KrmPNQZNTypBYqkjaLdKBo5HemVBs6YJNt/jOwkO7cireeRP8XVSSH+z
	2eLlU+dWxXPPa7VUMHFHdferoUZEQN8LmCfwrt4FaVFZsowSqBnFNRJWoXrkzYIWV7A0oYVxQvW
	0nx6LkBXoUlDyyrBa6UXFz2FMcn2bGt2bbVZtS3vv93FSUbX1OXvtrVDOhv7xnLlWMd53/1gsuf
	NrnD8eitASB9k11QLEjqryDzh3OuUpjcmtOLDZFVjIf76BrLaCrP69kAznV99f1BsfySFlAjzQt
	me+c2d6MtTiQTfp3zsUoheJOnAgPO80jfsoSdTfW4cMMIVBaN8eC6EPsk3TXIYCSFftaXVG4lXq
	A7TOPEiCLNfkPWPT3b9kQsGTV8OnWaWGES0ZgOa39pCQA5Si78an5o
X-Received: by 2002:a05:6830:917:b0:844:4959:e855 with SMTP id 46e09a7af769-85f1cf7a431mr5394630a34.6.1794046584470;
        Sat, 07 Nov 2026 02:16:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 00/58] mtd: rawnand: retain chip and controller state
 across removal
Date: Sat, 07 Nov 2026 03:15:57 -0700
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2OS24DIRAFrzJiHSS+A8xVIi+66Z6YyDN2ADuRL
 N89OM6ypFK9dxeNa+EmlukuKt9KK+d9gH6bRD7C/sGy0GBhlJm1Vk62K26lywrfO+wkK3coO5M
 cMp1YnsrKvWwsb1oqdMZ49pkVihG8VF7Lz9/Y++HFo/bJuT8X/o3KX9fxor80cYGej+PDMoHXm
 DI6FYJW3qWkrc1OW/IxByCjKQWLNj47CI1lPm/j6TJZRQCr5RBTQAeREgbDHlWOM9HMBhwFil4
 cHo9fEYSVahABAAA=
X-Change-ID: 20261104-submit-rawnand-retained-handle-lifetime-v1-0b4225e5ce0b
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Mike Rapoport <rppt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Jason Roberts <jason.e.roberts@intel.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Mason Yang <masonccyang@mxic.com.tw>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_021626_040090_5C676DFC 
X-CRM114-Status: GOOD (  11.67  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An MTD handle can outlive controller unbind. Its metadata and NAND locks
must remain valid, including when a writable file closes and calls sync,
while further hardware access must be rejected after disconnection.

This builds on earlier MTD removal-lifetime work. Commit 19bfa9ebebb5
("mtd: use refcount to prevent corruption") added MTD reference counting
[0], but retaining an MTD reference does not by itself retain the
driver-owned allocation containing the master. The 2025 read/unbind
discussion also covered raw NAND [1] and highlighted the need to drain
active operations before releasing resources [2]. Tze Yee Ng's SPI-NOR
series addresses the corresponding SPI-NOR paths [3]. This series adds
shared backing-object ownership and applies it to raw-NAND drivers.

Introduce an opt-in backing-object lifetime for MTD masters and separate
raw-NAND hardware disconnection from final cleanup. Registered MTD nodes,
device references and open handles retain the backing chip; nested
partitions also retain their parent metadata. Removal notifiers can
finish I/O before disconnection drains admitted operations. Hardware
resources are then released without waiting for open files to close.

OTP providers retain their callback context through final NVMEM device
release while keeping their existing physical-device parent. Preparatory
patches clear unregistered OTP provider pointers and add opt-in NVMEM
context references.

Share the chip and controller ownership helpers, serialize Macronix OTP
access through the same operation locks, and convert the raw-NAND
controller drivers. Each driver conversion keeps metadata cleanup
separate from hardware teardown, including partially published probes.
Shared controllers remain allocated until their last retained chip is
released. R852 allocates a new chip for each inserted card, and NDFC
allocates controller state per binding, so old handles cannot refer to
replacement media or a new binding.

The series adds the common lifetime support and converts its driver
users. It is based on NAND next at 30daaf3e7897 and Tze Yee Ng's posted
module-reference ordering fix [4], whose patch ID is a prerequisite.

TLA+ models of retained-handle, controller and OTP ownership, including
their assumptions and coverage limits, are available in [5].

[0] https://lore.kernel.org/r/20230620131905.648089-2-alexander.usyskin@intel.com
[1] https://lore.kernel.org/r/CAND4H7dz94Gsi_tXSQmLNme9uROnouOUwuCX9BW_+RCc2ZFDqA@mail.gmail.com
[2] https://lore.kernel.org/r/mafs0bjs73tbq.fsf@kernel.org
[3] https://lore.kernel.org/r/20261022035352.52129-1-tze.yee.ng@altera.com
[4] https://lore.kernel.org/r/20261022035352.52129-2-tze.yee.ng@altera.com
[5] https://github.com/jameshilliard/linux-h616-nand-tla

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (58):
      mtd: clear OTP provider pointers after unregistering them
      nvmem: retain provider context through final device release
      mtd: add opt-in lifetime ownership for backing objects
      mtd: rawnand: separate hardware disconnection from cleanup
      mtd: rawnand: share retained chip and controller ownership
      mtd: rawnand: macronix: serialize OTP access with NAND operations
      mtd: rawnand: sunxi: retain chip state until the final MTD put
      mtd: rawnand: plat_nand: retain open-handle state on removal
      mtd: rawnand: gpio: retain open-handle state on removal
      mtd: rawnand: stm32_fmc2: retain open-handle state on removal
      mtd: rawnand: denali: retain chips across controller removal
      mtd: rawnand: arasan: retain chips across controller removal
      mtd: rawnand: mxic: retain open-handle state on removal
      mtd: rawnand: intel: retain open-handle state on removal
      mtd: rawnand: tegra: retain open-handle state on removal
      mtd: rawnand: mtk: retain chips across controller removal
      mtd: rawnand: rockchip: retain chips across controller removal
      mtd: rawnand: atmel: retain chips across controller removal
      mtd: rawnand: orion: retain open-handle state on removal
      mtd: rawnand: socrates: retain open-handle state on removal
      mtd: rawnand: fsl_upm: retain open-handle state on removal
      mtd: rawnand: pasemi: retain open-handle state on removal
      mtd: rawnand: ams-delta: retain open-handle state on removal
      mtd: rawnand: xway: retain open-handle state on removal
      mtd: rawnand: hisi504: retain open-handle state on removal
      mtd: rawnand: vf610: retain open-handle state on removal
      mtd: rawnand: technologic: retain open-handle state on removal
      mtd: rawnand: loongson: retain open-handle state on removal
      mtd: rawnand: ma35d1: retain open-handle state on removal
      mtd: rawnand: pl35x: retain open-handle state on removal
      mtd: rawnand: mxc: retain open-handle state on removal
      mtd: rawnand: fsmc: retain open-handle state on removal
      mtd: rawnand: gpmi: retain open-handle state on removal
      mtd: rawnand: omap2: retain open-handle state on removal
      mtd: rawnand: marvell: retain open-handle state on removal
      mtd: rawnand: renesas: retain open-handle state on removal
      mtd: rawnand: meson: retain open-handle state on removal
      mtd: rawnand: cadence: retain open-handle state on removal
      mtd: rawnand: qcom: retain open-handle state on removal
      mtd: rawnand: cafe: retain open-handle state on removal
      mtd: rawnand: brcmnand: retain open-handle state on removal
      mtd: rawnand: au1550nd: retain chip state across removal
      mtd: rawnand: sharpsl: retain chip state across removal
      mtd: rawnand: davinci: retain chip state across removal
      mtd: rawnand: sh_flctl: retain chip state across removal
      mtd: rawnand: lpc32xx_slc: retain chip state across removal
      mtd: rawnand: lpc32xx_mlc: retain chip state across removal
      mtd: rawnand: ndfc: retain chip state across removal
      mtd: rawnand: txx9ndfmc: retain chip state across removal
      mtd: rawnand: ingenic: retain chip state across removal
      mtd: rawnand: mpc5121: retain chip state across removal
      mtd: rawnand: bcm47xxnflash: retain chip state across removal
      mtd: rawnand: fsl_elbc: retain chip state across removal
      mtd: rawnand: fsl_ifc: retain chip state across removal
      mtd: rawnand: r852: retain chip state across removal
      mtd: rawnand: nandsim: retain chip state across removal
      mtd: rawnand: cs553x: retain chip state across removal
      mtd: rawnand: diskonchip: retain chip state across removal

 drivers/mtd/mtdcore.c                              | 214 +++++++++++++++++----
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/ams-delta.c                   |  29 ++-
 drivers/mtd/nand/raw/arasan-nand-controller.c      |  57 ++++--
 drivers/mtd/nand/raw/atmel/nand-controller.c       |  59 ++++--
 drivers/mtd/nand/raw/au1550nd.c                    |  26 ++-
 drivers/mtd/nand/raw/bcm47xxnflash/main.c          |  23 ++-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c           |  72 +++++--
 drivers/mtd/nand/raw/cadence-nand-controller.c     |  60 ++++--
 drivers/mtd/nand/raw/cafe_nand.c                   |  37 +++-
 drivers/mtd/nand/raw/cs553x_nand.c                 |  46 +++--
 drivers/mtd/nand/raw/davinci_nand.c                |  29 ++-
 drivers/mtd/nand/raw/denali.c                      |  31 ++-
 drivers/mtd/nand/raw/denali_dt.c                   |  21 +-
 drivers/mtd/nand/raw/denali_pci.c                  |  15 +-
 drivers/mtd/nand/raw/diskonchip.c                  |  21 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c               |  68 ++++---
 drivers/mtd/nand/raw/fsl_ifc_nand.c                |  58 ++++--
 drivers/mtd/nand/raw/fsl_upm.c                     |  23 ++-
 drivers/mtd/nand/raw/fsmc_nand.c                   |  22 ++-
 drivers/mtd/nand/raw/gpio.c                        |  21 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c         |  22 ++-
 drivers/mtd/nand/raw/hisi504_nand.c                |  23 ++-
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c    |  49 +++--
 drivers/mtd/nand/raw/intel-nand-controller.c       |  22 ++-
 drivers/mtd/nand/raw/internals.h                   |   2 +
 drivers/mtd/nand/raw/loongson-nand-controller.c    |  23 ++-
 drivers/mtd/nand/raw/lpc32xx_mlc.c                 |  26 ++-
 drivers/mtd/nand/raw/lpc32xx_slc.c                 |  26 ++-
 drivers/mtd/nand/raw/marvell_nand.c                |  54 ++++--
 drivers/mtd/nand/raw/meson_nand.c                  |  55 ++++--
 drivers/mtd/nand/raw/mpc5121_nfc.c                 |  29 ++-
 drivers/mtd/nand/raw/mtk_nand.c                    |  44 ++++-
 drivers/mtd/nand/raw/mxc_nand.c                    |  24 ++-
 drivers/mtd/nand/raw/mxic_nand.c                   |  26 ++-
 drivers/mtd/nand/raw/nand_base.c                   |  78 ++++++--
 drivers/mtd/nand/raw/nand_lifetime.c               | 118 ++++++++++++
 drivers/mtd/nand/raw/nand_macronix.c               |   4 +
 drivers/mtd/nand/raw/nandsim.c                     |  24 ++-
 drivers/mtd/nand/raw/ndfc.c                        |  37 +++-
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  |  44 ++++-
 drivers/mtd/nand/raw/omap2.c                       |  45 ++++-
 drivers/mtd/nand/raw/orion_nand.c                  |  27 ++-
 drivers/mtd/nand/raw/pasemi_nand.c                 |  25 ++-
 drivers/mtd/nand/raw/pl35x-nand-controller.c       |  46 ++++-
 drivers/mtd/nand/raw/plat_nand.c                   |  24 ++-
 drivers/mtd/nand/raw/qcom_nandc.c                  |  74 ++++---
 drivers/mtd/nand/raw/r852.c                        | 111 +++++++----
 drivers/mtd/nand/raw/r852.h                        |   1 +
 drivers/mtd/nand/raw/renesas-nand-controller.c     |  45 +++--
 drivers/mtd/nand/raw/rockchip-nand-controller.c    |  49 +++--
 drivers/mtd/nand/raw/sh_flctl.c                    |  25 ++-
 drivers/mtd/nand/raw/sharpsl.c                     |  25 ++-
 drivers/mtd/nand/raw/sm_common.c                   |  15 +-
 drivers/mtd/nand/raw/sm_common.h                   |   2 +-
 drivers/mtd/nand/raw/socrates_nand.c               |  22 ++-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             |  22 ++-
 drivers/mtd/nand/raw/sunxi_nand.c                  |  59 ++++--
 drivers/mtd/nand/raw/technologic-nand-controller.c |  25 ++-
 drivers/mtd/nand/raw/tegra_nand.c                  |  37 +++-
 drivers/mtd/nand/raw/txx9ndfmc.c                   |  42 +++-
 drivers/mtd/nand/raw/vf610_nfc.c                   |  22 ++-
 drivers/mtd/nand/raw/xway_nand.c                   |  27 ++-
 drivers/nvmem/core.c                               |  12 +-
 drivers/nvmem/internals.h                          |   1 +
 include/linux/mtd/mtd.h                            |  16 ++
 include/linux/mtd/rawnand.h                        |  21 +-
 include/linux/nvmem-provider.h                     |  10 +
 68 files changed, 1949 insertions(+), 544 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261104-submit-rawnand-retained-handle-lifetime-v1-0b4225e5ce0b
prerequisite-patch-id: a51b9cb4077105499133c413d58c7ad21d973b38

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


