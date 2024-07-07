Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59678C30653
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jul 2024 11:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aj+H9xvUnyjT7MSWsF+iRqKuLRi/HfbWIla1Bmzx9bg=; b=vfi9U/om9CHWjxC5lPvIvlmMfv
	aY9LzjjzdL5nSF2ytaL/xcdKI7O2l7/d/JUg945gIV1p2rpuHzOrE2cfvVt4PO/BZlRWJ3JpE/RlF
	hYgpQwmhpSgJk1/Yq80j4heSr1f4qrVKE40gbzKjv/IvkcZeRRI13w7BFIyLYZIM8oA2uee0qegyN
	4NYZFufvM/FJ0aB+xlMI5liWv4VOF/S5TzXdqiPMalMjm7HWh/AxcSUdVwlpJbtUClvU4bGbY48/e
	qFmeWEsq/ZIPFcczpl/hnmZ3dbhsGQ4SlPBwDDCRlPkoTV6audpcXWjZaPAtJQgJVq2Fh04ad+nW5
	7KvJWGIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQQNq-00000001i63-04if;
	Sun, 07 Jul 2024 11:48:46 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQQNa-00000001i1l-3bbZ
	for linux-mediatek@lists.infradead.org;
	Sun, 07 Jul 2024 11:48:33 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-36798e62aeeso2002989f8f.1
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Jul 2024 04:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720352909; x=1720957709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aj+H9xvUnyjT7MSWsF+iRqKuLRi/HfbWIla1Bmzx9bg=;
        b=KQJCPYX/iB2jpAit4eZwAI8f8f/Oxf7+IvTYGzZverkFyosWV7QlwZnDROxxNo0zw8
         23hGBKUThJ9zRcPRQkrF4CNVXd2+Ir4E9gieoHcE7uPPAE72gN64L9YXFPazbl01zMWX
         peCjr4YIWNIQFRex4uh23yVnTJV0NH27dLdHRLwf9QmkMLupoKVhogajphC1Hfr8VM4L
         4/w+99iAssbVATC3xRqTDRtGvEAataQrgMOA6ewikuOE64bIBm6jojQg88Xw2lpkW913
         WB3Un8GI5/a86o/kITP8I6fOs4skEgYSM0akbgwdFiAu3gLGA01G+5K5WL0o/kyyK6vO
         9Uqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720352909; x=1720957709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aj+H9xvUnyjT7MSWsF+iRqKuLRi/HfbWIla1Bmzx9bg=;
        b=I3JQq4rBXdgElmZl0lKoZWXV5SAHfOLeiQfw9eszEH3NkX2QoKPEEsBPqcTZQ5e7M7
         Xgq1fygOqHzBKJsm5Kv+88y0Y8dceYkYbSA4KQupGKilDjhPetx6K5YcXcGjKG2U3lLi
         rbkBaTPY0G3nmtVgKY+YsMxX9TOYTPm1/QaKMPYkKmo0yISTgaXErltvng/4G7laY3wx
         lu+qvbrU6e2EOK+fQfZqPN6j7QflwtFNlCevMP6dRisBvliYytc5M7XyxI4hDIrF+qUw
         zLkQcANwjMqFMrkNQXmuHL8mJlAddrX3EAzrrxp1ncdgL25gLkoj+YYbkWAUs0KOtyRw
         sujA==
X-Forwarded-Encrypted: i=1; AJvYcCV+0KzAuobnQQKeccwCaEIQRBvc0qTUJffCxRzwHOgM0/4RrPrL3q0BO42P4MvOr05hX+XyTxqjVg8rq4UtU7nl6a6Q1D7X9cE2jYGnhOWRMLYG
X-Gm-Message-State: AOJu0Yxa+FuLKxgyLydRIWEjJf1eJnv2ELL5RjeNJW9CTi7OhDb79OV6
	kSXOMG2LrrLsr31ElvRpkrgFuPtZC0Bp4hhYi2DdsQ5m2QPimFdoKEcCCmSfejc=
X-Google-Smtp-Source: AGHT+IHeMOE4bOFQg+g/YY8EP60jFy+PSHmwQodEWUVahd9Sv7efipLc0NJkFBPW7S07o5gHz1LR0Q==
X-Received: by 2002:adf:ab1c:0:b0:367:9791:f155 with SMTP id ffacd0b85a97d-3679dd55b9emr5247812f8f.40.1720352909065;
        Sun, 07 Jul 2024 04:48:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367b09401d3sm4926279f8f.28.2024.07.07.04.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 04:48:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] mfd: syscon: Simplify with cleanup.h
Date: Sun,  7 Jul 2024 13:48:23 +0200
Message-ID: <20240707114823.9175-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240707114823.9175-1-krzysztof.kozlowski@linaro.org>
References: <20240707114823.9175-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_044830_920084_65A5F25A 
X-CRM114-Status: GOOD (  14.52  )
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

Allocate the memory with scoped/cleanup.h to reduce error handling and
make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/syscon.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 7d0e91164cba..c939a76e83b8 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -8,6 +8,7 @@
  * Author: Dong Aisheng <dong.aisheng@linaro.org>
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/hwspinlock.h>
@@ -45,7 +46,6 @@ static const struct regmap_config syscon_regmap_config = {
 static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
 {
 	struct clk *clk;
-	struct syscon *syscon;
 	struct regmap *regmap;
 	void __iomem *base;
 	u32 reg_io_width;
@@ -54,20 +54,16 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
 	struct resource res;
 	struct reset_control *reset;
 
-	syscon = kzalloc(sizeof(*syscon), GFP_KERNEL);
+	struct syscon *syscon __free(kfree) = kzalloc(sizeof(*syscon), GFP_KERNEL);
 	if (!syscon)
 		return ERR_PTR(-ENOMEM);
 
-	if (of_address_to_resource(np, 0, &res)) {
-		ret = -ENOMEM;
-		goto err_map;
-	}
+	if (of_address_to_resource(np, 0, &res))
+		return ERR_PTR(-ENOMEM);
 
 	base = of_iomap(np, 0);
-	if (!base) {
-		ret = -ENOMEM;
-		goto err_map;
-	}
+	if (!base)
+		return ERR_PTR(-ENOMEM);
 
 	/* Parse the device's DT node for an endianness specification */
 	if (of_property_read_bool(np, "big-endian"))
@@ -152,7 +148,7 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
 	list_add_tail(&syscon->list, &syscon_list);
 	spin_unlock(&syscon_list_slock);
 
-	return syscon;
+	return_ptr(syscon);
 
 err_reset:
 	reset_control_put(reset);
@@ -163,8 +159,6 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
 	regmap_exit(regmap);
 err_regmap:
 	iounmap(base);
-err_map:
-	kfree(syscon);
 	return ERR_PTR(ret);
 }
 
-- 
2.43.0


