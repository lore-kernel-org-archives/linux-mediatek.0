Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C23C5320D
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExS3Adk0ysbxVxPe6mSqv52zzn6f2EvdipX95Ynjg4g=; b=FaJaxpiVQmW8reUZkXa36A0uNc
	SJY2vS0qfTRYhrX7M2xFxzxfHPqaSxL3nRAOxFe9iHgvY7VdhyVLu+MjwLXWWK+loFyZanbFEus2l
	PuDAftuV6hRfUN7fF3uwaUw96dekWNfJMJgt4PyTia0XI63OCs4BDCrsVEqxdrz2Un2ZBrC7VRGb/
	4XFTkctdXhdMrcdr+ceE/AsbgHClH6qpVkmiO1Qm1Tbk0/ivy5Aracr3gM44AFo0wTBE1QvWb+i4O
	jFz/gXlqj60ZIwFWuUytBVe4p8WhQ0us3b4+p81aLC3eS+yGkgzbu4qmMzr4o2xlUt05/n21utWgr
	SxgdoYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sez23-0000000DQPX-0AAb;
	Fri, 16 Aug 2024 15:38:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyw4-0000000DOiM-1ERL
	for linux-mediatek@bombadil.infradead.org;
	Fri, 16 Aug 2024 15:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ExS3Adk0ysbxVxPe6mSqv52zzn6f2EvdipX95Ynjg4g=; b=htWOcm5KlMhSDcKPDjg51vr4JY
	NtSNLvYCe6nIt9gzDx4aIzIVLgQXyb8XNBNMSob67Gx5XWH7f51BEpt6fS4VHKRqQspYxeQMsNl3Z
	HjtjqbOU5nsjrDNMWEI7c1zl8FfMEzcr4cMZy1dMB6uaMM2prFJd19+5j7HxSjZLPEyhcu4P+Bs9i
	IAuEEgBQinDIDHz/1EddEfo2rscJMGLlI78ai5np0imd5T0F3H9WIaG5kFqZjdKo9MJU68sE1ozRy
	WxhYnhRC/+bs1LnlvvLPG5NSYaI+eEdX/APmXGxn8+1P2tQDq76Env11BvZNx0qsFNu8MEgE1eUP2
	xoWjaOHg==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyw1-00000008hXD-0n3y
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so15393315e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822331; x=1724427131; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExS3Adk0ysbxVxPe6mSqv52zzn6f2EvdipX95Ynjg4g=;
        b=xjPo6As4gsZN/yRikJk5YUj/+iAj0NbDgSKzArmNtgWJDaytukx5FNOpZcNpOsFq0h
         fkCXK5Zi228Cr1MUXDWoOUr3XZ0njMKTR3nSQ2egwns8NTXZMHxj1wbmoP/bXxzDbhdb
         Wzc6dQP0QkUedkxoDBxpOYEcn+6dk/KZl0ZtBCKeHsckOXlUGiUDuKPKPxohjhasbxfN
         slo8NQf/x/MEwWk68ArzlJUpIR+kV/ZjCOxYJ5B0YcXwLNyasGKb0ORvhFrcpEYBQUWD
         UY0H9j5qL0sh12fYzFivOoy8rt0TNz941Qr3XxKgSrFEfwMv0OA7k5Pjw2GoPGTN4Jfj
         PDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822331; x=1724427131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExS3Adk0ysbxVxPe6mSqv52zzn6f2EvdipX95Ynjg4g=;
        b=EcDwVo1FRYJ1Gcy1NerYFG6nohLH5fPG8UFQajFjVPwD4luJRnhRnfot53GbLFjxS9
         hPMR5eIUjlIpvdFzuuzMF8BsZD9LtVwjbqXIZrBbApu9YMbGyOkB9JUcWrZABHni/iIy
         DXG//Ei5GzVgaO8cI4iSyIZr55zQ+yr/Z5GbqeSk6TMC9hOes1vSIDI1L6iaq/5eETax
         yzZLPZ0CsW8WQoB4GCIfowpnTCyJFjXU3XLL2Em5dKvuwxNPonO2Xf0Mhg297zxS98Co
         PDF+z5+biSvuJLKekIbmLWaFecIV6+ee47BWxbCjhPzjqWgrM9QQUfj25/bjw8qvfi3R
         uY9A==
X-Forwarded-Encrypted: i=1; AJvYcCUCrqyAfsKzsdOFRnxbrJNpOAT4tnWBsCycoZBYlD5zNofSG1KJhZrR5DTJpXYcJYtd129YKXkJdt336ShF7d/+yncllFDoO5VuwE7W05m1y8YM
X-Gm-Message-State: AOJu0YzuyTz+1j8aeZOJp0tvSOYDDW3UL9rXDpFUHLkDbRRHa55LqXBo
	w0L/18MTO+JnkLwy57Q5BV3FOykRdkeX8K5hW9i26GTtTF9H277blTkcR9nFb8k=
X-Google-Smtp-Source: AGHT+IGY3LRWMur+RIX2EsOyWFfYB56XC96QTNt2jgmYdeU0Jid4hrYTxjzYfgcQsMTsb6CsL+XrrA==
X-Received: by 2002:a05:600c:358b:b0:426:68f2:4d7b with SMTP id 5b1f17b1804b1-429ed78562fmr22527545e9.3.1723822330645;
        Fri, 16 Aug 2024 08:32:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:43 +0200
Subject: [PATCH 11/17] leds: mc13783: Use scoped device node handling to
 simplify error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-11-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lKaguPS9XCpAsm5c5uDkmtZO7d+eB+Wkab1pNRXTP9U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3Di/6NaLLFot+D5dfegT8i/v6A5joRiEW89N
 jDAhq5CjM2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w4gAKCRDBN2bmhouD
 1+8tEACVczd8uQcgqQnn1chR1D9ZHwx5vpecvoE+zaIxLcF5I+90rwhxxDn8jJIGBDIEB4D9lEY
 8VArDs5hWgYidus4DO8QPVMc724Na7iEO7XzHXA0vlYqglosEqKSCnk4YhLj9qeh3+5O3s9AvHO
 R33hSdaUSKRYUo3TbrUsZEGXIeFOzwtCuHLsZ7q5n1zPLKNnM3zoWIwsYsAhBbyKKJG2C0DiGSQ
 2C2cIy6FWj+wnvnOugue2gimQjVJfyuQN9DzLZ8XGwrti2/8VvZRNUjkfCI2rAJxr9kwhYzVzr/
 MpKyOM/P4/YzNG8obVj+CwBkV+W8vCB0nXinpOgz7ZP9U7h5exRrnzfkT8OYQkEMN2K1KF5XpST
 DCGPitYNCxFLKDO3lSHmtS/5Uinxi5W9s9bcES7OcytdUjcqNr4rFP8F6AXsJZZEnBu9LTX2vnJ
 CyxeqAjuuhSzLaQqA75FgTeeQ1Q7SpHfyvewqraZVxTQRKdeuJJvXZo/aKCdvfZtzuo5bYGaBeC
 OiRKTvWBCZtlOIob7/WKFTNmtZyltasnmpOPnHBdyojcJynwE1/+XZ/AzSPpVBnvmulZACpMAT0
 3YFovAp4Rms2RRR8qDQXBvLFJMeuUkgoSK2KBHBiUy0eo/yRQDOxKD6WC52EALjbTb/BLwiLhox
 wdc6cj6rorb2j6Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_163213_317649_8CB446D0 
X-CRM114-Status: GOOD (  14.31  )
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

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-mc13783.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index bbd1d359bba4..da99d114bfb2 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -12,6 +12,7 @@
  *      Eric Miao <eric.miao@marvell.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
@@ -113,7 +114,7 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 {
 	struct mc13xxx_leds *leds = platform_get_drvdata(pdev);
 	struct mc13xxx_leds_platform_data *pdata;
-	struct device_node *parent, *child;
+	struct device_node *child;
 	struct device *dev = &pdev->dev;
 	int i = 0, ret = -ENODATA;
 
@@ -121,24 +122,23 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	parent = of_get_child_by_name(dev_of_node(dev->parent), "leds");
+	struct device_node *parent __free(device_node) =
+		of_get_child_by_name(dev_of_node(dev->parent), "leds");
 	if (!parent)
-		goto out_node_put;
+		return ERR_PTR(-ENODATA);
 
 	ret = of_property_read_u32_array(parent, "led-control",
 					 pdata->led_control,
 					 leds->devtype->num_regs);
 	if (ret)
-		goto out_node_put;
+		return ERR_PTR(ret);
 
 	pdata->num_leds = of_get_available_child_count(parent);
 
 	pdata->led = devm_kcalloc(dev, pdata->num_leds, sizeof(*pdata->led),
 				  GFP_KERNEL);
-	if (!pdata->led) {
-		ret = -ENOMEM;
-		goto out_node_put;
-	}
+	if (!pdata->led)
+		return ERR_PTR(-ENOMEM);
 
 	for_each_available_child_of_node(parent, child) {
 		const char *str;
@@ -158,12 +158,10 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 	}
 
 	pdata->num_leds = i;
-	ret = i > 0 ? 0 : -ENODATA;
+	if (i <= 0)
+		return ERR_PTR(-ENODATA);
 
-out_node_put:
-	of_node_put(parent);
-
-	return ret ? ERR_PTR(ret) : pdata;
+	return pdata;
 }
 #else
 static inline struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(

-- 
2.43.0


