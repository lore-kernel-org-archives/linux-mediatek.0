Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29019606A33D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 03:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3fMqWSRi;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=SuJDtysg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jFjDMeCOUfqx4tB4jN7qVpzUMoCyGqzAHhigGnXoPxQ=; b=3fMqWSRiJnLlto6AFaSWHsI8mE
	JRBWDrPx9AoC6A6bMs7qJ+RhFzl8TsylmAl33PiFekTbCmZ1Z8e2miMioTDWC8Ir1rV1cpU9CT5U2
	x9rB4AgCQgx4s96iMjv3tOHro6TNhE4h7f/6/SFmK9aOMW8NMP9lLMAa9t1act72r+ySHSoouutLj
	WcpXF3D6+/rkBUp04jqgJq5yGTm+jst6fb10QlKmzTL8PLvADm7SkKOojACYqeykeEEtO4onYyipq
	YWDTqwC2kzWI+IFB76uvYdHzZj+wILPT1yatQCE0ADHi3SYog76uih3X40xEPgjx3SP+K2MfEHn3l
	nnd1eiLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQFzv-0000000HBTJ-3c9n;
	Mon, 09 Nov 2026 03:24:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQFzs-0000000HBRL-2Kr4;
	Mon, 09 Nov 2026 03:24:41 +0000
X-UUID: 171c191adbed11f1afed4741b24580c9-20261108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jFjDMeCOUfqx4tB4jN7qVpzUMoCyGqzAHhigGnXoPxQ=;
	b=SuJDtysgK3t4uXc5L/Co7akhTjokQkP0yZ9y7qumuX1JFentI4BoQnK1LH17CMGI7q0awAM38gBPlz4uBCW+QUCwJWD2q+KTW2/zMiYqAgghCoDPdX7/wie4zItAsy2d/9S2xSN0ai9OjS5IP0WntH6x52YMDRPubGgSpCPQZKk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:8c4e152c-2999-43d7-88b4-8e83acde7770,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:0329f2ce-02bc-447e-ab88-2baec399874a,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 171c191adbed11f1afed4741b24580c9-20261108
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1791299977; Sun, 08 Nov 2026 20:24:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 9 Nov 2026 11:24:34 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 9 Nov 2026 11:24:33 +0800
From: Cyril Chao <Cyril.Chao@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nathan Chancellor
	<nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<llvm@lists.linux.dev>, Cyril Chao <cyril.chao@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Cyril Chao
	<Cyril.Chao@mediatek.com>
Subject: [PATCH v1 1/1] ASoC: mediatek: mt8189: Use AVOUT for DP and HDMI jacks
Date: Mon, 9 Nov 2026 11:24:09 +0800
Message-ID: <20261109032424.625004-2-Cyril.Chao@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109032424.625004-1-Cyril.Chao@mediatek.com>
References: <20261109032424.625004-1-Cyril.Chao@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_192440_596896_EA9FE068 
X-CRM114-Status: GOOD (  12.05  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The HDMI codec reports DP and HDMI connection status as SND_JACK_AVOUT,
which combines SND_JACK_LINEOUT and SND_JACK_VIDEOOUT. The machine driver
creates these jacks with SND_JACK_LINEOUT, omitting the video-output
capability and its SW_VIDEOOUT_INSERT events when
CONFIG_SND_JACK_INPUT_DEV is enabled.

Use SND_JACK_AVOUT for both jack creation and pin masks to match the
codec's audio/video output reporting.

Fixes: d218ea171430 ("ASoC: mediatek: mt8189: add machine driver with nau8825")
Signed-off-by: Cyril Chao <Cyril.Chao@mediatek.com>
---
 sound/soc/mediatek/mt8189/mt8189-nau8825.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-nau8825.c b/sound/soc/mediatek/mt8189/mt8189-nau8825.c
index 5d652d0cf01e..b551477cef51 100644
--- a/sound/soc/mediatek/mt8189/mt8189-nau8825.c
+++ b/sound/soc/mediatek/mt8189/mt8189-nau8825.c
@@ -74,14 +74,14 @@ enum mt8189_jacks {
 static struct snd_soc_jack_pin mt8189_dp_jack_pins[] = {
 	{
 		.pin = "DP",
-		.mask = SND_JACK_LINEOUT,
+		.mask = SND_JACK_AVOUT,
 	},
 };
 
 static struct snd_soc_jack_pin mt8189_hdmi_jack_pins[] = {
 	{
 		.pin = "HDMI",
-		.mask = SND_JACK_LINEOUT,
+		.mask = SND_JACK_AVOUT,
 	},
 };
 
@@ -369,7 +369,7 @@ static int mt8189_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
-	ret = snd_soc_card_jack_new_pins(rtd->card, "DP Jack", SND_JACK_LINEOUT,
+	ret = snd_soc_card_jack_new_pins(rtd->card, "DP Jack", SND_JACK_AVOUT,
 					 jack, mt8189_dp_jack_pins,
 					 ARRAY_SIZE(mt8189_dp_jack_pins));
 	if (ret) {
@@ -394,7 +394,7 @@ static int mt8189_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
-	ret = snd_soc_card_jack_new_pins(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+	ret = snd_soc_card_jack_new_pins(rtd->card, "HDMI Jack", SND_JACK_AVOUT,
 					 jack, mt8189_hdmi_jack_pins,
 					 ARRAY_SIZE(mt8189_hdmi_jack_pins));
 	if (ret) {

base-commit: c937f492dd40a8398d955cf0f4f9e11d7268bcb5
-- 
2.45.2


