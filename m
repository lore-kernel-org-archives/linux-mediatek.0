Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114C3C79FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Iq4XFZgztZ/SSg/JPxbN63E3iQJmYKZr/24Kl0mWDQ=; b=Ip/WGcjyOFFxG7JcP8E5vV8UrP
	wxUr6q6+EaK3wgqUpUSbFzbq+iuaCmd+8SNFm5ugGTlNzgxue5kFMnWDWHCY3wnhDnHG87X7yo90I
	UDQzxi98QRLM6gRW8PPV6tfXVqwgOyTvLZutHy+HJ2yXRk7XZCQG9q5ekTdAJgLbXcsly/8Iw4J5q
	BWY21YWBm3Vzu2u3QE+i0w6Y8AqaHEcn29WF6PZR5F7wcjc3rTICpMesQBKtNoK99dpUpvWia0nb+
	ke5PGzMhWAWQ1eeqkyndyBx/Ys4N6MsX7Gxk8jLQDdjtWRmejpH+b4YAF5dWP+YjUyDiR67g3UeSN
	lheEuxMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMj-0000000EP3L-0gpR;
	Thu, 10 Sep 2026 12:58:57 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMd-0000000EOvr-2uwT
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:52 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-398a5aad413so5909836a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 05:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045131; x=1789649931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Iq4XFZgztZ/SSg/JPxbN63E3iQJmYKZr/24Kl0mWDQ=;
        b=D2X5hIkYjaBumMJcVI5sMTpYA6yFa9CoV7aZQZwM3WzqleRPwBStwy1HM8F90NcW5U
         7JNOsxvwsgbREiqnShObkjjtDIrG0jAJbYv0pM6KxcGP5+GU7jMnFFNzce2dI00JnLZ8
         Y2ieCmerxyUEJVokv/Tw3hKKDdamsLeFzrT5zJQ/lKbxshnDgwHTjrnWTFFAkTgcTbhK
         oJiZT4715lx2SyDpB+f6R5t3OFZCajEDio2ZQ3L7R6uJmzpJbGbtRUVg9ElDi8YOU+se
         ex2LkRqQ8+89fB7/X+5TrOoTq3fpv64bR7oep31IDQcv1jvYDKagD4CO2Pi6KfVet3J5
         l8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045131; x=1789649931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Iq4XFZgztZ/SSg/JPxbN63E3iQJmYKZr/24Kl0mWDQ=;
        b=r6Bmh9iDROUkJgrgKsO2egH3ijeyUExE/vlfUJT+joi38VRX5yln69foBm8HoLINU6
         SMEil99RkQK4Qfa05e7+TDoyxgoCbbQGRX1s+BdAlcYFpbHbpCMNLK/E6BOZkjmtbglz
         T4gqIKRxvwGrX2UhpFKNnwh/wI/YIjYI0JTM2mgiW3WsIzbmyHuhnHIAXnnl+q1jjSdm
         38/7S1V1T7NluyatSZKrXghJBIBAOj+qgRcZXi+6vCG72rC12ah8xKP9rL1FTAMcpeWy
         NQggONQM16O2b7CC/uEea0Eeku6jIkEdRaQJ1H7WxCCETPcDh9iQc6bUiv7SmCvlGS/T
         5z9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAtVJhupaJHTqxWeQz7JKoNdipvVrrQXntV2v/iXId8lDXD7Ad34jWMuDSxlHS/+wM4JW6+a3q7h3SZ2kNZw==@lists.infradead.org
X-Gm-Message-State: AFuF++mNku/sUCpRDuaDzxX1iS1wS9d1XCdc9ekHWLnh3b/6IuE8iPzs
	QvRmjyKigRELWE+XQcejiTaCiYYvR4AsBF55uptj5gGG6MSf2iLouUWv
X-Gm-Gg: AYBFou2K+0o8IeUR+MODO1171PbPKgMMM1VHCcZJmnAiMzpbZaSt3H2LqbTNqsJecAd
	8RIyL5Y7LiLlgoTP/S2m2QBSS5dtdBkqc4TYjl7OcxnDPm54/jrNi1MpI5dy0UXMHKITyMYvw6E
	18e0GR9oVhgF6DYsea/pCtj4fTiPH+sBh34xEG4MpKD+znTvIdlE+n0mX8txdbsDWbd27FqLswv
	MMOMi+BgfPFzYhVEGk7N3R/HpS24YskkBC9nG7y7oiZcn5aFEEp2fCUx3tzaVc8KEs+301htv83
	dGfTeKFagSE7uA0oSrcM62MLqEBs+gmbtNrtQHhDAbDY88VRuNgfwRgLFqZiTuHFedcvh+9xZm3
	FrCRyHWdRzUdvrhc4Cck316BhVIoolm03YuBKS+Qzcv9cAtNpMuUbfKJE6yyDU1u5Np5DNJJ66w
	cCym9MouT+5069RegYiY9HifJWeQGv9tiPOP2/7+wlFOI3tl6MXdsiYrl98xoMV09qBZ8w7peTu
	u4HX4Fe2Ia8rcGss6mO0FA0WHc8l/E40PMRswc4AVHPUBJlwIaF/ZG7/ZQtCS73SQcTENtN5MWX
	4+ffnSnB4zA8gmc=
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr60419743a91.25.1789045130914;
        Thu, 10 Sep 2026 05:58:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 11/13] ASoC: mediatek: mt8189: Validate sysclk frequency
Date: Thu, 10 Sep 2026 19:57:40 +0700
Message-ID: <20260910125742.150902-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_055851_742337_84053CEA 
X-CRM114-Status: UNSURE (   9.45  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_dai_i2s_set_sysclk() accepts zero or negative frequencies.
Reject invalid frequencies before configuring the I2S clock.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index f20dbb410223..ca7d786cdeff 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -1286,6 +1286,9 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
 	    dir != SND_SOC_CLOCK_OUT)
 		return -EINVAL;
 
+	if (freq <= 0)
+		return -EINVAL;
+
 	i2s_priv = afe_priv->dai_priv[dai->id];
 	if (!i2s_priv)
 		return -EINVAL;
-- 
2.43.0


