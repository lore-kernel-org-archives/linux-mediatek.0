Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B88C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 07:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFz2Y/xxwkpdqewHbikoBaP7PZtSmri9F7IdaOcr4HM=; b=z9YYUAt/CKdXjShiavXZncQFKg
	mexaXoY+kXvGJpjMx4xUZWbqMrzW2ujwFg37y30AW9psaXRERqv1laMl4+MSu7fa6baEhIhO6EZKE
	HTt9Dy7VsXCvMfK55j6X1XC6oadVKE0S2hY/hnGPwk/8REHDRBi7nAGhtvGqRMUXRT4gfeqVREsfn
	a9EN/HDC5Xdggs530YsVt23eMkB3TMEFkamHNgT6JUUtZkatnuPUmCZ72NpVYmpDB7P4cwcXoi6ge
	NVqWGM2GmRbBIH7LkBnP2fJjfy9jKfpOGBjOdgyLAqd/WKUSpcFNwrnT778vWjjN646Gg/oAEW9OC
	6ogClnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8FwC-008UmM-Sd; Thu, 22 Dec 2022 07:24:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Fvi-008UbF-TZ; Thu, 22 Dec 2022 07:23:52 +0000
X-UUID: 6282a0ccd1b14e5284f5008e086af15f-20221222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lFz2Y/xxwkpdqewHbikoBaP7PZtSmri9F7IdaOcr4HM=;
	b=XTWknGrGY6bbMOG3xa8TyJCsNStFEkPAdWbeXxIIpBQS0kIrGyubqL90yTWjt5LEvBH0HP35zWXb/311rXHMTIE3RqmhDnqqP8DK5bHchfEQ8j9rHWqMOtgY5d/DA/YfHJrMZklL/HoZaOLifRtYlKtzRAg0cKY248/4MiVvU5w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:a6ec2d30-b908-433c-b6fb-8fd722debe3a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:377a178a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6282a0ccd1b14e5284f5008e086af15f-20221222
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1558367448; Thu, 22 Dec 2022 00:23:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 22 Dec 2022 15:23:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 22 Dec 2022 15:23:05 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, Chunxu Li
	<chunxu.li@mediatek.com>, Dan Carpenter <error27@gmail.com>, YC Hung
	<yc.hung@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Allen-KH Cheng
	<Allen-KH.Cheng@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 2/3] ASoC: SOF: mediatek: Support mt8188 platform
Date: Thu, 22 Dec 2022 15:21:49 +0800
Message-ID: <20221222072150.10627-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221222072150.10627-1-tinghan.shen@mediatek.com>
References: <20221222072150.10627-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_232351_088086_FB05D52E 
X-CRM114-Status: GOOD (  15.77  )
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

Add support of SOF on MediaTek MT8188 SoC.
MT8188 ADSP integrates with a single core Cadence HiFi-5 DSP.
The IPC communication between AP and DSP is based on shared DRAM and
mailbox interrupt.

The change in the mt8186.h is compatible on both mt8186 and
mt8188. The register controls booting the DSP core with the
default address or the user specified address. Both mt8186
and mt8188 should boot with the user specified boot in the driver.
The usage of the register is the same on both SoC, but the
control bit is different on mt8186 and mt8188, which is bit 1 on mt8186
and bit 0 on mt8188. Configure the redundant bit has noside effect
on both SoCs.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 17 +++++++++++++++++
 sound/soc/sof/mediatek/mt8186/mt8186.h |  3 ++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 79da25725987..af0dfc2fc4cc 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -625,8 +625,25 @@ static const struct sof_dev_desc sof_of_mt8186_desc = {
 	.ops = &sof_mt8186_ops,
 };
 
+static const struct sof_dev_desc sof_of_mt8188_desc = {
+	.ipc_supported_mask	= BIT(SOF_IPC),
+	.ipc_default		= SOF_IPC,
+	.default_fw_path = {
+		[SOF_IPC] = "mediatek/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "mediatek/sof-tplg",
+	},
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-mt8188.ri",
+	},
+	.nocodec_tplg_filename = "sof-mt8188-nocodec.tplg",
+	.ops = &sof_mt8186_ops,
+};
+
 static const struct of_device_id sof_of_mt8186_ids[] = {
 	{ .compatible = "mediatek,mt8186-dsp", .data = &sof_of_mt8186_desc},
+	{ .compatible = "mediatek,mt8188-dsp", .data = &sof_of_mt8188_desc},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sof_of_mt8186_ids);
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.h b/sound/soc/sof/mediatek/mt8186/mt8186.h
index 98b2965e5ba6..886d687449e3 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.h
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.h
@@ -52,7 +52,8 @@ struct snd_sof_dev;
 #define ADSP_PRID			0x0
 #define ADSP_ALTVEC_C0			0x04
 #define ADSP_ALTVECSEL			0x0C
-#define ADSP_ALTVECSEL_C0		BIT(1)
+/* BIT(1) for mt8186. BIT(0) for mt8188 */
+#define ADSP_ALTVECSEL_C0		(BIT(0) | BIT(1))
 
 /* dsp bus */
 #define ADSP_SRAM_POOL_CON		0x190
-- 
2.18.0


