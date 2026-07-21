Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CFAC4452D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=; b=zIinrw020Bi4RpLpnjmzQXNcwM
	vYvTrHbRiDrkEiLeHlqszV824ee+OrczX9kp1AT8z/tgzlu4Md2UjcSCyoMvVdMy5adq+uem+we0q
	NZ+qjqsNDDN3jE0XZSByI+uclOLWlLsxQ0zUbdxbZLguBJyaZj7a+MAnRHCB/Qy25c1lxZTI1yokB
	0kwFFkhhI4QVEZ7tiZq11f4MBal3x7BBJlb4gGmq3/cSv5sx6AiyDHRnPJNlbw7sxM/i/aqMaKuur
	1GlOakCC8+e376gmChwnhC4es1OilVmv80dIyl1TNgR42xVeAIzNx5IfpMi8jo41KlwDBp47x/hMX
	U0XVMdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hR-000000098v9-0ojm;
	Tue, 21 Jul 2026 10:27:45 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hM-000000098o1-34Sd
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:27:41 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cf27856f9cso56695485ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629660; x=1785234460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=s6UzVD35lUkCoMrpwi6N1PjB15bqA6iJlVAx3kHPGNDBzSDV6GNAnxeqThrEkHLgF8
         bCBBYVFlo+sZ/gY2gRsY9B+71h9iJ7JPzR+HGjo29eKqMyaY7H1zq51g2emasvskTYtu
         xh0V+rghmmUgrDyquCyPQxMaGGoA7mn3klwM1+oTBL9aiUN+Jy2TpA/ICM4B8qMoWe/t
         PhmPklH12Ue4EltALMADJO0kBXKS3Qv+n0bXSNVpHRJR3Jbljdgeya0Q0QARbk/0xHBF
         P1Paru7mbNIeypZU/a+T2Dtrtl5VRC23kDyKYqawdgUKBZ4gSMJSg8wN2xIxTreCpufX
         OXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629660; x=1785234460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=enp3FPLBItUzWXFqqDLQGqePcgpoSLfUEEdZc8Pi3Q8ctaNlaEts+Fbpxp8IkLPJOt
         zLW3gVA0onOJ8vYpb9lnhEnPLoosh85PyLBVUYiWM9kosnGTZXJFjq01xvjzteJLCfKs
         oEhHDmuki7nyefLQXDOCkfJRGtHqjYWzphZvQqOF+H4k0yNNGvw7/rA6aooBuWJwx+x2
         0lIPIm93tOyBtpzE7Ygbcxc6TnINRl0P2TSJmeXL8IhXZ9py+j3Ihv592Rb+JGDnzSxd
         tBlFSfXPumD25HURLz8fYBoRz7vZeCyKvgl2g+mH9CEbLHerWDtVcA1lCjRobuW1qPAf
         fckA==
X-Forwarded-Encrypted: i=1; AHgh+RrQlfqbhRg/2jGkj/Qv0F/3H1DHYZNEZPvA1z8TajSqEctIsuNh6FOKEdfhQn29vU7jfa4jAxub2KN1RBxiGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYMGNQPG5hvm1EHCewgQnDYptQGwuuMlytDIxQyfWf/LJ0wkP5
	R4ewHxA8gMk6FYuUKmxASkyGixitw9zu//Yd5TuxJQ/+OibWi63UOCON
X-Gm-Gg: AR+sD13xJ7rW+N97Yh112AZJywiogMJzdJSDcI0YRfqgzrVlHO/h4DSbrFoKlUJ3Ztl
	17SInk3uR2OdKUoSZCJVuAh9sybquW78sT3j5KSRb5DtrPU7qeAuVfiYzRr5K1rSPE1iKCVkITw
	fmn2HWKfLbKtQ0SHZAl7dbuVlyIu7K2AJlOo4/FMCMB3AmKcx/JkXVh6dqFO6LeIHYLoHLTwWxT
	lZw3FJJI2YXpijeVPQXO+eXhz20AyM5Cc+UfuSe7Z066u0GoundUWiicEiiQZi5wqhPxTfAYYvN
	qpIbMv84yvQWe0P9UQ99NHYzsPh10CbwE6anSFetswzGtru686exUtdxR4k3cpiMmS66gZPMtCA
	bWLgd/IZAFacj2L1pJ2Bq61peh+P9nNXNHcm4CSnequVcaBM5BC5EirrZMPgW9pCM7cwgK2c7Pb
	411aVrlkmMB8rdEg9qGwHQn3YmlfP4ZvxqLcos
X-Received: by 2002:a17:902:e5c8:b0:2c9:e261:95ce with SMTP id d9443c01a7336-2cf3494967emr195445995ad.30.1784629660063;
        Tue, 21 Jul 2026 03:27:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:39 -0700 (PDT)
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
Subject: [PATCH v4 10/29] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:41 +0700
Message-ID: <20260721102600.523199-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032740_794859_68706455 
X-CRM114-Status: GOOD (  10.74  )
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
 sound/soc/codecs/lpass-macro-common.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index 6e3b8d0897dd..7e59616ed7bc 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2022, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -71,21 +72,16 @@ EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
 
 void lpass_macro_set_codec_version(enum lpass_codec_version version)
 {
-	mutex_lock(&lpass_codec_mutex);
+	guard(mutex)(&lpass_codec_mutex);
 	lpass_codec_version = version;
-	mutex_unlock(&lpass_codec_mutex);
 }
 EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
 
 enum lpass_codec_version lpass_macro_get_codec_version(void)
 {
-	enum lpass_codec_version ver;
+	guard(mutex)(&lpass_codec_mutex);
 
-	mutex_lock(&lpass_codec_mutex);
-	ver = lpass_codec_version;
-	mutex_unlock(&lpass_codec_mutex);
-
-	return ver;
+	return lpass_codec_version;
 }
 EXPORT_SYMBOL_GPL(lpass_macro_get_codec_version);
 
-- 
2.43.0


