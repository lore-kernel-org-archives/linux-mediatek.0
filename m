Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87F3CD98ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 11:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJMU7K56og6O0Mgof55SgHjMcgC38/i5g3OlSm/yHKg=; b=eEsCjA43j3kEP03B0xmz4tUk0J
	vHbFc16ObATivawXciihFx7dE47lBVe4jn29qPe8YWYCGS1hRn0z/71dD+wnS2C2x/PahFtw1ycgl
	xNpUpgfHTO0JHABjhJ70pW8m+AYAkXkJQ9BCexeHVAhb8WEr6NzCu5tRS3oDPdzGt17CY0+y5npdW
	F1y8feh1oTQCnucqcEWkra//ge9YsqcDNJW2aO7UCeJCXtVfOXOUN8i3JDjrJ+YUlL9VbwALQjzSx
	68nOCR33kVf16ntplLovJAevxjmLvCb+dWdzLWKSJzy6eRf78gtK1mLMv/2thVDuRjh5vvcpNe1a8
	Ch1IxJQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAep-00000001AtC-3JZJ;
	Thu, 18 Jun 2026 11:11:39 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAen-00000001Arm-3T3l
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 11:11:39 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2c6c101aeafso5248335ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781097; x=1782385897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJMU7K56og6O0Mgof55SgHjMcgC38/i5g3OlSm/yHKg=;
        b=YSTDvJnl3tAcivYdBMHxCbgQ3hKnCx/e3+noGdlgUXWpY6CVwx2c8CHifvx6cl6GGQ
         YQjLxYeDb+ZMODzMAa20E9K14lP5kKKscOitMlF9lbwH2zeqsALGI/evdBmhQg/lxtAn
         5Ddw7fdSk6YX8tdd1lj+WTcUscGo85MFKWyYz7F+3NJNK735vQvUvUqAgA8XvXjRYbVR
         ykoCpX1YeG88raD6uO/klfl8AyHsG6Pw1HS76Uj2CJpjoPNLdErwweUPgXB54FGouD1m
         7ai/Ym7Nij0SBldOdAwi6PTpX3YucH6mVoDYcbido11/um8qhIyBMBS2hkRstXrlIK5v
         1POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781097; x=1782385897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FJMU7K56og6O0Mgof55SgHjMcgC38/i5g3OlSm/yHKg=;
        b=eKsTBP3iYRSF6KRdcprSI3spPLMiuO5Iet5TJaidKpr7yNVgTxjoWJE5S7I1ZRZnrN
         HtDWJ7Sk1FliJ508TjIn6XioCeHUZdtIEn0FJZr14/j4q9hENwA5nxQpz0pMd2n5CBrP
         oQ/aK5pjGgcjiBgTHBSrEdPMn0oK4/ce2ysGzdjPecS0Zhb176Ext9JviqNNTkpyZgYS
         EpQz0g228ttoZ9vvP4Vj6iLK6qtUF0tVe4WIezpqr90Qs6QazZ1AKTta6Q3s3tnMLXby
         KRkVv3EE82dkCXQauxCSjV3VjmdW6dtUQOvmN6Gni0hej/O7jajR1chn0yWmntDmHH/J
         X+HQ==
X-Forwarded-Encrypted: i=1; AFNElJ/dnEWA2YPhPq47rlmgIMoXRT8yvhvw7V9uHO2l64auNRO5E/jPzTphlkYIkgaXSsqZkwxlV0iGmEoBukMs2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdZYB0IyBrjLJfmgq2ALY06IgikBZny9k99T90dgBN4Lw0FGo0
	3uSiZVD7NqsRGkcGJbvGfgcUVjqnK1a5z7qevEsxqTbhEe8NpwG65GrH
X-Gm-Gg: AfdE7ckBCzTxCq+wG/XN+YJXlbIB85flJGBkclEwIG+o8SK2TeC235mSdi7t5pBS8wu
	8kiyGzpUL+LCeTXcPc733pvmeQzp27j3yoOjOI+ANof14cpv9QwQBZfkGYavqBKJa4IX0lcsJe9
	kSeEXUmo2sUVbh3E/x+erTpfhCtylchEom+AS3R6QYzTdF+t62c0PsxNwSFfMUPtdyii0ekvM69
	Ro12JBQkN0lH1Gw/CIwWgpGI6ZvL+9g0AXSNeLXL9uZ20/R0aVPICAVA7uvu7jndXQtqgA5BSEm
	FzuCj4JVVgMvBMIZ3vhFgmK7pK6DU/PNAbDrVpgDLQQTVivXEn35LrgNBz7reXUhTqGtv1diblf
	UHvSWOiQtxlv1X+Nmoor3AH0LSVkKX36qVb+lcLrDOh3loA81TvDDW2W1UMxFiVAEuzt2ugi5J7
	LLVa7eLmTTX+xFJQqfDoeHhPKSue3uGQMT/iRykiJIS1rg+gE=
X-Received: by 2002:a17:902:d546:b0:2c0:cb90:1e08 with SMTP id d9443c01a7336-2c6e2472467mr40617785ad.0.1781781096866;
        Thu, 18 Jun 2026 04:11:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 76/78] ASoC: codecs: wm971x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:25 +0700
Message-ID: <20260618110827.232983-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041137_906678_0B6C53D9 
X-CRM114-Status: UNSURE (   9.90  )
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm9712.c | 4 +---
 sound/soc/codecs/wm9713.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index 83cd42fa0c28..68ebf9d23865 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -229,7 +229,7 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = 1 << shift;
 
-	mutex_lock(&wm9712->lock);
+	guard(mutex)(&wm9712->lock);
 	old = wm9712->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9712->hp_mixer[mixer] |= mask;
@@ -251,8 +251,6 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9712->lock);
-
 	return change;
 }
 
diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index b3bbecf074ee..d338b9a915d7 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -238,7 +238,7 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = (1 << shift);
 
-	mutex_lock(&wm9713->lock);
+	guard(mutex)(&wm9713->lock);
 	old = wm9713->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9713->hp_mixer[mixer] |= mask;
@@ -260,8 +260,6 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9713->lock);
-
 	return change;
 }
 
-- 
2.43.0


