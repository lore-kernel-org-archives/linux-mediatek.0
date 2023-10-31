Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200F0C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 10:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F09VthF3SOwL7AJzpPS1gMu9ksJqqw5f9cVnGbYgdxg=; b=clQ/QPctrNha+68EvZNn4dUdbl
	rMYc5VhyMUjZ1lhSv2JcXe61h8e7w9N1E5+W97wLy/uSDi+zwLOCTJc/EnFnpdeAqHxyzH9GNCfky
	9F43Wj+TxnR2s0wIisesBT0cfwnkP3I9zNowzOyvueCGJUBLJLVkxpV5PIrVXPAtYS0M8NLblQkD1
	gIXtpKmxvn4zXcz5KFo7KNRpi47z9CvUWTTTDuJParxHzysDJvmr7zuD6lIPf2S9xt7hFjmznC5Th
	9Pky/xT4tpffiMRAAaO8bz9Ns5G6vm0S1uq6Zh0EqArN1li0UetGEhqI94nYliaCGJcD3gD3z8Rf2
	xe3NsPIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxm2c-0056UD-0c;
	Tue, 31 Oct 2023 10:32:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxm2Y-0056TO-17;
	Tue, 31 Oct 2023 10:32:07 +0000
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CA86E6607390;
	Tue, 31 Oct 2023 10:31:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698748319;
	bh=snKMPEw3/sZymut9YKmskK4tpvE9vyUtyrcQQzMwW3g=;
	h=From:To:Cc:Subject:Date:From;
	b=SAS7GJNIQK8qjHN8XRik3kZcD9sZCZkLAl3ZTwDYA4pvOqVkjXXyjUtk43OuWY7Wg
	 vvWrfQtDqiggNTVVpNKRAgMyHLIio/ULcMREQHw++q7xU9AUB0uMdj80jCMEGPgDwY
	 gnbLmepTCgkAIXfTRQMjMDbXMlLbMjYiS4WrwhRPTWDmm01BaYQp/gpBBtOqeS0pCz
	 d+Qb8LNoyvs1LaOCK3B5seqliWSRwh6o9S+W3XgwfSzwpEy22kJAMQHEwQMvjOLc9b
	 YtfTdv+jCOBmpYtFX8xDQiAIMiKTaNPVWU4LlU82zBA7SA7yDsbDPGUHlKOforksXZ
	 adNjdphnFv7Zw==
From: Eugen Hristev <eugen.hristev@collabora.com>
To: broonie@kernel.org,
	jiaxin.yu@mediatek.com,
	linux-sound@vger.kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: trivial: fix error messages
Date: Tue, 31 Oct 2023 12:31:39 +0200
Message-Id: <20231031103139.77395-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_033206_605494_5B2D7784 
X-CRM114-Status: GOOD (  10.45  )
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

Property 'playback-codecs' is referenced as 'speaker-codec' in the error
message, and this can lead to confusion.
Correct the error message such that the correct property name is
referenced.

Fixes: 0da16e370dd7 ("ASoC: mediatek: mt8186: add machine driver with mt6366, rt1019 and rt5682s")
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 6dfcfcf47cab..f78197c8e582 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -1216,7 +1216,7 @@ static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
 	playback_codec = of_get_child_by_name(pdev->dev.of_node, "playback-codecs");
 	if (!playback_codec) {
 		ret = -EINVAL;
-		dev_err_probe(&pdev->dev, ret, "Property 'speaker-codecs' missing or invalid\n");
+		dev_err_probe(&pdev->dev, ret, "Property 'playback-codecs' missing or invalid\n");
 		goto err_playback_codec;
 	}
 
@@ -1230,7 +1230,7 @@ static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
 	for_each_card_prelinks(card, i, dai_link) {
 		ret = mt8186_mt6366_card_set_be_link(card, dai_link, playback_codec, "I2S3");
 		if (ret) {
-			dev_err_probe(&pdev->dev, ret, "%s set speaker_codec fail\n",
+			dev_err_probe(&pdev->dev, ret, "%s set playback_codec fail\n",
 				      dai_link->name);
 			goto err_probe;
 		}
-- 
2.34.1


