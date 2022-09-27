Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6585FC6FA83
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 15:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9tjx5t8k5Luxw2O54U9tC1FC5+hKWB1/DzXaoINrLXE=; b=p+YhiTwfoMW+sNx9+Rwb0bTK8C
	AVPcuhJad4X5awtXNm8SJ7i/qepFbv2jBz1I/1j4Q2lJWWBcWQ0vWczSo4arGR9hMRjWVroPx4/KO
	SCLd896L3y4TforJ7QTvbfCY4Z32SPjI8af7lHCpmfreoT5S4jS54Nfe4qh+VPNSpoqu70JG9CAdu
	IZTr90jY5CyBSw8KgN+gxPMJvVrciwXvbCNaykP/RAQ7OsyVLyTfLHyU/uAs/kSuWeuFJOEJY2KWW
	4qta3RhOUfF4msUeqeVSoCaatwwOVLLCPgsTZwRIMdSlGxV+R/1RP0dgWFANu1M/7+QSjk+/yK3tA
	F/L9FajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odCPy-00BQUK-4R; Tue, 27 Sep 2022 15:22:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odCPk-00BQN9-A9; Tue, 27 Sep 2022 15:22:29 +0000
X-UUID: ac3756d47b084e698cc7900597bdccc0-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9tjx5t8k5Luxw2O54U9tC1FC5+hKWB1/DzXaoINrLXE=;
	b=GM3RIT9OpYSuKnPaqG9AWeo7d2qcRYKpeX4zfRzCi5JhE2D+XFKiHO2uYc8Xc1V5+2beI8LoEsXXGzqxufq4ivMffKvWcJ/W9SNiPDehAu8J9HOiJ4H/6kbdQ1LIGgcTeGAweF1gGbCf7bwhhIzzVeybFNYRh1oCgft6XJ+/NfU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:a91d5aea-2437-445f-b22e-1121cb81e5a5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:9bb23207-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ac3756d47b084e698cc7900597bdccc0-20220927
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1331973693; Tue, 27 Sep 2022 08:22:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 23:11:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Sep 2022 23:11:44 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: mediatek: mt8195: update audio tuner settings
Date: Tue, 27 Sep 2022 23:11:41 +0800
Message-ID: <20220927151141.11846-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_082228_589243_25F03CA0 
X-CRM114-Status: GOOD (  12.12  )
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

Audio tuner is used to handle clock drift between 26M and APLL domain.

It's expected when abs(chg_cnt) equals to upper bound, tuner updates pcw
setting automatically, and then abs(chg_cnt) decreases.
In the stress test, we found abs(chg_cnt) possibly equals to 2 at the
unexpected timing. This results in wrong pcw updating.
Finally, abs(chg_cnt) will always be larger than upper bound,

As a result, we update the upper bound to 3 to handle the corner case.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 2ee3872c83c3..9ca2cb8c8a9c 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -117,7 +117,7 @@ static struct mt8195_afe_tuner_cfg mt8195_afe_tuner_cfgs[MT8195_AUD_PLL_NUM] = {
 		.upper_bound_reg = AFE_APLL_TUNER_CFG,
 		.upper_bound_shift = 8,
 		.upper_bound_maskbit = 0xff,
-		.upper_bound_default = 0x2,
+		.upper_bound_default = 0x3,
 	},
 	[MT8195_AUD_PLL2] = {
 		.id = MT8195_AUD_PLL2,
@@ -135,7 +135,7 @@ static struct mt8195_afe_tuner_cfg mt8195_afe_tuner_cfgs[MT8195_AUD_PLL_NUM] = {
 		.upper_bound_reg = AFE_APLL_TUNER_CFG1,
 		.upper_bound_shift = 8,
 		.upper_bound_maskbit = 0xff,
-		.upper_bound_default = 0x2,
+		.upper_bound_default = 0x3,
 	},
 	[MT8195_AUD_PLL3] = {
 		.id = MT8195_AUD_PLL3,
-- 
2.18.0


