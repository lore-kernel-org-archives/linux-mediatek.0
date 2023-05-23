Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E09C7EE26
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 02:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAqn1KruCdx2EZzBuCbck+aI8EqCLgKQVJzvJgdn2lw=; b=IzuX54wQmPrNT9lRq8K7SwUHXq
	YBfpSvw5/qE2uhe1RWeSVRPNZh4UlboW+dyH2IXqSnCKa6SN1wgjMb2tIanxGrTOL/v1fhIVym1OR
	m4udAJKdl70ymPFVHZ8xaz/u8S1aHPxfP8Fea7wP/RtWmtNmqHoyiHcd2wvZenloCDcBooGmg3fPp
	HCQv2pexNLUjVE1tST8hhSqADex0H7UPB6sf8lOsih5NccpqF55c26IXDV/pe9UQo7J5DQgR/0cT5
	QlfBsMX/O6LWoT9izUqCyQK2eXqccnDF99rtg0ppxoBHzdX2iCZVLqvjFd1UuhMPpgyXrApuGX41U
	oFLQKWcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1IFe-008kr8-07;
	Tue, 23 May 2023 02:59:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1IFU-008klX-1R;
	Tue, 23 May 2023 02:59:45 +0000
X-UUID: daa0921cf91511ed83ed1395ce914268-20230522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xAqn1KruCdx2EZzBuCbck+aI8EqCLgKQVJzvJgdn2lw=;
	b=d/WY78kkA65AiI4Iy0CDQp/B5VA0riMBjeY7xtxboQMVEbL6CgsgXRlyRUWgoe+4ZkU4W3bwUQy2s0owUHcL4+T6jXXP/QDWAOmL4EIihaNclTj7V7vWHcUa85fkennCXMC4+zxrJqultj2WccoMA/0sAtc3B57G63prjXzG9oo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:8f439433-6f74-4801-af68-dfe180df76c5,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:9f4b083c-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: daa0921cf91511ed83ed1395ce914268-20230522
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2017299492; Mon, 22 May 2023 19:59:37 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 23 May 2023 10:59:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 23 May 2023 10:59:34 +0800
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
Subject: [PATCH v2 1/2] ASoC: SOF: mediatek: add mt8188 audio support
Date: Tue, 23 May 2023 10:59:32 +0800
Message-ID: <20230523025933.30494-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230523025933.30494-1-trevor.wu@mediatek.com>
References: <20230523025933.30494-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_195944_494692_BA842A45 
X-CRM114-Status: GOOD (  13.22  )
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
index 419913c8474d..cc91c2928fb6 100644
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
+	memcpy(&sof_mt8188_ops, &sof_mt8186_ops, sizeof(sof_mt8188_ops));
+
+	sof_mt8188_ops.drv = mt8188_dai;
+	sof_mt8188_ops.num_drv = ARRAY_SIZE(mt8188_dai);
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


