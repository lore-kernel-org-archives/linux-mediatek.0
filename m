Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE15C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 03:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b1FWvyRy8GjbOPQi3r+ybEhw4xkI3UGbcLNkPF4SrHc=; b=4mGlygKeTVBIOB
	Twm5bsdsq4iqGNji9l8ael/VD2PkRCObY2rjzAwYii8TITMSmoAMV+UVvaQ4vglSXFNqF2JOQDRjB
	F2W/UR9hrSvWw8jUtolJBuGEaiYWBwdApo9iBvg65Q8SttzUke+bfQTRf++FbNJZpl+Ys2jhIx/aO
	wJvrkUofjuAMvZRymxtrvMFIcO9RM1Z4ZL4Q3ujtQZghpZ9shmABXzEdtEGkY4uTb7T+Bg/bQwbkj
	dAWr5Rqi4kY5pJI73OpZGYdqZOt6YmykVzHUnS1EGSeVeLsv5W4Of3yT3XvUgBShw3R+lPRelRBNg
	VPxCNxb9uthRV/umpHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njYeV-00HIfY-IO; Wed, 27 Apr 2022 03:47:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njYeK-00HIdk-31; Wed, 27 Apr 2022 03:47:33 +0000
X-UUID: 8e454e17ecb241b1a0f6716089e5d362-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:89c6198b-f5cd-4a4f-be1b-c2e2205df548, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:41c29dc6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 8e454e17ecb241b1a0f6716089e5d362-20220426
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1518850438; Tue, 26 Apr 2022 20:47:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 20:44:40 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 27 Apr 2022 11:44:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 11:44:38 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
 <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>, "Yaochun
 Hung" <yc.hung@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Yang Yingliang <yangyingliang@huawei.com>
CC: <sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] ASoC: SOF: mediatek: Fix allyesconfig build error
Date: Wed, 27 Apr 2022 11:44:25 +0800
Message-ID: <20220427034425.24294-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_204732_164473_18774B67 
X-CRM114-Status: GOOD (  13.28  )
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

ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o:(.opd+0x18): multiple
definition of `adsp_clock_on';
sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(.opd+0x60): first defined
here
ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o: in function
`.adsp_clock_on':

ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o:(.opd+0x30): multiple
definition of `adsp_clock_off';
sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(.opd+0x78): first defined
here
ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o: in function
`.adsp_clock_off':

ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o:(.opd+0x0): multiple
definition of `sof_hifixdsp_boot_sequence';
sound/soc/sof/mediatek/mt8195/mt8195-loader.o:(.opd+0x0): first defined
here
ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o: in function
`.sof_hifixdsp_boot_sequence':

ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o:(.opd+0x18): multiple
definition of `sof_hifixdsp_shutdown';
 sound/soc/sof/mediatek/mt8195/mt8195-loader.o:(.opd+0x18): first defined
here
ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o: in function
`.sof_hifixdsp_shutdown':

Fixes: 91316c3dbe48 ("ASoC: SOF: mediatek: Add mt8186 sof fw loader and
dsp ops")
Fixes: 83e1b65ad2ac ("ASoC: SOF: mediatek: Add mt8186 dsp clock support")

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c    |  4 ++--
 sound/soc/sof/mediatek/mt8186/mt8186-clk.h    |  4 ++--
 sound/soc/sof/mediatek/mt8186/mt8186-loader.c |  4 ++--
 sound/soc/sof/mediatek/mt8186/mt8186.c        | 18 +++++++++---------
 sound/soc/sof/mediatek/mt8186/mt8186.h        |  4 ++--
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-clk.c b/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
index 5f805981b8e6..22220fd50b62 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
@@ -74,7 +74,7 @@ static void adsp_disable_all_clock(struct snd_sof_dev *sdev)
 	clk_disable_unprepare(priv->clk[CLK_TOP_AUDIODSP]);
 }
 
-int adsp_clock_on(struct snd_sof_dev *sdev)
+int mt8186_adsp_clock_on(struct snd_sof_dev *sdev)
 {
 	struct device *dev = sdev->dev;
 	int ret;
@@ -92,7 +92,7 @@ int adsp_clock_on(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-void adsp_clock_off(struct snd_sof_dev *sdev)
+void mt8186_adsp_clock_off(struct snd_sof_dev *sdev)
 {
 	snd_sof_dsp_write(sdev, DSP_REG_BAR, ADSP_CK_EN, 0);
 	snd_sof_dsp_write(sdev, DSP_REG_BAR, ADSP_UART_CTRL, 0);
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-clk.h b/sound/soc/sof/mediatek/mt8186/mt8186-clk.h
index fa174dfceff0..89c23caf0fee 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186-clk.h
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-clk.h
@@ -19,6 +19,6 @@ enum adsp_clk_id {
 };
 
 int mt8186_adsp_init_clock(struct snd_sof_dev *sdev);
-int adsp_clock_on(struct snd_sof_dev *sdev);
-void adsp_clock_off(struct snd_sof_dev *sdev);
+int mt8186_adsp_clock_on(struct snd_sof_dev *sdev);
+void mt8186_adsp_clock_off(struct snd_sof_dev *sdev);
 #endif
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-loader.c b/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
index 6ab4921b1010..548b12c33d8a 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
@@ -11,7 +11,7 @@
 #include "mt8186.h"
 #include "../../ops.h"
 
-void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr)
+void mt8186_sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr)
 {
 	/* set RUNSTALL to stop core */
 	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_HIFI_IO_CONFIG,
@@ -39,7 +39,7 @@ void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr)
 				RUNSTALL, 0);
 }
 
-void sof_hifixdsp_shutdown(struct snd_sof_dev *sdev)
+void mt8186_sof_hifixdsp_shutdown(struct snd_sof_dev *sdev)
 {
 	/* set RUNSTALL to stop core */
 	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_HIFI_IO_CONFIG,
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c8faa63497c6..6d574fd4492e 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -211,7 +211,7 @@ static int mt8186_run(struct snd_sof_dev *sdev)
 
 	adsp_bootup_addr = SRAM_PHYS_BASE_FROM_DSP_VIEW;
 	dev_dbg(sdev->dev, "HIFIxDSP boot from base : 0x%08X\n", adsp_bootup_addr);
-	sof_hifixdsp_boot_sequence(sdev, adsp_bootup_addr);
+	mt8186_sof_hifixdsp_boot_sequence(sdev, adsp_bootup_addr);
 
 	return 0;
 }
@@ -284,9 +284,9 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	ret = adsp_clock_on(sdev);
+	ret = mt8186_adsp_clock_on(sdev);
 	if (ret) {
-		dev_err(sdev->dev, "adsp_clock_on fail!\n");
+		dev_err(sdev->dev, "mt8186_adsp_clock_on fail!\n");
 		return ret;
 	}
 
@@ -297,18 +297,18 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 
 static int mt8186_dsp_remove(struct snd_sof_dev *sdev)
 {
-	sof_hifixdsp_shutdown(sdev);
+	mt8186_sof_hifixdsp_shutdown(sdev);
 	adsp_sram_power_off(sdev);
-	adsp_clock_off(sdev);
+	mt8186_adsp_clock_off(sdev);
 
 	return 0;
 }
 
 static int mt8186_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 {
-	sof_hifixdsp_shutdown(sdev);
+	mt8186_sof_hifixdsp_shutdown(sdev);
 	adsp_sram_power_off(sdev);
-	adsp_clock_off(sdev);
+	mt8186_adsp_clock_off(sdev);
 
 	return 0;
 }
@@ -317,9 +317,9 @@ static int mt8186_dsp_resume(struct snd_sof_dev *sdev)
 {
 	int ret;
 
-	ret = adsp_clock_on(sdev);
+	ret = mt8186_adsp_clock_on(sdev);
 	if (ret) {
-		dev_err(sdev->dev, "adsp_clock_on fail!\n");
+		dev_err(sdev->dev, "mt8186_adsp_clock_on fail!\n");
 		return ret;
 	}
 
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.h b/sound/soc/sof/mediatek/mt8186/mt8186.h
index df52ae9659e4..98b2965e5ba6 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.h
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.h
@@ -75,6 +75,6 @@ struct snd_sof_dev;
 #define SIZE_SHARED_DRAM_UL			0x40000 /*Shared buffer for Uplink*/
 #define TOTAL_SIZE_SHARED_DRAM_FROM_TAIL	(SIZE_SHARED_DRAM_DL + SIZE_SHARED_DRAM_UL)
 
-void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr);
-void sof_hifixdsp_shutdown(struct snd_sof_dev *sdev);
+void mt8186_sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr);
+void mt8186_sof_hifixdsp_shutdown(struct snd_sof_dev *sdev);
 #endif
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
