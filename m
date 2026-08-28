Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E08C61DB9
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 09:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=; b=g+lY248+EPq/TU+MciWKv/vK00
	kAaKLJ0SUQEBH3W5YErgFhHeDOlDIQDy6M03kj+ZAzTedpTe4rAelwuj1p8LaaVZuqmcDII7UwWD9
	2hY86Swg/oaKXOgeGieLdSeefJQGARcNKhvvMQpA8HUJGOiK/4YpvhHkOMzgAPUwwyCHSNQHY8yGT
	BRwRqXf2HU3EixjwySAx0gSu2wEeKABmfiv+znAQPeICSmh+V6jiSxvqp/Lo3UuQ7neP922AHGMXm
	H3ODn4sumoqnmf2mu9/O8KOuFHIlSeFzwu4q1CzuLgCyNtkL9U3/9TocbsRbPrTnTLNgleEobDfi/
	yfyfNdwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshI-00000005Qcp-2b2e;
	Fri, 28 Aug 2026 09:16:28 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshF-00000005QXn-1olL
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 09:16:26 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso692224b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2026 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908584; x=1788513384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=;
        b=UggPa5hbkpQSatLgNdrEliKqFiIi2JUoCstIsiaUl+mtAO7gJZr83D8xbzyeaAN1rk
         Akk5VX/03FOrYBYSCpRfJEyog7W6H9AE/YGxLSLPO38LTZlN3r24PNcYXk+3Cuh91C1X
         vQlfc0zZ5+ZBV8z68SUUnrw4mhqIFjOJIVe25uAveOuxhWspqcku0nrCJXx49fYbyuVo
         0D0CP3J/NtcSNn1MI3U+w90Wb+StckSecUa4FrLR4T3v/7NpMW+sz/SJVjgvzyi4Dvhc
         K/JSfMbwz2TEeDrdhzW73wkcth53ZKu8U3ID/VfRriwbauA7MKAervD36t+0jUoHPJXj
         /4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908584; x=1788513384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=;
        b=gBze1BNG4f3D+GZisB07+lEZZt/ta1iPWNJ0Zogtw1nc52EBQiyPm4G4AHRhnasWIp
         RaLKaHBXxHaa+/Xxs8rsMxDqPt98ikb83CU82AkXyZJFf4X4JJhJIJyBBNZz5/NRA/aj
         bglAJklzjwDVrSKpPqyz8yBS9EGSSJtIHD0KfeBFvSLfm3kt8ttEOphu5LTQwbE72xKR
         jtrWiTi3jFWG1bWV3oECdYgcDXes3/d3wqPJ8DIQqWD7qYhsHqSxtljPy76kDervr2H+
         bRWRrgLZ8zoJxbubzFqHMxFdurfUgEF4UbUi3EcftbKAoqcYDip5nN4iesdPmloZeYJb
         8/DQ==
X-Forwarded-Encrypted: i=1; AHgh+RpniSLw203L7GpI8Bcht3UaidwcMj+l9NJOfvEpxCfk4HpEQVfuKENiPUgV/uD6hchumz/FWtc8cYwrnC1vtQ==@lists.infradead.org
X-Gm-Message-State: AFuF++l4qqSa1HrSttc24Yyb3BnhEIf3EeYVYJrLwXTdna8l+DFRWzlD
	tryqB62TaEdH2z6/jOixjcgHlhrpQMfq79L4oaQP8w2cEsDbnaGNZNdNCLcS2w==
X-Gm-Gg: AR+sD13hu1XA6HkTDz4UNFmVq7G6JWHhfpCc5lOkhx3R1AxhgMq0J46HItUiS7ixu6R
	Ic+H0TqUCBrvSsUFwWLvIyUHBaKnnDMw3oGx1Ucz12YLvtSl/wZFeEgPsdcv6P/HArDbTA7djW9
	x3UEsLD4kLbSrxMVzaS/olGfLWOYgY50b5q9gwyGmPTWhnexjX0PEttqqYRc/+OszXcf68Afoy/
	SMpeh5yRy3STkrFu4dJRK6g9PMhUDHh8DQ2rpEaKtINUcX1kTpxE+EEWlDQQI/BKEBLHXH2eplG
	unDyg+gUhvK9/cjYg4pCb4xbxZdoelezDM6eM6SpdYQPt7CRqgQpeLJl811MniBmvCxhSUfSyH4
	R1CmI04rOfAE+hpJMsZvacQP0Je++QjUnOcIhh9sGpYa5MRAC0zH5gzJTyQy47YcT9L97lMzlWw
	mU3NBdBrQJQZmwSe2m/szKp9ozlK7gMRfxTTWiEF66lYGrk1x+K+bDeQTvCV5yE6iW32imClraT
	jFaUkARyRdARbVdTA6iPj0CgoY2B2+1umexGh/8MfNtkoV11pYTj8rf75J+D//ExsxXR9Iy83rc
	hZHDuU8fi8M/b7U=
X-Received: by 2002:a05:6a00:f0a:b0:853:5152:a3e9 with SMTP id d2e1a72fcca58-85628c7766fmr12100030b3a.11.1787908584414;
        Fri, 28 Aug 2026 02:16:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 6/8] ASoC: mediatek: mt8186: Fix gpio rollback on adda dl/ul partial failure
Date: Fri, 28 Aug 2026 16:15:30 +0700
Message-ID: <20260828091532.600047-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021625_488388_ED6553E3 
X-CRM114-Status: UNSURE (   9.46  )
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

If the second mt8186_afe_gpio_select() call in adda_dl()/adda_ul() fails,
the first one's state is left applied, leaving CLK/DAT in an inconsistent
state. Roll back the first select on failure.

Also fix a copy-pasted "CLK ON" debug message that should say "CLK OFF"
in the _dl disable path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index aced8e7e920c..1cff2a63ef37 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -143,6 +143,7 @@ static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
 		if (ret) {
 			dev_dbg(dev, "%s(), MOSI DAT ON select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
 			return ret;
 		}
 	} else {
@@ -154,7 +155,8 @@ static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
 		if (ret) {
-			dev_dbg(dev, "%s(), MOSI CLK ON select fail!\n", __func__);
+			dev_dbg(dev, "%s(), MOSI CLK OFF select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
 			return ret;
 		}
 	}
@@ -176,6 +178,7 @@ static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
 		if (ret) {
 			dev_dbg(dev, "%s(), MISO DAT ON select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
 			return ret;
 		}
 	} else {
@@ -188,6 +191,7 @@ static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
 		if (ret) {
 			dev_dbg(dev, "%s(), MISO CLK OFF select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
 			return ret;
 		}
 	}
-- 
2.43.0


