Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E53C05027
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 16:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zji8ZorB2LK6ZbZ+Ghj+vk3Xi5pRv5gO2w8sseJohNk=; b=BWxtR3EMMhZWfWzwjdYnJLqXuK
	DXPGGuxhoc70fiJmulS1ZRQu7QUewv/tPo18CA2ghxradd5X92/EyBzzAloQHiX89X0ysc7kLe+Y3
	V3LB16C5qybfz1SFoMxg9SFoZC67Y6np6jnT2y5AKEYRAgUZahUJvMAeKUCNLMtTgNjR2dsU6+jIn
	bJMoWn80FeJ45iQsg2G6Y+mdKikkqMsR8pzmrrbQv1hhk49v/+yydSI/YAKydeFkq81+uM9BIIN+R
	6tPOoj1BNtvIvZhYaM8BXQ9IeWMjIA7HGuZgAlIkD58aK2ecIYjO7JL/IN05mpX6Lle5Uj1AFRRYQ
	T0597yPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3wE-0099Ms-Ue; Mon, 06 Feb 2023 16:01:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3SA-008uEN-2Z; Mon, 06 Feb 2023 15:30:48 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9FC9F6600363;
	Mon,  6 Feb 2023 15:30:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675697444;
	bh=x+QRoWiULJ/XHNjgH1N2qNqUs/540iuVlloPm/BTi94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ECepMEhLJNtpt9NH9mn6BHgwPsrc4D6xMJ0VZAaU50TTdRllUaO5Ri/cPaaJdTKSC
	 CvlKhZcm1fiHKNcw9rHmDJjzoLPf+ma60wtBLNIXGyn+vSVmxssiUErpKVL1+Juudk
	 5zmI736N7wVQj7zJPGAffRIjldFZkuRXDD0fkzsSydUoXw7GzTfhGv1LY4ZHkt/q8P
	 ZUtMWHK1GGM3z7uM/bErPhAjqFot1R54Svh+isrtF5+zPaTsXr8H8eBd8C4XPi3vxO
	 vx6G1i7viKTALZ9WtL00CNxt8zWWqJY/K+3XT53KHuPvu/EIduTvpLi2xmG4RVczRk
	 nac3M3rfF1hXw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	daniel@makrotopia.org,
	fparent@baylibre.com,
	msp@baylibre.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	zhaojh329@gmail.com,
	sam.shih@mediatek.com,
	edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com,
	granquet@baylibre.com,
	pablo.sun@mediatek.com,
	sean.wang@mediatek.com,
	chen.zhong@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 42/45] clk: mediatek: Split configuration options for MT8186 clock drivers
Date: Mon,  6 Feb 2023 16:29:25 +0100
Message-Id: <20230206152928.918562-43-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_073046_413791_D68A5C1D 
X-CRM114-Status: GOOD (  10.31  )
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

When building clock drivers for MT8186, some may want to build in only
some of them to, for example, get CPUFreq up faster, and some may want
to leave out some clock drivers entirely as a machine may not need the
Warp Engine or the camera ISP (hence, their clock drivers).

Split the various clock drivers in their own configuration options,
keeping MT8186 configuration options consistent with other MediaTek
SoCs.

While at it, also allow building the remaining clock drivers as modules
by switching COMMON_CLK_MT8186 to tristate.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig  | 68 ++++++++++++++++++++++++++++++++++-
 drivers/clk/mediatek/Makefile | 18 +++++++---
 2 files changed, 80 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 1497171a65ef..706a7cf86ce0 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -596,7 +596,7 @@ config COMMON_CLK_MT8183_VENCSYS
 	  This driver supports MediaTek MT8183 vencsys clocks.
 
 config COMMON_CLK_MT8186
-	bool "Clock driver for MediaTek MT8186"
+	tristate "Clock driver for MediaTek MT8186"
 	depends on ARM64 || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	select COMMON_CLK_MEDIATEK_FHCTL
@@ -604,6 +604,72 @@ config COMMON_CLK_MT8186
 	help
 	  This driver supports MediaTek MT8186 clocks.
 
+config COMMON_CLK_MT8186_CAMSYS
+	tristate "Clock driver for MediaTek MT8186 camsys"
+	depends on COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 camsys and camsys_raw clocks.
+
+config COMMON_CLK_MT8186_IMGSYS
+	tristate "Clock driver for MediaTek MT8186 imgsys"
+	depends on COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 imgsys and imgsys2 clocks.
+
+config COMMON_CLK_MT8186_IMP_IIC_WRAP
+	tristate "Clock driver for MediaTek MT8186 imp_iic_wrap"
+	depends on COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 imp_iic_wrap clocks.
+
+config COMMON_CLK_MT8186_IPESYS
+	tristate "Clock driver for MediaTek MT8186 ipesys"
+	depends on COMMON_CLK_MT8186_IMGSYS
+	help
+	  This driver supports MediaTek MT8186 ipesys clocks.
+
+config COMMON_CLK_MT8186_MCUSYS
+	tristate "Clock driver for MediaTek MT8186 mcusys"
+	depends on COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 mcusys clocks.
+
+config COMMON_CLK_MT8186_MDPSYS
+	tristate "Clock driver for MediaTek MT8186 mdpsys"
+	depends on COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 mdpsys clocks.
+
+config COMMON_CLK_MT8186_MFGCFG
+	tristate "Clock driver for MediaTek MT8186 mfgcfg"
+	depends on COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 mfgcfg clocks.
+
+config COMMON_CLK_MT8186_MMSYS
+	tristate "Clock driver for MediaTek MT8186 mmsys"
+	depends on COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 mmsys clocks.
+
+config COMMON_CLK_MT8186_VDECSYS
+	tristate "Clock driver for MediaTek MT8186 vdecsys"
+	depends on COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 vdecsys and vdecsys_soc clocks.
+
+config COMMON_CLK_MT8186_VENCSYS
+	tristate "Clock driver for MediaTek MT8186 vencsys"
+	depends on COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 vencsys clocks.
+
+config COMMON_CLK_MT8186_WPESYS
+	tristate "Clock driver for MediaTek MT8186 wpesys"
+	depends on COMMON_CLK_MT8186_IMGSYS
+	help
+	  This driver supports MediaTek MT8186 Warp Engine clocks.
+
 config COMMON_CLK_MT8192
 	bool "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 63351957f862..6204ad17b7ca 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -87,11 +87,19 @@ obj-$(CONFIG_COMMON_CLK_MT8183_MFGCFG) += clk-mt8183-mfgcfg.o
 obj-$(CONFIG_COMMON_CLK_MT8183_MMSYS) += clk-mt8183-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VDECSYS) += clk-mt8183-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
-obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt8186-infra_ao.o \
-				   clk-mt8186-apmixedsys.o clk-mt8186-imp_iic_wrap.o \
-				   clk-mt8186-mfg.o clk-mt8186-mm.o clk-mt8186-wpe.o \
-				   clk-mt8186-img.o clk-mt8186-vdec.o clk-mt8186-venc.o \
-				   clk-mt8186-cam.o clk-mt8186-mdp.o clk-mt8186-ipe.o
+obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-apmixedsys.o clk-mt8186-infra_ao.o \
+				   clk-mt8186-topckgen.o
+obj-$(CONFIG_COMMON_CLK_MT8186_CAMSYS) += clk-mt8186-cam.o
+obj-$(CONFIG_COMMON_CLK_MT8186_IMGSYS) += clk-mt8186-img.o
+obj-$(CONFIG_COMMON_CLK_MT8186_IMP_IIC_WRAP) += clk-mt8186-imp_iic_wrap.o
+obj-$(CONFIG_COMMON_CLK_MT8186_IPESYS) += clk-mt8186-ipe.o
+obj-$(CONFIG_COMMON_CLK_MT8186_MCUSYS) += clk-mt8186-mcu.o
+obj-$(CONFIG_COMMON_CLK_MT8186_MDPSYS) += clk-mt8186-mdp.o
+obj-$(CONFIG_COMMON_CLK_MT8186_MFGCFG) += clk-mt8186-mfg.o
+obj-$(CONFIG_COMMON_CLK_MT8186_MMSYS) += clk-mt8186-mm.o
+obj-$(CONFIG_COMMON_CLK_MT8186_VDECSYS) += clk-mt8186-vdec.o
+obj-$(CONFIG_COMMON_CLK_MT8186_VENCSYS) += clk-mt8186-venc.o
+obj-$(CONFIG_COMMON_CLK_MT8186_WPESYS) += clk-mt8186-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
-- 
2.39.1


