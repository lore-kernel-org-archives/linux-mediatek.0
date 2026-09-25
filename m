Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4ECC9830D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 04:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=; b=h4CSsKjEIWESahy5esubHRjOed
	n76Ju/79C4VKzuF6vpd19NpNjVToUm4wOVvoDXI4ioBHAtOy1dO0EEA66AyXXcmrLEXwELCVTEprF
	BZWpZrwhY/+R7wMv3JHy3QKmglSKDGkZzZEKUZQNVeaz7b0nGkPTJEUZOEp+z/UnNAVG3ugNUac59
	fUXKDP9dUugHMmYkUEU9S4i5mQvqX2ZefJ4xgRFscI095XQhNLD5shoT4HOz+KbyfTVL1wEBVfB1T
	uFgkWXEkQjzMJb8K8YpCacUhmnkha9btgNgrhaj+FSxZo8jotPjbXSsaLYystBL9cJ8siOQWlElfP
	k/RRFMXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xuB-0000000CeMO-12Ca;
	Fri, 25 Sep 2026 04:51:27 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xth-0000000Cdyj-1618
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:58 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so451188a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 21:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311857; x=1790916657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=m3BllfD1xr5dWecMUjWZ/wH0r46XJ3XzJsuVJy23GKqIIfg+jwx43f0w8JThBxQJd2
         oRRqAF+WcgWqOfwGx77wI6YH9rsEKwSyeKx1SqS9HKnyHGje/RvVJy9J8/b2BkKtkyQR
         J6WXd7vc0IIgJo+ZWna5Dxp6nqo8110pchM+2lXkXPtwhqFpP3ofCSWX4YGAejfc+R75
         2XcRfDXZ3LrgJ4x7Ose8TipwAaxAKQvwLRVxN1ytKhS7NnSWIXKzjk4F7UhjTOxzByxZ
         8OQbkgylEEGugQK9TMX5L6Sn46MpfEtJVmmBF8nMwN4DU6bDTDvEUxDE3VhBO5OdfwUP
         EH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311857; x=1790916657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=JQU2uJS+1ctdSDc/ZW32mDmOVvnXJCwvNvgnvPUF//gcb7eLGbgYDzTQC9JroBV7fF
         v7Q8WRpFr7xHJ5pZZkux879Wj3y7Ax+SeKvKpjHUxUPZHyefbob+nj2doF+1vj+YjIPc
         8/wWorJLuJQIqopqmiZI46aMue0z5MqNo9dX7D39s3zOV0zzUCApxtBUTzFRIwywoTyh
         YSGS19DOIBsLnqjFDy6MwozDe1TkW9VfJg7d7Kuli8qiVXvaVHQu6EWwHZwfKWS/51Z4
         YXd9CNkwVOYS/jVLBmQmhD8no6MNTVmpWNIQ31gb1pPu2ca10JmSWS0e9gK3RxxoVl4d
         Dopg==
X-Forwarded-Encrypted: i=1; AKwUvBwgVTbCED8hnujAIh31yCuaz7R/N01Or6tvvtEzriqHNA6e6h0VXC4PVqRnI1nuDuH+R42dpjjLQR1/O7q2UQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nIfvM/kA0UNoNsmlEh1jO5pKMzhZY6pN0nSSLEIAQJRRsXStdf
	DWrN0yyplvK8ist5pZJkD+3Aqli5vkjA6uQ+PX2RwtKA8bc0Hxy63Mhj
X-Gm-Gg: AYBFou1GZsWksa5nS4YiCzsjYxBajaiBkk588rSB+KpP8P5r26lxiQp+BQJFVdF7kMQ
	MYEpZ25lHVuaIS5Hvh56ZeYR3BItAmD0ysWu4xBOoTvfQ6YwdPP/AkfMh2aDf5pSuSwRPkzbAY5
	5IBxGVzma8yb33gERO15B8Qlo6SQ2qMxkrY8JvXInhPqN1kepfGtaItdRvQNtMsbtKHU6r+/WI4
	mlweOeajnyvNdYTcAemKSkYgqoyTUqXCT+l5KcElm3uNGGFACnaWzuK0FqFrMdLj2ZsFzlgge5e
	PdQF+6Q/n6nMlHIDulPAQeMDFl+VqjCh5u8XSMG/28Fwoas5kU13tlUFHeLupXvBmgQrcZBO71e
	kS4bwWnNIZOwY4eg7oKBDseuP8GA70ri1i9GxB+whbR1ExOUwQEnEB1fG8VPaMu+6QQ4ocDagIw
	xVZDWjDSKpYy+3gLbRFUb7G+5X2Ys3U/ZzundCBjDvjajEipXwNS22DRrLbCjZjwM17Auo/ideq
	V0lpNQX5guf1Or5ge6uVNkeK5E/reiokVAT9a8EtG0PI92cfFFlx4FeubQbxL+mEjXrgHDvRrE5
	4SKvWoz0h/iR2w==
X-Received: by 2002:a17:90a:d643:b0:39e:6a7f:1dc7 with SMTP id 98e67ed59e1d1-3a098db98a7mr4301609a91.35.1790311856643;
        Thu, 24 Sep 2026 21:50:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:56 -0700 (PDT)
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
Subject: [PATCH 14/14] ASoC: mediatek: mt8195: Fix clock parent error handling
Date: Fri, 25 Sep 2026 11:49:08 +0700
Message-ID: <20260925044908.450775-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215057_322060_885723F2 
X-CRM114-Status: GOOD (  10.13  )
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

Propagate the error returned by mt8195_afe_set_clk_parent() instead of
ignoring it.

This allows clock parent configuration failures to be properly handled
by the caller.

Fixes: 3de3eba588bb ("ASoC: mediatek: mt8195: support adda in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
index 94abde15ea09..8a58a142064d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
@@ -262,9 +262,8 @@ static int mtk_audio_hires_event(struct snd_soc_dapm_widget *w,
 	default:
 		return 0;
 	}
-	mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 
-	return 0;
+	return mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 }
 
 static struct mtk_dai_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
-- 
2.43.0


