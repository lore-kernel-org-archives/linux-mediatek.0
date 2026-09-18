Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B750C982D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDhRsljiXwH4R/2v4DqxrYu1sHb7R4NiCX/UTlOHxi0=; b=Qy8CoBxkUrz6a8Ws1WnqLVf9SO
	kw70ZLK2G5RlIJCxXPsPnQ4iYSDaf14oyzYU/7H9mBI1m9jf9+e4iuaCUwi1XknLCFbTP/jeMJiVw
	5kEtMBBic51mydpvVbMeKaVcFDOJDbHxUEBomRlEw9NXA/GNrfyWl0pRRnEfv2kEg9jZoo4X0JwsD
	FwsAYVzYkNs4fuJejih1Kop2P3CCmp2rxLcoresRp4svHZZ9zNsASJa6OORBfqRr6oCNiiMXEcU2p
	UtcZm85o1/sGihw4/NXS9KY3t+TO4UDOz2JLt1lr3W97iIbdLM1h08npOrs7LY21L9NItEeRY0ZPz
	lyD4yFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpJ-0000000Eawt-2smV;
	Fri, 18 Sep 2026 13:40:29 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpB-0000000Eaq2-2MPG
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:26 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d91c22d27dso4381575ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 06:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738821; x=1790343621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDhRsljiXwH4R/2v4DqxrYu1sHb7R4NiCX/UTlOHxi0=;
        b=rxvHhOM95dqHTdqMmjdjoJQApgLnmlO4LwASKpEQJesyqCYLZzvwxg+1kgqY4R4fWA
         XITR4lXmt16tYfbPisG+J8GZUwycFvPF+38LdUncFlQP+2bXhevPQXWI4aC3xn/akxLa
         G85nzp54wQ4xCm28g5p0uvR4RDjyJVMbA3/1P24xh84G7MGghkt4u6CXgOEGKANfMJXO
         LmSIcnxSJJl4eQ+LTD2SBOeOynVacQ7RUICX1pmmEf5PIEKU+j1aewpJKLPXcDHUU26k
         GgvF6fAk2p8t+2L0/xJl6GbSQcKLC8s3TTpJXb5595uVLDuwFVySvAUfdjiDBWrMlj6H
         U66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738821; x=1790343621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GDhRsljiXwH4R/2v4DqxrYu1sHb7R4NiCX/UTlOHxi0=;
        b=bLP0qDhiEkommtZU4r1rmWfgugdoQTZh4TN9sORBAEig3cOw8tx5yiN8gDtJRzdg5s
         HDGjwDyHs92F1T4K5OewcdmCQ7FFmuj5zrR8W090VjJK4gIXWgjQPXzuG0H34i46j1uT
         GAjCfdJtax3xRrelu9J4ME5lRDT7yDiCBqJsAdi3acd9U+zhehZquW3/jF82biDsduLW
         rqAOmBc1NCdc4hEFPhxfm4drl/uRCvOnLedQOlRWS2+F+NCcF7Boeo75hCbnjGfToWiw
         N9hhnT5LKpRVsJ4+Es2Uurp57+V1p4yVb3DtD25ftAVy7E7GsOQNsKJyztjguhQ/F3VZ
         n5hQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNg/3Vmg4BSqQpgm3TjEA7/+4WBLmXpW5ZNHSy6IdAaFhf+Q6hs2r9FW9zCOaiEiIi2QAtSJWjfjKzUBOyIg==@lists.infradead.org
X-Gm-Message-State: AFuF++neZfGUHSsoSAm3dALi4CRLpqbcBYrlJ55wjqdvW2E2c+ljOO+4
	jG/0O4oUhHGtPwB4F3acjPuDsa+wMEwvi3u+hMMTcjw6iEhAHxQvOTzB
X-Gm-Gg: AYBFou2OBhQWMil1Z66+2Zs7i+DSO3BBimRqttyWQR/aqP//JDXl6NwGIjX/3y0E1ry
	N0K1w0VIMYwx4uJCLGm7cRh3ktIhJSHGzyjaKGl0nxjX0keNmYpJ5ux6ejNfq6l6x13v4haB6L7
	r+xWcbV9bfwOMCILac4582Kz6vm2YWy31cYwoMmjwqCcHKvbtNj+Nocim5J3vdgVrHWW+htD+oJ
	u7FuhPvonM6XrgTx9tSq0Gy9Om8QRuEFOVr8W3Z9pvimZvgJ9/c8oeyaGrflO3qerfPV80H1fwz
	/11VF4bRD+Gt9SoP9rBJfB1J+jaPSJeA0znvBUZ+yQlqN47Q84VUMsEngnt94UenN7O58edaGFS
	kYYNiaGpdMxq7INe6U4GaIeUP/aypQM/w9G8dSV/kuaXVeI4r76o1028FjghNIkyY+faTu3hfWN
	+ErgqIN3b2gxcapI3WOr9SyDjMlBPcFi7wh0GMV5xsBR5JoBIwrhbCmp8dnO04KTljs+kv80a7Y
	k/iW06w7yEJS5itNiJA8zd8M9y8EzkZvIc77sSTEYvjut0DoQ9OazJwJN9eXG151yKvwtPeLZkM
	fYjSemT5+wVTBA==
X-Received: by 2002:a17:90b:3b85:b0:39e:4c7f:7305 with SMTP id 98e67ed59e1d1-39e5504d3d9mr5689902a91.28.1789738820802;
        Fri, 18 Sep 2026 06:40:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/15] ASoC: mediatek: mt8192: Use dev_err_probe() for devm_pinctrl_get()
Date: Fri, 18 Sep 2026 20:39:04 +0700
Message-ID: <20260918133912.133799-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064022_545394_48577096 
X-CRM114-Status: GOOD (  10.83  )
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

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index ed6dfdf2589b..d4218f9708f7 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -132,12 +132,8 @@ int mt8192_afe_gpio_init(struct device *dev)
 	int i, ret;
 
 	aud_pinctrl = devm_pinctrl_get(dev);
-	if (IS_ERR(aud_pinctrl)) {
-		ret = PTR_ERR(aud_pinctrl);
-		dev_err(dev, "%s(), ret %d, cannot get aud_pinctrl!\n",
-			__func__, ret);
-		return ret;
-	}
+	if (IS_ERR(aud_pinctrl))
+		return dev_err_probe(dev, PTR_ERR(aud_pinctrl), "cannot get aud_pinctrl!\n");
 
 	for (i = 0; i < ARRAY_SIZE(aud_gpios); i++) {
 		aud_gpios[i].gpioctrl = pinctrl_lookup_state(aud_pinctrl,
-- 
2.43.0


