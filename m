Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC35C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6a5pI89qkoqLyXJ9nwUbzxIvoF2RQuyIx3pRsOaEJGo=; b=nmAjbkD0YBfToIL0cRUQcX2JFE
	BQlw62GiCQQQqO9iqGGBpWgpVbomoYMJRrxQJ3dzXzBn7hb4eVF55qRMdMjuyExlYthSYrTvlb4x2
	nJgWpklp0PCZz2e9/fN9kFQL72UMA0OM1DLdVlrUeZy8BtC5UeqVoJ+OG642IU/+1Bc1PHqFsdX51
	QiyMLwPhRbBNrkHm4OjzRWxHGHmce1L2YoLPb2TSao1Qf+RuoacBcu4+F5evfr8ptghWngrAQxXXl
	wtCMTkX9VRA0PJPjjMM2fJJ+zifn1sT9K1moasiZlkgRWOlNmnXwU4OzAFn9dm95wFTKVZpQSL0Js
	Rm1+MiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURq0-0082eP-Vg; Tue, 21 Feb 2023 12:33:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURGT-007k6V-5e; Tue, 21 Feb 2023 11:57:01 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B5CCA66021E8;
	Tue, 21 Feb 2023 11:56:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676980615;
	bh=BpYZWFTJBiGmhjWTU8H+MwbDque178dVxUf9q6AYoEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UnbnzsxyJRtPFFH22SUTAmGrcigk6gs2XYQiArWivPcOCz18uAH49ATux94T3gLxI
	 kyPAT5StglmQQZMAbKMPcl5WHZUptSllxRWl/PKf4vESPlsubjQ89MayEdZJqocmgk
	 i5nycQ7fJLKTKoIlVdN/XrbDWGpH+/HJWrJQSwpb8G4QGFn2l4yrBWoe2P4oaq06RU
	 1JgLqxt+nSoIJMe54ai22nAY/DrOBCnoMyAOc6sp+psTEiM7tpXiN+91q58XTDbr//
	 IzeJj7UTzdDGRogwrx1/GrIWcwKh4hHf/FVIyyflL0Sg3RkqQ1EUJhRY9K2zPc2xos
	 fEQSMy9IAzY9A==
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
Subject: [PATCH v4 46/54] clk: mediatek: Split configuration options for MT8186 clock drivers
Date: Tue, 21 Feb 2023 12:55:41 +0100
Message-Id: <20230221115549.360132-47-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
References: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_035657_551913_E51B7FC9 
X-CRM114-Status: GOOD (  10.93  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig  | 79 ++++++++++++++++++++++++++++++++++-
 drivers/clk/mediatek/Makefile | 18 +++++---
 2 files changed, 91 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 0240c1039d64..04b4be419bd0 100644
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
@@ -604,6 +604,83 @@ config COMMON_CLK_MT8186
 	help
 	  This driver supports MediaTek MT8186 clocks.
 
+config COMMON_CLK_MT8186_CAMSYS
+	tristate "Clock driver for MediaTek MT8186 camsys"
+	depends on COMMON_CLK_MT8186
+	default COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 camsys and camsys_raw clocks.
+
+config COMMON_CLK_MT8186_IMGSYS
+	tristate "Clock driver for MediaTek MT8186 imgsys"
+	depends on COMMON_CLK_MT8186
+	default COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 imgsys and imgsys2 clocks.
+
+config COMMON_CLK_MT8186_IPESYS
+	tristate "Clock driver for MediaTek MT8186 ipesys"
+	depends on COMMON_CLK_MT8186_IMGSYS
+	default COMMON_CLK_MT8186_IMGSYS
+	help
+	  This driver supports MediaTek MT8186 ipesys clocks.
+
+config COMMON_CLK_MT8186_WPESYS
+	tristate "Clock driver for MediaTek MT8186 wpesys"
+	depends on COMMON_CLK_MT8186_IMGSYS
+	default COMMON_CLK_MT8186_IMGSYS
+	help
+	  This driver supports MediaTek MT8186 Warp Engine clocks.
+
+config COMMON_CLK_MT8186_IMP_IIC_WRAP
+	tristate "Clock driver for MediaTek MT8186 imp_iic_wrap"
+	depends on COMMON_CLK_MT8186
+	default COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 imp_iic_wrap clocks.
+
+config COMMON_CLK_MT8186_MCUSYS
+	tristate "Clock driver for MediaTek MT8186 mcusys"
+	depends on COMMON_CLK_MT8186
+	default COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 mcusys clocks.
+
+config COMMON_CLK_MT8186_MDPSYS
+	tristate "Clock driver for MediaTek MT8186 mdpsys"
+	depends on COMMON_CLK_MT8186
+	default COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 mdpsys clocks.
+
+config COMMON_CLK_MT8186_MFGCFG
+	tristate "Clock driver for MediaTek MT8186 mfgcfg"
+	depends on COMMON_CLK_MT8186
+	default COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 mfgcfg clocks.
+
+config COMMON_CLK_MT8186_MMSYS
+	tristate "Clock driver for MediaTek MT8186 mmsys"
+	depends on COMMON_CLK_MT8186
+	default COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 mmsys clocks.
+
+config COMMON_CLK_MT8186_VDECSYS
+	tristate "Clock driver for MediaTek MT8186 vdecsys"
+	depends on COMMON_CLK_MT8186
+	default COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 vdecsys and vdecsys_soc clocks.
+
+config COMMON_CLK_MT8186_VENCSYS
+	tristate "Clock driver for MediaTek MT8186 vencsys"
+	depends on COMMON_CLK_MT8186
+	default COMMON_CLK_MT8186
+	help
+	  This driver supports MediaTek MT8186 vencsys clocks.
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


