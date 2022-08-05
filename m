Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B883BC00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 07:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOqddKZhToBsZLP2uAp1qRSP/7JS4UI9EtLgt1ogCzY=; b=Jvl38+gCYxzeCa7GCzvjBEblE1
	Nls/GejiXPkg7K1u0cq8SiWUPt+/tyFRceREwBBBb1VKOLFiBo8ZUQr5mZiX/zCJ64x7b6buNjONB
	0nq7NWDCILDanALqHn896PpakeuK+cgwprfeJ1y4MAxYr9RBlmCUlUEraOgmuJAi10XBxDuV8OkiY
	weoH8m56n26fen1p8C+6taWfPo5A6RczNRWExQ6Y78G9UxNKK/UwEIt0/cCiAsHaAAh540ruKL8Rf
	Eb7+NYhCqy35KTFbFEzGV4Xt2se3gJHlcWkRIQ935oBHG+gbxuAtUOD+XfRxO2TLI+OkuuTfVKsa2
	+mp+PX4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJrPa-00Cgm6-H5; Fri, 05 Aug 2022 07:06:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJrPK-00Cgf2-Np; Fri, 05 Aug 2022 07:06:08 +0000
X-UUID: 7ce0a9b20e6b4e4682c8b7366002cdad-20220805
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:21e05190-54d7-4f14-ad98-e697914e7245,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:d484ce48-f57f-4088-93dd-066979cdb4e6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 7ce0a9b20e6b4e4682c8b7366002cdad-20220805
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 238119236; Fri, 05 Aug 2022 00:06:02 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 5 Aug 2022 15:04:57 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Aug 2022 15:04:56 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>,
	<angelogioacchino.delregno@collabora.com>, <daniel.baluta@nxp.com>
CC: <matthias.bgg@gmail.com>, <yc.hung@mediatek.com>,
	<tinghan.shen@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <sound-open-firmware@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>, Chunxu Li
	<chunxu.li@mediatek.com>
Subject: [PATCH v2 1/2] ASoC: SOF: Introduce function sof_of_machine_select
Date: Fri, 5 Aug 2022 15:04:48 +0800
Message-ID: <20220805070449.6611-2-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805070449.6611-1-chunxu.li@mediatek.com>
References: <20220805070449.6611-1-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_000606_813583_6D089C86 
X-CRM114-Status: GOOD (  17.46  )
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

From current design in sof_machine_check and snd_sof_new_platform_drv,
the SOF can only support ACPI type machine.

1. In sof_machine_check if there is no ACPI machine exist, the function
will return -ENODEV directly, that's we don't expected if we do not
base on ACPI machine.

2. In snd_sof_new_platform_drv the component driver need a driver name
to do ignore_machine, currently the driver name is obtained from
machine->drv_name, and the type of machine is snd_soc_acpi_mach.

So we add a new function named sof_of_machine_select that we can pass
sof_machine_check and obtain info required by snd_sof_new_platform_drv.

Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
---
 include/sound/sof.h        |  2 ++
 sound/soc/sof/pcm.c        |  8 +++++++-
 sound/soc/sof/sof-audio.c  | 30 ++++++++++++++++++++++++++++++
 sound/soc/sof/sof-of-dev.h |  7 +++++++
 4 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 367dccfea7ad..341fef19e612 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -89,6 +89,7 @@ struct snd_sof_pdata {
 	/* machine */
 	struct platform_device *pdev_mach;
 	const struct snd_soc_acpi_mach *machine;
+	const struct snd_sof_of_mach *of_machine;
 
 	void *hw_pdata;
 
@@ -102,6 +103,7 @@ struct snd_sof_pdata {
 struct sof_dev_desc {
 	/* list of machines using this configuration */
 	struct snd_soc_acpi_mach *machines;
+	struct snd_sof_of_mach *of_machines;
 
 	/* alternate list of machines using this configuration */
 	struct snd_soc_acpi_mach *alt_machines;
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 6cb6a432be5e..49f7cb049f62 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -13,6 +13,7 @@
 #include <linux/pm_runtime.h>
 #include <sound/pcm_params.h>
 #include <sound/sof.h>
+#include "sof-of-dev.h"
 #include "sof-priv.h"
 #include "sof-audio.h"
 #include "sof-utils.h"
@@ -655,7 +656,12 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 	struct snd_sof_pdata *plat_data = sdev->pdata;
 	const char *drv_name;
 
-	drv_name = plat_data->machine->drv_name;
+	if (plat_data->machine)
+		drv_name = plat_data->machine->drv_name;
+	else if (plat_data->of_machine)
+		drv_name = plat_data->of_machine->drv_name;
+	else
+		drv_name = NULL;
 
 	pd->name = "sof-audio-component";
 	pd->probe = sof_pcm_probe;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 28976098a89e..ea9663d448eb 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include "sof-audio.h"
+#include "sof-of-dev.h"
 #include "ops.h"
 
 static void sof_reset_route_setup_status(struct snd_sof_dev *sdev, struct snd_sof_widget *widget)
@@ -784,6 +785,28 @@ int sof_dai_get_bclk(struct snd_soc_pcm_runtime *rtd)
 }
 EXPORT_SYMBOL(sof_dai_get_bclk);
 
+static struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *sof_pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = sof_pdata->desc;
+	struct snd_sof_of_mach *mach = desc->of_machines;
+
+	if (!mach)
+		return NULL;
+
+	for (; mach->compatible; mach++) {
+		if (of_machine_is_compatible(mach->compatible)) {
+			sof_pdata->tplg_filename = mach->sof_tplg_filename;
+			if (mach->fw_filename)
+				sof_pdata->fw_filename = mach->fw_filename;
+
+			return mach;
+		}
+	}
+
+	return NULL;
+}
+
 /*
  * SOF Driver enumeration.
  */
@@ -794,6 +817,7 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 	struct snd_soc_acpi_mach *mach;
 
 	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)) {
+		const struct snd_sof_of_mach *of_mach;
 
 		/* find machine */
 		mach = snd_sof_machine_select(sdev);
@@ -803,6 +827,12 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 			return 0;
 		}
 
+		of_mach = sof_of_machine_select(sdev);
+		if (of_mach) {
+			sof_pdata->of_machine = of_mach;
+			return 0;
+		}
+
 		if (!IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)) {
 			dev_err(sdev->dev, "error: no matching ASoC machine driver found - aborting probe\n");
 			return -ENODEV;
diff --git a/sound/soc/sof/sof-of-dev.h b/sound/soc/sof/sof-of-dev.h
index fd950a222ba4..2948b3a0d9fe 100644
--- a/sound/soc/sof/sof-of-dev.h
+++ b/sound/soc/sof/sof-of-dev.h
@@ -9,6 +9,13 @@
 #ifndef __SOUND_SOC_SOF_OF_H
 #define __SOUND_SOC_SOF_OF_H
 
+struct snd_sof_of_mach {
+	const char *compatible;
+	const char *drv_name;
+	const char *fw_filename;
+	const char *sof_tplg_filename;
+};
+
 extern const struct dev_pm_ops sof_of_pm;
 
 int sof_of_probe(struct platform_device *pdev);
-- 
2.25.1


