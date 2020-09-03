Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A32CC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:24:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B8F72087C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:24:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SSlHTK86";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nWTxeoHg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B8F72087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zdy0tMpFEkCgqZ2pnP82Fl889PEJrrUcUVXnx18ZTmg=; b=SSlHTK86mhVnF15DXWUfuTJaX
	wiEi6fswl11EsQi3Hp4vT4aqHIdTl71HLbICnmZSw6KPdU9AHawQ7Ijn8kRwGPJRE1ke76+aq117b
	YvuPaFJxpBnjdicstGxCMioss0AH8opn0t1lv6Fk4zM+qZbqgvJy0IWoF4/STCTpezVKB/shipYXE
	0m5I1QTMxhkmHiYvqJpT4xcn7sXjKi3hwT/n920uXdBjIvlEkIWdktjszOY4th4+3gA8fkXh+qAdA
	BurhThk7GbRUcO3zcDo6Od2GSgTIdFeVsi5rsIaKwnVrOMQYFKfokXhtYSoKep4nVA+V0UjOl+tOy
	2MfWNe91Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDfrL-00046w-NF; Thu, 03 Sep 2020 03:24:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDfqd-0003hr-7O; Thu, 03 Sep 2020 03:23:44 +0000
X-UUID: 914e5f81446c4842b7259f0845e37603-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WtNwKq6Sv08b3dpl+Rsxt/hBADl4ZCmRNRLiogEH2Xs=; 
 b=nWTxeoHgwnj4UND13MVjdQVXjDcbay+hQkHiZBRnRF2xH3qzFUZH7KEUEOmAm20tEd9iQURaWGVIjfshEcWilYc7RiFtB3j7f8djbvSEsQWlQAFxkMiFe9pnoPGTQJ3PmAoVI9CDwy0ez1Bj2IPsfPrIITWF6nDYh7NTjXu2xb8=;
X-UUID: 914e5f81446c4842b7259f0845e37603-20200902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1708090864; Wed, 02 Sep 2020 19:23:27 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 20:23:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 11:23:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 3 Sep 2020 11:23:25 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v3 9/9] clk: mediatek: Add MT8192 clock support
Date: Thu, 3 Sep 2020 11:23:00 +0800
Message-ID: <1599103380-4155-10-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599103380-4155-1-git-send-email-weiyi.lu@mediatek.com>
References: <1599103380-4155-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Wendell Lin <wendell.lin@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8192 clock support, include topckgen, apmixedsys,
infracfg, pericfg and subsystem clocks.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/Kconfig                      |  146 +++
 drivers/clk/mediatek/Makefile                     |   24 +
 drivers/clk/mediatek/clk-mt8192-aud.c             |  118 ++
 drivers/clk/mediatek/clk-mt8192-cam.c             |   72 ++
 drivers/clk/mediatek/clk-mt8192-cam_rawa.c        |   59 +
 drivers/clk/mediatek/clk-mt8192-cam_rawb.c        |   59 +
 drivers/clk/mediatek/clk-mt8192-cam_rawc.c        |   59 +
 drivers/clk/mediatek/clk-mt8192-img.c             |   60 +
 drivers/clk/mediatek/clk-mt8192-img2.c            |   62 +
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_c.c  |   61 +
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_e.c  |   58 +
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_n.c  |   59 +
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_s.c  |   60 +
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_w.c  |   58 +
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_ws.c |   60 +
 drivers/clk/mediatek/clk-mt8192-ipe.c             |   64 +
 drivers/clk/mediatek/clk-mt8192-mdp.c             |   89 ++
 drivers/clk/mediatek/clk-mt8192-mfg.c             |   57 +
 drivers/clk/mediatek/clk-mt8192-mm.c              |  108 ++
 drivers/clk/mediatek/clk-mt8192-msdc.c            |   57 +
 drivers/clk/mediatek/clk-mt8192-msdc_top.c        |   71 ++
 drivers/clk/mediatek/clk-mt8192-scp_adsp.c        |   57 +
 drivers/clk/mediatek/clk-mt8192-vdec.c            |   82 ++
 drivers/clk/mediatek/clk-mt8192-vdec_soc.c        |   82 ++
 drivers/clk/mediatek/clk-mt8192-venc.c            |   60 +
 drivers/clk/mediatek/clk-mt8192.c                 | 1340 +++++++++++++++++++++
 drivers/clk/mediatek/clk-mux.h                    |   15 +
 27 files changed, 3097 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-aud.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-cam.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-cam_rawa.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-cam_rawb.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-cam_rawc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-img2.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_c.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_e.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_n.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_s.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_w.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_ws.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-ipe.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-mdp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-msdc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-msdc_top.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-scp_adsp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-vdec_soc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 89ceb2fb..a0513b1 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -441,6 +441,152 @@ config COMMON_CLK_MT8183_VENCSYS
 	help
 	  This driver supports MediaTek MT8183 vencsys clocks.
 
+config COMMON_CLK_MT8192
+	bool "Clock driver for MediaTek MT8192"
+	depends on ARM64 || COMPILE_TEST
+	select COMMON_CLK_MEDIATEK
+	default ARM64
+	help
+	  This driver supports MediaTek MT8192 basic clocks.
+
+config COMMON_CLK_MT8192_AUDSYS
+	bool "Clock driver for MediaTek MT8192 audsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 audsys clocks.
+
+config COMMON_CLK_MT8192_CAMSYS
+	bool "Clock driver for MediaTek MT8192 camsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 camsys clocks.
+
+config COMMON_CLK_MT8192_CAMSYS_RAWA
+	bool "Clock driver for MediaTek MT8192 camsys_rawa"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 camsys_rawa clocks.
+
+config COMMON_CLK_MT8192_CAMSYS_RAWB
+	bool "Clock driver for MediaTek MT8192 camsys_rawb"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 camsys_rawb clocks.
+
+config COMMON_CLK_MT8192_CAMSYS_RAWC
+	bool "Clock driver for MediaTek MT8192 camsys_rawc"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 camsys_rawc clocks.
+
+config COMMON_CLK_MT8192_IMGSYS
+	bool "Clock driver for MediaTek MT8192 imgsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 imgsys clocks.
+
+config COMMON_CLK_MT8192_IMGSYS2
+	bool "Clock driver for MediaTek MT8192 imgsys2"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 imgsys2 clocks.
+
+config COMMON_CLK_MT8192_IMP_IIC_WRAP_C
+	bool "Clock driver for MediaTek MT8192 imp_iic_wrap_c"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 imp_iic_wrap_c clocks.
+
+config COMMON_CLK_MT8192_IMP_IIC_WRAP_E
+	bool "Clock driver for MediaTek MT8192 imp_iic_wrap_e"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 imp_iic_wrap_e clocks.
+
+config COMMON_CLK_MT8192_IMP_IIC_WRAP_N
+	bool "Clock driver for MediaTek MT8192 imp_iic_wrap_n"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 imp_iic_wrap_n clocks.
+
+config COMMON_CLK_MT8192_IMP_IIC_WRAP_S
+	bool "Clock driver for MediaTek MT8192 imp_iic_wrap_s"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 imp_iic_wrap_s clocks.
+
+config COMMON_CLK_MT8192_IMP_IIC_WRAP_W
+	bool "Clock driver for MediaTek MT8192 imp_iic_wrap_w"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 imp_iic_wrap_w clocks.
+
+config COMMON_CLK_MT8192_IMP_IIC_WRAP_WS
+	bool "Clock driver for MediaTek MT8192 imp_iic_wrap_ws"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 imp_iic_wrap_ws clocks.
+
+config COMMON_CLK_MT8192_IPESYS
+	bool "Clock driver for MediaTek MT8192 ipesys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 ipesys clocks.
+
+config COMMON_CLK_MT8192_MDPSYS
+	bool "Clock driver for MediaTek MT8192 mdpsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 mdpsys clocks.
+
+config COMMON_CLK_MT8192_MFGCFG
+	bool "Clock driver for MediaTek MT8192 mfgcfg"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 mfgcfg clocks.
+
+config COMMON_CLK_MT8192_MMSYS
+	bool "Clock driver for MediaTek MT8192 mmsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 mmsys clocks.
+
+config COMMON_CLK_MT8192_MSDC_TOP
+	bool "Clock driver for MediaTek MT8192 msdc_top"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 msdc_top clocks.
+
+config COMMON_CLK_MT8192_MSDC
+	bool "Clock driver for MediaTek MT8192 msdc"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 msdc clocks.
+
+config COMMON_CLK_MT8192_SCP_ADSP
+	bool "Clock driver for MediaTek MT8192 scp_adsp"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 scp_adsp clocks.
+
+config COMMON_CLK_MT8192_VDECSYS
+	bool "Clock driver for MediaTek MT8192 vdecsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 vdecsys clocks.
+
+config COMMON_CLK_MT8192_VDECSYS_SOC
+	bool "Clock driver for MediaTek MT8192 vdecsys_soc"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 vdecsys_soc clocks.
+
+config COMMON_CLK_MT8192_VENCSYS
+	bool "Clock driver for MediaTek MT8192 vencsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 vencsys clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 959b556..3e660ac 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -61,5 +61,29 @@ obj-$(CONFIG_COMMON_CLK_MT8183_MFGCFG) += clk-mt8183-mfgcfg.o
 obj-$(CONFIG_COMMON_CLK_MT8183_MMSYS) += clk-mt8183-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VDECSYS) += clk-mt8183-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
+obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
+obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
+obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
+obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS_RAWA) += clk-mt8192-cam_rawa.o
+obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS_RAWB) += clk-mt8192-cam_rawb.o
+obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS_RAWC) += clk-mt8192-cam_rawc.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IMGSYS) += clk-mt8192-img.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IMGSYS2) += clk-mt8192-img2.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_C) += clk-mt8192-imp_iic_wrap_c.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_E) += clk-mt8192-imp_iic_wrap_e.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_N) += clk-mt8192-imp_iic_wrap_n.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_S) += clk-mt8192-imp_iic_wrap_s.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_W) += clk-mt8192-imp_iic_wrap_w.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_WS) += clk-mt8192-imp_iic_wrap_ws.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IPESYS) += clk-mt8192-ipe.o
+obj-$(CONFIG_COMMON_CLK_MT8192_MDPSYS) += clk-mt8192-mdp.o
+obj-$(CONFIG_COMMON_CLK_MT8192_MFGCFG) += clk-mt8192-mfg.o
+obj-$(CONFIG_COMMON_CLK_MT8192_MMSYS) += clk-mt8192-mm.o
+obj-$(CONFIG_COMMON_CLK_MT8192_MSDC_TOP) += clk-mt8192-msdc_top.o
+obj-$(CONFIG_COMMON_CLK_MT8192_MSDC) += clk-mt8192-msdc.o
+obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
+obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
+obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS_SOC) += clk-mt8192-vdec_soc.o
+obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-aud.c b/drivers/clk/mediatek/clk-mt8192-aud.c
new file mode 100644
index 0000000..b38f5a5
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-aud.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs aud0_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x0,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs aud1_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x4,
+};
+
+static const struct mtk_gate_regs aud2_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x8,
+};
+
+#define GATE_AUD0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &aud0_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+#define GATE_AUD1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &aud1_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+#define GATE_AUD2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &aud2_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+static const struct mtk_gate aud_clks[] = {
+	/* AUD0 */
+	GATE_AUD0(CLK_AUD_AFE, "aud_afe", "audio_sel", 2),
+	GATE_AUD0(CLK_AUD_22M, "aud_22m", "aud_engen1_sel", 8),
+	GATE_AUD0(CLK_AUD_24M, "aud_24m", "aud_engen2_sel", 9),
+	GATE_AUD0(CLK_AUD_APLL2_TUNER, "aud_apll2_tuner", "aud_engen2_sel", 18),
+	GATE_AUD0(CLK_AUD_APLL_TUNER, "aud_apll_tuner", "aud_engen1_sel", 19),
+	GATE_AUD0(CLK_AUD_TDM, "aud_tdm", "aud_1_sel", 20),
+	GATE_AUD0(CLK_AUD_ADC, "aud_adc", "audio_sel", 24),
+	GATE_AUD0(CLK_AUD_DAC, "aud_dac", "audio_sel", 25),
+	GATE_AUD0(CLK_AUD_DAC_PREDIS, "aud_dac_predis", "audio_sel", 26),
+	GATE_AUD0(CLK_AUD_TML, "aud_tml", "audio_sel", 27),
+	GATE_AUD0(CLK_AUD_NLE, "aud_nle", "audio_sel", 28),
+	/* AUD1 */
+	GATE_AUD1(CLK_AUD_I2S1_B, "aud_i2s1_b", "audio_sel", 4),
+	GATE_AUD1(CLK_AUD_I2S2_B, "aud_i2s2_b", "audio_sel", 5),
+	GATE_AUD1(CLK_AUD_I2S3_B, "aud_i2s3_b", "audio_sel", 6),
+	GATE_AUD1(CLK_AUD_I2S4_B, "aud_i2s4_b", "audio_sel", 7),
+	GATE_AUD1(CLK_AUD_CONNSYS_I2S_ASRC, "aud_connsys_i2s_asrc", "audio_sel", 12),
+	GATE_AUD1(CLK_AUD_GENERAL1_ASRC, "aud_general1_asrc", "audio_sel", 13),
+	GATE_AUD1(CLK_AUD_GENERAL2_ASRC, "aud_general2_asrc", "audio_sel", 14),
+	GATE_AUD1(CLK_AUD_DAC_HIRES, "aud_dac_hires", "audio_h_sel", 15),
+	GATE_AUD1(CLK_AUD_ADC_HIRES, "aud_adc_hires", "audio_h_sel", 16),
+	GATE_AUD1(CLK_AUD_ADC_HIRES_TML, "aud_adc_hires_tml", "audio_h_sel", 17),
+	GATE_AUD1(CLK_AUD_ADDA6_ADC, "aud_adda6_adc", "audio_sel", 20),
+	GATE_AUD1(CLK_AUD_ADDA6_ADC_HIRES, "aud_adda6_adc_hires", "audio_h_sel", 21),
+	GATE_AUD1(CLK_AUD_3RD_DAC, "aud_3rd_dac", "audio_sel", 28),
+	GATE_AUD1(CLK_AUD_3RD_DAC_PREDIS, "aud_3rd_dac_predis", "audio_sel", 29),
+	GATE_AUD1(CLK_AUD_3RD_DAC_TML, "aud_3rd_dac_tml", "audio_sel", 30),
+	GATE_AUD1(CLK_AUD_3RD_DAC_HIRES, "aud_3rd_dac_hires", "audio_h_sel", 31),
+	/* AUD2 */
+	GATE_AUD2(CLK_AUD_I2S5_B, "aud_i2s5_b", "audio_sel", 0),
+	GATE_AUD2(CLK_AUD_I2S6_B, "aud_i2s6_b", "audio_sel", 1),
+	GATE_AUD2(CLK_AUD_I2S7_B, "aud_i2s7_b", "audio_sel", 2),
+	GATE_AUD2(CLK_AUD_I2S8_B, "aud_i2s8_b", "audio_sel", 3),
+	GATE_AUD2(CLK_AUD_I2S9_B, "aud_i2s9_b", "audio_sel", 4),
+};
+
+static int clk_mt8192_aud_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_AUD_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, aud_clks, ARRAY_SIZE(aud_clks), clk_data);
+	if (r)
+		return r;
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		return r;
+
+	r = devm_of_platform_populate(&pdev->dev);
+	if (r)
+		of_clk_del_provider(node);
+
+	return r;
+}
+
+static const struct of_device_id of_match_clk_mt8192_aud[] = {
+	{ .compatible = "mediatek,mt8192-audsys", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_aud_drv = {
+	.probe = clk_mt8192_aud_probe,
+	.driver = {
+		.name = "clk-mt8192-aud",
+		.of_match_table = of_match_clk_mt8192_aud,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_aud_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-cam.c b/drivers/clk/mediatek/clk-mt8192-cam.c
new file mode 100644
index 0000000..68d3f6e
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-cam.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs cam_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_CAM(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &cam_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate cam_clks[] = {
+	GATE_CAM(CLK_CAM_LARB13, "cam_larb13", "cam_sel", 0),
+	GATE_CAM(CLK_CAM_DFP_VAD, "cam_dfp_vad", "cam_sel", 1),
+	GATE_CAM(CLK_CAM_LARB14, "cam_larb14", "cam_sel", 2),
+	GATE_CAM(CLK_CAM_CAM, "cam_cam", "cam_sel", 6),
+	GATE_CAM(CLK_CAM_CAMTG, "cam_camtg", "cam_sel", 7),
+	GATE_CAM(CLK_CAM_SENINF, "cam_seninf", "cam_sel", 8),
+	GATE_CAM(CLK_CAM_CAMSV0, "cam_camsv0", "cam_sel", 9),
+	GATE_CAM(CLK_CAM_CAMSV1, "cam_camsv1", "cam_sel", 10),
+	GATE_CAM(CLK_CAM_CAMSV2, "cam_camsv2", "cam_sel", 11),
+	GATE_CAM(CLK_CAM_CAMSV3, "cam_camsv3", "cam_sel", 12),
+	GATE_CAM(CLK_CAM_CCU0, "cam_ccu0", "cam_sel", 13),
+	GATE_CAM(CLK_CAM_CCU1, "cam_ccu1", "cam_sel", 14),
+	GATE_CAM(CLK_CAM_MRAW0, "cam_mraw0", "cam_sel", 15),
+	GATE_CAM(CLK_CAM_FAKE_ENG, "cam_fake_eng", "cam_sel", 17),
+	GATE_CAM(CLK_CAM_CCU_GALS, "cam_ccu_gals", "cam_sel", 18),
+	GATE_CAM(CLK_CAM_CAM2MM_GALS, "cam2mm_gals", "cam_sel", 19),
+};
+
+static int clk_mt8192_cam_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_CAM_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, cam_clks, ARRAY_SIZE(cam_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_cam[] = {
+	{ .compatible = "mediatek,mt8192-camsys", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_cam_drv = {
+	.probe = clk_mt8192_cam_probe,
+	.driver = {
+		.name = "clk-mt8192-cam",
+		.of_match_table = of_match_clk_mt8192_cam,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_cam_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-cam_rawa.c b/drivers/clk/mediatek/clk-mt8192-cam_rawa.c
new file mode 100644
index 0000000..02efd68
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-cam_rawa.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs cam_rawa_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_CAM_RAWA(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &cam_rawa_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate cam_rawa_clks[] = {
+	GATE_CAM_RAWA(CLK_CAM_RAWA_LARBX, "cam_rawa_larbx", "cam_sel", 0),
+	GATE_CAM_RAWA(CLK_CAM_RAWA_CAM, "cam_rawa_cam", "cam_sel", 1),
+	GATE_CAM_RAWA(CLK_CAM_RAWA_CAMTG, "cam_rawa_camtg", "cam_sel", 2),
+};
+
+static int clk_mt8192_cam_rawa_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_CAM_RAWA_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, cam_rawa_clks, ARRAY_SIZE(cam_rawa_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_cam_rawa[] = {
+	{ .compatible = "mediatek,mt8192-camsys_rawa", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_cam_rawa_drv = {
+	.probe = clk_mt8192_cam_rawa_probe,
+	.driver = {
+		.name = "clk-mt8192-cam_rawa",
+		.of_match_table = of_match_clk_mt8192_cam_rawa,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_cam_rawa_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-cam_rawb.c b/drivers/clk/mediatek/clk-mt8192-cam_rawb.c
new file mode 100644
index 0000000..b3855f7
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-cam_rawb.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs cam_rawb_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_CAM_RAWB(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &cam_rawb_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate cam_rawb_clks[] = {
+	GATE_CAM_RAWB(CLK_CAM_RAWB_LARBX, "cam_rawb_larbx", "cam_sel", 0),
+	GATE_CAM_RAWB(CLK_CAM_RAWB_CAM, "cam_rawb_cam", "cam_sel", 1),
+	GATE_CAM_RAWB(CLK_CAM_RAWB_CAMTG, "cam_rawb_camtg", "cam_sel", 2),
+};
+
+static int clk_mt8192_cam_rawb_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_CAM_RAWB_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, cam_rawb_clks, ARRAY_SIZE(cam_rawb_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_cam_rawb[] = {
+	{ .compatible = "mediatek,mt8192-camsys_rawb", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_cam_rawb_drv = {
+	.probe = clk_mt8192_cam_rawb_probe,
+	.driver = {
+		.name = "clk-mt8192-cam_rawb",
+		.of_match_table = of_match_clk_mt8192_cam_rawb,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_cam_rawb_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-cam_rawc.c b/drivers/clk/mediatek/clk-mt8192-cam_rawc.c
new file mode 100644
index 0000000..054361d
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-cam_rawc.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs cam_rawc_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_CAM_RAWC(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &cam_rawc_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate cam_rawc_clks[] = {
+	GATE_CAM_RAWC(CLK_CAM_RAWC_LARBX, "cam_rawc_larbx", "cam_sel", 0),
+	GATE_CAM_RAWC(CLK_CAM_RAWC_CAM, "cam_rawc_cam", "cam_sel", 1),
+	GATE_CAM_RAWC(CLK_CAM_RAWC_CAMTG, "cam_rawc_camtg", "cam_sel", 2),
+};
+
+static int clk_mt8192_cam_rawc_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_CAM_RAWC_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, cam_rawc_clks, ARRAY_SIZE(cam_rawc_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_cam_rawc[] = {
+	{ .compatible = "mediatek,mt8192-camsys_rawc", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_cam_rawc_drv = {
+	.probe = clk_mt8192_cam_rawc_probe,
+	.driver = {
+		.name = "clk-mt8192-cam_rawc",
+		.of_match_table = of_match_clk_mt8192_cam_rawc,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_cam_rawc_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-img.c b/drivers/clk/mediatek/clk-mt8192-img.c
new file mode 100644
index 0000000..9a741b0
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-img.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs img_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMG(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &img_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate img_clks[] = {
+	GATE_IMG(CLK_IMG_LARB9, "img_larb9", "img1_sel", 0),
+	GATE_IMG(CLK_IMG_LARB10, "img_larb10", "img1_sel", 1),
+	GATE_IMG(CLK_IMG_DIP, "img_dip", "img1_sel", 2),
+	GATE_IMG(CLK_IMG_GALS, "img_gals", "img1_sel", 12),
+};
+
+static int clk_mt8192_img_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_IMG_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, img_clks, ARRAY_SIZE(img_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_img[] = {
+	{ .compatible = "mediatek,mt8192-imgsys", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_img_drv = {
+	.probe = clk_mt8192_img_probe,
+	.driver = {
+		.name = "clk-mt8192-img",
+		.of_match_table = of_match_clk_mt8192_img,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_img_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-img2.c b/drivers/clk/mediatek/clk-mt8192-img2.c
new file mode 100644
index 0000000..76f9e32
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-img2.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs img2_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMG2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &img2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate img2_clks[] = {
+	GATE_IMG2(CLK_IMG2_LARB11, "img2_larb11", "img1_sel", 0),
+	GATE_IMG2(CLK_IMG2_LARB12, "img2_larb12", "img1_sel", 1),
+	GATE_IMG2(CLK_IMG2_MFB, "img2_mfb", "img1_sel", 6),
+	GATE_IMG2(CLK_IMG2_WPE, "img2_wpe", "img1_sel", 7),
+	GATE_IMG2(CLK_IMG2_MSS, "img2_mss", "img1_sel", 8),
+	GATE_IMG2(CLK_IMG2_GALS, "img2_gals", "img1_sel", 12),
+};
+
+static int clk_mt8192_img2_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_IMG2_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, img2_clks, ARRAY_SIZE(img2_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_img2[] = {
+	{ .compatible = "mediatek,mt8192-imgsys2", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_img2_drv = {
+	.probe = clk_mt8192_img2_probe,
+	.driver = {
+		.name = "clk-mt8192-img2",
+		.of_match_table = of_match_clk_mt8192_img2,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_img2_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_c.c b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_c.c
new file mode 100644
index 0000000..84a167a
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_c.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs imp_iic_wrap_c_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP_IIC_WRAP_C(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &imp_iic_wrap_c_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate imp_iic_wrap_c_clks[] = {
+	GATE_IMP_IIC_WRAP_C(CLK_IMP_IIC_WRAP_C_I2C10, "imp_iic_wrap_c_i2c10", "infra_i2c0", 0),
+	GATE_IMP_IIC_WRAP_C(CLK_IMP_IIC_WRAP_C_I2C11, "imp_iic_wrap_c_i2c11", "infra_i2c0", 1),
+	GATE_IMP_IIC_WRAP_C(CLK_IMP_IIC_WRAP_C_I2C12, "imp_iic_wrap_c_i2c12", "infra_i2c0", 2),
+	GATE_IMP_IIC_WRAP_C(CLK_IMP_IIC_WRAP_C_I2C13, "imp_iic_wrap_c_i2c13", "infra_i2c0", 3),
+};
+
+static int clk_mt8192_imp_iic_wrap_c_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_IMP_IIC_WRAP_C_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, imp_iic_wrap_c_clks, ARRAY_SIZE(imp_iic_wrap_c_clks),
+			clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_imp_iic_wrap_c[] = {
+	{ .compatible = "mediatek,mt8192-imp_iic_wrap_c", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_imp_iic_wrap_c_drv = {
+	.probe = clk_mt8192_imp_iic_wrap_c_probe,
+	.driver = {
+		.name = "clk-mt8192-imp_iic_wrap_c",
+		.of_match_table = of_match_clk_mt8192_imp_iic_wrap_c,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_imp_iic_wrap_c_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_e.c b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_e.c
new file mode 100644
index 0000000..088654c
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_e.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs imp_iic_wrap_e_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP_IIC_WRAP_E(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &imp_iic_wrap_e_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate imp_iic_wrap_e_clks[] = {
+	GATE_IMP_IIC_WRAP_E(CLK_IMP_IIC_WRAP_E_I2C3, "imp_iic_wrap_e_i2c3", "infra_i2c0", 0),
+};
+
+static int clk_mt8192_imp_iic_wrap_e_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_IMP_IIC_WRAP_E_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, imp_iic_wrap_e_clks, ARRAY_SIZE(imp_iic_wrap_e_clks),
+			clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_imp_iic_wrap_e[] = {
+	{ .compatible = "mediatek,mt8192-imp_iic_wrap_e", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_imp_iic_wrap_e_drv = {
+	.probe = clk_mt8192_imp_iic_wrap_e_probe,
+	.driver = {
+		.name = "clk-mt8192-imp_iic_wrap_e",
+		.of_match_table = of_match_clk_mt8192_imp_iic_wrap_e,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_imp_iic_wrap_e_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_n.c b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_n.c
new file mode 100644
index 0000000..6806c6e
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_n.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs imp_iic_wrap_n_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP_IIC_WRAP_N(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &imp_iic_wrap_n_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate imp_iic_wrap_n_clks[] = {
+	GATE_IMP_IIC_WRAP_N(CLK_IMP_IIC_WRAP_N_I2C0, "imp_iic_wrap_n_i2c0", "infra_i2c0", 0),
+	GATE_IMP_IIC_WRAP_N(CLK_IMP_IIC_WRAP_N_I2C6, "imp_iic_wrap_n_i2c6", "infra_i2c0", 1),
+};
+
+static int clk_mt8192_imp_iic_wrap_n_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_IMP_IIC_WRAP_N_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, imp_iic_wrap_n_clks, ARRAY_SIZE(imp_iic_wrap_n_clks),
+			clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_imp_iic_wrap_n[] = {
+	{ .compatible = "mediatek,mt8192-imp_iic_wrap_n", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_imp_iic_wrap_n_drv = {
+	.probe = clk_mt8192_imp_iic_wrap_n_probe,
+	.driver = {
+		.name = "clk-mt8192-imp_iic_wrap_n",
+		.of_match_table = of_match_clk_mt8192_imp_iic_wrap_n,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_imp_iic_wrap_n_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_s.c b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_s.c
new file mode 100644
index 0000000..cf4746c
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_s.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs imp_iic_wrap_s_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP_IIC_WRAP_S(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &imp_iic_wrap_s_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate imp_iic_wrap_s_clks[] = {
+	GATE_IMP_IIC_WRAP_S(CLK_IMP_IIC_WRAP_S_I2C7, "imp_iic_wrap_s_i2c7", "infra_i2c0", 0),
+	GATE_IMP_IIC_WRAP_S(CLK_IMP_IIC_WRAP_S_I2C8, "imp_iic_wrap_s_i2c8", "infra_i2c0", 1),
+	GATE_IMP_IIC_WRAP_S(CLK_IMP_IIC_WRAP_S_I2C9, "imp_iic_wrap_s_i2c9", "infra_i2c0", 2),
+};
+
+static int clk_mt8192_imp_iic_wrap_s_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_IMP_IIC_WRAP_S_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, imp_iic_wrap_s_clks, ARRAY_SIZE(imp_iic_wrap_s_clks),
+			clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_imp_iic_wrap_s[] = {
+	{ .compatible = "mediatek,mt8192-imp_iic_wrap_s", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_imp_iic_wrap_s_drv = {
+	.probe = clk_mt8192_imp_iic_wrap_s_probe,
+	.driver = {
+		.name = "clk-mt8192-imp_iic_wrap_s",
+		.of_match_table = of_match_clk_mt8192_imp_iic_wrap_s,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_imp_iic_wrap_s_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_w.c b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_w.c
new file mode 100644
index 0000000..bfe0561
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_w.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs imp_iic_wrap_w_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP_IIC_WRAP_W(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &imp_iic_wrap_w_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate imp_iic_wrap_w_clks[] = {
+	GATE_IMP_IIC_WRAP_W(CLK_IMP_IIC_WRAP_W_I2C5, "imp_iic_wrap_w_i2c5", "infra_i2c0", 0),
+};
+
+static int clk_mt8192_imp_iic_wrap_w_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_IMP_IIC_WRAP_W_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, imp_iic_wrap_w_clks, ARRAY_SIZE(imp_iic_wrap_w_clks),
+			clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_imp_iic_wrap_w[] = {
+	{ .compatible = "mediatek,mt8192-imp_iic_wrap_w", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_imp_iic_wrap_w_drv = {
+	.probe = clk_mt8192_imp_iic_wrap_w_probe,
+	.driver = {
+		.name = "clk-mt8192-imp_iic_wrap_w",
+		.of_match_table = of_match_clk_mt8192_imp_iic_wrap_w,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_imp_iic_wrap_w_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_ws.c b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_ws.c
new file mode 100644
index 0000000..4ea6620
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_ws.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs imp_iic_wrap_ws_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP_IIC_WRAP_WS(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &imp_iic_wrap_ws_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate imp_iic_wrap_ws_clks[] = {
+	GATE_IMP_IIC_WRAP_WS(CLK_IMP_IIC_WRAP_WS_I2C1, "imp_iic_wrap_ws_i2c1", "infra_i2c0", 0),
+	GATE_IMP_IIC_WRAP_WS(CLK_IMP_IIC_WRAP_WS_I2C2, "imp_iic_wrap_ws_i2c2", "infra_i2c0", 1),
+	GATE_IMP_IIC_WRAP_WS(CLK_IMP_IIC_WRAP_WS_I2C4, "imp_iic_wrap_ws_i2c4", "infra_i2c0", 2),
+};
+
+static int clk_mt8192_imp_iic_wrap_ws_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_IMP_IIC_WRAP_WS_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, imp_iic_wrap_ws_clks, ARRAY_SIZE(imp_iic_wrap_ws_clks),
+			clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_imp_iic_wrap_ws[] = {
+	{ .compatible = "mediatek,mt8192-imp_iic_wrap_ws", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_imp_iic_wrap_ws_drv = {
+	.probe = clk_mt8192_imp_iic_wrap_ws_probe,
+	.driver = {
+		.name = "clk-mt8192-imp_iic_wrap_ws",
+		.of_match_table = of_match_clk_mt8192_imp_iic_wrap_ws,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_imp_iic_wrap_ws_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-ipe.c b/drivers/clk/mediatek/clk-mt8192-ipe.c
new file mode 100644
index 0000000..304dca4
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-ipe.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs ipe_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IPE(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &ipe_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate ipe_clks[] = {
+	GATE_IPE(CLK_IPE_LARB19, "ipe_larb19", "ipe_sel", 0),
+	GATE_IPE(CLK_IPE_LARB20, "ipe_larb20", "ipe_sel", 1),
+	GATE_IPE(CLK_IPE_SMI_SUBCOM, "ipe_smi_subcom", "ipe_sel", 2),
+	GATE_IPE(CLK_IPE_FD, "ipe_fd", "ipe_sel", 3),
+	GATE_IPE(CLK_IPE_FE, "ipe_fe", "ipe_sel", 4),
+	GATE_IPE(CLK_IPE_RSC, "ipe_rsc", "ipe_sel", 5),
+	GATE_IPE(CLK_IPE_DPE, "ipe_dpe", "ipe_sel", 6),
+	GATE_IPE(CLK_IPE_GALS, "ipe_gals", "ipe_sel", 8),
+};
+
+static int clk_mt8192_ipe_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_IPE_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, ipe_clks, ARRAY_SIZE(ipe_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_ipe[] = {
+	{ .compatible = "mediatek,mt8192-ipesys", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_ipe_drv = {
+	.probe = clk_mt8192_ipe_probe,
+	.driver = {
+		.name = "clk-mt8192-ipe",
+		.of_match_table = of_match_clk_mt8192_ipe,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_ipe_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-mdp.c b/drivers/clk/mediatek/clk-mt8192-mdp.c
new file mode 100644
index 0000000..2df020d
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-mdp.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs mdp0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs mdp1_cg_regs = {
+	.set_ofs = 0x124,
+	.clr_ofs = 0x128,
+	.sta_ofs = 0x120,
+};
+
+#define GATE_MDP0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &mdp0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_MDP1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &mdp1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate mdp_clks[] = {
+	/* MDP0 */
+	GATE_MDP0(CLK_MDP_RDMA0, "mdp_mdp_rdma0", "mdp_sel", 0),
+	GATE_MDP0(CLK_MDP_TDSHP0, "mdp_mdp_tdshp0", "mdp_sel", 1),
+	GATE_MDP0(CLK_MDP_IMG_DL_ASYNC0, "mdp_img_dl_async0", "mdp_sel", 2),
+	GATE_MDP0(CLK_MDP_IMG_DL_ASYNC1, "mdp_img_dl_async1", "mdp_sel", 3),
+	GATE_MDP0(CLK_MDP_RDMA1, "mdp_mdp_rdma1", "mdp_sel", 4),
+	GATE_MDP0(CLK_MDP_TDSHP1, "mdp_mdp_tdshp1", "mdp_sel", 5),
+	GATE_MDP0(CLK_MDP_SMI0, "mdp_smi0", "mdp_sel", 6),
+	GATE_MDP0(CLK_MDP_APB_BUS, "mdp_apb_bus", "mdp_sel", 7),
+	GATE_MDP0(CLK_MDP_WROT0, "mdp_mdp_wrot0", "mdp_sel", 8),
+	GATE_MDP0(CLK_MDP_RSZ0, "mdp_mdp_rsz0", "mdp_sel", 9),
+	GATE_MDP0(CLK_MDP_HDR0, "mdp_mdp_hdr0", "mdp_sel", 10),
+	GATE_MDP0(CLK_MDP_MUTEX0, "mdp_mdp_mutex0", "mdp_sel", 11),
+	GATE_MDP0(CLK_MDP_WROT1, "mdp_mdp_wrot1", "mdp_sel", 12),
+	GATE_MDP0(CLK_MDP_RSZ1, "mdp_mdp_rsz1", "mdp_sel", 13),
+	GATE_MDP0(CLK_MDP_HDR1, "mdp_mdp_hdr1", "mdp_sel", 14),
+	GATE_MDP0(CLK_MDP_FAKE_ENG0, "mdp_mdp_fake_eng0", "mdp_sel", 15),
+	GATE_MDP0(CLK_MDP_AAL0, "mdp_mdp_aal0", "mdp_sel", 16),
+	GATE_MDP0(CLK_MDP_AAL1, "mdp_mdp_aal1", "mdp_sel", 17),
+	GATE_MDP0(CLK_MDP_COLOR0, "mdp_mdp_color0", "mdp_sel", 18),
+	GATE_MDP0(CLK_MDP_COLOR1, "mdp_mdp_color1", "mdp_sel", 19),
+	/* MDP1 */
+	GATE_MDP1(CLK_MDP_IMG_DL_RELAY0_ASYNC0, "mdp_img_dl_relay0_async0", "mdp_sel", 0),
+	GATE_MDP1(CLK_MDP_IMG_DL_RELAY1_ASYNC1, "mdp_img_dl_relay1_async1", "mdp_sel", 8),
+};
+
+static int clk_mt8192_mdp_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_MDP_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, mdp_clks, ARRAY_SIZE(mdp_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_mdp[] = {
+	{ .compatible = "mediatek,mt8192-mdpsys", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_mdp_drv = {
+	.probe = clk_mt8192_mdp_probe,
+	.driver = {
+		.name = "clk-mt8192-mdp",
+		.of_match_table = of_match_clk_mt8192_mdp,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_mdp_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-mfg.c b/drivers/clk/mediatek/clk-mt8192-mfg.c
new file mode 100644
index 0000000..ae6b383
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-mfg.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs mfg_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_MFG(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate mfg_clks[] = {
+	GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "mfg_pll_sel", 0),
+};
+
+static int clk_mt8192_mfg_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_MFG_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, mfg_clks, ARRAY_SIZE(mfg_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_mfg[] = {
+	{ .compatible = "mediatek,mt8192-mfgcfg", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_mfg_drv = {
+	.probe = clk_mt8192_mfg_probe,
+	.driver = {
+		.name = "clk-mt8192-mfg",
+		.of_match_table = of_match_clk_mt8192_mfg,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_mfg_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-mm.c b/drivers/clk/mediatek/clk-mt8192-mm.c
new file mode 100644
index 0000000..dfdfb21
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-mm.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs mm0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs mm1_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+static const struct mtk_gate_regs mm2_cg_regs = {
+	.set_ofs = 0x1a4,
+	.clr_ofs = 0x1a8,
+	.sta_ofs = 0x1a0,
+};
+
+#define GATE_MM0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &mm0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_MM1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &mm1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_MM2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &mm2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate mm_clks[] = {
+	/* MM0 */
+	GATE_MM0(CLK_MM_DISP_MUTEX0, "mm_disp_mutex0", "disp_sel", 0),
+	GATE_MM0(CLK_MM_DISP_CONFIG, "mm_disp_config", "disp_sel", 1),
+	GATE_MM0(CLK_MM_DISP_OVL0, "mm_disp_ovl0", "disp_sel", 2),
+	GATE_MM0(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "disp_sel", 3),
+	GATE_MM0(CLK_MM_DISP_OVL0_2L, "mm_disp_ovl0_2l", "disp_sel", 4),
+	GATE_MM0(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "disp_sel", 5),
+	GATE_MM0(CLK_MM_DISP_UFBC_WDMA0, "mm_disp_ufbc_wdma0", "disp_sel", 6),
+	GATE_MM0(CLK_MM_DISP_RSZ0, "mm_disp_rsz0", "disp_sel", 7),
+	GATE_MM0(CLK_MM_DISP_AAL0, "mm_disp_aal0", "disp_sel", 8),
+	GATE_MM0(CLK_MM_DISP_CCORR0, "mm_disp_ccorr0", "disp_sel", 9),
+	GATE_MM0(CLK_MM_DISP_DITHER0, "mm_disp_dither0", "disp_sel", 10),
+	GATE_MM0(CLK_MM_SMI_INFRA, "mm_smi_infra", "disp_sel", 11),
+	GATE_MM0(CLK_MM_DISP_GAMMA0, "mm_disp_gamma0", "disp_sel", 12),
+	GATE_MM0(CLK_MM_DISP_POSTMASK0, "mm_disp_postmask0", "disp_sel", 13),
+	GATE_MM0(CLK_MM_DISP_DSC_WRAP0, "mm_disp_dsc_wrap0", "disp_sel", 14),
+	GATE_MM0(CLK_MM_DSI0, "mm_dsi0", "disp_sel", 15),
+	GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "disp_sel", 16),
+	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "disp_sel", 17),
+	GATE_MM0(CLK_MM_DISP_FAKE_ENG0, "mm_disp_fake_eng0", "disp_sel", 18),
+	GATE_MM0(CLK_MM_DISP_FAKE_ENG1, "mm_disp_fake_eng1", "disp_sel", 19),
+	GATE_MM0(CLK_MM_MDP_TDSHP4, "mm_mdp_tdshp4", "disp_sel", 20),
+	GATE_MM0(CLK_MM_MDP_RSZ4, "mm_mdp_rsz4", "disp_sel", 21),
+	GATE_MM0(CLK_MM_MDP_AAL4, "mm_mdp_aal4", "disp_sel", 22),
+	GATE_MM0(CLK_MM_MDP_HDR4, "mm_mdp_hdr4", "disp_sel", 23),
+	GATE_MM0(CLK_MM_MDP_RDMA4, "mm_mdp_rdma4", "disp_sel", 24),
+	GATE_MM0(CLK_MM_MDP_COLOR4, "mm_mdp_color4", "disp_sel", 25),
+	GATE_MM0(CLK_MM_DISP_Y2R0, "mm_disp_y2r0", "disp_sel", 26),
+	GATE_MM0(CLK_MM_SMI_GALS, "mm_smi_gals", "disp_sel", 27),
+	GATE_MM0(CLK_MM_DISP_OVL2_2L, "mm_disp_ovl2_2l", "disp_sel", 28),
+	GATE_MM0(CLK_MM_DISP_RDMA4, "mm_disp_rdma4", "disp_sel", 29),
+	GATE_MM0(CLK_MM_DISP_DPI0, "mm_disp_dpi0", "disp_sel", 30),
+	/* MM1 */
+	GATE_MM1(CLK_MM_SMI_IOMMU, "mm_smi_iommu", "disp_sel", 0),
+	/* MM2 */
+	GATE_MM2(CLK_MM_DSI_DSI0, "mm_dsi_dsi0", "disp_sel", 0),
+	GATE_MM2(CLK_MM_DPI_DPI0, "mm_dpi_dpi0", "dpi_sel", 8),
+	GATE_MM2(CLK_MM_26MHZ, "mm_26mhz", "clk26m", 24),
+	GATE_MM2(CLK_MM_32KHZ, "mm_32khz", "clk32k", 25),
+};
+
+static int clk_mt8192_mm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_onecell_data *clk_data;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static struct platform_driver clk_mt8192_mm_drv = {
+	.probe = clk_mt8192_mm_probe,
+	.driver = {
+		.name = "clk-mt8192-mm",
+	},
+};
+
+builtin_platform_driver(clk_mt8192_mm_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-msdc.c b/drivers/clk/mediatek/clk-mt8192-msdc.c
new file mode 100644
index 0000000..9d2b168
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-msdc.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs msdc_cg_regs = {
+	.set_ofs = 0xb4,
+	.clr_ofs = 0xb4,
+	.sta_ofs = 0xb4,
+};
+
+#define GATE_MSDC(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &msdc_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+static const struct mtk_gate msdc_clks[] = {
+	GATE_MSDC(CLK_MSDC_AXI_WRAP, "msdc_axi_wrap", "axi_sel", 22),
+};
+
+static int clk_mt8192_msdc_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_MSDC_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, msdc_clks, ARRAY_SIZE(msdc_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_msdc[] = {
+	{ .compatible = "mediatek,mt8192-msdc", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_msdc_drv = {
+	.probe = clk_mt8192_msdc_probe,
+	.driver = {
+		.name = "clk-mt8192-msdc",
+		.of_match_table = of_match_clk_mt8192_msdc,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_msdc_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-msdc_top.c b/drivers/clk/mediatek/clk-mt8192-msdc_top.c
new file mode 100644
index 0000000..6f5ad65
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-msdc_top.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs msdc_top_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x0,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_MSDC_TOP(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &msdc_top_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+static const struct mtk_gate msdc_top_clks[] = {
+	GATE_MSDC_TOP(CLK_MSDC_TOP_AES_0P, "msdc_top_aes_0p", "aes_msdcfde_sel", 0),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_SRC_0P, "msdc_top_src_0p", "infra_msdc0_src", 1),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_SRC_1P, "msdc_top_src_1p", "infra_msdc1_src", 2),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_SRC_2P, "msdc_top_src_2p", "infra_msdc2_src", 3),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_P_MSDC0, "msdc_top_p_msdc0", "axi_sel", 4),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_P_MSDC1, "msdc_top_p_msdc1", "axi_sel", 5),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_P_MSDC2, "msdc_top_p_msdc2", "axi_sel", 6),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_P_CFG, "msdc_top_p_cfg", "axi_sel", 7),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_AXI, "msdc_top_axi", "axi_sel", 8),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_H_MST_0P, "msdc_top_h_mst_0p", "infra_msdc0", 9),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_H_MST_1P, "msdc_top_h_mst_1p", "infra_msdc1", 10),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_H_MST_2P, "msdc_top_h_mst_2p", "infra_msdc2", 11),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_MEM_OFF_DLY_26M, "msdc_top_mem_off_dly_26m", "clk26m", 12),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_32K, "msdc_top_32k", "clk32k", 13),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_AHB2AXI_BRG_AXI, "msdc_top_ahb2axi_brg_axi", "axi_sel", 14),
+};
+
+static int clk_mt8192_msdc_top_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_MSDC_TOP_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, msdc_top_clks, ARRAY_SIZE(msdc_top_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_msdc_top[] = {
+	{ .compatible = "mediatek,mt8192-msdc_top", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_msdc_top_drv = {
+	.probe = clk_mt8192_msdc_top_probe,
+	.driver = {
+		.name = "clk-mt8192-msdc_top",
+		.of_match_table = of_match_clk_mt8192_msdc_top,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_msdc_top_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-scp_adsp.c b/drivers/clk/mediatek/clk-mt8192-scp_adsp.c
new file mode 100644
index 0000000..3c05140
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-scp_adsp.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs scp_adsp_cg_regs = {
+	.set_ofs = 0x180,
+	.clr_ofs = 0x180,
+	.sta_ofs = 0x180,
+};
+
+#define GATE_SCP_ADSP(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &scp_adsp_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+static const struct mtk_gate scp_adsp_clks[] = {
+	GATE_SCP_ADSP(CLK_SCP_ADSP_AUDIODSP, "scp_adsp_audiodsp", "adsp_sel", 0),
+};
+
+static int clk_mt8192_scp_adsp_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_SCP_ADSP_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, scp_adsp_clks, ARRAY_SIZE(scp_adsp_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_scp_adsp[] = {
+	{ .compatible = "mediatek,mt8192-scp_adsp", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_scp_adsp_drv = {
+	.probe = clk_mt8192_scp_adsp_probe,
+	.driver = {
+		.name = "clk-mt8192-scp_adsp",
+		.of_match_table = of_match_clk_mt8192_scp_adsp,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_scp_adsp_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-vdec.c b/drivers/clk/mediatek/clk-mt8192-vdec.c
new file mode 100644
index 0000000..33cd9c3
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-vdec.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs vdec0_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs vdec1_cg_regs = {
+	.set_ofs = 0x200,
+	.clr_ofs = 0x204,
+	.sta_ofs = 0x200,
+};
+
+static const struct mtk_gate_regs vdec2_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0xc,
+	.sta_ofs = 0x8,
+};
+
+#define GATE_VDEC0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec0_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec2_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate vdec_clks[] = {
+	/* VDEC0 */
+	GATE_VDEC0(CLK_VDEC_VDEC, "vdec_vdec", "vdec_sel", 0),
+	GATE_VDEC0(CLK_VDEC_ACTIVE, "vdec_active", "vdec_sel", 4),
+	/* VDEC1 */
+	GATE_VDEC1(CLK_VDEC_LAT, "vdec_lat", "vdec_sel", 0),
+	GATE_VDEC1(CLK_VDEC_LAT_ACTIVE, "vdec_lat_active", "vdec_sel", 4),
+	/* VDEC2 */
+	GATE_VDEC2(CLK_VDEC_LARB1, "vdec_larb1", "vdec_sel", 0),
+};
+
+static int clk_mt8192_vdec_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_VDEC_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, vdec_clks, ARRAY_SIZE(vdec_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_vdec[] = {
+	{ .compatible = "mediatek,mt8192-vdecsys", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_vdec_drv = {
+	.probe = clk_mt8192_vdec_probe,
+	.driver = {
+		.name = "clk-mt8192-vdec",
+		.of_match_table = of_match_clk_mt8192_vdec,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_vdec_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-vdec_soc.c b/drivers/clk/mediatek/clk-mt8192-vdec_soc.c
new file mode 100644
index 0000000..2f615a8
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-vdec_soc.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs vdec_soc0_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs vdec_soc1_cg_regs = {
+	.set_ofs = 0x200,
+	.clr_ofs = 0x204,
+	.sta_ofs = 0x200,
+};
+
+static const struct mtk_gate_regs vdec_soc2_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0xc,
+	.sta_ofs = 0x8,
+};
+
+#define GATE_VDEC_SOC0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec_soc0_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC_SOC1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec_soc1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC_SOC2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec_soc2_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate vdec_soc_clks[] = {
+	/* VDEC_SOC0 */
+	GATE_VDEC_SOC0(CLK_VDEC_SOC_VDEC, "vdec_soc_vdec", "vdec_sel", 0),
+	GATE_VDEC_SOC0(CLK_VDEC_SOC_VDEC_ACTIVE, "vdec_soc_vdec_active", "vdec_sel", 4),
+	/* VDEC_SOC1 */
+	GATE_VDEC_SOC1(CLK_VDEC_SOC_LAT, "vdec_soc_lat", "vdec_sel", 0),
+	GATE_VDEC_SOC1(CLK_VDEC_SOC_LAT_ACTIVE, "vdec_soc_lat_active", "vdec_sel", 4),
+	/* VDEC_SOC2 */
+	GATE_VDEC_SOC2(CLK_VDEC_SOC_LARB1, "vdec_soc_larb1", "vdec_sel", 0),
+};
+
+static int clk_mt8192_vdec_soc_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_VDEC_SOC_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, vdec_soc_clks, ARRAY_SIZE(vdec_soc_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_vdec_soc[] = {
+	{ .compatible = "mediatek,mt8192-vdecsys_soc", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_vdec_soc_drv = {
+	.probe = clk_mt8192_vdec_soc_probe,
+	.driver = {
+		.name = "clk-mt8192-vdec_soc",
+		.of_match_table = of_match_clk_mt8192_vdec_soc,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_vdec_soc_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192-venc.c b/drivers/clk/mediatek/clk-mt8192-venc.c
new file mode 100644
index 0000000..4739354
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-venc.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs venc_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_VENC(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &venc_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate venc_clks[] = {
+	GATE_VENC(CLK_VENC_SET0_LARB, "venc_set0_larb", "venc_sel", 0),
+	GATE_VENC(CLK_VENC_SET1_VENC, "venc_set1_venc", "venc_sel", 4),
+	GATE_VENC(CLK_VENC_SET2_JPGENC, "venc_set2_jpgenc", "venc_sel", 8),
+	GATE_VENC(CLK_VENC_SET5_GALS, "venc_set5_gals", "venc_sel", 28),
+};
+
+static int clk_mt8192_venc_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_VENC_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, venc_clks, ARRAY_SIZE(venc_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_venc[] = {
+	{ .compatible = "mediatek,mt8192-vencsys", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_venc_drv = {
+	.probe = clk_mt8192_venc_probe,
+	.driver = {
+		.name = "clk-mt8192-venc",
+		.of_match_table = of_match_clk_mt8192_venc,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_venc_drv);
diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
new file mode 100644
index 0000000..44577c4
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -0,0 +1,1340 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "clk-mtk.h"
+#include "clk-mux.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static DEFINE_SPINLOCK(mt8192_clk_lock);
+
+static const struct mtk_fixed_clk top_fixed_clks[] = {
+	FIXED_CLK(CLK_TOP_ULPOSC, "ulposc", NULL, 260000000),
+};
+
+static const struct mtk_fixed_factor top_early_divs[] = {
+	FACTOR(CLK_TOP_CSW_F26M_D2, "csw_f26m_d2", "clk26m", 1, 2),
+};
+
+static const struct mtk_fixed_factor top_divs[] = {
+	FACTOR(CLK_TOP_MAINPLL_D3, "mainpll_d3", "mainpll", 1, 3),
+	FACTOR(CLK_TOP_MAINPLL_D4, "mainpll_d4", "mainpll", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D4_D2, "mainpll_d4_d2", "mainpll_d4", 1, 2),
+	FACTOR(CLK_TOP_MAINPLL_D4_D4, "mainpll_d4_d4", "mainpll_d4", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D4_D8, "mainpll_d4_d8", "mainpll_d4", 1, 8),
+	FACTOR(CLK_TOP_MAINPLL_D4_D16, "mainpll_d4_d16", "mainpll_d4", 1, 16),
+	FACTOR(CLK_TOP_MAINPLL_D5, "mainpll_d5", "mainpll", 1, 5),
+	FACTOR(CLK_TOP_MAINPLL_D5_D2, "mainpll_d5_d2", "mainpll_d5", 1, 2),
+	FACTOR(CLK_TOP_MAINPLL_D5_D4, "mainpll_d5_d4", "mainpll_d5", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D5_D8, "mainpll_d5_d8", "mainpll_d5", 1, 8),
+	FACTOR(CLK_TOP_MAINPLL_D6, "mainpll_d6", "mainpll", 1, 6),
+	FACTOR(CLK_TOP_MAINPLL_D6_D2, "mainpll_d6_d2", "mainpll_d6", 1, 2),
+	FACTOR(CLK_TOP_MAINPLL_D6_D4, "mainpll_d6_d4", "mainpll_d6", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D7, "mainpll_d7", "mainpll", 1, 7),
+	FACTOR(CLK_TOP_MAINPLL_D7_D2, "mainpll_d7_d2", "mainpll_d7", 1, 2),
+	FACTOR(CLK_TOP_MAINPLL_D7_D4, "mainpll_d7_d4", "mainpll_d7", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D7_D8, "mainpll_d7_d8", "mainpll_d7", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univpll", 1, 3),
+	FACTOR(CLK_TOP_UNIVPLL_D4, "univpll_d4", "univpll", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_D4_D2, "univpll_d4_d2", "univpll_d4", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL_D4_D4, "univpll_d4_d4", "univpll_d4", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_D4_D8, "univpll_d4_d8", "univpll_d4", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univpll", 1, 5),
+	FACTOR(CLK_TOP_UNIVPLL_D5_D2, "univpll_d5_d2", "univpll_d5", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL_D5_D4, "univpll_d5_d4", "univpll_d5", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_D5_D8, "univpll_d5_d8", "univpll_d5", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D6, "univpll_d6", "univpll", 1, 6),
+	FACTOR(CLK_TOP_UNIVPLL_D6_D2, "univpll_d6_d2", "univpll_d6", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL_D6_D4, "univpll_d6_d4", "univpll_d6", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_D6_D8, "univpll_d6_d8", "univpll_d6", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D6_D16, "univpll_d6_d16", "univpll_d6", 1, 16),
+	FACTOR(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univpll", 1, 7),
+	FACTOR(CLK_TOP_APLL1, "apll1_ck", "apll1", 1, 1),
+	FACTOR(CLK_TOP_APLL1_D2, "apll1_d2", "apll1", 1, 2),
+	FACTOR(CLK_TOP_APLL1_D4, "apll1_d4", "apll1", 1, 4),
+	FACTOR(CLK_TOP_APLL1_D8, "apll1_d8", "apll1", 1, 8),
+	FACTOR(CLK_TOP_APLL2, "apll2_ck", "apll2", 1, 1),
+	FACTOR(CLK_TOP_APLL2_D2, "apll2_d2", "apll2", 1, 2),
+	FACTOR(CLK_TOP_APLL2_D4, "apll2_d4", "apll2", 1, 4),
+	FACTOR(CLK_TOP_APLL2_D8, "apll2_d8", "apll2", 1, 8),
+	FACTOR(CLK_TOP_MMPLL_D4, "mmpll_d4", "mmpll", 1, 4),
+	FACTOR(CLK_TOP_MMPLL_D4_D2, "mmpll_d4_d2", "mmpll_d4", 1, 2),
+	FACTOR(CLK_TOP_MMPLL_D5, "mmpll_d5", "mmpll", 1, 5),
+	FACTOR(CLK_TOP_MMPLL_D5_D2, "mmpll_d5_d2", "mmpll_d5", 1, 2),
+	FACTOR(CLK_TOP_MMPLL_D6, "mmpll_d6", "mmpll", 1, 6),
+	FACTOR(CLK_TOP_MMPLL_D6_D2, "mmpll_d6_d2", "mmpll_d6", 1, 2),
+	FACTOR(CLK_TOP_MMPLL_D7, "mmpll_d7", "mmpll", 1, 7),
+	FACTOR(CLK_TOP_MMPLL_D9, "mmpll_d9", "mmpll", 1, 9),
+	FACTOR(CLK_TOP_APUPLL, "apupll_ck", "apupll", 1, 2),
+	FACTOR(CLK_TOP_NPUPLL, "npupll_ck", "npupll", 1, 1),
+	FACTOR(CLK_TOP_TVDPLL, "tvdpll_ck", "tvdpll", 1, 1),
+	FACTOR(CLK_TOP_TVDPLL_D2, "tvdpll_d2", "tvdpll", 1, 2),
+	FACTOR(CLK_TOP_TVDPLL_D4, "tvdpll_d4", "tvdpll", 1, 4),
+	FACTOR(CLK_TOP_TVDPLL_D8, "tvdpll_d8", "tvdpll", 1, 8),
+	FACTOR(CLK_TOP_TVDPLL_D16, "tvdpll_d16", "tvdpll", 1, 16),
+	FACTOR(CLK_TOP_MSDCPLL, "msdcpll_ck", "msdcpll", 1, 1),
+	FACTOR(CLK_TOP_MSDCPLL_D2, "msdcpll_d2", "msdcpll", 1, 2),
+	FACTOR(CLK_TOP_MSDCPLL_D4, "msdcpll_d4", "msdcpll", 1, 4),
+	FACTOR(CLK_TOP_OSC_D2, "osc_d2", "ulposc", 1, 2),
+	FACTOR(CLK_TOP_OSC_D4, "osc_d4", "ulposc", 1, 4),
+	FACTOR(CLK_TOP_OSC_D8, "osc_d8", "ulposc", 1, 8),
+	FACTOR(CLK_TOP_OSC_D10, "osc_d10", "ulposc", 1, 10),
+	FACTOR(CLK_TOP_OSC_D16, "osc_d16", "ulposc", 1, 16),
+	FACTOR(CLK_TOP_OSC_D20, "osc_d20", "ulposc", 1, 20),
+	FACTOR(CLK_TOP_ADSPPLL, "adsppll_ck", "adsppll", 1, 1),
+	FACTOR(CLK_TOP_UNIVPLL_192M, "univpll_192m", "univpll", 1, 13),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D2, "univpll_192m_d2", "univpll_192m", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D4, "univpll_192m_d4", "univpll_192m", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D8, "univpll_192m_d8", "univpll_192m", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D16, "univpll_192m_d16", "univpll_192m", 1, 16),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D32, "univpll_192m_d32", "univpll_192m", 1, 32),
+};
+
+static const char * const axi_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"mainpll_d7_d2",
+	"mainpll_d4_d2",
+	"mainpll_d5_d2",
+	"mainpll_d6_d2",
+	"osc_d4"
+};
+
+static const char * const spm_parents[] = {
+	"clk26m",
+	"osc_d10",
+	"mainpll_d7_d4",
+	"clk32k"
+};
+
+static const char * const scp_parents[] = {
+	"clk26m",
+	"univpll_d5",
+	"mainpll_d6_d2",
+	"mainpll_d6",
+	"univpll_d6",
+	"mainpll_d4_d2",
+	"mainpll_d5_d2",
+	"univpll_d4_d2"
+};
+
+static const char * const bus_aximem_parents[] = {
+	"clk26m",
+	"mainpll_d7_d2",
+	"mainpll_d4_d2",
+	"mainpll_d5_d2",
+	"mainpll_d6"
+};
+
+static const char * const disp_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d5_d2",
+	"mmpll_d6_d2",
+	"univpll_d5_d2",
+	"univpll_d4_d2",
+	"mmpll_d7",
+	"univpll_d6",
+	"mainpll_d4",
+	"mmpll_d5_d2"
+};
+
+static const char * const mdp_parents[] = {
+	"clk26m",
+	"mainpll_d5_d2",
+	"mmpll_d6_d2",
+	"mainpll_d4_d2",
+	"mmpll_d4_d2",
+	"mainpll_d6",
+	"univpll_d6",
+	"mainpll_d4",
+	"tvdpll_ck",
+	"univpll_d4",
+	"mmpll_d5_d2"
+};
+
+static const char * const img1_parents[] = {
+	"clk26m",
+	"univpll_d4",
+	"tvdpll_ck",
+	"mainpll_d4",
+	"univpll_d5",
+	"mmpll_d6",
+	"univpll_d6",
+	"mainpll_d6",
+	"mmpll_d4_d2",
+	"mainpll_d4_d2",
+	"mmpll_d6_d2",
+	"mmpll_d5_d2"
+};
+
+static const char * const img2_parents[] = {
+	"clk26m",
+	"univpll_d4",
+	"tvdpll_ck",
+	"mainpll_d4",
+	"univpll_d5",
+	"mmpll_d6",
+	"univpll_d6",
+	"mainpll_d6",
+	"mmpll_d4_d2",
+	"mainpll_d4_d2",
+	"mmpll_d6_d2",
+	"mmpll_d5_d2"
+};
+
+static const char * const ipe_parents[] = {
+	"clk26m",
+	"mainpll_d4",
+	"mmpll_d6",
+	"univpll_d6",
+	"mainpll_d6",
+	"univpll_d4_d2",
+	"mainpll_d4_d2",
+	"mmpll_d6_d2",
+	"mmpll_d5_d2"
+};
+
+static const char * const dpe_parents[] = {
+	"clk26m",
+	"mainpll_d4",
+	"mmpll_d6",
+	"univpll_d6",
+	"mainpll_d6",
+	"univpll_d4_d2",
+	"univpll_d5_d2",
+	"mmpll_d6_d2"
+};
+
+static const char * const cam_parents[] = {
+	"clk26m",
+	"mainpll_d4",
+	"mmpll_d6",
+	"univpll_d4",
+	"univpll_d5",
+	"univpll_d6",
+	"mmpll_d7",
+	"univpll_d4_d2",
+	"mainpll_d4_d2",
+	"univpll_d6_d2"
+};
+
+static const char * const ccu_parents[] = {
+	"clk26m",
+	"mainpll_d4",
+	"mmpll_d6",
+	"mainpll_d6",
+	"mmpll_d7",
+	"univpll_d4_d2",
+	"mmpll_d6_d2",
+	"mmpll_d5_d2",
+	"univpll_d5",
+	"univpll_d6_d2"
+};
+
+static const char * const dsp7_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d6",
+	"mmpll_d6",
+	"univpll_d5",
+	"mmpll_d5",
+	"univpll_d4",
+	"mmpll_d4"
+};
+
+static const char * const mfg_ref_parents[] = {
+	"clk26m",
+	"clk26m",
+	"univpll_d6",
+	"mainpll_d5_d2"
+};
+
+static const char * const mfg_pll_parents[] = {
+	"mfg_ref_sel",
+	"mfgpll"
+};
+
+static const char * const camtg_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_d6_d16",
+	"csw_f26m_d2",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const camtg2_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_d6_d16",
+	"csw_f26m_d2",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const camtg3_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_d6_d16",
+	"csw_f26m_d2",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const camtg4_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_d6_d16",
+	"csw_f26m_d2",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const camtg5_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_d6_d16",
+	"csw_f26m_d2",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const camtg6_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_d6_d16",
+	"csw_f26m_d2",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const uart_parents[] = {
+	"clk26m",
+	"univpll_d6_d8"
+};
+
+static const char * const spi_parents[] = {
+	"clk26m",
+	"mainpll_d5_d4",
+	"mainpll_d6_d4",
+	"msdcpll_d4"
+};
+
+static const char * const msdc50_0_h_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d6_d2"
+};
+
+static const char * const msdc50_0_parents[] = {
+	"clk26m",
+	"msdcpll_ck",
+	"msdcpll_d2",
+	"univpll_d4_d4",
+	"mainpll_d6_d2",
+	"univpll_d4_d2"
+};
+
+static const char * const msdc30_1_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d6_d2",
+	"mainpll_d7_d2",
+	"msdcpll_d2"
+};
+
+static const char * const msdc30_2_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d6_d2",
+	"mainpll_d7_d2",
+	"msdcpll_d2"
+};
+
+static const char * const audio_parents[] = {
+	"clk26m",
+	"mainpll_d5_d8",
+	"mainpll_d7_d8",
+	"mainpll_d4_d16"
+};
+
+static const char * const aud_intbus_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"mainpll_d7_d4"
+};
+
+static const char * const pwrap_ulposc_parents[] = {
+	"osc_d10",
+	"clk26m",
+	"osc_d4",
+	"osc_d8",
+	"osc_d16"
+};
+
+static const char * const atb_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d5_d2"
+};
+
+static const char * const sspm_parents[] = {
+	"clk26m",
+	"mainpll_d5_d2",
+	"univpll_d5_d2",
+	"mainpll_d4_d2",
+	"univpll_d4_d2",
+	"mainpll_d6"
+};
+
+static const char * const dpi_parents[] = {
+	"clk26m",
+	"tvdpll_d2",
+	"tvdpll_d4",
+	"tvdpll_d8",
+	"tvdpll_d16"
+};
+
+static const char * const scam_parents[] = {
+	"clk26m",
+	"mainpll_d5_d4"
+};
+
+static const char * const disp_pwm_parents[] = {
+	"clk26m",
+	"univpll_d6_d4",
+	"osc_d2",
+	"osc_d4",
+	"osc_d16"
+};
+
+static const char * const usb_top_parents[] = {
+	"clk26m",
+	"univpll_d5_d4",
+	"univpll_d6_d4",
+	"univpll_d5_d2"
+};
+
+static const char * const ssusb_xhci_parents[] = {
+	"clk26m",
+	"univpll_d5_d4",
+	"univpll_d6_d4",
+	"univpll_d5_d2"
+};
+
+static const char * const i2c_parents[] = {
+	"clk26m",
+	"mainpll_d4_d8",
+	"univpll_d5_d4"
+};
+
+static const char * const seninf_parents[] = {
+	"clk26m",
+	"univpll_d4_d4",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"univpll_d7",
+	"univpll_d6",
+	"mmpll_d6",
+	"univpll_d5"
+};
+
+static const char * const seninf1_parents[] = {
+	"clk26m",
+	"univpll_d4_d4",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"univpll_d7",
+	"univpll_d6",
+	"mmpll_d6",
+	"univpll_d5"
+};
+
+static const char * const seninf2_parents[] = {
+	"clk26m",
+	"univpll_d4_d4",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"univpll_d7",
+	"univpll_d6",
+	"mmpll_d6",
+	"univpll_d5"
+};
+
+static const char * const seninf3_parents[] = {
+	"clk26m",
+	"univpll_d4_d4",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"univpll_d7",
+	"univpll_d6",
+	"mmpll_d6",
+	"univpll_d5"
+};
+
+static const char * const tl_parents[] = {
+	"clk26m",
+	"univpll_192m_d2",
+	"mainpll_d6_d4"
+};
+
+static const char * const dxcc_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d4_d4",
+	"mainpll_d4_d8"
+};
+
+static const char * const aud_engen1_parents[] = {
+	"clk26m",
+	"apll1_d2",
+	"apll1_d4",
+	"apll1_d8"
+};
+
+static const char * const aud_engen2_parents[] = {
+	"clk26m",
+	"apll2_d2",
+	"apll2_d4",
+	"apll2_d8"
+};
+
+static const char * const aes_ufsfde_parents[] = {
+	"clk26m",
+	"mainpll_d4",
+	"mainpll_d4_d2",
+	"mainpll_d6",
+	"mainpll_d4_d4",
+	"univpll_d4_d2",
+	"univpll_d6"
+};
+
+static const char * const ufs_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"mainpll_d4_d8",
+	"univpll_d4_d4",
+	"mainpll_d6_d2",
+	"mainpll_d5_d2",
+	"msdcpll_d2"
+};
+
+static const char * const aud_1_parents[] = {
+	"clk26m",
+	"apll1_ck"
+};
+
+static const char * const aud_2_parents[] = {
+	"clk26m",
+	"apll2_ck"
+};
+
+static const char * const adsp_parents[] = {
+	"clk26m",
+	"mainpll_d6",
+	"mainpll_d5_d2",
+	"univpll_d4_d4",
+	"univpll_d4",
+	"univpll_d6",
+	"ulposc",
+	"adsppll_ck"
+};
+
+static const char * const dpmaif_main_parents[] = {
+	"clk26m",
+	"univpll_d4_d4",
+	"mainpll_d6",
+	"mainpll_d4_d2",
+	"univpll_d4_d2"
+};
+
+static const char * const venc_parents[] = {
+	"clk26m",
+	"mmpll_d7",
+	"mainpll_d6",
+	"univpll_d4_d2",
+	"mainpll_d4_d2",
+	"univpll_d6",
+	"mmpll_d6",
+	"mainpll_d5_d2",
+	"mainpll_d6_d2",
+	"mmpll_d9",
+	"univpll_d4_d4",
+	"mainpll_d4",
+	"univpll_d4",
+	"univpll_d5",
+	"univpll_d5_d2",
+	"mainpll_d5"
+};
+
+static const char * const vdec_parents[] = {
+	"clk26m",
+	"univpll_192m_d2",
+	"univpll_d5_d4",
+	"mainpll_d5",
+	"mainpll_d5_d2",
+	"mmpll_d6_d2",
+	"univpll_d5_d2",
+	"mainpll_d4_d2",
+	"univpll_d4_d2",
+	"univpll_d7",
+	"mmpll_d7",
+	"mmpll_d6",
+	"univpll_d5",
+	"mainpll_d4",
+	"univpll_d4",
+	"univpll_d6"
+};
+
+static const char * const camtm_parents[] = {
+	"clk26m",
+	"univpll_d7",
+	"univpll_d6_d2",
+	"univpll_d4_d2"
+};
+
+static const char * const pwm_parents[] = {
+	"clk26m",
+	"univpll_d4_d8"
+};
+
+static const char * const audio_h_parents[] = {
+	"clk26m",
+	"univpll_d7",
+	"apll1_ck",
+	"apll2_ck"
+};
+
+static const char * const spmi_mst_parents[] = {
+	"clk26m",
+	"csw_f26m_d2",
+	"osc_d8",
+	"osc_d10",
+	"osc_d16",
+	"osc_d20",
+	"clk32k"
+};
+
+static const char * const aes_msdcfde_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d6",
+	"mainpll_d4_d4",
+	"univpll_d4_d2",
+	"univpll_d6"
+};
+
+static const char * const mcupm_parents[] = {
+	"clk26m",
+	"mainpll_d6_d4",
+	"mainpll_d6_d2"
+};
+
+static const char * const sflash_parents[] = {
+	"clk26m",
+	"mainpll_d7_d8",
+	"univpll_d6_d8",
+	"univpll_d5_d8"
+};
+
+static const char * const apll_i2s0_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s1_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s2_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s3_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s4_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s5_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s6_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s7_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s8_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s9_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+/*
+ * CRITICAL CLOCK:
+ * axi_sel is the main bus clock of whole SOC.
+ * spm_sel is the clock of the always-on co-processor.
+ * bus_aximem_sel is clock of the bus that access emi.
+ */
+static const struct mtk_mux top_mtk_muxes[] = {
+	/* CLK_CFG_0 */
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_AXI_SEL, "axi_sel",
+		axi_parents, 0x010, 0x014, 0x018, 0, 3, 7, 0x004, 0,
+		CLK_IS_CRITICAL),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_SPM_SEL, "spm_sel",
+		spm_parents, 0x010, 0x014, 0x018, 8, 2, 15, 0x004, 1,
+		CLK_IS_CRITICAL),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SCP_SEL, "scp_sel",
+		scp_parents, 0x010, 0x014, 0x018, 16, 3, 23, 0x004, 2),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_BUS_AXIMEM_SEL, "bus_aximem_sel",
+		bus_aximem_parents, 0x010, 0x014, 0x018, 24, 3, 31, 0x004, 3,
+		CLK_IS_CRITICAL),
+	/* CLK_CFG_1 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DISP_SEL, "disp_sel",
+		disp_parents, 0x020, 0x024, 0x028, 0, 4, 7, 0x004, 4),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MDP_SEL, "mdp_sel",
+		mdp_parents, 0x020, 0x024, 0x028, 8, 4, 15, 0x004, 5),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IMG1_SEL, "img1_sel",
+		img1_parents, 0x020, 0x024, 0x028, 16, 4, 23, 0x004, 6),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IMG2_SEL, "img2_sel",
+		img2_parents, 0x020, 0x024, 0x028, 24, 4, 31, 0x004, 7),
+	/* CLK_CFG_2 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IPE_SEL, "ipe_sel",
+		ipe_parents, 0x030, 0x034, 0x038, 0, 4, 7, 0x004, 8),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DPE_SEL, "dpe_sel",
+		dpe_parents, 0x030, 0x034, 0x038, 8, 3, 15, 0x004, 9),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAM_SEL, "cam_sel",
+		cam_parents, 0x030, 0x034, 0x038, 16, 4, 23, 0x004, 10),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CCU_SEL, "ccu_sel",
+		ccu_parents, 0x030, 0x034, 0x038, 24, 4, 31, 0x004, 11),
+	/* CLK_CFG_4 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP7_SEL, "dsp7_sel",
+		dsp7_parents, 0x050, 0x054, 0x058, 0, 3, 7, 0x004, 16),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MFG_REF_SEL, "mfg_ref_sel",
+		mfg_ref_parents, 0x050, 0x054, 0x058, 16, 2, 23, 0x004, 18),
+	MUX_CLR_SET_UPD(CLK_TOP_MFG_PLL_SEL, "mfg_pll_sel",
+		mfg_pll_parents, 0x050, 0x054, 0x058, 18, 1, -1, -1),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG_SEL, "camtg_sel",
+		camtg_parents, 0x050, 0x054, 0x058, 24, 3, 31, 0x004, 19),
+	/* CLK_CFG_5 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG2_SEL, "camtg2_sel",
+		camtg2_parents, 0x060, 0x064, 0x068, 0, 3, 7, 0x004, 20),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG3_SEL, "camtg3_sel",
+		camtg3_parents, 0x060, 0x064, 0x068, 8, 3, 15, 0x004, 21),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG4_SEL, "camtg4_sel",
+		camtg4_parents, 0x060, 0x064, 0x068, 16, 3, 23, 0x004, 22),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG5_SEL, "camtg5_sel",
+		camtg5_parents, 0x060, 0x064, 0x068, 24, 3, 31, 0x004, 23),
+	/* CLK_CFG_6 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG6_SEL, "camtg6_sel",
+		camtg6_parents, 0x070, 0x074, 0x078, 0, 3, 7, 0x004, 24),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_UART_SEL, "uart_sel",
+		uart_parents, 0x070, 0x074, 0x078, 8, 1, 15, 0x004, 25),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SPI_SEL, "spi_sel",
+		spi_parents, 0x070, 0x074, 0x078, 16, 2, 23, 0x004, 26),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MSDC50_0_H_SEL, "msdc50_0_h_sel",
+		msdc50_0_h_parents, 0x070, 0x074, 0x078, 24, 2, 31, 0x004, 27),
+	/* CLK_CFG_7 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MSDC50_0_SEL, "msdc50_0_sel",
+		msdc50_0_parents, 0x080, 0x084, 0x088, 0, 3, 7, 0x004, 28),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MSDC30_1_SEL, "msdc30_1_sel",
+		msdc30_1_parents, 0x080, 0x084, 0x088, 8, 3, 15, 0x004, 29),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MSDC30_2_SEL, "msdc30_2_sel",
+		msdc30_2_parents, 0x080, 0x084, 0x088, 16, 3, 23, 0x004, 30),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUDIO_SEL, "audio_sel",
+		audio_parents, 0x080, 0x084, 0x088, 24, 2, 31, 0x008, 0),
+	/* CLK_CFG_8 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_INTBUS_SEL, "aud_intbus_sel",
+		aud_intbus_parents, 0x090, 0x094, 0x098, 0, 2, 7, 0x008, 1),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_PWRAP_ULPOSC_SEL, "pwrap_ulposc_sel",
+		pwrap_ulposc_parents, 0x090, 0x094, 0x098, 8, 3, 15, 0x008, 2),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_ATB_SEL, "atb_sel",
+		atb_parents, 0x090, 0x094, 0x098, 16, 2, 23, 0x008, 3),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SSPM_SEL, "sspm_sel",
+		sspm_parents, 0x090, 0x094, 0x098, 24, 3, 31, 0x008, 4),
+	/* CLK_CFG_9 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DPI_SEL, "dpi_sel",
+		dpi_parents, 0x0a0, 0x0a4, 0x0a8, 0, 3, 7, 0x008, 5),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SCAM_SEL, "scam_sel",
+		scam_parents, 0x0a0, 0x0a4, 0x0a8, 8, 1, 15, 0x008, 6),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DISP_PWM_SEL, "disp_pwm_sel",
+		disp_pwm_parents, 0x0a0, 0x0a4, 0x0a8, 16, 3, 23, 0x008, 7),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_USB_TOP_SEL, "usb_top_sel",
+		usb_top_parents, 0x0a0, 0x0a4, 0x0a8, 24, 2, 31, 0x008, 8),
+	/* CLK_CFG_10 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SSUSB_XHCI_SEL, "ssusb_xhci_sel",
+		ssusb_xhci_parents, 0x0b0, 0x0b4, 0x0b8, 0, 2, 7, 0x008, 9),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_I2C_SEL, "i2c_sel",
+		i2c_parents, 0x0b0, 0x0b4, 0x0b8, 8, 2, 15, 0x008, 10),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SENINF_SEL, "seninf_sel",
+		seninf_parents, 0x0b0, 0x0b4, 0x0b8, 16, 3, 23, 0x008, 11),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SENINF1_SEL, "seninf1_sel",
+		seninf1_parents, 0x0b0, 0x0b4, 0x0b8, 24, 3, 31, 0x008, 12),
+	/* CLK_CFG_11 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SENINF2_SEL, "seninf2_sel",
+		seninf2_parents, 0x0c0, 0x0c4, 0x0c8, 0, 3, 7, 0x008, 13),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SENINF3_SEL, "seninf3_sel",
+		seninf3_parents, 0x0c0, 0x0c4, 0x0c8, 8, 3, 15, 0x008, 14),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_TL_SEL, "tl_sel",
+		tl_parents, 0x0c0, 0x0c4, 0x0c8, 16, 2, 23, 0x008, 15),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DXCC_SEL, "dxcc_sel",
+		dxcc_parents, 0x0c0, 0x0c4, 0x0c8, 24, 2, 31, 0x008, 16),
+	/* CLK_CFG_12 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_ENGEN1_SEL, "aud_engen1_sel",
+		aud_engen1_parents, 0x0d0, 0x0d4, 0x0d8, 0, 2, 7, 0x008, 17),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_ENGEN2_SEL, "aud_engen2_sel",
+		aud_engen2_parents, 0x0d0, 0x0d4, 0x0d8, 8, 2, 15, 0x008, 18),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AES_UFSFDE_SEL, "aes_ufsfde_sel",
+		aes_ufsfde_parents, 0x0d0, 0x0d4, 0x0d8, 16, 3, 23, 0x008, 19),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_UFS_SEL, "ufs_sel",
+		ufs_parents, 0x0d0, 0x0d4, 0x0d8, 24, 3, 31, 0x008, 20),
+	/* CLK_CFG_13 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_1_SEL, "aud_1_sel",
+		aud_1_parents, 0x0e0, 0x0e4, 0x0e8, 0, 1, 7, 0x008, 21),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_2_SEL, "aud_2_sel",
+		aud_2_parents, 0x0e0, 0x0e4, 0x0e8, 8, 1, 15, 0x008, 22),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_ADSP_SEL, "adsp_sel",
+		adsp_parents, 0x0e0, 0x0e4, 0x0e8, 16, 3, 23, 0x008, 23),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DPMAIF_MAIN_SEL, "dpmaif_main_sel",
+		dpmaif_main_parents, 0x0e0, 0x0e4, 0x0e8, 24, 3, 31, 0x008, 24),
+	/* CLK_CFG_14 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_VENC_SEL, "venc_sel",
+		venc_parents, 0x0f0, 0x0f4, 0x0f8, 0, 4, 7, 0x008, 25),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_VDEC_SEL, "vdec_sel",
+		vdec_parents, 0x0f0, 0x0f4, 0x0f8, 8, 4, 15, 0x008, 26),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTM_SEL, "camtm_sel",
+		camtm_parents, 0x0f0, 0x0f4, 0x0f8, 16, 2, 23, 0x008, 27),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_PWM_SEL, "pwm_sel",
+		pwm_parents, 0x0f0, 0x0f4, 0x0f8, 24, 1, 31, 0x008, 28),
+	/* CLK_CFG_15 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUDIO_H_SEL, "audio_h_sel",
+		audio_h_parents, 0x100, 0x104, 0x108, 0, 2, 7, 0x008, 29),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SPMI_MST_SEL, "spmi_mst_sel",
+		spmi_mst_parents, 0x100, 0x104, 0x108, 8, 3, 15, 0x008, 30),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AES_MSDCFDE_SEL, "aes_msdcfde_sel",
+		aes_msdcfde_parents, 0x100, 0x104, 0x108, 24, 3, 31, 0x00c, 1),
+	/* CLK_CFG_16 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MCUPM_SEL, "mcupm_sel",
+		mcupm_parents, 0x110, 0x114, 0x118, 0, 2, 7, 0x00c, 2),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SFLASH_SEL, "sflash_sel",
+		sflash_parents, 0x110, 0x114, 0x118, 8, 2, 15, 0x00c, 3),
+};
+
+static struct mtk_composite top_muxes[] = {
+	/* CLK_AUDDIV_0 */
+	MUX(CLK_TOP_APLL_I2S0_M_SEL, "apll_i2s0_m_sel", apll_i2s0_m_parents, 0x320, 16, 1),
+	MUX(CLK_TOP_APLL_I2S1_M_SEL, "apll_i2s1_m_sel", apll_i2s1_m_parents, 0x320, 17, 1),
+	MUX(CLK_TOP_APLL_I2S2_M_SEL, "apll_i2s2_m_sel", apll_i2s2_m_parents, 0x320, 18, 1),
+	MUX(CLK_TOP_APLL_I2S3_M_SEL, "apll_i2s3_m_sel", apll_i2s3_m_parents, 0x320, 19, 1),
+	MUX(CLK_TOP_APLL_I2S4_M_SEL, "apll_i2s4_m_sel", apll_i2s4_m_parents, 0x320, 20, 1),
+	MUX(CLK_TOP_APLL_I2S5_M_SEL, "apll_i2s5_m_sel", apll_i2s5_m_parents, 0x320, 21, 1),
+	MUX(CLK_TOP_APLL_I2S6_M_SEL, "apll_i2s6_m_sel", apll_i2s6_m_parents, 0x320, 22, 1),
+	MUX(CLK_TOP_APLL_I2S7_M_SEL, "apll_i2s7_m_sel", apll_i2s7_m_parents, 0x320, 23, 1),
+	MUX(CLK_TOP_APLL_I2S8_M_SEL, "apll_i2s8_m_sel", apll_i2s8_m_parents, 0x320, 24, 1),
+	MUX(CLK_TOP_APLL_I2S9_M_SEL, "apll_i2s9_m_sel", apll_i2s9_m_parents, 0x320, 25, 1),
+};
+
+static const struct mtk_composite top_adj_divs[] = {
+	DIV_GATE(CLK_TOP_APLL12_DIV0, "apll12_div0", "apll_i2s0_m_sel", 0x320, 0, 0x328, 8, 0),
+	DIV_GATE(CLK_TOP_APLL12_DIV1, "apll12_div1", "apll_i2s1_m_sel", 0x320, 1, 0x328, 8, 8),
+	DIV_GATE(CLK_TOP_APLL12_DIV2, "apll12_div2", "apll_i2s2_m_sel", 0x320, 2, 0x328, 8, 16),
+	DIV_GATE(CLK_TOP_APLL12_DIV3, "apll12_div3", "apll_i2s3_m_sel", 0x320, 3, 0x328, 8, 24),
+	DIV_GATE(CLK_TOP_APLL12_DIV4, "apll12_div4", "apll_i2s4_m_sel", 0x320, 4, 0x334, 8, 0),
+	DIV_GATE(CLK_TOP_APLL12_DIVB, "apll12_divb", "apll12_div4", 0x320, 5, 0x334, 8, 8),
+	DIV_GATE(CLK_TOP_APLL12_DIV5, "apll12_div5", "apll_i2s5_m_sel", 0x320, 6, 0x334, 8, 16),
+	DIV_GATE(CLK_TOP_APLL12_DIV6, "apll12_div6", "apll_i2s6_m_sel", 0x320, 7, 0x334, 8, 24),
+	DIV_GATE(CLK_TOP_APLL12_DIV7, "apll12_div7", "apll_i2s7_m_sel", 0x320, 8, 0x338, 8, 0),
+	DIV_GATE(CLK_TOP_APLL12_DIV8, "apll12_div8", "apll_i2s8_m_sel", 0x320, 9, 0x338, 8, 8),
+	DIV_GATE(CLK_TOP_APLL12_DIV9, "apll12_div9", "apll_i2s9_m_sel", 0x320, 10, 0x338, 8, 16),
+};
+
+static const struct mtk_gate_regs apmixed_cg_regs = {
+	.set_ofs = 0x14,
+	.clr_ofs = 0x14,
+	.sta_ofs = 0x14,
+};
+
+#define GATE_APMIXED(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &apmixed_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+static const struct mtk_gate apmixed_clks[] = {
+	GATE_APMIXED(CLK_APMIXED_MIPID26M, "mipid26m", "clk26m", 16),
+};
+
+static const struct mtk_gate_regs infra0_cg_regs = {
+	.set_ofs = 0x80,
+	.clr_ofs = 0x84,
+	.sta_ofs = 0x90,
+};
+
+static const struct mtk_gate_regs infra1_cg_regs = {
+	.set_ofs = 0x88,
+	.clr_ofs = 0x8c,
+	.sta_ofs = 0x94,
+};
+
+static const struct mtk_gate_regs infra2_cg_regs = {
+	.set_ofs = 0xa4,
+	.clr_ofs = 0xa8,
+	.sta_ofs = 0xac,
+};
+
+static const struct mtk_gate_regs infra3_cg_regs = {
+	.set_ofs = 0xc0,
+	.clr_ofs = 0xc4,
+	.sta_ofs = 0xc8,
+};
+
+static const struct mtk_gate_regs infra4_cg_regs = {
+	.set_ofs = 0xd0,
+	.clr_ofs = 0xd4,
+	.sta_ofs = 0xd8,
+};
+
+static const struct mtk_gate_regs infra5_cg_regs = {
+	.set_ofs = 0xe0,
+	.clr_ofs = 0xe4,
+	.sta_ofs = 0xe8,
+};
+
+#define GATE_INFRA0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &infra0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_INFRA1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &infra1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_INFRA2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &infra2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_INFRA3(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &infra3_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_INFRA4(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &infra4_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_INFRA5_FLAGS(_id, _name, _parent, _shift, _flag)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &infra5_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, _flag)
+
+#define GATE_INFRA5(_id, _name, _parent, _shift)	\
+	GATE_INFRA5_FLAGS(_id, _name, _parent, _shift, 0)
+
+/*
+ * CRITICAL CLOCK:
+ * infra_133m and infra_66m are main peripheral bus clocks of SOC.
+ */
+static const struct mtk_gate infra_clks[] = {
+	/* INFRA0 */
+	GATE_INFRA0(CLK_INFRA_PMIC_TMR, "infra_pmic_tmr", "pwrap_ulposc_sel", 0),
+	GATE_INFRA0(CLK_INFRA_PMIC_AP, "infra_pmic_ap", "pwrap_ulposc_sel", 1),
+	GATE_INFRA0(CLK_INFRA_PMIC_MD, "infra_pmic_md", "pwrap_ulposc_sel", 2),
+	GATE_INFRA0(CLK_INFRA_PMIC_CONN, "infra_pmic_conn", "pwrap_ulposc_sel", 3),
+	GATE_INFRA0(CLK_INFRA_SCPSYS, "infra_scpsys", "scp_sel", 4),
+	GATE_INFRA0(CLK_INFRA_SEJ, "infra_sej", "axi_sel", 5),
+	GATE_INFRA0(CLK_INFRA_APXGPT, "infra_apxgpt", "axi_sel", 6),
+	GATE_INFRA0(CLK_INFRA_MCUPM, "infra_mcupm", "mcupm_sel", 7),
+	GATE_INFRA0(CLK_INFRA_GCE, "infra_gce", "axi_sel", 8),
+	GATE_INFRA0(CLK_INFRA_GCE2, "infra_gce2", "axi_sel", 9),
+	GATE_INFRA0(CLK_INFRA_THERM, "infra_therm", "axi_sel", 10),
+	GATE_INFRA0(CLK_INFRA_I2C0, "infra_i2c0", "i2c_sel", 11),
+	GATE_INFRA0(CLK_INFRA_AP_DMA_PSEUDO, "infra_ap_dma_pseudo", "axi_sel", 12),
+	GATE_INFRA0(CLK_INFRA_I2C2, "infra_i2c2", "i2c_sel", 13),
+	GATE_INFRA0(CLK_INFRA_I2C3, "infra_i2c3", "i2c_sel", 14),
+	GATE_INFRA0(CLK_INFRA_PWM_H, "infra_pwm_h", "axi_sel", 15),
+	GATE_INFRA0(CLK_INFRA_PWM1, "infra_pwm1", "pwm_sel", 16),
+	GATE_INFRA0(CLK_INFRA_PWM2, "infra_pwm2", "pwm_sel", 17),
+	GATE_INFRA0(CLK_INFRA_PWM3, "infra_pwm3", "pwm_sel", 18),
+	GATE_INFRA0(CLK_INFRA_PWM4, "infra_pwm4", "pwm_sel", 19),
+	GATE_INFRA0(CLK_INFRA_PWM, "infra_pwm", "pwm_sel", 21),
+	GATE_INFRA0(CLK_INFRA_UART0, "infra_uart0", "uart_sel", 22),
+	GATE_INFRA0(CLK_INFRA_UART1, "infra_uart1", "uart_sel", 23),
+	GATE_INFRA0(CLK_INFRA_UART2, "infra_uart2", "uart_sel", 24),
+	GATE_INFRA0(CLK_INFRA_UART3, "infra_uart3", "uart_sel", 25),
+	GATE_INFRA0(CLK_INFRA_GCE_26M, "infra_gce_26m", "axi_sel", 27),
+	GATE_INFRA0(CLK_INFRA_CQ_DMA_FPC, "infra_cq_dma_fpc", "axi_sel", 28),
+	GATE_INFRA0(CLK_INFRA_BTIF, "infra_btif", "axi_sel", 31),
+	/* INFRA1 */
+	GATE_INFRA1(CLK_INFRA_SPI0, "infra_spi0", "spi_sel", 1),
+	GATE_INFRA1(CLK_INFRA_MSDC0, "infra_msdc0", "msdc50_0_h_sel", 2),
+	GATE_INFRA1(CLK_INFRA_MSDC1, "infra_msdc1", "msdc50_0_h_sel", 4),
+	GATE_INFRA1(CLK_INFRA_MSDC2, "infra_msdc2", "msdc50_0_h_sel", 5),
+	GATE_INFRA1(CLK_INFRA_MSDC0_SRC, "infra_msdc0_src", "msdc50_0_sel", 6),
+	GATE_INFRA1(CLK_INFRA_GCPU, "infra_gcpu", "axi_sel", 8),
+	GATE_INFRA1(CLK_INFRA_TRNG, "infra_trng", "axi_sel", 9),
+	GATE_INFRA1(CLK_INFRA_AUXADC, "infra_auxadc", "clk26m", 10),
+	GATE_INFRA1(CLK_INFRA_CPUM, "infra_cpum", "axi_sel", 11),
+	GATE_INFRA1(CLK_INFRA_CCIF1_AP, "infra_ccif1_ap", "axi_sel", 12),
+	GATE_INFRA1(CLK_INFRA_CCIF1_MD, "infra_ccif1_md", "axi_sel", 13),
+	GATE_INFRA1(CLK_INFRA_AUXADC_MD, "infra_auxadc_md", "clk26m", 14),
+	GATE_INFRA1(CLK_INFRA_PCIE_TL_26M, "infra_pcie_tl_26m", "axi_sel", 15),
+	GATE_INFRA1(CLK_INFRA_MSDC1_SRC, "infra_msdc1_src", "msdc30_1_sel", 16),
+	GATE_INFRA1(CLK_INFRA_MSDC2_SRC, "infra_msdc2_src", "msdc30_2_sel", 17),
+	GATE_INFRA1(CLK_INFRA_PCIE_TL_96M, "infra_pcie_tl_96m", "tl_sel", 18),
+	GATE_INFRA1(CLK_INFRA_PCIE_PL_P_250M, "infra_pcie_pl_p_250m", "axi_sel", 19),
+	GATE_INFRA1(CLK_INFRA_DEVICE_APC, "infra_device_apc", "axi_sel", 20),
+	GATE_INFRA1(CLK_INFRA_CCIF_AP, "infra_ccif_ap", "axi_sel", 23),
+	GATE_INFRA1(CLK_INFRA_DEBUGSYS, "infra_debugsys", "axi_sel", 24),
+	GATE_INFRA1(CLK_INFRA_AUDIO, "infra_audio", "axi_sel", 25),
+	GATE_INFRA1(CLK_INFRA_CCIF_MD, "infra_ccif_md", "axi_sel", 26),
+	GATE_INFRA1(CLK_INFRA_DXCC_SEC_CORE, "infra_dxcc_sec_core", "dxcc_sel", 27),
+	GATE_INFRA1(CLK_INFRA_DXCC_AO, "infra_dxcc_ao", "dxcc_sel", 28),
+	GATE_INFRA1(CLK_INFRA_DBG_TRACE, "infra_dbg_trace", "axi_sel", 29),
+	GATE_INFRA1(CLK_INFRA_DEVMPU_B, "infra_devmpu_b", "axi_sel", 30),
+	GATE_INFRA1(CLK_INFRA_DRAMC_F26M, "infra_dramc_f26m", "clk26m", 31),
+	/* INFRA2 */
+	GATE_INFRA2(CLK_INFRA_IRTX, "infra_irtx", "clk26m", 0),
+	GATE_INFRA2(CLK_INFRA_SSUSB, "infra_ssusb", "usb_top_sel", 1),
+	GATE_INFRA2(CLK_INFRA_DISP_PWM, "infra_disp_pwm", "axi_sel", 2),
+	GATE_INFRA2(CLK_INFRA_CLDMA_B, "infra_cldma_b", "axi_sel", 3),
+	GATE_INFRA2(CLK_INFRA_AUDIO_26M_B, "infra_audio_26m_b", "clk26m", 4),
+	GATE_INFRA2(CLK_INFRA_MODEM_TEMP_SHARE, "infra_modem_temp_share", "clk26m", 5),
+	GATE_INFRA2(CLK_INFRA_SPI1, "infra_spi1", "spi_sel", 6),
+	GATE_INFRA2(CLK_INFRA_I2C4, "infra_i2c4", "i2c_sel", 7),
+	GATE_INFRA2(CLK_INFRA_SPI2, "infra_spi2", "spi_sel", 9),
+	GATE_INFRA2(CLK_INFRA_SPI3, "infra_spi3", "spi_sel", 10),
+	GATE_INFRA2(CLK_INFRA_UNIPRO_SYS, "infra_unipro_sys", "ufs_sel", 11),
+	GATE_INFRA2(CLK_INFRA_UNIPRO_TICK, "infra_unipro_tick", "clk26m", 12),
+	GATE_INFRA2(CLK_INFRA_UFS_MP_SAP_B, "infra_ufs_mp_sap_b", "clk26m", 13),
+	GATE_INFRA2(CLK_INFRA_MD32_B, "infra_md32_b", "axi_sel", 14),
+	GATE_INFRA2(CLK_INFRA_SSPM, "infra_sspm", "sspm_sel", 15),
+	GATE_INFRA2(CLK_INFRA_UNIPRO_MBIST, "infra_unipro_mbist", "axi_sel", 16),
+	GATE_INFRA2(CLK_INFRA_SSPM_BUS_H, "infra_sspm_bus_h", "axi_sel", 17),
+	GATE_INFRA2(CLK_INFRA_I2C5, "infra_i2c5", "i2c_sel", 18),
+	GATE_INFRA2(CLK_INFRA_I2C5_ARBITER, "infra_i2c5_arbiter", "i2c_sel", 19),
+	GATE_INFRA2(CLK_INFRA_I2C5_IMM, "infra_i2c5_imm", "i2c_sel", 20),
+	GATE_INFRA2(CLK_INFRA_I2C1_ARBITER, "infra_i2c1_arbiter", "i2c_sel", 21),
+	GATE_INFRA2(CLK_INFRA_I2C1_IMM, "infra_i2c1_imm", "i2c_sel", 22),
+	GATE_INFRA2(CLK_INFRA_I2C2_ARBITER, "infra_i2c2_arbiter", "i2c_sel", 23),
+	GATE_INFRA2(CLK_INFRA_I2C2_IMM, "infra_i2c2_imm", "i2c_sel", 24),
+	GATE_INFRA2(CLK_INFRA_SPI4, "infra_spi4", "spi_sel", 25),
+	GATE_INFRA2(CLK_INFRA_SPI5, "infra_spi5", "spi_sel", 26),
+	GATE_INFRA2(CLK_INFRA_CQ_DMA, "infra_cq_dma", "axi_sel", 27),
+	GATE_INFRA2(CLK_INFRA_UFS, "infra_ufs", "ufs_sel", 28),
+	GATE_INFRA2(CLK_INFRA_AES_UFSFDE, "infra_aes_ufsfde", "aes_ufsfde_sel", 29),
+	GATE_INFRA2(CLK_INFRA_UFS_TICK, "infra_ufs_tick", "ufs_sel", 30),
+	GATE_INFRA2(CLK_INFRA_SSUSB_XHCI, "infra_ssusb_xhci", "ssusb_xhci_sel", 31),
+	/* INFRA3 */
+	GATE_INFRA3(CLK_INFRA_MSDC0_SELF, "infra_msdc0_self", "msdc50_0_sel", 0),
+	GATE_INFRA3(CLK_INFRA_MSDC1_SELF, "infra_msdc1_self", "msdc50_0_sel", 1),
+	GATE_INFRA3(CLK_INFRA_MSDC2_SELF, "infra_msdc2_self", "msdc50_0_sel", 2),
+	GATE_INFRA3(CLK_INFRA_SSPM_26M_SELF, "infra_sspm_26m_self", "clk26m", 3),
+	GATE_INFRA3(CLK_INFRA_SSPM_32K_SELF, "infra_sspm_32k_self", "clk32k", 4),
+	GATE_INFRA3(CLK_INFRA_UFS_AXI, "infra_ufs_axi", "axi_sel", 5),
+	GATE_INFRA3(CLK_INFRA_I2C6, "infra_i2c6", "i2c_sel", 6),
+	GATE_INFRA3(CLK_INFRA_AP_MSDC0, "infra_ap_msdc0", "msdc50_0_sel", 7),
+	GATE_INFRA3(CLK_INFRA_MD_MSDC0, "infra_md_msdc0", "msdc50_0_sel", 8),
+	GATE_INFRA3(CLK_INFRA_CCIF5_AP, "infra_ccif5_ap", "axi_sel", 9),
+	GATE_INFRA3(CLK_INFRA_CCIF5_MD, "infra_ccif5_md", "axi_sel", 10),
+	GATE_INFRA3(CLK_INFRA_PCIE_TOP_H_133M, "infra_pcie_top_h_133m", "axi_sel", 11),
+	GATE_INFRA3(CLK_INFRA_FLASHIF_TOP_H_133M, "infra_flashif_top_h_133m", "axi_sel", 14),
+	GATE_INFRA3(CLK_INFRA_PCIE_PERI_26M, "infra_pcie_peri_26m", "axi_sel", 15),
+	GATE_INFRA3(CLK_INFRA_CCIF2_AP, "infra_ccif2_ap", "axi_sel", 16),
+	GATE_INFRA3(CLK_INFRA_CCIF2_MD, "infra_ccif2_md", "axi_sel", 17),
+	GATE_INFRA3(CLK_INFRA_CCIF3_AP, "infra_ccif3_ap", "axi_sel", 18),
+	GATE_INFRA3(CLK_INFRA_CCIF3_MD, "infra_ccif3_md", "axi_sel", 19),
+	GATE_INFRA3(CLK_INFRA_SEJ_F13M, "infra_sej_f13m", "clk26m", 20),
+	GATE_INFRA3(CLK_INFRA_AES, "infra_aes", "axi_sel", 21),
+	GATE_INFRA3(CLK_INFRA_I2C7, "infra_i2c7", "i2c_sel", 22),
+	GATE_INFRA3(CLK_INFRA_I2C8, "infra_i2c8", "i2c_sel", 23),
+	GATE_INFRA3(CLK_INFRA_FBIST2FPC, "infra_fbist2fpc", "msdc50_0_sel", 24),
+	GATE_INFRA3(CLK_INFRA_DEVICE_APC_SYNC, "infra_device_apc_sync", "axi_sel", 25),
+	GATE_INFRA3(CLK_INFRA_DPMAIF_MAIN, "infra_dpmaif_main", "dpmaif_main_sel", 26),
+	GATE_INFRA3(CLK_INFRA_PCIE_TL_32K, "infra_pcie_tl_32k", "axi_sel", 27),
+	GATE_INFRA3(CLK_INFRA_CCIF4_AP, "infra_ccif4_ap", "axi_sel", 28),
+	GATE_INFRA3(CLK_INFRA_CCIF4_MD, "infra_ccif4_md", "axi_sel", 29),
+	GATE_INFRA3(CLK_INFRA_SPI6, "infra_spi6", "spi_sel", 30),
+	GATE_INFRA3(CLK_INFRA_SPI7, "infra_spi7", "spi_sel", 31),
+	/* INFRA4 */
+	GATE_INFRA4(CLK_INFRA_AP_DMA, "infra_ap_dma", "infra_ap_dma_pseudo", 31),
+	/* INFRA5 */
+	GATE_INFRA5_FLAGS(CLK_INFRA_133M, "infra_133m", "axi_sel", 0, CLK_IS_CRITICAL),
+	GATE_INFRA5_FLAGS(CLK_INFRA_66M, "infra_66m", "axi_sel", 1, CLK_IS_CRITICAL),
+	GATE_INFRA5(CLK_INFRA_66M_PERI_BUS, "infra_66m_peri_bus", "axi_sel", 2),
+	GATE_INFRA5(CLK_INFRA_FREE_DCM_133M, "infra_free_dcm_133m", "axi_sel", 3),
+	GATE_INFRA5(CLK_INFRA_FREE_DCM_66M, "infra_free_dcm_66m", "axi_sel", 4),
+	GATE_INFRA5(CLK_INFRA_PERI_BUS_DCM_133M, "infra_peri_bus_dcm_133m", "axi_sel", 5),
+	GATE_INFRA5(CLK_INFRA_PERI_BUS_DCM_66M, "infra_peri_bus_dcm_66m", "axi_sel", 6),
+	GATE_INFRA5(CLK_INFRA_FLASHIF_PERI_26M, "infra_flashif_peri_26m", "axi_sel", 30),
+	GATE_INFRA5(CLK_INFRA_FLASHIF_SFLASH, "infra_flashif_fsflash", "axi_sel", 31),
+};
+
+static const struct mtk_gate_regs peri_cg_regs = {
+	.set_ofs = 0x20c,
+	.clr_ofs = 0x20c,
+	.sta_ofs = 0x20c,
+};
+
+#define GATE_PERI(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &peri_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+static const struct mtk_gate peri_clks[] = {
+	GATE_PERI(CLK_PERI_PERIAXI, "peri_periaxi", "axi_sel", 31),
+};
+
+static const struct mtk_gate_regs top_cg_regs = {
+	.set_ofs = 0x150,
+	.clr_ofs = 0x150,
+	.sta_ofs = 0x150,
+};
+
+#define GATE_TOP(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &top_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+static const struct mtk_gate top_clks[] = {
+	GATE_TOP(CLK_TOP_SSUSB_TOP_REF, "ssusb_top_ref", "clk26m", 24),
+	GATE_TOP(CLK_TOP_SSUSB_PHY_REF, "ssusb_phy_ref", "clk26m", 25),
+};
+
+#define MT8192_PLL_FMAX		(3800UL * MHZ)
+#define MT8192_PLL_FMIN		(1500UL * MHZ)
+#define MT8192_INTEGER_BITS	8
+
+#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags,		\
+			_rst_bar_mask, _pcwbits, _pd_reg, _pd_shift,	\
+			_tuner_reg, _tuner_en_reg, _tuner_en_bit,	\
+			_pcw_reg, _pcw_shift, _pcw_chg_reg,		\
+			_en_reg, _pll_en_bit) {				\
+		.id = _id,						\
+		.name = _name,						\
+		.reg = _reg,						\
+		.pwr_reg = _pwr_reg,					\
+		.en_mask = _en_mask,					\
+		.flags = _flags,					\
+		.rst_bar_mask = _rst_bar_mask,				\
+		.fmax = MT8192_PLL_FMAX,				\
+		.fmin = MT8192_PLL_FMIN,				\
+		.pcwbits = _pcwbits,					\
+		.pcwibits = MT8192_INTEGER_BITS,			\
+		.pd_reg = _pd_reg,					\
+		.pd_shift = _pd_shift,					\
+		.tuner_reg = _tuner_reg,				\
+		.tuner_en_reg = _tuner_en_reg,				\
+		.tuner_en_bit = _tuner_en_bit,				\
+		.pcw_reg = _pcw_reg,					\
+		.pcw_shift = _pcw_shift,				\
+		.pcw_chg_reg = _pcw_chg_reg,				\
+		.en_reg = _en_reg,					\
+		.pll_en_bit = _pll_en_bit,				\
+	}
+
+#define PLL_B(_id, _name, _reg, _pwr_reg, _en_mask, _flags,		\
+			_rst_bar_mask, _pcwbits, _pd_reg, _pd_shift,	\
+			_tuner_reg, _tuner_en_reg, _tuner_en_bit,	\
+			_pcw_reg, _pcw_shift)				\
+		PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags,	\
+			_rst_bar_mask, _pcwbits, _pd_reg, _pd_shift,	\
+			_tuner_reg, _tuner_en_reg, _tuner_en_bit,	\
+			_pcw_reg, _pcw_shift, 0, 0, 0)
+
+static const struct mtk_pll_data plls[] = {
+	PLL_B(CLK_APMIXED_MAINPLL, "mainpll", 0x0340, 0x034c, 0xff000000,
+		HAVE_RST_BAR, BIT(23), 22, 0x0344, 24, 0, 0, 0, 0x0344, 0),
+	PLL_B(CLK_APMIXED_UNIVPLL, "univpll", 0x0308, 0x0314, 0xff000000,
+		HAVE_RST_BAR, BIT(23), 22, 0x030c, 24, 0, 0, 0, 0x030c, 0),
+	PLL(CLK_APMIXED_USBPLL, "usbpll", 0x03c4, 0x03cc, 0x00000000,
+		0, 0, 22, 0x03c4, 24, 0, 0, 0, 0x03c4, 0, 0x03c4, 0x03cc, 2),
+	PLL_B(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0350, 0x035c, 0x00000000,
+		0, 0, 22, 0x0354, 24, 0, 0, 0, 0x0354, 0),
+	PLL_B(CLK_APMIXED_MMPLL, "mmpll", 0x0360, 0x036c, 0xff000000,
+		HAVE_RST_BAR, BIT(23), 22, 0x0364, 24, 0, 0, 0, 0x0364, 0),
+	PLL_B(CLK_APMIXED_ADSPPLL, "adsppll", 0x0370, 0x037c, 0xff000000,
+		HAVE_RST_BAR, BIT(23), 22, 0x0374, 24, 0, 0, 0, 0x0374, 0),
+	PLL_B(CLK_APMIXED_MFGPLL, "mfgpll", 0x0268, 0x0274, 0x00000000,
+		0, 0, 22, 0x026c, 24, 0, 0, 0, 0x026c, 0),
+	PLL_B(CLK_APMIXED_TVDPLL, "tvdpll", 0x0380, 0x038c, 0x00000000,
+		0, 0, 22, 0x0384, 24, 0, 0, 0, 0x0384, 0),
+	PLL_B(CLK_APMIXED_APLL1, "apll1", 0x0318, 0x0328, 0x00000000,
+		0, 0, 32, 0x031c, 24, 0x0040, 0x000c, 0, 0x0320, 0),
+	PLL_B(CLK_APMIXED_APLL2, "apll2", 0x032c, 0x033c, 0x00000000,
+		0, 0, 32, 0x0330, 24, 0, 0, 0, 0x0334, 0),
+};
+
+static struct clk_onecell_data *top_clk_data;
+
+static void clk_mt8192_top_init_early(struct device_node *node)
+{
+	int i;
+
+	top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+	if (!top_clk_data)
+		return;
+
+	for (i = 0; i < CLK_TOP_NR_CLK; i++)
+		top_clk_data->clks[i] = ERR_PTR(-EPROBE_DEFER);
+
+	mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs), top_clk_data);
+
+	of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
+}
+
+CLK_OF_DECLARE_DRIVER(mt8192_topckgen, "mediatek,mt8192-topckgen",
+			clk_mt8192_top_init_early);
+
+static int clk_mt8192_top_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
+	mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs), top_clk_data);
+	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+	mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node, &mt8192_clk_lock,
+			top_clk_data);
+	mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base, &mt8192_clk_lock,
+			top_clk_data);
+	mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base, &mt8192_clk_lock,
+			top_clk_data);
+	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
+}
+
+static int clk_mt8192_infra_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static int clk_mt8192_peri_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, peri_clks, ARRAY_SIZE(peri_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192[] = {
+	{
+		.compatible = "mediatek,mt8192-apmixedsys",
+		.data = clk_mt8192_apmixed_probe,
+	}, {
+		.compatible = "mediatek,mt8192-topckgen",
+		.data = clk_mt8192_top_probe,
+	}, {
+		.compatible = "mediatek,mt8192-infracfg",
+		.data = clk_mt8192_infra_probe,
+	}, {
+		.compatible = "mediatek,mt8192-pericfg",
+		.data = clk_mt8192_peri_probe,
+	}, {
+		/* sentinel */
+	}
+};
+
+static int clk_mt8192_probe(struct platform_device *pdev)
+{
+	int (*clk_probe)(struct platform_device *pdev);
+	int r;
+
+	clk_probe = of_device_get_match_data(&pdev->dev);
+	if (!clk_probe)
+		return -EINVAL;
+
+	r = clk_probe(pdev);
+	if (r)
+		dev_err(&pdev->dev, "could not register clock provider: %s: %d\n", pdev->name, r);
+
+	return r;
+}
+
+static struct platform_driver clk_mt8192_drv = {
+	.probe = clk_mt8192_probe,
+	.driver = {
+		.name = "clk-mt8192",
+		.of_match_table = of_match_clk_mt8192,
+	},
+};
+
+static int __init clk_mt8192_init(void)
+{
+	return platform_driver_register(&clk_mt8192_drv);
+}
+
+arch_initcall(clk_mt8192_init);
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index f5625f4..afbc7df 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -77,6 +77,21 @@ struct mtk_mux {
 			_width, _gate, _upd_ofs, _upd,			\
 			CLK_SET_RATE_PARENT)
 
+#define MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,		\
+			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
+			_upd_ofs, _upd, _flags)				\
+		GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,	\
+			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
+			0, _upd_ofs, _upd, _flags,			\
+			mtk_mux_clr_set_upd_ops)
+
+#define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,			\
+			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
+			_upd_ofs, _upd)					\
+		MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents,		\
+			_mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,	\
+			_width, _upd_ofs, _upd,	CLK_SET_RATE_PARENT)
+
 struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
 				 struct regmap *regmap,
 				 spinlock_t *lock);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
