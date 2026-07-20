Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ED6C44524
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 06:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjslSMaLxzrkUem1WFJqu5PdOsbgvYRCxR6KR5IC8og=; b=4yPXyWxwr7QfUD5rMc/JQfoMuw
	3c5CMtggl+8c7Mcv/XJ0brvnbCHbW9mXGKKr2iNhJmrHMTG43sZuDLNypTsOPv1g02oY0OgOLbQvm
	xMMHv6Y2bVhw+qV8WkwBSnnai2/7UdxrLXRcXVD81sAW8yQ6s6rYJZWojL3Mnt9N6iC0I4mSv3ej8
	y3/MJ/ah1zylsLHQ3RPTTxwlOIwWZ9xxGt+cwFmfGZETznQOjZvTU74ccSUgnjGNvI8Dr/wTqg+zv
	9ltwWBv6P6mLDjS/pFvzA1RSHcTqHcaQE02CXIJ1ETaYvpsIt7xZspm/Y/4B9Z4PPFTf/a7nvSvkT
	DM7U6r4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhQH-00000005wEu-2nCw;
	Mon, 20 Jul 2026 06:24:17 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhQB-00000005wBL-3yfp
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 06:24:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso13443065e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Jul 2026 23:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784528650; x=1785133450; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LjslSMaLxzrkUem1WFJqu5PdOsbgvYRCxR6KR5IC8og=;
        b=S0OBhEGDZWMXk9OG8TA4F3+dU6nkUQzj1cQGYspNq70nMqo6miF8lK+GsalB/N3ccE
         bFB8PkFdQhAHecoPX6LYarN9cLjmlp65paZRKh8eoTJRaasQEYn74PKaKonh+6YrgLYY
         90oJnoKb8ZUEM7g0cOu7fbZUZmPZogGvU9LSbxw+yUg1aPRcm36bqhEB+oWGaKviZT7I
         UIEbpIyhnxGNwDGPKyqxoJNe9UPMEMf7uP22qiAOygeCIHwlxX/PIiH3bj9VqWCT8uFq
         AM8qTSvvi1ODR97AivSzMph+/CAMktA8fAOxF5pt8MCLCvbqFPkhzrqCwxnmOD51TaeN
         IkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784528650; x=1785133450;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjslSMaLxzrkUem1WFJqu5PdOsbgvYRCxR6KR5IC8og=;
        b=OUZ9DaIY79QZCVjyCSlyW5LDQ8lC4AYjg5MhO+8rRyIzXDfjelMAcb/4JkBtC6tgpK
         /X66TOfzxfzLQDnHF9tT5WTeT8DqowWZoucNaji4A2UCRdoLMLJF6rYLtSSlVWgG9CUX
         Y+6X2d8N6nKA4scTVZ9AhKuBEL9xT2jPpxmuXVM6xlSBnJHYdoDLvZWHV11BEpcIuuWi
         rc2A/LlNCTxf+U7K7TQzrgTlsT6PtKMFEelqn9R5+zESBFDZgoPZbGeIlsFXNrW/DZer
         eiH8P0zfo9SrWT3MU/aDRpUyIX1uYCtY/tWCON3htkIcq9RzQG65y0ofnWMeGHWGnkAj
         /QfA==
X-Forwarded-Encrypted: i=1; AHgh+Rpg0F9VS+o3K9iW7fCDbiJ6gcvESzLENL+lmpWrqHAwUvg6llp1Hu0ulHtomb6DPryQAiASniSeAE0cN9UNKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDD7SKF2gpE/NBlzM0remud80ZHyou3zAU9wRRg8M50sKmknSa
	DKGyvF3vlgZb3H1iJGjabcdOhYp2J0ynVdNPmEiLFgmBVoP2IUJ0Qo3zGKVGP3PhKzI=
X-Gm-Gg: AfdE7cnQPC1VqeSQfu4bkA1Q7bhQG5K8LlZ/ERJHmYLuCc49HTpk+JLV6D1bGttyIrc
	2c0OEk95evhkhBvTOyIC0SXECDIWFOR0k0+GYl2qDh1reZ60FCNlrMiXv2o9Ic75YFSjOUZpSkv
	dpbyK7Ayma/vKIjxo9D4XOLhnMkoHkhbu1aTE9dXNaQku4URZuRJJ7Wt6xE4vB1lbrfJZQgm+hV
	ND0n+WqqD9i8NgsOBFmKJEniixu/NY0xpS3yd4UACBm9CqrGRpRqipzr7QvYLnjnkQxwt1X9h1R
	2rBe6FD1aMex0tiClINGdiY40i3U7eWc8BJYB9Ee6G7nCOwKv8ElUzmW52vgLpjtz1QIsGmdFME
	XEFA4tcWUQJ7TI9CNzO6wmvZR3WaF1n4VmKoYY11RhPC6Hy9GzmVF/N/bEbN5JteWhD8OMz5om9
	kysZO0AsQ=
X-Received: by 2002:a05:600c:3b9e:b0:493:c1bc:79bd with SMTP id 5b1f17b1804b1-4954a41150fmr139665125e9.20.1784528650076;
        Sun, 19 Jul 2026 23:24:10 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63ed1911sm28677377f8f.22.2026.07.19.23.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:24:09 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/6] ASoC: codecs: mt6357: Drop unused assignment of platform_device_id driver data
Date: Mon, 20 Jul 2026 08:23:45 +0200
Message-ID: <724af6f60ed9420d5513724d126d70f22e319c91.1784528081.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=996; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=vAKMmJnHPuZMbQlF7pMCnwvdxfkdQbAQi3GO0Glrn7k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqXb7zvzrc7TRHECpePNkMrYEielNWjuww1fVDr ZBkweZo62OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCal2+8wAKCRCPgPtYfRL+ TiVRB/9pxg+lmyYWuCSLbYSK9sf7vzngD6LucEFTmTPJICBCB4vNZ3/XUHrJlM1DESz4TIzE2Fh 1fwPQsqTHoPspzc+0uTxTmt68ghGm5Xr1drI9zNF9bbji6fWZhpXSlmMSbvfctD7OBsqTDg/wF0 6PyxjnmLlOlSo42BTI1Qq1qTrxRpLWs7GU+C+KW098GhMah3AUzkFe6oKPDwgkYVhIUCCHvq4bl lI2gUj9DrJCts6IznbFJQi34G3AgS59Jkd+AsDET5IuL8q23tuscpT1HNsDs8SJgBrkQxLfIczg Dn9ZzmUSYacJgaE0Dz12vY3llnccIhHPDDHlun34OYeksTb8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_232411_995222_55DD53BF 
X-CRM114-Status: GOOD (  14.52  )
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

The driver explicitly sets the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignment.

While touching this array unify spacing, use a named initializer for
.name and drop a trailing comma after the list terminator.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/codecs/mt6357.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/mt6357.c b/sound/soc/codecs/mt6357.c
index 674cf7df9df4..3b07087e1cab 100644
--- a/sound/soc/codecs/mt6357.c
+++ b/sound/soc/codecs/mt6357.c
@@ -1834,8 +1834,8 @@ static int mt6357_platform_driver_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6357_platform_ids[] = {
-	{"mt6357-sound", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6357-sound" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6357_platform_ids);
 
-- 
2.55.0.11.g153666a7d9bb


