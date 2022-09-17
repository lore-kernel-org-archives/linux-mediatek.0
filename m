Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23778ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Sep 2022 02:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fKvbJABWgQ4iaf/3lMmgdSUEyoDkavfne7wQG/frOBE=; b=o51eEjUTGgpVAiMvc4G5RTbBUH
	BC+pgd96OEs8WWRoD2t+dQZMEwM1BGOuIPk7guVTUMCT9f0+Zi6K3zQbOhAj3eviIHah4+VDbPcsL
	/lYDxFZs/lRzlsM9I4A3aVHxpPY7VDgmTcZvjHBaZanuh21W7CtjFlvnP/Pt36we1KUcl2oeqZqcV
	Dx+Mm3mFIPsH881Cok7oNg/Yhrv+O5LpHxtp+ugvx7voZNNpYWa/Wy+qL5mjjgRhMqgNJGpp2u+mp
	KHtuzNeZGTyCDiEFFQCWqoOuWSq4o5cagorkM8VU9PJnCa+qgDYE8GeAFZ9NUWkXcBVkdVFFUDDlp
	bKVxHF5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZNXK-001pmy-Mf; Sat, 17 Sep 2022 02:26:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZNXH-001piT-Hc; Sat, 17 Sep 2022 02:26:28 +0000
X-UUID: 67eb990e591f461281e4396a08de5f6a-20220916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fKvbJABWgQ4iaf/3lMmgdSUEyoDkavfne7wQG/frOBE=;
	b=CgA8GfuGT51D1Bt0uraxXp/29oMAy4nME/sEiM2BiMM5/XWoKXCRejEKWD27tXMSKXi0CX06CZj2j/28edp7AoSeigMhmQqbwxcHpiV5B8qzSCn4KW2VqR42rz/fM8hjX7nn79QOOKzLnM6NjJXGqoGCgWRVOAH7bFQtZbkKlMU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:9ee35d00-fa90-4db0-a1f7-4ddba987114b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:1d55f35d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 67eb990e591f461281e4396a08de5f6a-20220916
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 223115740; Fri, 16 Sep 2022 19:26:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Sat, 17 Sep 2022 10:26:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 17 Sep 2022 10:26:13 +0800
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
Subject: [PATCH] ASoC: SOF: mediatek: add pcm_hw_params callback for mt8186
Date: Sat, 17 Sep 2022 10:26:10 +0800
Message-ID: <20220917022610.594-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_192627_614136_0A078C62 
X-CRM114-Status: GOOD (  10.05  )
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

add pcm_hw_params callback for mt8186 to support continue
update dma host position

Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index a1be5d74f40b..9ec89fc7fec0 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -460,6 +460,16 @@ static int mt8186_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 	return type;
 }
 
+static int mt8186_pcm_hw_params(struct snd_sof_dev *sdev,
+				struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_sof_platform_stream_params *platform_params)
+{
+	platform_params->cont_update_posn = 1;
+
+	return 0;
+}
+
 static struct snd_soc_dai_driver mt8186_dai[] = {
 {
 	.name = "SOF_DL1",
@@ -526,6 +536,7 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 
 	/* stream callbacks */
 	.pcm_open	= sof_stream_pcm_open,
+	.pcm_hw_params	= mt8186_pcm_hw_params,
 	.pcm_close	= sof_stream_pcm_close,
 
 	/* firmware loading */
-- 
2.25.1


