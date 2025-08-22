Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC6ECA0EFC
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Aug 2025 11:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a74RVsak1TLYR6bws4zrQXpjsmVG5raUd4MS/ii7fb8=; b=bS4JxsGZY0ZBfwX+mXmE+F3b4L
	S0TQyhvrkITIwc8RNLteuLT1wV6oP6nXOBTlM3XZAuHoSnewQk//5zeUAnUY4d58AIsop7yjoolZ5
	BCQgSSW/MvwY73KozkLKYhSANKDjAERw3nDVZsk0YpKcY4B9vL7y86lTe3aQFsg1ABKAVL9L8lmZN
	xCk+Tc/Wp8K5AfPE4EAtAVXq918JnZ7wKUwMqyliynF34Kq1SYYTElei43LxBElNwOYTgW9g+UYNI
	eOaefhLAQz6gZORJ8F58MdASqrwVD0G32oEOSHCndoqbaBzDhh2VdFRkbYRrxguvA+pVwxgnYCdAo
	sCVvLqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQG7-00000002N85-2zN5;
	Fri, 22 Aug 2025 11:48:39 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLFg-00000001hAn-0iJ9
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Aug 2025 06:27:53 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-24646202152so2144515ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Aug 2025 23:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755844071; x=1756448871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a74RVsak1TLYR6bws4zrQXpjsmVG5raUd4MS/ii7fb8=;
        b=IyaxVViPc/AIlzEvOnUXoGosXp1kTIyOjulTuNdCziuZa7hm00xl5UaRZHKnhEXHUN
         8ZAzuA7/WjBsKb7Qo1oa6Q82pjtvpvJuZJbrmNugilriCuIGlRwCpVhdRlmVIBpeHBu4
         L9yFXpIKRAlLbPmqDjhHTfjufXM1UH5EsIy88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755844071; x=1756448871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a74RVsak1TLYR6bws4zrQXpjsmVG5raUd4MS/ii7fb8=;
        b=GyJMBiAv9RJz1iA/A0KooEPbK2Px67TSqRRbvNYoMTPXQlPBbiPaSFkdd+3f/zDRTc
         Rwia+MI+QvA89QMZrwJMuKwpV64N1k7wLQ5gmJfW5ddMCLlc5Yc3hTsIuRxcYJSqMBOo
         stqGzwvc69NwR1LmbNAURpDvsLf8W6m/zuQZOYvDF0zjbwaLWjk3usbQfVLeNp+AO3M8
         /eZkZVdmoSM2ugqdrdA4sCDoSFxKBAEZwtG3qlUe4KCZNLf+CJVYXpAo/qicU1zxTul3
         TdQ8Y4Xpv9ezlesqJEq4y858T/lPgwqou6vHuu0r1bqr+tYSq5wbfj6+GIEXQwBI9rLe
         /dBg==
X-Forwarded-Encrypted: i=1; AJvYcCUk8kpz3WgAPqiJbcK2Xoga2yOUivrldL+N2nDzxyWxNPZNpRyPIes2HcRLE2sKlNfoAut1iddwIC3RyBJHfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzowvC+R9DTfkB3Ih7x++WZ4npi52LY2yX30j6g4ufF+VrkkmCD
	gx+U5FmpPX3/GTgj+IP3YiUynbfDuBHSMTVwj3//4faEIklUvZgQzRg4rjpC8O/TaualuQbKijM
	lIl8=
X-Gm-Gg: ASbGncuwsq02jbu9en5NRxSGFX5rtufTUC/Ubc7iBR35fJnFksx3jc9ZIcV+31kpWLO
	DxOeoQuJ9Ca6osVkW7JGxxFu+xkx9bmAogBfKkeag3S9jILVKMdFx/d3MqKV8Ju6NpHLfx+kpwJ
	XiXAy+k/ZHm6jeEr3gA4EqJyoPgxSazz+jEJg3POwMlozEHXgojiQrMWqUK9qoeQ0oi3VMwAGd9
	mlNEv8dkd91d6h4855iZ4LvKVtZF10WoQ0OfYoD0d2GMa8dien3aZRkIUNjpSHTyYqydxqrpEgr
	ribcLQT8IQYYxOpNu9k53DuCJjAj+yFRaNC59jRp9AwBxJx9M1flVvjdp3JoXdJPwDGV/96IS3u
	+gBg6qvzI4tVCvZ5X1M3ydeWDHO3eyEWDwU5vdB6f4TFZZ66GWmI=
X-Google-Smtp-Source: AGHT+IF4m2GD74ARWQ90O62WKvsqVkiAGFVrRDGXDAa8grwxDZefBXzvdvCU1/9OIzJpcFb0Leq+aw==
X-Received: by 2002:a17:902:c402:b0:246:464d:118a with SMTP id d9443c01a7336-246464d12bbmr7066525ad.46.1755844071478;
        Thu, 21 Aug 2025 23:27:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8278:5411:367e:2f11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2463606470asm11813375ad.14.2025.08.21.23.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 23:27:51 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: common: Switch to for_each_available_child_of_node_scoped()
Date: Fri, 22 Aug 2025 14:27:37 +0800
Message-ID: <20250822062738.2632746-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_232752_232592_69AAAF08 
X-CRM114-Status: GOOD (  11.66  )
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

Using for_each_available_child_of_node_scoped() allows us to get rid of
of_node_put() calls from early returns or breaks in the loop. It also
fixes issues with missing of_node_put() calls.

Switch to for_each_available_child_of_node_scoped() in parse_dai_link_info().
Also drop the braces around if blocks now that the inner block is just
one statement.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../soc/mediatek/common/mtk-soundcard-driver.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 95a083939f3e..1e3b43fbb16f 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -95,34 +95,26 @@ int parse_dai_link_info(struct snd_soc_card *card)
 	int ret, i;
 
 	/* Loop over all the dai link sub nodes */
-	for_each_available_child_of_node(dev->of_node, sub_node) {
+	for_each_available_child_of_node_scoped(dev->of_node, sub_node) {
 		if (of_property_read_string(sub_node, "link-name",
-					    &dai_link_name)) {
-			of_node_put(sub_node);
+					    &dai_link_name))
 			return -EINVAL;
-		}
 
 		for_each_card_prelinks(card, i, dai_link) {
 			if (!strcmp(dai_link_name, dai_link->name))
 				break;
 		}
 
-		if (i >= card->num_links) {
-			of_node_put(sub_node);
+		if (i >= card->num_links)
 			return -EINVAL;
-		}
 
 		ret = set_card_codec_info(card, sub_node, dai_link);
-		if (ret < 0) {
-			of_node_put(sub_node);
+		if (ret < 0)
 			return ret;
-		}
 
 		ret = set_dailink_daifmt(card, sub_node, dai_link);
-		if (ret < 0) {
-			of_node_put(sub_node);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	return 0;
-- 
2.51.0.261.g7ce5a0a67e-goog


