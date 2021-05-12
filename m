Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5407FC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:17:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC2996198E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC2996198E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aPHQ7VwVwLYQ/7zjAOTEzrLe5Giuk5/n6u4hIPZxrFE=; b=EDgPkKTj0nLVl0Y1V0nrEEf5i
	L9IUOggBk7RBx1DNnnm4Dl/LKFVjF6zgs3Qtm3jSyODV8Pjl+A+0AVijz+rf9ezXk+IaK8zF8Kul+
	hhh0AD7k1KN7tOGZoq9LRa58GMgHIjvZ7Ppm/3jsBnEKA75cKAXQiTy+BLzU0DfD/s7QIM1tvbolE
	dNbmywKyHT85N+WuIAarsYHsUNiyR0h73IsK1mBuDfNLfdS9517q+h0QHx5d941WPRMgciLiMs8Yj
	M87aOTNa3sbEHp1u5+Z02IXiScoMCO5sClhKFvrc1UgvSOCrNWsA4cgoyPvf5l6XFzWVnuwnDfTik
	Eo4Wowdug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgqbx-0039HD-T0; Wed, 12 May 2021 15:17:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqbD-00396c-M6
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 15:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=KDuP19RIvFr3oYQnO2ffHmKNK3OSRhOK3RHFKslMECA=; b=XemQTczWrviQ04enSnakeWXXjK
 7VYMzpjqo37CiLdbD2Gp7YI9/HQtVLyQ2FOMFyVs/3mGLteU8S8+rRy1KqxRKXt9Ns0lKDshe8Q+t
 Y1QjTKSJq6xQDY56U8kft5K2PENe5iR7oH+FxkUj8mUAmPcMXTY/Dj/doxE1p7BWo2M1w4vBQ7KjR
 sJvIJcpdEK4r9iHH0c7nPn3R1MZKKeBr16MTSXwAneaOUMDIWiekLAv45yFHgSREtulwtkhvJdc1Y
 1hr7adhuEzxutwz2IlnKEFfcKoGf+tscv5ZdXI9g+MPKPqu9zEnAj108oLDsfAn0tBQenxTApNCNO
 qamumScw==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqb8-00AVAa-BQ
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 15:16:34 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 82-20020a1c01550000b0290142562ff7c9so3237208wmb.3
 for <linux-mediatek@lists.infradead.org>; Wed, 12 May 2021 08:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KDuP19RIvFr3oYQnO2ffHmKNK3OSRhOK3RHFKslMECA=;
 b=AHsi9QcSyHxTvetudNhwrxkqTejvmZjBagws09KH8tllOy1N/4NiMyr/HaBReldoV8
 qeqBlAgDvFPkuTC+vOQ/VAN6vK/o4EYg3TNZEgHHvS3POxYlRYvtIfx4OVwjzT88jhcL
 T6DfkDjXNEz0lnH1cFFBdv8szeZAXGz7ArX3EAyCeM1Vu7k0uhkJ3j/Lcp1iN0ykjgbV
 9pqPwNrU9Lm88JgI76C5qZeCP96z7xRH7XJyNetHGc2bdRBOh3yEy0BX1SNTS53UoD8w
 f4yd89zJGGdA15NY/0Gr+hK0SOwB1Sxh4cVtAbfEguquCCBM0B8YenRrNCrDEisM8h2P
 jY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDuP19RIvFr3oYQnO2ffHmKNK3OSRhOK3RHFKslMECA=;
 b=KOjQXeDGv99v7yE2JneU9pV1tz2cbUCu0nVJqCPeMXZ+qesWKZCxSu4w292KddvrAv
 ELq4cm3V/qzJvXXeV9u2OembPKdNZVXiRXaTjmuFUOvdLCQtJIxvunmiOdoRmhr6bPjt
 GFX5wFtW7Fg+/AegQKRU3Iwtm0jQYQ8tF5PsiYSEAPijeK8lpANQWZrwSic/zoF6Krtk
 WnVfD/lvsiPOO3KiDfA8igHmgzeuNAdacANB0k4ofDtfqiE8UsnIUZNB+fBe9ym63Mfg
 DJiwhBRk8WjXwPeZvEHrsmpuxauB3nOyL3qYBitMNxRccdP58LXtcbdZq72LhasAADhP
 xgeA==
X-Gm-Message-State: AOAM533mMKZI9nJl5g6spnGNWENfNcZguzQzDL+0qjpWCaO5tkepm/KN
 O/DfpxOfnrAwmfpA5ELHJ+jsaw==
X-Google-Smtp-Source: ABdhPJxkxuJGKpTC4HM24aBYSK3735xOUkAIGYxX68Mo3N9Oxk8oAVWYkmP52aGsOEU5pJ5UUbQhpg==
X-Received: by 2002:a05:600c:1994:: with SMTP id
 t20mr39311918wmq.177.1620832586988; 
 Wed, 12 May 2021 08:16:26 -0700 (PDT)
Received: from mkorpershoek-XPS-13-9370.home
 (lfbn-tou-1-1465-169.w90-89.abo.wanadoo.fr. [90.89.34.169])
 by smtp.gmail.com with ESMTPSA id c15sm30095011wrr.3.2021.05.12.08.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 08:16:26 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v2 1/3] mfd: mt6397: add mt6358 register definitions for power
 key
Date: Wed, 12 May 2021 17:16:12 +0200
Message-Id: <20210512151614.36996-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512151614.36996-1-mkorpershoek@baylibre.com>
References: <20210512151614.36996-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_081630_396687_6070418D 
X-CRM114-Status: UNSURE (   9.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

To support power/home key detection, add definitions for
two more MT6358 PMIC registers:

- TOPSTATUS: homekey and powerkey debounce status
- TOP_RST_MISC: controls homekey,powerkey long press reset time

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 include/linux/mfd/mt6358/registers.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mfd/mt6358/registers.h b/include/linux/mfd/mt6358/registers.h
index 2ad0b312aa28..201139b12140 100644
--- a/include/linux/mfd/mt6358/registers.h
+++ b/include/linux/mfd/mt6358/registers.h
@@ -8,6 +8,8 @@
 
 /* PMIC Registers */
 #define MT6358_SWCID                          0xa
+#define MT6358_TOPSTATUS                      0x28
+#define MT6358_TOP_RST_MISC                   0x14c
 #define MT6358_MISC_TOP_INT_CON0              0x188
 #define MT6358_MISC_TOP_INT_STATUS0           0x194
 #define MT6358_TOP_INT_STATUS0                0x19e
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
