Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD945C77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 06:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWjWdFK+UzXUxIC1PHVEcLcVfmOLCn7lAe5Vf/6IX2c=; b=wvElqiD+rMYSxYX90TCraEEjFM
	gAUleIwBCzb0We/HSCaGW1LFDVDj2kX8PhInXRUdMk5YjIrdZE38EHEK0jbSpXhhJGIJxkItTu/BO
	FwK7GxyOnCBtNG5s4K0KABHsDarWCM1dMyTWGOYB6dETk6RRETbRPH7ijJxrGM8s42+w1pniOlle6
	xoBG7h1G9OkzH+DULrRqH2B75ToUXiCqW1MpFsX8VLgNouGVsV9j/WJQRQWTGAhV5pgZm6OfNMH6H
	Ob/1GXiG/2fKiuSXFnvvXjGi+M/aKjHg/2DC5r08ATesrP7+Mk//oDJNPJRN8J44vOdBMG0OvOcs3
	Be3bkNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRio-0019AS-10;
	Mon, 15 May 2023 06:30:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyQio-000wwL-0e;
	Mon, 15 May 2023 05:26:11 +0000
X-UUID: fb177fb4f2e011ed83ed1395ce914268-20230514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oWjWdFK+UzXUxIC1PHVEcLcVfmOLCn7lAe5Vf/6IX2c=;
	b=X9qGVwD8xM3qd00EuogpOox0yuFdzKGMEzf1M2F4QUJRHji4E4tj8dyIEiSqDjPoWueHMHKyN0j+0GhVub3YrcAU+3u+k5LEDOeBWPCmold0Qtp8yKR7mZ39qAEa7Uyb8ROrm2ZcXQwcNc8w+iSrVyIznqD6Gb0MlBSQKbJoYgs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:abafaba2-cc0c-417d-98b9-c84c6ef8746f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:178d4d4,CLOUDID:dfc3cf6b-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: fb177fb4f2e011ed83ed1395ce914268-20230514
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 310392889; Sun, 14 May 2023 22:26:01 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 15 May 2023 13:25:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 15 May 2023 13:25:41 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <daniel.baluta@nxp.com>,
	<broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <yc.hung@mediatek.com>,
	<tinghan.shen@mediatek.com>, <sound-open-firmware@alsa-project.org>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: SOF: mediatek: add mt8188 audio support
Date: Mon, 15 May 2023 13:25:39 +0800
Message-ID: <20230515052540.9037-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230515052540.9037-1-trevor.wu@mediatek.com>
References: <20230515052540.9037-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_222610_241843_30A2B4FC 
X-CRM114-Status: GOOD (  11.77  )
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

Add mt8188 dai driver and specify of_machine to support mt8188 audio.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 61 +++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 419913c8474d..3a9c81418c1f 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -594,7 +594,65 @@ static const struct sof_dev_desc sof_of_mt8186_desc = {
 	.ops = &sof_mt8186_ops,
 };
 
+/*
+ * DL2, DL3, UL4, UL5 are registered as SOF FE, so creating the corresponding
+ * SOF BE to complete the pipeline.
+ */
+static struct snd_soc_dai_driver mt8188_dai[] = {
+{
+	.name = "SOF_DL2",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+{
+	.name = "SOF_DL3",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+{
+	.name = "SOF_UL4",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+{
+	.name = "SOF_UL5",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+};
+
+/* mt8188 ops */
+static struct snd_sof_dsp_ops sof_mt8188_ops;
+
+static int sof_mt8188_ops_init(struct snd_sof_dev *sdev)
+{
+	/* common defaults */
+	memcpy(&sof_mt8188_ops, &sof_mt8186_ops, sizeof(struct snd_sof_dsp_ops));
+
+	sof_mt8188_ops.drv = mt8188_dai;
+	sof_mt8186_ops.num_drv = ARRAY_SIZE(mt8188_dai);
+
+	return 0;
+}
+
+static struct snd_sof_of_mach sof_mt8188_machs[] = {
+	{
+		.compatible = "mediatek,mt8188",
+		.sof_tplg_filename = "sof-mt8188.tplg",
+	},
+	{}
+};
+
 static const struct sof_dev_desc sof_of_mt8188_desc = {
+	.of_machines = sof_mt8188_machs,
 	.ipc_supported_mask	= BIT(SOF_IPC),
 	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
@@ -607,7 +665,8 @@ static const struct sof_dev_desc sof_of_mt8188_desc = {
 		[SOF_IPC] = "sof-mt8188.ri",
 	},
 	.nocodec_tplg_filename = "sof-mt8188-nocodec.tplg",
-	.ops = &sof_mt8186_ops,
+	.ops = &sof_mt8188_ops,
+	.ops_init = sof_mt8188_ops_init,
 };
 
 static const struct of_device_id sof_of_mt8186_ids[] = {
-- 
2.18.0


