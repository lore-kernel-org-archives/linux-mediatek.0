Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0D2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 05:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yW2FrriAGMPi3BlRoQD2saKzgj7GzO8cKgexPpJLwGc=; b=dPVUBLGXDjHRCu
	4O9qXifTR6QBf7xvjpD4X2q1a1ds2GG7uDQFeecE9t2QOmlYvoNBCLSK8CSCxdSXENA7fkeQ5z05J
	eaRLIb6UlQ6wZHSInA7FjCW0e8agPc/F31Y62NspUFzsfQBNuNnuXAyE+nvNN+SOJBrLiX8sVS+UQ
	gKMoX/9mJ0mtLs9g3usY4/nUemsItlAANhql+Xt+cdCbC6j1zlUXqYVpa5+X+LIZ/Ag9l7Pz+hKGY
	fjeDypF8TFTt3J/nmddfBikvzDUmlL/nMz+XcZxniuxtLgS+Hi/XNU++ZVyvFP+a6ruQ9WXB0pMPo
	8oiClLNJU1U9d7uX8Q5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmIr-00GJ52-Bt; Fri, 22 Apr 2022 05:58:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmII-00GInu-JA; Fri, 22 Apr 2022 05:57:28 +0000
X-UUID: 9a9d3a1783e9418b93dbb5f96838b807-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:28e1ab76-59dd-40af-91e7-1ace7fc65cb1, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:d1d992f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 9a9d3a1783e9418b93dbb5f96838b807-20220421
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2041969755; Thu, 21 Apr 2022 22:57:18 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 22:57:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 22 Apr 2022 13:57:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 13:57:15 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
 <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, YC Hung <yc.hung@mediatek.com>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>
CC: <linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 2/4] ASoC: SOF: mediatek: Add mt8186 sof fw loader and dsp
 ops
Date: Fri, 22 Apr 2022 13:56:57 +0800
Message-ID: <20220422055659.8738-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20220422055659.8738-1-tinghan.shen@mediatek.com>
References: <20220422055659.8738-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_225726_652660_BAFC5436 
X-CRM114-Status: GOOD (  19.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mt8186-loader module with ops callback to load and run firmware
on mt8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8186/Makefile        |  2 +-
 sound/soc/sof/mediatek/mt8186/mt8186-loader.c | 53 +++++++++++++++++++
 sound/soc/sof/mediatek/mt8186/mt8186.c        | 18 +++++++
 sound/soc/sof/mediatek/mt8186/mt8186.h        |  3 ++
 4 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186-loader.c

diff --git a/sound/soc/sof/mediatek/mt8186/Makefile b/sound/soc/sof/mediatek/mt8186/Makefile
index e0e971c17d5e..03a12f2096f9 100644
--- a/sound/soc/sof/mediatek/mt8186/Makefile
+++ b/sound/soc/sof/mediatek/mt8186/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-snd-sof-mt8186-objs := mt8186.o
+snd-sof-mt8186-objs := mt8186.o mt8186-loader.o
 obj-$(CONFIG_SND_SOC_SOF_MT8186) += snd-sof-mt8186.o
 
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-loader.c b/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
new file mode 100644
index 000000000000..6ab4921b1010
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright (c) 2022 Mediatek Corporation. All rights reserved.
+//
+// Author: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
+//         Tinghan Shen <tinghan.shen@mediatek.com>
+//
+// Hardware interface for mt8186 DSP code loader
+
+#include <sound/sof.h>
+#include "mt8186.h"
+#include "../../ops.h"
+
+void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr)
+{
+	/* set RUNSTALL to stop core */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_HIFI_IO_CONFIG,
+				RUNSTALL, RUNSTALL);
+
+	/* set core boot address */
+	snd_sof_dsp_write(sdev, DSP_SECREG_BAR, ADSP_ALTVEC_C0, boot_addr);
+	snd_sof_dsp_write(sdev, DSP_SECREG_BAR, ADSP_ALTVECSEL, ADSP_ALTVECSEL_C0);
+
+	/* assert core reset */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_CFGREG_SW_RSTN,
+				SW_RSTN_C0 | SW_DBG_RSTN_C0,
+				SW_RSTN_C0 | SW_DBG_RSTN_C0);
+
+	/* hardware requirement */
+	udelay(1);
+
+	/* release core reset */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_CFGREG_SW_RSTN,
+				SW_RSTN_C0 | SW_DBG_RSTN_C0,
+				0);
+
+	/* clear RUNSTALL (bit31) to start core */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_HIFI_IO_CONFIG,
+				RUNSTALL, 0);
+}
+
+void sof_hifixdsp_shutdown(struct snd_sof_dev *sdev)
+{
+	/* set RUNSTALL to stop core */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_HIFI_IO_CONFIG,
+				RUNSTALL, RUNSTALL);
+
+	/* assert core reset */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_CFGREG_SW_RSTN,
+				SW_RSTN_C0 | SW_DBG_RSTN_C0,
+				SW_RSTN_C0 | SW_DBG_RSTN_C0);
+}
+
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 60021195e0b5..892cd7d79994 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -204,6 +204,17 @@ static int adsp_shared_base_ioremap(struct platform_device *pdev, void *data)
 	return 0;
 }
 
+static int mt8186_run(struct snd_sof_dev *sdev)
+{
+	u32 adsp_bootup_addr;
+
+	adsp_bootup_addr = SRAM_PHYS_BASE_FROM_DSP_VIEW;
+	dev_dbg(sdev->dev, "HIFIxDSP boot from base : 0x%08X\n", adsp_bootup_addr);
+	sof_hifixdsp_boot_sequence(sdev, adsp_bootup_addr);
+
+	return 0;
+}
+
 static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 {
 	struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
@@ -272,6 +283,7 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 
 static int mt8186_dsp_remove(struct snd_sof_dev *sdev)
 {
+	sof_hifixdsp_shutdown(sdev);
 	adsp_sram_power_off(sdev);
 
 	return 0;
@@ -289,6 +301,9 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	.probe		= mt8186_dsp_probe,
 	.remove		= mt8186_dsp_remove,
 
+	/* DSP core boot */
+	.run		= mt8186_run,
+
 	/* Block IO */
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
@@ -302,6 +317,9 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	/* misc */
 	.get_bar_index	= mt8186_get_bar_index,
 
+	/* firmware loading */
+	.load_firmware	= snd_sof_load_firmware_memcpy,
+
 	/* Firmware ops */
 	.dsp_arch_ops = &sof_xtensa_arch_ops,
 
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.h b/sound/soc/sof/mediatek/mt8186/mt8186.h
index 40ea7cb9295b..df52ae9659e4 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.h
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.h
@@ -10,6 +10,7 @@
 #define __MT8186_H
 
 struct mtk_adsp_chip_info;
+struct snd_sof_dev;
 
 #define DSP_REG_BAR			4
 #define DSP_SECREG_BAR			5
@@ -74,4 +75,6 @@ struct mtk_adsp_chip_info;
 #define SIZE_SHARED_DRAM_UL			0x40000 /*Shared buffer for Uplink*/
 #define TOTAL_SIZE_SHARED_DRAM_FROM_TAIL	(SIZE_SHARED_DRAM_DL + SIZE_SHARED_DRAM_UL)
 
+void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr);
+void sof_hifixdsp_shutdown(struct snd_sof_dev *sdev);
 #endif
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
