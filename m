Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9C4CD6E5D
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2026 07:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OAHd6WydKYBQCkvMXE/3oSe9e9pm1fVvh4h5O21kqfs=; b=1Fl18pO7b6e9aFxrt5Vf5FjWPt
	nLXclAWWcndP5lsK7E0zpHWK9u42YmLBKZ6bUjT//Xfsr77M5rr66CdG8B4AnFESgG3yRMVJj2Fn7
	1rW36FPvtrkMDufEkfNQwxYVEN6PkcXyUzFirKDOfN0fNDe69r3vbGU5OVjJg+JWx+IXJWMoF+HxO
	3v7qHYCONkEEmTEd2TMHIE3TfXBoTji7t4xj8BWsJtzUwE5BkkEttkJMZv/l5pdjTeEkDITtRTxOW
	zNnOhTIwdzK2aY9mBNA9KJ8zSjwzEAyQ04yA6AqR3Q8Od0h9TcVJxD5HuPkGNRB54F1hQZbAZlGR5
	l9jGKpoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOk6-00000000DdD-3dPt;
	Fri, 05 Jun 2026 07:13:22 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOk5-00000000DcV-0o2J
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jun 2026 07:13:22 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-46019edc13dso735608f8f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jun 2026 00:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643598; x=1781248398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OAHd6WydKYBQCkvMXE/3oSe9e9pm1fVvh4h5O21kqfs=;
        b=dNt081YKyhjLaPTj9d8Sf6iQQ8x9U0P5mhz65zvpTp67kqmsrJ3SFSqDiDDaGtdlCU
         pTHpsl3aCVpb+wSKG+rtPv+V/sHA+4cVsoJ/BVdCkG/l7RD+c9MlxYAh0z1Yk2JVyP/7
         M7vat7EuTwyrN6jnyR2L3o2jO3UpMOaEAJVKGXczXiqVpVtX4Gc3oS2v+ClyjOv7t8mo
         +2sEfadadgF02Fkdm1UREmIWJoRKyqS8GvPhf1YK5505mq3bqjG5vS1L7+ldC/3zaCAz
         BPncvcHWKcF1ul5waFuPqJNxT6g4qCLY00+aD4bO0MxnDhUZeeuUa3Uii7dROKoq3JTR
         Elhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643598; x=1781248398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OAHd6WydKYBQCkvMXE/3oSe9e9pm1fVvh4h5O21kqfs=;
        b=V3o6Fcvwxg16jm3z7Pi+jPx6o78JhlOwsAWbfYPdBDZetY5PDtMSy5MM2UwiVGVbZi
         ItJOKd/MMk7gIxlZf5gqVt6pFSHAkm1tmu+2W0xBn+cqT+/anb9o4K4VxwKXqNUTYw1O
         gmIkP61zmC08bnjPJGThdjJ3X+O7W9zle9T7/sO6h127movArZvEtwupPchiuc3zXCrQ
         2SW9oqDQHllkn/+WTKKez7S5KpIVVmXcQkIeWM3Z4LN9tRyufZCGe30/wUoEt6+ubr6z
         x7qFHAchrFiP2sEX4R9go5cP5/moa8CL+DM5E6ETaPPWndArOFcbdLnEeGUCxc1ORPs6
         hiHw==
X-Forwarded-Encrypted: i=1; AFNElJ9c9ymkFlvcAHFQWuKUAxOLBLMbtpxPLvLKM4hio6OizFsW1aRKAiw+JMSgZ1OxEax6YUHUxj2+eq4dhyLw/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvIPynAnfkM7cReEBW5JvCjNzVVqWXey8EZq9KKj3YsHZFLzc8
	Ye3nnKMI0QXgrM9oYaL++01py2FvoDblPeH2ND22qv238nXeT2HfYRGo
X-Gm-Gg: Acq92OFP40eJ5HOIIc0AnBbeI2Vsfh31WKZokGSlxh4FqopPqO2wFbjoPJcaASmnazs
	eVEc4uRjXIJEdP2l3vm5mF3rJMBt3oJUtGFJZjlSgLy8JYtB/rLoUW9qagU7t8Y/HUlwrzBq26N
	6hDXaCmMbr3H1Kq31WYlGay/Bnn10GRXVrz5ZZZdiEd2iVIrtfU4gA51qq7ssYmVnO9wBJA1am4
	zTlUuE1If0FTQXuGDTLa9G1FYSR1cm1WNvl2MTl0QYtoked6a2UTgqWDnUjlLO3SQMqXo25yqG7
	jZqR6cwbm89VSBbwya1+gLtUkKyjQVe5UGfOBBrADuw0uJMv8Th8iUMFwgQSITOftWmiOAHIOUE
	ZITX4DK3G3rDq710DMyufZDDZfCYIHborOhoYsBxAGDSk3dZkmjCMVPpiR1AZvyiZ/jeRqjzW3z
	BZMbjzf8fsNZ0ptTtuhleDPnzCVHxMvf6cS6IIQaBWlMDlc54Nv2c78W1HvpN39WhZ83k+d4ZCl
	vGAIuI=
X-Received: by 2002:adf:fd8b:0:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-460304f6b48mr2770670f8f.9.1780643597933;
        Fri, 05 Jun 2026 00:13:17 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4601f2f5612sm22221465f8f.15.2026.06.05.00.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:13:16 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: Move Airoha driver to dedicated directory
Date: Fri,  5 Jun 2026 09:12:31 +0200
Message-ID: <20260605071233.28873-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_001321_254895_7DD73404 
X-CRM114-Status: GOOD (  17.45  )
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

In preparation for additional SoC support, move the Airoha pinctrl driver
for AN7581 SoC to a dedicated directory.

This is to tidy things up and keep code organized without polluting the
Mediatek driver directory.

The driver doesn't depend on any generic or common code from the Mediatek
codebase so it can be safely moved without any modification.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                                   |  2 +-
 drivers/pinctrl/Kconfig                       |  1 +
 drivers/pinctrl/Makefile                      |  1 +
 drivers/pinctrl/airoha/Kconfig                | 20 +++++++++++++++++++
 drivers/pinctrl/airoha/Makefile               |  3 +++
 .../{mediatek => airoha}/pinctrl-airoha.c     |  0
 drivers/pinctrl/mediatek/Kconfig              | 17 +---------------
 drivers/pinctrl/mediatek/Makefile             |  1 -
 8 files changed, 27 insertions(+), 18 deletions(-)
 create mode 100644 drivers/pinctrl/airoha/Kconfig
 create mode 100644 drivers/pinctrl/airoha/Makefile
 rename drivers/pinctrl/{mediatek => airoha}/pinctrl-airoha.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 21c0ef0b9ce5..38bf92149a15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21024,7 +21024,7 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
-F:	drivers/pinctrl/mediatek/pinctrl-airoha.c
+F:	drivers/pinctrl/airoha/pinctrl-airoha.c
 
 PIN CONTROLLER - AMD
 M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 03f2e3ee065f..e0babad31445 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -679,6 +679,7 @@ config PINCTRL_RP1
 	  multi function device.
 
 source "drivers/pinctrl/actions/Kconfig"
+source "drivers/pinctrl/airoha/Kconfig"
 source "drivers/pinctrl/aspeed/Kconfig"
 source "drivers/pinctrl/bcm/Kconfig"
 source "drivers/pinctrl/berlin/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f7d5d5f76d0c..36c55858801f 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -66,6 +66,7 @@ obj-$(CONFIG_PINCTRL_ZYNQMP)	+= pinctrl-zynqmp.o
 obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 
 obj-y				+= actions/
+obj-y				+= airoha/
 obj-$(CONFIG_ARCH_ASPEED)	+= aspeed/
 obj-y				+= bcm/
 obj-$(CONFIG_PINCTRL_BERLIN)	+= berlin/
diff --git a/drivers/pinctrl/airoha/Kconfig b/drivers/pinctrl/airoha/Kconfig
new file mode 100644
index 000000000000..03adaeae8fc3
--- /dev/null
+++ b/drivers/pinctrl/airoha/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "Airoha pinctrl drivers"
+	depends on ARCH_AIROHA || COMPILE_TEST
+
+config PINCTRL_AIROHA
+	tristate "Airoha EN7581 pin control"
+	depends on OF
+	depends on ARM64 || COMPILE_TEST
+	select PINMUX
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	select REGMAP_MMIO
+	help
+	  Say yes here to support pin controller and gpio driver
+	  on Airoha EN7581 SoC.
+
+endmenu
diff --git a/drivers/pinctrl/airoha/Makefile b/drivers/pinctrl/airoha/Makefile
new file mode 100644
index 000000000000..a25b744dd7a8
--- /dev/null
+++ b/drivers/pinctrl/airoha/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_PINCTRL_AIROHA)		+= pinctrl-airoha.o
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
similarity index 100%
rename from drivers/pinctrl/mediatek/pinctrl-airoha.c
rename to drivers/pinctrl/airoha/pinctrl-airoha.c
diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 4819617d9368..97980cc28b9c 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "MediaTek pinctrl drivers"
-	depends on ARCH_MEDIATEK || ARCH_AIROHA || RALINK || COMPILE_TEST
+	depends on ARCH_MEDIATEK || RALINK || COMPILE_TEST
 
 config EINT_MTK
 	tristate "MediaTek External Interrupt Support"
@@ -126,21 +126,6 @@ config PINCTRL_MT8127
 	select PINCTRL_MTK
 
 # For ARMv8 SoCs
-config PINCTRL_AIROHA
-	tristate "Airoha EN7581 pin control"
-	depends on OF
-	depends on ARM64 || COMPILE_TEST
-	select PINMUX
-	select GENERIC_PINCONF
-	select GENERIC_PINCTRL_GROUPS
-	select GENERIC_PINMUX_FUNCTIONS
-	select GPIOLIB
-	select GPIOLIB_IRQCHIP
-	select REGMAP_MMIO
-	help
-	  Say yes here to support pin controller and gpio driver
-	  on Airoha EN7581 SoC.
-
 config PINCTRL_MT2712
 	bool "MediaTek MT2712 pin control"
 	depends on OF
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index ae765bd99965..6dc17b0c23f9 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -8,7 +8,6 @@ obj-$(CONFIG_PINCTRL_MTK_MOORE)		+= pinctrl-moore.o
 obj-$(CONFIG_PINCTRL_MTK_PARIS)		+= pinctrl-paris.o
 
 # SoC Drivers
-obj-$(CONFIG_PINCTRL_AIROHA)		+= pinctrl-airoha.o
 obj-$(CONFIG_PINCTRL_MT7620)		+= pinctrl-mt7620.o
 obj-$(CONFIG_PINCTRL_MT7621)		+= pinctrl-mt7621.o
 obj-$(CONFIG_PINCTRL_MT76X8)		+= pinctrl-mt76x8.o
-- 
2.53.0


