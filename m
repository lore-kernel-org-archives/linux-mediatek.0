Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8BEC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JleaosgPudHEejmUeNFrpNbP60XzHFLgR4c9WPlcTX8=; b=n795IAbmZFZhfsHPb15vY6XTYh
	nUmQmQba3UVlVV/Q5DFIodcF8M+bDoRsYU/+yBjG/7sNoT+2Gco9uhjib1LzTbsVoXJ8QssUloC0I
	ir5+2yJHEdSnfzLbROOjdpInvm6rVwSImCrx+6Rvob3pwOQNI+MHgW2/1w4ceBY0QCnNiP1pzo0r1
	Z5ImAiiA6+dIAjrPj8I64C2LDBdJhlSWnbvKBDgxfUVlGGAwO0gp4yj1Gfp5CdaMY9qiNf0kpBDUv
	qd7Jsk9KotQHV3ui9otU14AXqYs1zL+PdgWU30T4aanSUA2on83acQoNYsTztNYKmvXlH1Lez+AFs
	834Kfhsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS6D-0000000FzYM-3SGy;
	Tue, 30 Jun 2026 06:37:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS6A-0000000FzUM-18i5
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JleaosgPudHEejmUeNFrpNbP60XzHFLgR4c9WPlcTX8=; b=PzZZ6zKHeVx+EiQpo+odrOcGYv
	O3y+VucYQA8P9GOS7fdwyqvGkqtg+Ll70T/qCoNsXGjJq9vX1QJBqPjFIBZJZel+8LFa9HJDbmIA2
	CtzfJ95oGDuMfFXu8u5umB9RarONUd5ZGBsJHPihqzi9qsXwWbYbfhzDOH510PKk/JGdiVlKpoUY1
	+IeVSjSjl3qe+53xfaCgdrZz2U65byUf7wQ5A6Ypmb2/I0PETljoy/dY/qJL6xV3NWxgX7P6OHeps
	ifzxld+oQ2fxjVcn9VHI4okpU79qMYKugVUtuToS1BWrG24kKMxlSyxjwqhV/UQ6hDE2EDBni4qNx
	LQ8Wq1FA==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS66-00000001ZNP-3ND1
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:37:32 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-845eb7b96feso1194256b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801449; x=1783406249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JleaosgPudHEejmUeNFrpNbP60XzHFLgR4c9WPlcTX8=;
        b=YPAdyRX2rJF6XsM8ParU1VGg/tg3u3sVi3weMawHkQAsteN0my8cwL1QpnDQzmyoKg
         0OEhS9T21nCZtPrGPNQiOINlf0lYktYaeZ4YlwQ93hgmErN0104hNmsYmu+R/ANB/f/4
         4FDay0zFtShxEmIAqE8dsjOljt+arUSPRDFuNDZAe+5COl//dMhatHcvK9tQnUvKEkKw
         B4dSD5YhyRhu/SY14dcEjoR14ibqGq1IDaU33m6EzeZUuepQyNi8op4y59d5az532i5b
         xhIJqHKG0fghocvut38rI5+O97LKwtFwi4XH9LWjREggwVCy7geYslaeAR98fuFTclRz
         EBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801449; x=1783406249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JleaosgPudHEejmUeNFrpNbP60XzHFLgR4c9WPlcTX8=;
        b=C9YswpWBLWpqxvkE+81gpHCVBoNG3JUs8Z3ITzmpWK05UrzOaUBOVousSSVuEzm9sT
         dDObd6lLW+9y8xpj8YVQli66HJy0DdV4HAHbwWTM+1B+xd1GIFgYJL+YisXgNdDrqaad
         dBhRwRVnfNv0BcPcXNwT6d3RSpn6DSQoe3pPyLDU+O4UvJAY1FKsQSXrY9f2tjDgN72l
         FVFZ6IWMowqaDcmSMv3yLOeGCcccEvlZZz5QyngpwKN0JB7iCHss8CDfqOwXURIctJ3b
         c5g6iZbICThV69HTnDgXsgOknJW13qy+BhvyjcW05K9+5p3b0wB7OZNo2LoZSm5/L19w
         aQ3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrzk+1DnrjvnHC+6C4x6E4sn0hDiIXtSCbXUKjsG+S6iiOKVZOpQ0j6ubjnryNGt/bdG2GJBOkCTEkdRxv0QA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUjYmu1CNIILhdu+eBA05cjbbwrdO9+uitdBqIcv0j0HcI17eW
	Y4J7p9zfwqRUidM94DbMfVrVQzAFtnGGGqu95YEsO1Kcr/0vBmauqIXP
X-Gm-Gg: AfdE7ckPJ1/jYOPOJua3MMIwMQJH0IE4Cz+/atzDKbPpP8x41TTzhR4ZyA0GctS/5xd
	/uMA/R8J6JfDyuQiwm+D+xXVwewmW8XIajCm3uo1HccEyDmIkPx/kDrc1ub+oBEy3TmzN4zLPNE
	nzYp+iwYF1lBC1QT3INs9h/88NIJklH2DF4Toe/89YNoihUt2M+ZjEOxlPj2LwKHAleoJ4FlWCq
	WQUxtPwZGma/DfVAhxuqS5Oz88oIGEOtuP7Ux4bRClRsVqK68xGI1sgR86u/58nNBrhBH53Y9R7
	19f8Jw8a7piq1x9/QKFe0mlysCOd9VrkHbFsPL1QHSvJcjdKsD8lG0Y5uBU36EBkEaP0SzezTQL
	fPIXm3jtpbcRbHxGyi8EUPAGIQbMzA2iZGvpxIcNByKDrKD/DMZnVVMv7xclyzw31OTVLjqB8Iq
	roCXgxCh5K+bNEEeJKXeSHoxHDA/LIdifCHBQ2uivnnDzO0Aw6QOdGDhgywQ==
X-Received: by 2002:a05:6a00:4b4b:b0:847:8842:8c63 with SMTP id d2e1a72fcca58-8479f2ea745mr1734146b3a.56.1782801449017;
        Mon, 29 Jun 2026 23:37:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 16/27] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:38 +0700
Message-ID: <20260630063449.503996-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073731_089390_D3C58B45 
X-CRM114-Status: GOOD (  12.71  )
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/peb2466.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d71d204d8fa..5a1ed02abb84 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -6,6 +6,7 @@
 //
 // Author: Herve Codina <herve.codina@bootlin.com>
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/clk.h>
 #include <linux/firmware.h>
@@ -1704,13 +1705,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 	 * So, a specific cache value is used.
 	 */
 
-	mutex_lock(&peb2466->gpio.lock);
+	guard(mutex)(&peb2466->gpio.lock);
 
 	cache = peb2466_chip_gpio_get_cache(peb2466, xr_reg);
-	if (!cache) {
-		ret = -EINVAL;
-		goto end;
-	}
+	if (!cache)
+		return -EINVAL;
 
 	tmp = *cache;
 	tmp &= ~mask;
@@ -1718,14 +1717,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 
 	ret = regmap_write(peb2466->regmap, xr_reg, tmp);
 	if (ret)
-		goto end;
+		return ret;
 
 	*cache = tmp;
-	ret = 0;
 
-end:
-	mutex_unlock(&peb2466->gpio.lock);
-	return ret;
+	return 0;
 }
 
 static int peb2466_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
-- 
2.43.0


