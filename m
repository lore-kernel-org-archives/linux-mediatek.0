Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367D2C07E9D
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Sep 2022 03:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXyxt+QPcRzoxeoQ32yLL7lzO5+U9FmRkjwUiGGfG3c=; b=thB6LhexSukb5yu/eQWrbJ3H2p
	EfO4V//T43h6clV+UttdXXfR5PsSGGgRXQc9T06qgVv/FNnTl6/1twGlsf49pVfM2ZmSwexBv9L1z
	r8Tg3hZKflF95RrOA6WdKgLKL0X5fxI42BiWZeOmUwNemTQm+ivUKVLKn2jxeUtvDqK2PaW2uam/v
	Zla87UCgLtvy6azeQPFzFp4DgDFMUYN6Q7A60GueXKtRSFhDb5ZefLYtno71040fPEF1OmezGskt6
	/A1dlHl4jwsFNsgpUvVz8etUhRhGdKP9vtSRf9+VcVE+uYiq78lQNDxdyGc3Ejm+pLlZZAc+wEyLu
	twoEYtRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obw7x-006GwY-5A; Sat, 24 Sep 2022 03:46:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obw7u-006Gvq-5U; Sat, 24 Sep 2022 03:46:51 +0000
X-UUID: 89ff27f13b7a4a818930f096ebe000e1-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HXyxt+QPcRzoxeoQ32yLL7lzO5+U9FmRkjwUiGGfG3c=;
	b=NHN6oEerxuuhRm01g1wjm61rOuoaxzCgfuxXV0KA9lyYB9hUQ1njhjaN5utQmdi1dD4UUU0oEcO99W7jitzugtS4xqE/Mawpo7h1dZnSCZUfUIgJMu27MhsKg8KPSI6gjD18ypoD9UI3BzBX246mJ/pYaBsnZYUnJp0YWrlXqUg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:33efda0b-d2e5-48b4-ae87-9fae098e962f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:ff470ee4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 89ff27f13b7a4a818930f096ebe000e1-20220923
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1221657318; Fri, 23 Sep 2022 20:46:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 24 Sep 2022 11:36:05 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 24 Sep 2022 11:36:05 +0800
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
Subject: [PATCH 2/2] ASoC: SOF: mediatek: mt8195: Add pcm_pointer callback
Date: Sat, 24 Sep 2022 11:35:59 +0800
Message-ID: <20220924033559.26599-3-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220924033559.26599-1-chunxu.li@mediatek.com>
References: <20220924033559.26599-1-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_204650_261836_CB3A4487 
X-CRM114-Status: GOOD (  11.95  )
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

Add pcm_pointer callback for mt8195 to support read
host position from DSP

Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 882fde741cf5..3c81e84fcecf 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -506,6 +506,38 @@ static int mt8195_pcm_hw_params(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+static snd_pcm_uframes_t mt8195_pcm_pointer(struct snd_sof_dev *sdev,
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
 static void mt8195_adsp_dump(struct snd_sof_dev *sdev, u32 flags)
 {
 	u32 dbg_pc, dbg_data, dbg_bus0, dbg_bus1, dbg_inst;
@@ -599,6 +631,7 @@ static struct snd_sof_dsp_ops sof_mt8195_ops = {
 	/* stream callbacks */
 	.pcm_open	= sof_stream_pcm_open,
 	.pcm_hw_params	= mt8195_pcm_hw_params,
+	.pcm_pointer	= mt8195_pcm_pointer,
 	.pcm_close	= sof_stream_pcm_close,
 
 	/* firmware loading */
-- 
2.25.1


