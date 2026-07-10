Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3ECC44506
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 05:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=; b=IKLAyAoD5h4ktSDzzjlskPB+9F
	qvCphCI5rCBPB0saSWJaEteeG43sc2qgvA7u2WqCf1ZawZXmsY+686XYQQkXZvaKRFaNsddwEnUlS
	yioLl8egiyVhm0CgwdfH0dwZymIfvVs8tjeKC6MzzroN0oLrLzNnROyh2vIzii5XPxGEmxbXgyboZ
	27eB8rilC9FgjmwJwQMDgY1BzB3OQAxAX83caZj0FRuu5iz6XQm9N7jaFg+izUlnnwEPaRH91DBEr
	d+L4a9pciroT1GjGNpDeosHYAT+/Z6DtJNpoefWB3VWJfO6De4VUq3xaatjVW1uCEFHjHQvs1l/D5
	WxU8Xh8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3RZ-000000048Qd-0y1s;
	Fri, 10 Jul 2026 05:06:33 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3RX-000000048Og-1EYr
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 05:06:32 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so481836b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 22:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659991; x=1784264791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=i/MK+VPMKhE8JZJJJKZQUjAbROnGYBTaY922ig3Mevd7i9oOODWzmonXYhaQoe0yQZ
         wCq2IQX/RcdV3WSmAGnNyPrRe2IYqTN+v8QmIIOKU0jUflDhsfSEzivpr60lNMdI5vRc
         Moba/JBibvPWas7yNoWaenzM6gTiuY/7UtE6EUBQrcAYkfHWmbJS8zBc/xqUwaOEu7UT
         2PX0UdQgSq8qOluCGbtjcEgCtK+RTBjJmGv1wmXOAu9UefTScrGWowy5sG+HXmM/pvBW
         Po+kA+zVGsywSJmeFp9jYMdeZSHPDTNjjqorJBnziLhGwYO5zRMud9jBu/7TvUZg+lLJ
         Qjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659991; x=1784264791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=eYVguMNpwJQxM9i4eFhZ+zhfREjDXeexmWVXa33mELmhN+H4vgJERWbgsL/G54CS6T
         vUMyxRGydAHohEA1jjyzAbrnDWaSwXMuOgsqJMHQw70LmRchyYoNuOqP8eBw2iiSC0BZ
         kv3PMZTbxO47nkHDTX7QXom41eslDqbCemRYzG7pBG6ShzHbi/+h+YiZ0KYtYWPpggll
         hg7UCB19R++zyrtp3ccY7Dka2xQbYQdomZCE4XVY2d7I/1JBrJSjfVN8DxJr6q29XcYg
         lFxyL6oVFGFmIvXETNvkvNp9qkgXrHXcMTJ+TvNa0Dm92EaE8zbjhFzjXN60rj8HABjR
         88tA==
X-Forwarded-Encrypted: i=1; AHgh+RrISg28KqfCqHwCM6oFt9MSvTpqqyXWZQ7IQCJWoICycnY96Q0boVSAr7IMLZAeudlUDeDy6/rPEWkFb3CwIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6CjZUkd2mfJ4ZndalS7KrEfMQCP0HiO1y9HGgSoj8LdGcLEZr
	MD+4CaX+lDuJrdfPm0LKPhHLcWd5rmfjHhVWO6sBZTRbjp/TN5/Zbxt+
X-Gm-Gg: AfdE7cl5lCiMrPunjd6/sbdy4xo7Clst0LHViUhCo5zIK9QqsXmVQTc9kzp7YS7d7bm
	35GiWC+roBrrn2FQilzFK0tTWMF444qK2BE7SA8aRKxxxOQnTIiMkyxZB5pCzryZnQkU4JMMtnB
	d6h8bFoM74DW6JjzWXpX4IPW0qLiXhftsyB0PmXfT8uXDaqg3AP1hSuLNn+N5Ig84QoiC5BbuWG
	eomBlYI/ru9qQjkGOQb7FEWQBU0ny9BFsQIenqVDs1mBmiduAB9hxoLsuYG8+1kUrGNmXLA5VIu
	BlNQPsRH3p8WmTls0dGEPEUhLDONkrqur27TcBzLpo36ckOPZRzSXyi5aGUad1T95ZqxUQDqtYy
	DOdEnDU6MiOFY/m8QWY+iBSdJbn5CfqjyQ6gvhxccAZdIKwjvaC0CZosQrv2NOR7AO+bLDZAz9a
	VRfVBJbOrDj+TCTVDBvbukJ2DJNqNVPoPVQh6CbSBjeH2fqJk=
X-Received: by 2002:a05:6a00:3923:b0:848:7b92:8e79 with SMTP id d2e1a72fcca58-8487b929051mr502475b3a.67.1783659990526;
        Thu, 09 Jul 2026 22:06:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:30 -0700 (PDT)
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
Subject: [PATCH v3 10/27] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:54 +0700
Message-ID: <20260710050511.14439-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220631_330659_EACC3A7D 
X-CRM114-Status: GOOD (  10.68  )
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


