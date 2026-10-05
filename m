Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC530CA5FCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 11:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=; b=zwm4FffFWgPVX5X9t4nAE9ngyS
	vj2zyUAgk0DJFoWG2wR/hGShffNkC5HUpZtvkw87n7pBW6DlSd8uXF6SD38EheYstEQqAck0Ddj8Q
	gsrYkg6Vj5fOt5V2MzqQ8Ps7IAQSL0LOIQNTh5itiKkO/3aL3iQyOuXPHKXRwlKKBbFVjwlzw/kiI
	m0cNI7AoNmPh22Q5CtXVe87X2+miRd5rQLh0JgAU4NZIkQ+NKKX4Rg/KOzDUkUScJixuuekNqmBTs
	ZJ7GZOWcmOIXLkm+0w30AE3y6P2iMEExaOmrh8IqMWnxyk4ML+Z41IZJjBJnC9RVCqvvHwvh7o6lc
	a6CsFLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUK-0000000GHe7-3rJi;
	Mon, 05 Oct 2026 11:04:08 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUG-0000000GHY8-08T7
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 11:04:07 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1056416a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 04:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198243; x=1791803043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=;
        b=cwqir8EryFVEKI5Qvy4OAo1dMkYDdc+HSvOhu048EPkzF2HxGwM9kp351MH9boKhmH
         DFQbX/xuhRCOk9ETMAg/jZnB+8X+TxiSovXEbjjsKp5YL96pOI3/Y7OFAa7J94c7RJKF
         5foZPHJq91pnriQN3k54BmP09Xj33buzfKQscqRBGxrlAToAmD/UOVfKzPASuI+/48vt
         MG5iNbURYMDlXKY4XNmlYzt6RtztLM8ZQwTVe7feoUjBRTDJUU3wuOAy59PiEUqpNMP5
         sxsZ2x/EMaeuzgPsPZVZcoRoR2qiLJ9yuTRPK3mDXFHnqtiikbk2ZSCwqzRGJ92HCg6j
         dhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198243; x=1791803043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=;
        b=VlbxyNJOdSFTRM3lIrx1RVRiMOyjH2HBW1vYvMmcrgLdzZ3TbkS4tWEIaGxPOT221x
         jHI36B79VGERCnAG4ZGamNgn6nf4npDztJZPLfiXLKeBkGHVAg+00f+PITMnXlCgSwKt
         NEi1HQJR1fp2H2WfbuRKcIULyKWmp3/Gy359ZvXl1+8qhoP4xYBeIHPCHvsshfirwHlf
         Tz3onLwBWwTmkNtai+QHbA5ivQb5set3Cjiq1n7iw5p4/DbP3r2JBIdSHtatvbv0MOOm
         XeL/bS9j99eb5yL71cNgy3JNKgLW70K2q/xjpQ5yMBdncCGghDElS2Wp3o8SfpnZeYjS
         OjdA==
X-Forwarded-Encrypted: i=1; AKwUvBy/dGE+IcNO2dtlQ+8E/n4MivFrHoQQq4Xc5niKxoytmXkBO6h4Fi89UN7EYNTKwPHl5TdnJEeX6hDypzxWsQ==@lists.infradead.org
X-Gm-Message-State: AFuF++ljvegBiNobt4DenQFcKEGg62zV6AeyX9HHfXArR97lvknFkVQI
	kBc3V0k+ARJD4pFtYmGTL/CzwQYKr6zp/ehya1NmlbY0sntYJcrTTJAO
X-Gm-Gg: AYBFou0X4JmZH72xyrWZLUfyCsCwRDxydvA71JXPdsQhXdm1MB+jLDQ5MydnHxWzC4E
	EBXiy6OKmD8JEI8Hmmg7Z4iHzwWsaZOe6Stc5J/zySSLEUhELsMxcyOPgmO0PZgiG/kV+op4kj/
	hoEsQrjg8nta/q7WCDUSF8+4Il3P0ZDnNlbwkGkMZoymWmk2/KP9HOTP/gtr89I1kdwOPJ9RmZr
	/589ZgJpqkKVUgX0h43glOYhgQ15dmhp1a0RfXBlAkpoNAjWLPqO0RgCD6RyP70KCOd0TPa9QRm
	EaSYw9Ru4mLjoAxl74MSX5TVYLyMPrImsr9kljwF/K4OI4TvCf41yIFznFh2X78CCBxJ6Thgo0v
	l2OmpvNTxvR11OeAZmBJCcjNsk23wF3w4FGBYwIMC/LPHqX9BIbuETmz9++KHXQG7YR7RWbvPXE
	Diq3lC+pX059oZQAIbEu4AE+HcFlhZWnnjKcLpGkCwvpbEvpZHeKop/DnDDjbW/sA9wGgTAlVqw
	ymQ9bHh6UEMKIQQO5sJNEf99gp9LZYijX2jw/NENbif1wdQbove32H1Mb+O/uFRD3BZhZenFNzN
	3thB1lnFPGN5Zg==
X-Received: by 2002:a05:6a21:648f:b0:3e0:b1b2:2ae9 with SMTP id adf61e73a8af0-3e0d6b33a61mr6751759637.47.1791198242991;
        Mon, 05 Oct 2026 04:04:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 10/14] ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
Date: Mon,  5 Oct 2026 18:02:53 +0700
Message-ID: <20261005110257.50145-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040404_176192_0F132132 
X-CRM114-Status: GOOD (  10.10  )
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

Propagate errors from mt8195_afe_enable_clk() when enabling the
ETDM MCLK instead of always returning success.

This allows callers to properly handle failures when enabling the
MCLK.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1a20adb2cbf5..fba51c552eec 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1549,9 +1549,7 @@ static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
 	if (clkdiv_id < 0)
 		return -EINVAL;
 
-	mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
-
-	return 0;
+	return mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
 }
 
 static int mtk_dai_etdm_disable_mclk(struct mtk_base_afe *afe, int dai_id)
-- 
2.43.0


