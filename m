Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A01ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 12:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rnk6XT/XzFAqp50N45m5DaI+6+u2HgKxMgT5LBTZ044=; b=Io8Hl6epzbhiSlZJGIPIJcd11J
	hUO8RN6cpqqyxAXc8S7yTPCawogNYKQDf2dTITlIk8SDkvkFpemeR5/9JnaQc6aqEytGkRuuEYDFT
	bkKUjH/02upc+8mOB4VHPM4gPQBCTearOSatJCNBxyRVQ1ImJCor0GBF8BmGwA9Ak179V0ucEYoEp
	lvGDAzzySwuAXUX6D1nBZbF3wvSImFXeerTIKCWLAA64HZ/adLC6tIraiwrmqWDAGM1NZvwxnL5VE
	9GRT5ypCvr3h3ohEjvvI6GmTj722o3DPtUtpq/7svm2k6d2oBZ2DbLTXpe1GSAF+jtv/KsIfA+lL5
	kbhXA59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oayuS-00BI8b-72; Wed, 21 Sep 2022 12:33:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oayuP-00BI6k-F2; Wed, 21 Sep 2022 12:32:58 +0000
X-UUID: 3d239dad7dd84033bf46a5fa496ef44e-20220921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rnk6XT/XzFAqp50N45m5DaI+6+u2HgKxMgT5LBTZ044=;
	b=ex6lN7IqOklTdSG9WF+AOCVQBHETkp0vnp+ccEgXBOwjk/qNKA38S4tv0AWnp37lB9hL68L85imVTa8FQ7otOW3RJUSohvt6jLtRPGkp+1gadm361Hpw34G+ceX8gespqbVqZBsMPEYbUwoqzv5u1EpBUnq2bmSyg9YMI2bdVM4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:82b3bdf3-a90e-4119-b9bd-89cb201e645a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:379b6c5e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3d239dad7dd84033bf46a5fa496ef44e-20220921
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1800239767; Wed, 21 Sep 2022 05:32:46 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 21 Sep 2022 20:02:42 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Sep 2022 20:02:41 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
	<peter.ujfalusi@linux.intel.com>, <lgirdwood@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <daniel.baluta@nxp.com>
CC: <matthias.bgg@gmail.com>, <yc.hung@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<sound-open-firmware@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>, Chunxu Li
	<chunxu.li@mediatek.com>
Subject: [PATCH] ASoC: SOF: mediatek: add pcm_pointer callback for mt8186
Date: Wed, 21 Sep 2022 20:02:39 +0800
Message-ID: <20220921120239.31934-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_053257_515834_D58EE704 
X-CRM114-Status: GOOD (  12.66  )
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

add pcm_pointer callback for mt8186 to support read
host position from DSP

Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 9ec89fc7fec0..181189e00e02 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -470,6 +470,38 @@ static int mt8186_pcm_hw_params(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+static snd_pcm_uframes_t mt8186_pcm_pointer(struct snd_sof_dev *sdev,
+					    struct snd_pcm_substream *substream)
+{
+	int ret;
+	snd_pcm_uframes_t pos;
+	struct snd_sof_pcm *spcm;
+	struct sof_ipc_stream_posn posn;
+	struct snd_sof_pcm_stream *stream;
+	struct snd_soc_component *scomp = sdev->component;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+
+	spcm = snd_sof_find_spcm_dai(scomp, rtd);
+	if (!spcm) {
+		dev_warn_ratelimited(sdev->dev, "warn: can't find PCM with DAI ID %d\n",
+				     rtd->dai_link->id);
+		return 0;
+	}
+
+	stream = &spcm->stream[substream->stream];
+	ret = snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+	if (ret < 0) {
+		dev_warn(sdev->dev, "failed to read stream position: %d\n", ret);
+		return 0;
+	}
+
+	memcpy(&stream->posn, &posn, sizeof(posn));
+	pos = spcm->stream[substream->stream].posn.host_posn;
+	pos = bytes_to_frames(substream->runtime, pos);
+
+	return pos;
+}
+
 static struct snd_soc_dai_driver mt8186_dai[] = {
 {
 	.name = "SOF_DL1",
@@ -537,6 +569,7 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	/* stream callbacks */
 	.pcm_open	= sof_stream_pcm_open,
 	.pcm_hw_params	= mt8186_pcm_hw_params,
+	.pcm_pointer	= mt8186_pcm_pointer,
 	.pcm_close	= sof_stream_pcm_close,
 
 	/* firmware loading */
-- 
2.25.1


