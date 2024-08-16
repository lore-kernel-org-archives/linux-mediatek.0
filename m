Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C183C531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGaV2RDOc8MAwrZD+PEbChQMiUdw7FasLLrpXnw03mg=; b=2ay/rXy38ohL+hbreFzo/+SbgX
	O2hzCFWTt67CGp51Ai3cRYXJvumrByeo+M/SRtYZYwcrAHcYc91Ft2gCu/9sdy3Kl/rGMRfzq0mpP
	QLNxRfMrPZrzSsH/IwPcT87kg5Ots0jmEIr2MSCMaivUzKZSVCCJHIlSWoF0rnySbH6WuHwVMuMv7
	y2AMa8crr/CvxhvZzQkulQjp0LChAcvosLH5lHzY1Zg0T0XibT36ktFNz0fksFDQpiv6nfnTqxs/I
	KwtKrpxnvp01lTF92SDhJa2rFNlijGkTncRdlZm68d8205YgkG/bHmLhF/JnI6VkwYTt/4R35+lX/
	JCsjwq1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sez22-0000000DQOs-1JDQ;
	Fri, 16 Aug 2024 15:38:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyw1-0000000DOgn-2KVh
	for linux-mediatek@bombadil.infradead.org;
	Fri, 16 Aug 2024 15:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LGaV2RDOc8MAwrZD+PEbChQMiUdw7FasLLrpXnw03mg=; b=O00bAXK+DG4iQL516pe3pBBaE4
	EYe1e68FM0J266zuP+FpP443wZRo4GrzcMwQo3IADPrIAHUHvXB5J7qELLiEn3+CF8QIMAmfKs8Ep
	qkPuKRMdmzQ8KuGZzVdfPUzunKNWKhrPMTP+LvRpqVtZnJ60a904uUzXvAJzTWdexm8WjOB2iEGHD
	IfmJKr7HSUiLO+ehJaq726S+ASEch5RpJQVWKkvud3KPYyo8Fu4Wcw/GIT73Q2llAZjr4jnkACbmw
	j9QEO8xrjJtvY7deVxP6CQyOEaE4/cYgHeGog1F30dFNtiDlJ0wO4PTJ9gUwnr3R0yieJYQkkKgJE
	cAj5ul2A==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyvy-00000008hWN-1QR4
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42808071810so15443295e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822328; x=1724427128; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGaV2RDOc8MAwrZD+PEbChQMiUdw7FasLLrpXnw03mg=;
        b=kystC/ds0RxHxDVQNmXwL6Qzf+SNNQTc3+u3vGPjm4oVNZ5Jjlfd6kSlkGuATpBCY9
         I+f5x4rE3z+UD3ghDBpqlGmsHE7uA+G+6DJ8dqTVhuPR7JUOqFF7fDsS75DCChhwVSoc
         DaOwwgFx0J7LKhq8eOHQIyAu3FA16vOEm2WqFN0EA8sdZsqzaZKl8tF9KMSp4jxY4NQx
         mQ5NIGDqSivy0H/Zt+rVow47wCAw7mOwwJie/XTUD2z1af0/YfKijRT2wtY1Fyj0btdP
         xZt+LM1PPhZD8v80W+Ndd6mlhW/2PTQ1Hqf09Faxmm6P1pHh8bmdKBYEGUZ+fq0+NLQ4
         KlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822328; x=1724427128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGaV2RDOc8MAwrZD+PEbChQMiUdw7FasLLrpXnw03mg=;
        b=T+jvITWsT9QS8QwX48nL6RCSQbmhjrESL7rXirWy24jGA1YFur/XQlPl+to9n0wBlF
         lGGHwGWhnqnvtl3lUXG3tL8xMUjW8V+bK/geXOQ4JKMjzDNWzXVkDujLmGMiM8niHH0U
         4daXiGy/j651lomU3rU3AFO7FCpxhxNeKA+NEfu4wralobJkDJxF3eBGAA9HD+UARfim
         pYgtsJKM3lOG16XrVxesYl81rLf6yHXBAcQ6Ue2wEK+IqF/lK3ZgR6U0eHMZP2xsgO8A
         wVFIjdEJEj14dJ028+Rt8wexr+xJvVuiuS68OOQM/1QdBLWWR7fxtMauhvot7aK7hIDV
         gdZw==
X-Forwarded-Encrypted: i=1; AJvYcCUHBV6ue391b4I18ZfTNmLUMckqzPrrAhh/UBCxHHV8rJ+GVDWsCqnTytNakjBjp/sVEfUo6tKcTazTDEtmKWiXPlTXWbPkm8ggBvlw+0mnqw8e
X-Gm-Message-State: AOJu0YyH9FMB+cAyN1TeDM8ilt3h5L5gQFWmzgf5PVuhLZ8m/HhKyKZa
	B6kYY1MfmA9NiMI77fh++yuRVzG6gO6BVJ0EKRCNN7Kk7LN8MNwzvJqI1xbvXiQ=
X-Google-Smtp-Source: AGHT+IFfmPaV7HvNPh3uTKrf3gPU3+DlTc+If8+6DTZ+FnUuks5SQ2r0R/qNXIMR4vvm/S2Vv5bzyQ==
X-Received: by 2002:a5d:4e4e:0:b0:360:7887:31ae with SMTP id ffacd0b85a97d-3719468d263mr2762190f8f.54.1723822327656;
        Fri, 16 Aug 2024 08:32:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:41 +0200
Subject: [PATCH 09/17] leds: is31fl32xx: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-9-1d0292802470@linaro.org>
References: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Riku Voipio <riku.voipio@iki.fi>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1925;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+81/quQFHALMpUB6fQmVb6mYEiHO0lEYq5t7UhRRMzs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DgYLr3gj7531lmAyEQypWWevzG4gT7CE04J
 K7wVw1+wd2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w4AAKCRDBN2bmhouD
 18xTEACSro+sjGBUtLTGgjVaSxyV60PtwZwyOAK7Fqq5RH1ZZVgzESSlUU4qdgNYZeDkODJl+XV
 q7Orhu0Ajk5cK5db9fLOIQJkaXRvUU47dRau+PErZEtCvDdRmpFkxBMmw8KR0l/Vnv4RYUZV3Jm
 P0cQEcKCg9YRbojaWpMU+quoyK5LaLGG+Cx0tPZeSuUJpJTOGFZ1J45hL6greDe5n2VKdBukx6a
 aZWqSnZrvVfGnwiUx5a2CGDix7osxzq7lmbmutLc6T/AY65rW3hg5oCT1O7jYY3uuXD0Laf42eC
 BBTlIhd6KtnfY2oto8IDnEA2vKT8PjFD/nN7rSdU41LNMMDMDYz7erZQsvRjYvSqguihznoR5/B
 Bv+QTFItKK/xXo1rDiigsO8nYwzjLJLRt6HRkQJYq+Vjpoalu2pdQst+Ag3PG0PL2UBBR5jGGgm
 T8gf3mtGBE39cfCl/Mzx0EtK+q1COmuvOZzQdjByTdCoDc81E41quD4JvGt4IjHKJttzblIkOuw
 wD1jYqT4VIgAxshxIwIGVhY7xHvx7CIPQjOmj499jKFh4+alZP/cTnAnUfiDZ4m/3sKulB8kiqF
 9NGVGnke+Ui9f3fbfrhIjExOqOW7HcXHD7w+LwnJSHkvbiclraXKpDezFEiTmuvKQ2slyYcVW1r
 zTb+hCEeRcSiRkA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_163210_606463_0ECD5B75 
X-CRM114-Status: GOOD (  12.85  )
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

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-is31fl32xx.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index b0a0be77bb33..8793330dd414 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -363,10 +363,9 @@ static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
 static int is31fl32xx_parse_dt(struct device *dev,
 			       struct is31fl32xx_priv *priv)
 {
-	struct device_node *child;
 	int ret = 0;
 
-	for_each_available_child_of_node(dev_of_node(dev), child) {
+	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
 		struct led_init_data init_data = {};
 		struct is31fl32xx_led_data *led_data =
 			&priv->leds[priv->num_leds];
@@ -376,7 +375,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 
 		ret = is31fl32xx_parse_child_dt(dev, child, led_data);
 		if (ret)
-			goto err;
+			return ret;
 
 		/* Detect if channel is already in use by another child */
 		other_led_data = is31fl32xx_find_led_data(priv,
@@ -385,8 +384,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 			dev_err(dev,
 				"Node %pOF 'reg' conflicts with another LED\n",
 				child);
-			ret = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 
 		init_data.fwnode = of_fwnode_handle(child);
@@ -396,17 +394,13 @@ static int is31fl32xx_parse_dt(struct device *dev,
 		if (ret) {
 			dev_err(dev, "Failed to register LED for %pOF: %d\n",
 				child, ret);
-			goto err;
+			return ret;
 		}
 
 		priv->num_leds++;
 	}
 
 	return 0;
-
-err:
-	of_node_put(child);
-	return ret;
 }
 
 static const struct of_device_id of_is31fl32xx_match[] = {

-- 
2.43.0


