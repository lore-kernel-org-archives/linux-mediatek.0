Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46361C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 06:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I9S5XEA04o7vLBGjFE7K0bOk89d+weuh7BPzKGJ+vfM=; b=ckiwOJniQ5Lp7U
	E0staI772JlLhr/UwhyFqHDfy4kRIaxkfmshr2DypeUgoLhriUIin+DOazv39nU1dtLpIiP4uhaxM
	Mrxq4wGvuU7Ii5KRRSbRD4Kwtr/N6nLnTKUlkuQnFj4s1lx4mhycScecKMgzSUHLW30nlIHVHizuy
	SL4MWNicJV9SVUPKbN76tW9+iaxBAZ2Rr/9WlPrY1gCL6Badh5DQsV4GK2F40DKgZXyC/c8rEfZmc
	LKWAAcS/U719KY2lTX9gQ82dbCEmQazYTa47Ag3oPNdSuNN6V437nJG4n50U6SEQBvadB7pmqnCOD
	W5cqgSvOYPd6vIEFE/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPehB-005Ign-No; Thu, 03 Mar 2022 06:12:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPegy-005IeQ-A5; Thu, 03 Mar 2022 06:12:03 +0000
X-UUID: 26e4912192c942a1acccd0bffeb4f531-20220302
X-UUID: 26e4912192c942a1acccd0bffeb4f531-20220302
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1797754195; Wed, 02 Mar 2022 23:11:52 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Mar 2022 22:11:50 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 14:11:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 14:11:48 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
CC: <perex@perex.cz>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>,
 <tzungbi@google.com>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <aaronyu@google.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt8183: support wb bt audio
Date: Thu, 3 Mar 2022 14:11:47 +0800
Message-ID: <20220303061147.5037-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_221200_377699_13281297 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

This patch use "bt-sco-pcm-wb" codec dai driver for wb bt audio.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---

This patch depends on:
https://patchwork.kernel.org/project/alsa-devel/patch/20220302013533.29068-1-jiaxin.yu@mediatek.com/

 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index b0ec5ebd4f2d..889f9e4a96aa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -260,7 +260,7 @@ SND_SOC_DAILINK_DEFS(pcm2,
 
 SND_SOC_DAILINK_DEFS(i2s0,
 	DAILINK_COMP_ARRAY(COMP_CPU("I2S0")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("bt-sco", "bt-sco-pcm")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("bt-sco", "bt-sco-pcm-wb")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(i2s1,
@@ -291,7 +291,7 @@ SND_SOC_DAILINK_DEFS(i2s3_rt1015p,
 
 SND_SOC_DAILINK_DEFS(i2s5,
 	DAILINK_COMP_ARRAY(COMP_CPU("I2S5")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("bt-sco", "bt-sco-pcm")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("bt-sco", "bt-sco-pcm-wb")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(tdm,
@@ -508,7 +508,6 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.no_pcm = 1,
 		.dpcm_capture = 1,
 		.ignore_suspend = 1,
-		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
 		SND_SOC_DAILINK_REG(i2s0),
 	},
@@ -541,7 +540,6 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
-		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
 		SND_SOC_DAILINK_REG(i2s5),
 	},
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
