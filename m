Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D54C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 14:24:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C31A207D3
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 14:24:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NOApz5S8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="upvfkJpE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C31A207D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GE7ExtzPMV94G7b3hKT6JgVsTxrG50PDrBTUIe9ZTvc=; b=NOApz5S8WPpOmw
	8myq1TNsBXrVAee+oZvLScFQZeC7saYYLDykPVHB/jWA3+8l9mkB95Nr0GXIjxMxd+BukI4ZQ8MHV
	M5r01MncbbW4HEeU5NlzUvFRQvwEHmDs0+CI/NyVUj5iYuPzGUaaNOKUwr3KejvCdbNGHtymqsFBc
	jwxCk9LXaWYek5pznK6on3R8tJ8byhd/AvDFBmHVdxXVCuL2XpWNyfOw48fod7svHVv3W1R9hICZ9
	48sPOjBq+fZH2ZS1LM+wQtMGIP6mSl42RyCGGTlmQ4IlgeWdOV14AWXiM9Z+yCauODKfoL3yM5+XY
	rahhGr5Z2whP2VEbcsPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeJRq-0003Fc-10; Thu, 28 May 2020 14:23:54 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeJQu-0002K8-0w
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 14:22:57 +0000
Received: by mail-wm1-x344.google.com with SMTP id v19so3373355wmj.0
 for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2020 07:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bUTqIyJQ96SSMI0A1T4YUDc+Z+dd4WsNKtNtEYEWK4U=;
 b=upvfkJpE+j2X8Py5StpA9JlDlz2G9d49LnZEOgNJpWo/0I87+o9/l2XXA6HKaXcNac
 bXBCxrNiF435IihMwKsSZiyIuVjmiev2lr80Ts7YvZxkr2y+Ny3q+KKL2LEWFCP4f2Mn
 jDCBpYaiitFDb9cI/2Qsa+yvmMxX7nEjTCkgmHspXj8M19pq6FYicVh5ufEf3GsndFsC
 3sImHWzerLDxh1w42NoP5PX14EUb5k9D/VNKWVIobkFk8O77pL77IyOg7lrb757twjpi
 QsnvGsOfA4hIJLkF9gCVphVrXvKu4hwwk8x1d2eQE56DXo5ckQKHQI6aiKdnddEUBnxD
 tqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bUTqIyJQ96SSMI0A1T4YUDc+Z+dd4WsNKtNtEYEWK4U=;
 b=r7TB7LTDl7wrwx+aNe5PT1v+XBPCkRrlDZ6uGEnZM41eUqozF/dLiNskaiUoAh5vTu
 4Vp6drvwVuTaZxHRYi1h/Rf/qa0GrYjlWdBfA+UAT+Udm7lHJytiB9SjVP7ifyHyaA84
 gxtup40+HbLbyz9na2Vhy2z0D3trKvxcmXy65131tAoXEO1RYE6M4sx6IdJI8Lt7r//k
 aceOzqBE0gNKYX3FLy/dA1ok/uPF6VJAMu5Q3bfsfgyq3gkN8eYIznhjvPxVy91JBxJG
 1GZxdAQFUdsQ7uBraJu1NZEPn1T6BaeidmgSiQKGXjUlBSLPFqnobcGxGiEtf/s7r4OO
 C50A==
X-Gm-Message-State: AOAM5332d+QW+k7GUtvFVakTe3zRVmuWYEX78H32MKxlqTRcv9r5erKa
 vaQsU7/N0hyeQYPbv8A32CuC9w==
X-Google-Smtp-Source: ABdhPJyl+FBJZedD5liWJOKutUX+saEOEFndp/bsIsFCtM6wE+3IrguyrR+0NAJOMR+t886hi1rjXQ==
X-Received: by 2002:a7b:c086:: with SMTP id r6mr3540234wmh.29.1590675773653;
 Thu, 28 May 2020 07:22:53 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id h74sm6258162wrh.76.2020.05.28.07.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 07:22:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/2] regmap: provide helpers for simple bit operations
Date: Thu, 28 May 2020 16:22:40 +0200
Message-Id: <20200528142241.20466-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200528142241.20466-1-brgl@bgdev.pl>
References: <20200528142241.20466-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_072256_304764_1EF939B2 
X-CRM114-Status: GOOD (  12.24  )
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
clear_bits and test_bits.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/base/regmap/regmap.c | 22 ++++++++++++++++++++++
 include/linux/regmap.h       | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 59f911e57719..30f659e0b4e4 100644
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
+	return (val & bits) == bits ? 1 : 0;
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
