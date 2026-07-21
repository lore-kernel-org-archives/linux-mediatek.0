Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7696C44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AG1aLLSk1A+OF1XRTr/NNeiulfMJPmRiCY4S1R09y4=; b=egUoCpnZpZ0Hu1HvHvxjMCZ8mi
	FeV9+lMstINaaDHj23FxqOddT8fEvHQzaPu3SVUL4ShS50wcIoFLRTgfUUBt4QZkIUYCYDMB4pteP
	qFbbKCT+Gd4d8AkVdx4c20epNUTjwqANfv++7kagPmiXzlSgcXY4NjnUkSEWixsA2FiZnhMD5xA5h
	cEBVMFQZXdKKv4elsg8WG83FNfcyDJGYvrEDs6YSzA+5qBDpzeFkZnDYHdTLARpLRJZAU1W1OtT4C
	VNF1loBc8pBLNx+dh7Un1PTeMBowt4XDyA03Y4oWPWC8bfurP0Rd2P4TLeERdxc1VweSLjAnmQwKk
	I28VAlQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7jb-00000009B6o-0JWy;
	Tue, 21 Jul 2026 10:29:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7jX-00000009B46-4B4h
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:29:57 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ce7d2adef4so111105895ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629795; x=1785234595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AG1aLLSk1A+OF1XRTr/NNeiulfMJPmRiCY4S1R09y4=;
        b=V3F54AM9EUfvRV7fH5e1TeFX2q7L4TX37cELE3tBJFb1yyD/FlYqnrAtnxzLfnm5U6
         7+gDKnvrhMQzXK22CaX2e8W/is+3IYR35t0rtHL8OvqitN0rmsxO7bcLqbt5DKZYGulX
         AKU5blenwhPh4brlnjCafcmvHNAeoHYAWD96tPGK5xCudsqKHQD8C6U9N68FW5YKkZIH
         6ekpSVk/gDGkk1pArnLbxgHTCw89RMWwfRUsx6BPUoK/LJ1zsxmz8s9go8YBpDVzFYby
         KKanwRfHqe7jmiysYwzRAlhQ70ZR/FAaatBHLu+p4w1zd72AAD/mHjhZhq2Arw/H+Y0p
         iJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629795; x=1785234595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/AG1aLLSk1A+OF1XRTr/NNeiulfMJPmRiCY4S1R09y4=;
        b=hWq/1KlSshlC4J0je+penywS1Ec8ztp1mzLFFet64TsW1nHaDHvqBo+8FVDedfoLeA
         6spLfd5/KptegqCaLtaL9a7QXcak2T0EkObBnj6TvIHirLc4fQLhfABtSbhjEV53PQ6k
         qsK7wqOIl6RNba8+AbBnVI6OxHeOvKEexXE7MpC9XX6LcItYaHZWd5JXjY40oDGaaCwe
         0EU1Wqrm676mSSuktdejacLRpkA/2byb6elJ8VQon3tzQ7kZNOGMhTEGmQ1Cpf/J/iZN
         hoglpFjEeqE3N5SpNzszFRzPpo9yNiNB7aDlogjmq6VH0IZS+3b3rUF3p8doe3hhHBRo
         lSqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8Ahirj0tSSO2oyQDJX9YiCKyNYinzu1lJWqZmMwg5WADI0H6PdF3SylBOqcjKINJgMPoX0d7iHq4b8yg/XQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPVHLGQSRHPQwxiog3Ox00xYa2KMh17PLSROM7Jlr1QUXLKmYd
	RVIUQ5m9xOoHCsmSZiHL8mXf5MFDW0bm9hSgt/Ov5x9FR9Hvf7MSSNjr
X-Gm-Gg: AR+sD12uzVQ8wea9gf9FvWNIsVWWuMEiPC0rAogKtgrDWmjtKydtBR6nOzbvFGefHG/
	+3187Y/PenZ/Lk2J/DbfgZlq5Gwq4E/k53YgA9vrpHv3B4C9BHJLrCr3uoRPeS3vxlEAaR0WvF9
	ix0RxtTt7RrX8NmmIAgbps2XTmEO+3EaO87dLSjayJ29lN4/X/hxISlBhBV7uH0sL9XY1kabGS4
	899Ut6FxpXohEYvbwuA7FeYBhEqALpH5N+pFJASVqWSajy/h4V1op78FHR9O1eXzKvcp74C6Dun
	cXEg5n7Qe1bgwDsDldAz2A5BTrBCw6JQugYKzIu1YdKRnHC5yu14VimpKcBKEee6NKiTVU8em+e
	KiVYYVjzYK8OQyrkA9NORly6pWh5cPY6CH1dqmeZT1O8PZ+R6DsNCg/PUxl8pfwLibPP1DfPIAG
	41ebVTceaFQYGUPEY6y40CSexN2zFx6cD6jXd0
X-Received: by 2002:a17:903:2f8c:b0:2c0:b6c7:2271 with SMTP id d9443c01a7336-2cf348047e3mr198541925ad.4.1784629795303;
        Tue, 21 Jul 2026 03:29:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:29:55 -0700 (PDT)
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
Subject: [PATCH v4 27/29] ASoC: codecs: rt721-sdca-sdw: Simplify regcache error handling in resume
Date: Tue, 21 Jul 2026 17:25:58 +0700
Message-ID: <20260721102600.523199-28-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032956_080896_8D1C30D4 
X-CRM114-Status: GOOD (  11.29  )
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

Calling regcache_mark_dirty() on error is redundant as regcache_sync()
retains dirty state on failure, and any write in cache_only mode marks
the cache dirty anyway.
Restore cache_only directly on error for active regmaps and drop the
redundant regcache_mark_dirty() calls. This also removes goto labels
to prepare for guard cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt721-sdca-sdw.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 6e27e761afb6..6411df4eede7 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -511,22 +511,20 @@ static int rt721_sdca_dev_resume(struct device *dev)
 
 	regcache_cache_only(rt721->regmap, false);
 	ret = regcache_sync(rt721->regmap);
-	if (ret)
-		goto err_sync;
+	if (ret) {
+		regcache_cache_only(rt721->regmap, true);
+		return ret;
+	}
 
 	regcache_cache_only(rt721->mbq_regmap, false);
 	ret = regcache_sync(rt721->mbq_regmap);
-	if (ret)
-		goto err_sync;
+	if (ret) {
+		regcache_cache_only(rt721->mbq_regmap, true);
+		regcache_cache_only(rt721->regmap, true);
+		return ret;
+	}
 
 	return 0;
-
-err_sync:
-	regcache_cache_only(rt721->regmap, true);
-	regcache_cache_only(rt721->mbq_regmap, true);
-	regcache_mark_dirty(rt721->regmap);
-	regcache_mark_dirty(rt721->mbq_regmap);
-	return ret;
 }
 
 static const struct dev_pm_ops rt721_sdca_pm = {
-- 
2.43.0


