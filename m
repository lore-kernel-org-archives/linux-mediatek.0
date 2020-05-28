Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50D0C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 15:46:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B2242089D
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 15:46:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MGqjadcc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="Lz/Ir6YY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B2242089D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUIRZYugLEUSufBW4JBfa3mo6DKn5lACoYSIg7m1uSo=; b=MGqjadcc7kkH4y
	2PTKkW82W3tF1yz+bPnllmKQP6nSNMDBsCtDAIC5E2WoSxPog2Mc7l3Q/u4PUoJaJxuUkcBD2QAtr
	T6lJrTjbv6XRhFe4QqVxjAUwEbMa0hB67Dk7O1RgwboEm1kmgGbuwZ9+5yzOctBX2E6OpKrdy2bAT
	wyaG8AXXY70u1Q4pRjRmsju6u3QrhWv81DdIQg1ES5glVOpPQITa1vvHDGbl6j492SaqpBtIhMU56
	GS+uEsnj9mlFfD/L2xKUxHqqWbLGeSvVwfjWMlFCJc/xQf/YnvsqFQMMsVx5Ic3Pqjt2l3jUuEGTl
	IJai58x97mbX33WNdSEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeKjH-0003Xm-1h; Thu, 28 May 2020 15:45:59 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeKiT-0001hv-W5
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 15:45:15 +0000
Received: by mail-wr1-x444.google.com with SMTP id x13so13784480wrv.4
 for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2020 08:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bqViQ9O7yTT1lgzVQrGPraM7Z4Hz1E/DmaF8sGIg+iU=;
 b=Lz/Ir6YYZ1FaaBpnkUI+cMYlywvXzGXow6KMrv4fZdA7/bgI4AbB23N78iA7MFyp2p
 LvnyLynD7rqEMo0nz3JXHbUIf4JazglS82LMO7DvDpJz/fVU1TcVgS09Dup9yOmn5wVS
 KL5+ITKGh5QNC2uugt7BU6Efi/LHQXySdc7wLKdh+Pr3d4FAZLegm0DE9oBVR77mo1y0
 FAk0imstc1fNze/qzrVYEYKGVF7+SzYP2hXp+8GYMvhtNAK8FdjCA+ocmiHyukxsKLmR
 fdPTO09bYF9gqF+Vi7AomscvgvmjVD+/Glq0pkKK4n4azHfefXrjzrah3Ije8A9aOINv
 h4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bqViQ9O7yTT1lgzVQrGPraM7Z4Hz1E/DmaF8sGIg+iU=;
 b=haDa3po3yJj3ysBEztxAxEgmKQw1/L6GsNeR3mf69A3birq9wiYeWmfIKFRoRrNj5c
 Y9/njXbuK/cPPQDl+qIx1DaM6w8/k1IxBqS7Rsp2zmeARNI6Fp6ikSvkG2iQujm4s0yy
 Aq0a+UeEx2yJ196Hc1wzejRWp4G4JYBSbSqletf+VH+B4t3IKLkPl3teUB5lQCi5lvxV
 OT4zwZzitCPb8AU6/yIp6BbgLsmkHsXmmfTzZ2HarqbBNZTFlB3KYbyfyzJHDaVGTJvO
 W9TN379b/y0ePpcQK25xgSyvzvFKV5sIoj7d/mwtUeFP/VHYqHOCar/vab61jW357HZx
 lGcg==
X-Gm-Message-State: AOAM532SvGJTKhvgAoT2iIR9Pkk6jB+a3U17iD49bCJ72Z87aLMfgact
 qugKBv/DnYrNOXFWvg9hQGn1sA==
X-Google-Smtp-Source: ABdhPJxZ3c9apdw8jBteGu0AEMQp/RpPJsqo4qBOi5jFydJGbre3onqrr8gehfrvNztP9kivt1/xOA==
X-Received: by 2002:adf:e3c4:: with SMTP id k4mr4076613wrm.262.1590680708560; 
 Thu, 28 May 2020 08:45:08 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id n1sm6285650wrp.10.2020.05.28.08.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 08:45:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 1/2] regmap: provide helpers for simple bit operations
Date: Thu, 28 May 2020 17:45:02 +0200
Message-Id: <20200528154503.26304-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200528154503.26304-1-brgl@bgdev.pl>
References: <20200528154503.26304-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_084510_082071_AE285803 
X-CRM114-Status: GOOD (  12.45  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

In many instances regmap_update_bits() is used for simple bit setting
and clearing. In these cases the last argument is redundant and we can
hide it with a static inline function.

This adds three new helpers for simple bit operations: set_bits,
clear_bits and test_bits (the last one defined as a regular function).

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/base/regmap/regmap.c | 22 ++++++++++++++++++++++
 include/linux/regmap.h       | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 59f911e57719..4ad5c5adc0a3 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -2936,6 +2936,28 @@ int regmap_update_bits_base(struct regmap *map, unsigned int reg,
 }
 EXPORT_SYMBOL_GPL(regmap_update_bits_base);
 
+/**
+ * regmap_test_bits() - Check if all specified bits are set in a register.
+ *
+ * @map: Register map to operate on
+ * @reg: Register to read from
+ * @bits: Bits to test
+ *
+ * Returns -1 if the underlying regmap_read() fails, 0 if at least one of the
+ * tested bits is not set and 1 if all tested bits are set.
+ */
+int regmap_test_bits(struct regmap *map, unsigned int reg, unsigned int bits)
+{
+	unsigned int val, ret;
+
+	ret = regmap_read(map, reg, &val);
+	if (ret)
+		return ret;
+
+	return (val & bits) == bits;
+}
+EXPORT_SYMBOL_GPL(regmap_test_bits);
+
 void regmap_async_complete_cb(struct regmap_async *async, int ret)
 {
 	struct regmap *map = async->map;
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 40b07168fd8e..ddf0baff195d 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1111,6 +1111,21 @@ bool regmap_reg_in_ranges(unsigned int reg,
 			  const struct regmap_range *ranges,
 			  unsigned int nranges);
 
+static inline int regmap_set_bits(struct regmap *map,
+				  unsigned int reg, unsigned int bits)
+{
+	return regmap_update_bits_base(map, reg, bits, bits,
+				       NULL, false, false);
+}
+
+static inline int regmap_clear_bits(struct regmap *map,
+				    unsigned int reg, unsigned int bits)
+{
+	return regmap_update_bits_base(map, reg, bits, 0, NULL, false, false);
+}
+
+int regmap_test_bits(struct regmap *map, unsigned int reg, unsigned int bits);
+
 /**
  * struct reg_field - Description of an register field
  *
@@ -1410,6 +1425,27 @@ static inline int regmap_update_bits_base(struct regmap *map, unsigned int reg,
 	return -EINVAL;
 }
 
+static inline int regmap_set_bits(struct regmap *map,
+				  unsigned int reg, unsigned int bits)
+{
+	WARN_ONCE(1, "regmap API is disabled");
+	return -EINVAL;
+}
+
+static inline int regmap_clear_bits(struct regmap *map,
+				    unsigned int reg, unsigned int bits)
+{
+	WARN_ONCE(1, "regmap API is disabled");
+	return -EINVAL;
+}
+
+static inline int regmap_test_bits(struct regmap *map,
+				   unsigned int reg, unsigned int bits)
+{
+	WARN_ONCE(1, "regmap API is disabled");
+	return -EINVAL;
+}
+
 static inline int regmap_field_update_bits_base(struct regmap_field *field,
 					unsigned int mask, unsigned int val,
 					bool *change, bool async, bool force)
-- 
2.26.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
