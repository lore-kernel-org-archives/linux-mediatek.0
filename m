Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AE1C6FD1B
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 14:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sJ+KLioVAfEAyqsRbKClnAP8NbUip6dniQxV4usCdg=; b=ZoCO15120Qbdzg7sAEQdro7bc2
	0muBUA05nquK+ttvEWP8UlWmL/sAyX/0le0zujSOsWppDmBHxA5PvJyoxoqzd1aimSFWI3lv1qj1r
	l2cEX7TKtq5DjSIh4yEUTgbMrEDy6ebeRILn23gM2DNVG1YB+FAINThpru1qbAYsH78r7D5b4uQ5o
	qWpG+sA0jJzwP9stNLr3FzV0Zifby5aFL+UI5V6WWCvFPvBwqyHzapbuKrN5bh55umV8S6EObueDr
	ChAusYCrExoe8vNvle21mKBAI5MgU+xyEqP4DQC3YlNZ09aHlEngo6I/YjH06VHm1vpotEJJhMCv9
	ZHY2PaMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBw6-00DJLD-Im; Mon, 06 Mar 2023 14:35:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBUJ-00D3xR-IT; Mon, 06 Mar 2023 14:06:56 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 12E406602FFB;
	Mon,  6 Mar 2023 14:06:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678111610;
	bh=pz3P6JF4Ib/gr2oV/m98v2YvTn5nCYl1sGKbbsFD8Xk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f9tiEVnikSiRAXqKBn0+jCAhastmDKosxdc3vpaFHzbq5fCi2wgQOk/QroR50qeUd
	 r/jyeoBExmqsNDph+pVvSsBtvePHTjwMMW+F+UZkFhti88p1jCPn6Ml8gS4tXKi6y4
	 qGhVNO1Oe1qjJ/rOho9nSUtCpJh/3UWl+SPE/r7DBm2bknmozI+Ip0jDwP+g0GiKOI
	 U59LMgdYcouq978UReBIVWRFDRcAqLCfb+KLN/3wuSz8/eemB2+qFxzLW4fPOA6WO5
	 V73oWPCf6vLX29pXycCWzQv5EbrQdhxzdezws6DbKdu6i8aqwmv01Pjl+rQ3Nuk/EE
	 qpJJ/4Ewlk0Nw==
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
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v6 39/54] clk: mediatek: Split MT8195 clock drivers and allow module build
Date: Mon,  6 Mar 2023 15:05:28 +0100
Message-Id: <20230306140543.1813621-40-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
References: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_060651_927980_F56F4D7A 
X-CRM114-Status: UNSURE (   9.74  )
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

MT8195 clock drivers were encapsulated in one single (and big) Kconfig
option: there's no reason to do that, as it is totally unnecessary to
build in all or none of them.

Split them out: keep boot-critical clocks as bool and allow choosing
non critical clocks as tristate.

As a note, the dependencies of VDEC/VENCSYS and CAM/IMG/IPE/WPESYS
are not for build-time but rather for runtime, as clocks registered
by those have runtime dependencies on either or both VPP and IMGSYS.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig  | 100 ++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/Makefile |  20 ++++---
 2 files changed, 113 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 45b7aea7648d..ab47b9ec64af 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -692,6 +692,106 @@ config COMMON_CLK_MT8195
         help
           This driver supports MediaTek MT8195 clocks.
 
+config COMMON_CLK_MT8195_APUSYS
+	tristate "Clock driver for MediaTek MT8195 apusys"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 AI Processor Unit System clocks.
+
+config COMMON_CLK_MT8195_AUDSYS
+	tristate "Clock driver for MediaTek MT8195 audsys"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 audsys clocks.
+
+config COMMON_CLK_MT8195_IMP_IIC_WRAP
+	tristate "Clock driver for MediaTek MT8195 imp_iic_wrap"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 I2C/I3C clocks.
+
+config COMMON_CLK_MT8195_MFGCFG
+	tristate "Clock driver for MediaTek MT8195 mfgcfg"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 mfgcfg clocks.
+
+config COMMON_CLK_MT8195_MSDC
+	tristate "Clock driver for MediaTek MT8195 msdc"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 MMC and SD Controller's
+	  msdc and msdc_top clocks.
+
+config COMMON_CLK_MT8195_SCP_ADSP
+	tristate "Clock driver for MediaTek MT8195 scp_adsp"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 System Companion Processor
+	  Audio DSP clocks.
+
+config COMMON_CLK_MT8195_VDOSYS
+	tristate "Clock driver for MediaTek MT8195 vdosys"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 vdosys0/1 (multimedia) clocks.
+
+config COMMON_CLK_MT8195_VPPSYS
+	tristate "Clock driver for MediaTek MT8195 vppsys"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 vppsys0/1 clocks.
+
+config COMMON_CLK_MT8195_CAMSYS
+	tristate "Clock driver for MediaTek MT8195 camsys"
+	depends on COMMON_CLK_MT8195_VPPSYS
+	default COMMON_CLK_MT8195_VPPSYS
+	help
+	  This driver supports MediaTek MT8195 camsys and camsys_raw clocks.
+
+config COMMON_CLK_MT8195_IMGSYS
+	tristate "Clock driver for MediaTek MT8195 imgsys"
+	depends on COMMON_CLK_MT8195_VPPSYS
+	default COMMON_CLK_MT8195_VPPSYS
+	help
+	  This driver supports MediaTek MT8195 imgsys and imgsys2 clocks.
+
+config COMMON_CLK_MT8195_IPESYS
+	tristate "Clock driver for MediaTek MT8195 ipesys"
+	depends on COMMON_CLK_MT8195_IMGSYS
+	default COMMON_CLK_MT8195_IMGSYS
+	help
+	  This driver supports MediaTek MT8195 ipesys clocks.
+
+config COMMON_CLK_MT8195_WPESYS
+	tristate "Clock driver for MediaTek MT8195 wpesys"
+	depends on COMMON_CLK_MT8195_IMGSYS
+	default COMMON_CLK_MT8195_IMGSYS
+	help
+	  This driver supports MediaTek MT8195 Warp Engine clocks.
+
+config COMMON_CLK_MT8195_VDECSYS
+	tristate "Clock driver for MediaTek MT8195 vdecsys"
+	depends on COMMON_CLK_MT8195_VPPSYS
+	default COMMON_CLK_MT8195_VPPSYS
+	help
+	  This driver supports MediaTek MT8195 vdecsys and vdecsys_soc clocks.
+
+config COMMON_CLK_MT8195_VENCSYS
+	tristate "Clock driver for MediaTek MT8195 vencsys"
+	depends on COMMON_CLK_MT8195_VPPSYS
+	default COMMON_CLK_MT8195_VPPSYS
+	help
+	  This driver supports MediaTek MT8195 vencsys clocks.
+
 config COMMON_CLK_MT8365
 	tristate "Clock driver for MediaTek MT8365"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 79244e5ccc9c..9ea1af2a7457 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -106,13 +106,19 @@ obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
 obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o \
-				   clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o \
-				   clk-mt8195-cam.o clk-mt8195-ccu.o clk-mt8195-img.o \
-				   clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o \
-				   clk-mt8195-vdec.o clk-mt8195-vdo0.o clk-mt8195-vdo1.o \
-				   clk-mt8195-venc.o clk-mt8195-vpp0.o clk-mt8195-vpp1.o \
-				   clk-mt8195-wpe.o clk-mt8195-imp_iic_wrap.o \
-				   clk-mt8195-apusys_pll.o
+				   clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o
+obj-$(CONFIG_COMMON_CLK_MT8195_APUSYS) += clk-mt8195-apusys_pll.o
+obj-$(CONFIG_COMMON_CLK_MT8195_CAMSYS) += clk-mt8195-cam.o clk-mt8195-ccu.o
+obj-$(CONFIG_COMMON_CLK_MT8195_IMGSYS) += clk-mt8195-img.o
+obj-$(CONFIG_COMMON_CLK_MT8195_IMP_IIC_WRAP) += clk-mt8195-imp_iic_wrap.o
+obj-$(CONFIG_COMMON_CLK_MT8195_IPESYS) += clk-mt8195-ipe.o
+obj-$(CONFIG_COMMON_CLK_MT8195_MFGCFG) += clk-mt8195-mfg.o
+obj-$(CONFIG_COMMON_CLK_MT8195_SCP_ADSP) += clk-mt8195-scp_adsp.o
+obj-$(CONFIG_COMMON_CLK_MT8195_VDECSYS) += clk-mt8195-vdec.o
+obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS) += clk-mt8195-vdo0.o clk-mt8195-vdo1.o
+obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) += clk-mt8195-venc.o
+obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) += clk-mt8195-vpp0.o clk-mt8195-vpp1.o
+obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) += clk-mt8195-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
 obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
 obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
-- 
2.39.2


