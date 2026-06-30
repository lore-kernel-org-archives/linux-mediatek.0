Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B475EC43602
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=; b=Vqp4srKU8VBOE0xr4PWlxL5lw1
	g0wvkoBNU8NOq4DhBng0hTfIDsDHK+Uyz7QtNUfdXYaT3LvT0dbkgObCQflRjOqN+s6CQbbG5cEmC
	DuYlIUhr2brrpsl3V/SNypRXr4t6WXO4F7oOi58nUpSc0k68GxkPrl2oj5EL6pgQ0MHBvzNBg0tZk
	UHwDJ0xF6nCfja7PW8lD7PjG03SOfyDGRIjJWNRV85vgG9x/goQXr3hQWbEBaoqJUZ3/7jWSLEd22
	wGSZy0JFbJuzYMGgsf8eCLzpi/6WPYXtG0YGD79LdPOIaQj81caRA4EllTKxGAtk1sraj54+uTiie
	QQrTEVnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5T-0000000FyrH-3sk5;
	Tue, 30 Jun 2026 06:36:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5S-0000000Fypc-3dD4
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=; b=afE8JDjerDXAp5VEe5hDsJzTf2
	5ysF5vHTRHjM/lYgLM1qgmpPFzGHx+nVtLeGBmyz9ZG4EfsH4ghxxC5fkhLZMLR/smAdI3Rc+33Zr
	rRxdF3ezfKxyLADdhCC3DK9HNyI2ANB8DcW08v6VRewplZkJ1yfkbeFjEBGcVKGpaeLRlsE7x1oFn
	uE8klOTb5Mp4YhosSQ3fTW8BysAJoTJmVBu5qgQTZV8wa4noFQNjrEZjykxtCGwbj+IfyBKNawXmK
	JUcYgJLKRg6A18OqkG4KB7S5IdBbNnc1Bq1UL86wk4I4ZlqbfXUoyS0ZU7duC3E2Cuoh7roGbBZ/e
	wdQsdlkA==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS5N-00000001ZFb-1arx
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:36:48 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c88d1d4543fso116117a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801402; x=1783406202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=M8fmsJyAB9YEhysYZck88ECClljBIZBzAR8PJiepCMvw9WqqnKsn/wR0sI18o1kuTW
         95EJQhkVVf64gTYluJXxccfjQZrH/bZrW4sAamIVI/WpmYkebwtXIYKSc4MBEXgNkfNn
         DVAq7NUUmtAPi7osdoinZngQyFEeFHkqChTcqdHTrqkoCt2qhIdxD1nFNfo0WDGIzFry
         4YbRS3xI5yJ04cVTDbhEKvJltfJkhlBMwm3pXmGk3z4ugwRTXU5o/WwVcz40SsZgrAij
         wxoC/fJHRwxhcbFf+HU1tJ+auJTm1mExq/L/sGK6cQLw1392TEsocQs+XgPwX0cgJJE0
         U/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801402; x=1783406202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=X76TnHvmcJI6bKleCJGdaBX4gqd9UjVoT25p7/zs1CI2dt4ZOUc1khLEPWAES0TBiX
         6qC60WsH8MJJj8FX//GP9psrnnm77oj+QOD8SP5MKsqBHagtrMCWmfC/JCluHzK6OsbA
         ZPJt23A0XTlBhHEv74F1KE73PvU7Eguybrfi1YSiWzDMdYG18mxGOP8DlhbvASdAJxmI
         ANkGwRiyrwGrqdumdGj63BA5znR1j/vrEjjhOQpGuPyIvzDMQk3ldztUmle7+eF4TAca
         6XCYuqI2YlXi9y1iJYW6K1sD0kDy/7MagY7VsirPDMLuPiXt+1g6C4KqfPl0jbJdb9zI
         /jRw==
X-Forwarded-Encrypted: i=1; AFNElJ8RSnwPDRqCJQKshjAaSU1pNRTo6VDIHhmyMv06LADg03WThjYubNwdKhPtfQtHGNBDWlSvk6uaiASyI/RVHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCk0k6RtCF68JuftB5az0VG9T2BIhEDFJBrYehGCbDQSRatmU+
	9xCx5EDkl+iNnCoFpfMzGEKUTDOlqrdWSrJO/8bP7a1vvDfv0zux/Mff
X-Gm-Gg: AfdE7cnI8CcssJa26JLqaJhytLfH0xCGPyEFaybvGLLkT3UL72BYcTwQHjac612jjN3
	0JVMogNrwozh3RaboBBRK9ZNRxZzVOULTuwjpUN8uga8ifcFm0dxu1ShGaSnlCOBg/7kvkZm6vU
	I7KlqveM+XnPQzsMSuUlvKhMzMKiUf06TYkHrcqpSP8zKF+bvS3ZhN32m9YfF0vW9bgIZWYxLtX
	+gnm49yi/utYGtB0Lq/Hs1vMume9tvRX3+01PGpY7feMESH2F7PnCco6cbZUUT6DXrszI4I2HFV
	ql5y05zLKmDOT3eRrQXRgVH/v6r5LYikF4nqvA3NUJNzA0d8vJ81pAH4TVm73eM1lPcFRiZUvNe
	Xb9ZDr+oYCuyA8/hNTt6XhAPBoinpGjsJiJ5HfWjMJaQXub2dGygGBcj471KVLIapzX5LsKBMN+
	q6sqNrZHJPi+vz3NG/iGblsLKfYvmMpq3a3XFFvlDLiqWFigo=
X-Received: by 2002:a05:6a21:4596:b0:3bf:aa29:1612 with SMTP id adf61e73a8af0-3bfd28b243dmr447077637.28.1782801402645;
        Mon, 29 Jun 2026 23:36:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:36:42 -0700 (PDT)
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
Subject: [PATCH 10/27] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:32 +0700
Message-ID: <20260630063449.503996-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073646_644013_4BA15C5B 
X-CRM114-Status: GOOD (  10.73  )
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


