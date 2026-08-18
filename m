Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F44C5DF70
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2026 10:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lERV4Dgamz3blZ88l1O9q1VhAYN8Lxx5pk25Ui9BHUY=; b=DjsOepkGQkOgWu3+SvdCDDWYTj
	/hzfJwcxO6eu3ROjcY2FgOJjegoxeXXUjV1QDc1mh5zlZrzZA+sxmrxnlih3KV2xZ9jUL4RmaXi6G
	Mh6GvlBH9Ye+PX/WCTMCue0AnFbdIzryKwSx9U1O4a7UJVLbxZKd6glhj34b7qyLKxfH5yiD/Esqi
	Hy8oxzL0HqmzStxmodN/p42W3PdwrQ8Ha8jSCJhQSd14TqTpy2Wr+NLX3NArDccgRpiz69uOdDVO/
	zLyNYbEsbQoLlm+IVnaxGuDJlE4VCxOogwZTQwjBT12D/GVBqMYdMLF3gZdqyLSf0V2eSd75Cha9d
	05edFWjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHIp-00000007lud-23yk;
	Tue, 18 Aug 2026 10:44:19 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHIn-00000007lta-2HdW
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Aug 2026 10:44:18 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso4427726a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Aug 2026 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787049856; x=1787654656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lERV4Dgamz3blZ88l1O9q1VhAYN8Lxx5pk25Ui9BHUY=;
        b=CoAKyW5Lpsqu6Nf4Iuc/Pb/uFY1VQOgrDCNU7CF2duIHOBGCMFE3aBp+eVWI171qlc
         jS9ppT4xIiB4jCtzh/NLBZ6fKE5O6X3oGhGVeUF4Jc9Ap8qv+i6HF/IC5r90dis0VNd9
         A9oMegh79yAT6ABBxhc7O7K7tHx9n9id2q71/Ey6rIGVpULNxw3g9doxo6nOkWsp2luZ
         J/Y4OgmXIHIsW6uOUA7PUh5A1zOrnfnuo0q1a8TsV0fIIxTucWxQEcsLJQc0zIzA5wA8
         Do6H/kBOCiz1jjK/UOsctOcK4xRpq2vIJdOKZmlQfPboMZnVEIQzcjQSiyYIgNhFFyRk
         0E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049856; x=1787654656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lERV4Dgamz3blZ88l1O9q1VhAYN8Lxx5pk25Ui9BHUY=;
        b=pzVt570M2P8PBR3ebIRV+4OIwAgvTjGVxdySZcRFT0dH9RsqJHhmWKts2b0IcnOgfq
         TR6drsoi61II6qCUUHfJUCxvVBiThM8ZpUymJdrWCgh7x2Hr4kNRCVl8CdBmSkNbFqFI
         FtirJQOVl1/5htrE1nvs4mi4vU4hqNYFS+BK0AgPGnfjtBGGPjMqJmSUaCSqype4yP7P
         xY6UeBoEJAWDVkXzS3zbBcZwrn6L4+3oH+735RaLx2O9woLoqNMyL2XZut1gO7ImJ5t6
         hrMX/DZLKqQnCgY6th5RkKmOHh7TjtycT5cp2/CFTDl8CVf5n01oE9B0nRKRwpFTUZ4H
         5sFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUN3urowLQpmExvNzICIa5/SlNIV6fSmBNHmlIWX/p0aVcBk4OzwZcZB498cERYa6bQNdOQwjJBJ6knZGgcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfjHLZJkkluHkbCnAdRgOfcZi2QCR5M9YnJUg0L553RuQAGzvy
	0ibVsXGVUCUzLSVhA4SNuqaYO7EGMwCbXPrGdCxzJ1850OpEzhsQ57A2
X-Gm-Gg: AR+sD10XEgsMvcI0qs9LtLQEhN3voeayupug+tSILQItr2JLXAkWZcdE3KEx2AWMhp6
	6Nuum4tbm7vqlvpQhgpBSANvB95AZgnXunP7gnMCTraFhys/qTRC6s8b7lRS9vJfNt1tleuSnHK
	36Th76wNMcGf9LRrR6C0Go9sxdQqeuseHYbuWQTJHNxRRWXdHHOFQIq24OY7RasNxpkGuN2P/Me
	6vbRxIsq7UxOMO/O438tgIf8hq+4+E8WBGAXMLrOGSUxQkbD0sXPlVR8RSk3HicpokrSmY1LprJ
	e6OFkAeChRSWqDv3nPrcwS13lwmqGfkanTqP+Bj1eq9nRjauFl9ihhuMmwX2oPl6OyidsXVcdAo
	KOw9I4yvlMD7DU5SBL1eSjaNbty6cnu9B+oRdC2JI8/eT5NsSlwOFNTEWSqLH3FfdT81j0IPsXx
	uv4TEat2MZKn90QzPCG1ij0JEdKyMBoSdYPgxbeBue0Onog76ioQjzc9MXMmGkjEMse5XG8ucOE
	i2iiBOavQK/lhSZHa1fYBuYDqdU8Nqjimwwnjo41fU3zezD7J5PFOGyo4oj2sxhYIhw5cVuZutg
	0c47
X-Received: by 2002:a17:90b:3809:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-3955a79c068mr8481277a91.10.1787049856368;
        Tue, 18 Aug 2026 03:44:16 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267bf83fb2sm15039905eec.19.2026.08.18.03.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:44:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: mediatek: mt8173: Use dev_err_probe() for error handling
Date: Tue, 18 Aug 2026 17:43:43 +0700
Message-ID: <20260818104344.37824-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818104344.37824-1-phucduc.bui@gmail.com>
References: <20260818104344.37824-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_034417_584165_DD809991 
X-CRM114-Status: GOOD (  11.69  )
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

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index b4c6ef6f0845..b7c4b24a9cad 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1038,11 +1038,9 @@ static int mt8173_afe_init_audio_clk(struct mtk_base_afe *afe)
 
 	for (i = 0; i < ARRAY_SIZE(aud_clks); i++) {
 		afe_priv->clocks[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clocks[i])) {
-			dev_err(afe->dev, "%s devm_clk_get %s fail\n",
-				__func__, aud_clks[i]);
-			return PTR_ERR(afe_priv->clocks[i]);
-		}
+		if (IS_ERR(afe_priv->clocks[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clocks[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 	clk_set_rate(afe_priv->clocks[MT8173_CLK_BCK0], 22579200); /* 22M */
 	clk_set_rate(afe_priv->clocks[MT8173_CLK_BCK1], 24576000); /* 24M */
-- 
2.43.0


