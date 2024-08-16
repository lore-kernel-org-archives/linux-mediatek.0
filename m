Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E415C531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82u0aLxCOMmAENgy1g3HMnv8Q8OUR/q6nxVGVYKir68=; b=YLEdNA2FCWfAnivi/4F0GTpq/E
	NK0aHjYQPJ+wsC8E8nbTaFZlIGFGDz+8PhnkMe5ozjP7UYvgesCmKLJtWonaQvvF9cI5wOjCPczuo
	2E25nK0etpiVE1iDFh8HSdOPu4AyHpjKPsZ4TQkPFq2+aMA1w6RFc++1pK9rJLi5LVp5nutD75o8U
	WWtGjC719V2IVS6RbzV3hh7dixq70Rc+1OWaHdmsIgVurnJrR2h0s8U0IU00sSHn48klWk/iPUHvP
	vIfUrC7ayKE6iy0k0wfIupJbDjF/lfL1Ih0dZ5ok52G5bMrSL+4zYu6fyg+QP03mNbSWPjqecoFR4
	YUIVYTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sez5B-0000000DR7X-0omX;
	Fri, 16 Aug 2024 15:41:41 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyw6-0000000DOjW-2WJ6
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:19 +0000
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428119da952so15550395e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822336; x=1724427136; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82u0aLxCOMmAENgy1g3HMnv8Q8OUR/q6nxVGVYKir68=;
        b=wfta9OA8qfKM5UXu0Oq3k7QH/UcoOyJV5sdHBNasy37cAyfVOQ3foMPV5ReaOmFFWz
         mLA3hMHkRoeBvzuJ+kFBbINAY7WbdJMI6GiS84MU/ZSfLQkxwxCIBj1ZjHdbk8CyHRhs
         6mSm7TR+Pde9nKuImuDHm6cQ8FAKptghLde/uEusnTe7zmNCR0TYWHhRnK1qFQKNsrbF
         wRjZXS0O0Dcav+nHbKCwhVur3pPOaO7Rin6g8V5EoDhHJJ6oGB1ljfB6Xah1Kws9xHNy
         LXXVScZCQYAqAizL8PmNLoSpTDCT1jS1nIq/JbLA8SUSG1riHTa4eZTirM3s7s8P5DyG
         rLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822336; x=1724427136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82u0aLxCOMmAENgy1g3HMnv8Q8OUR/q6nxVGVYKir68=;
        b=PRGTn4dHUbo2NDmjtCf8STxhmJzP3FGmeoOo5pyH4/pjtV3Twlsbsdx+IvK39vl1MU
         FaXqdsgfMnCJd9rlBKbZwds1SoR+QvndmsEPQpc2hfQm91X8RaDaC5r+JE9EbtK4U1pD
         7LiUYO4C3/xkfujtKB414PZG4WGv8v4xJ9oOZQtR25LhT3gFyAmewdaa3WktL6QVAo1J
         PhHXYNENMpf2TPMU0nmIK7EouyTph5yM0rtw4T5X8GVqZdTXFyFGjaI1cNFcRgqyxAlh
         5+RtClipSvjMH6T/U3OIBbRz5rV134D9RWzFhEokxZynQI+df2ZJBG1N2kn0oEaM8b7w
         fOLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/45FZvSXaVnknfRHC1OUjYo953xj6RzmrBNOr2Snoq9gRvtwFyixROnffQA45QG4njj4co+a3Qat+vBUWEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+LdZOtX5+OaFilmNFBpz8nP65cmMLWKs7rfohWCjRvsgPXGNT
	z1BYPwpR8S0aRiuVyILIpuCXyti15sHO7cJa6wTny+qehd5e+nTc+PjAaK6AE2w=
X-Google-Smtp-Source: AGHT+IFoty7tTAPOCyav/M+yMTn7h/aGTkjK2dWYaVz5fLcCWS//Y230cKvMHPE242A86aP9/IgluA==
X-Received: by 2002:a05:600c:46cf:b0:426:64f4:7793 with SMTP id 5b1f17b1804b1-429ed7af3d8mr25468635e9.22.1723822336156;
        Fri, 16 Aug 2024 08:32:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:47 +0200
Subject: [PATCH 15/17] leds: sc27xx: Simplify with scoped for each OF child
 loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-15-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=P/bMkN6MpG1hpAYn2CS2V4doNmtsHBv2dg+qwQSz6uY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3Dm8noI8EzoG5LCskKgbLFVnnrv1PYZVipeX
 tFmNsyKbeGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w5gAKCRDBN2bmhouD
 180EEACar4IcrZlsd3xk9bIpi0NxSlkXiLAuI8nxmW6mz+cNcfhPQWr4juEKIKU8SWq8Bcjuz0A
 RA0/Qwpgh/ThAWVSamp8X55go6COy9pVnFY/WIozfcjxLDmnjQc2rNa03f5aknsPajDOz2WoySW
 vV/UYxxrb2GFPccA/TJERMXE5GeOfqMzjLmOmv2GvpLO6MLT77aVmgva9B55Rg8FG2SyQx0J7pE
 Lo3Sb5LhsPgASPhBfGo1CNKh/s7c0mO4IhaZIY9gT/M+cJ3k5+2F+tBX95He9It9KNZkpBRh8mF
 qMOxPToh9G+2XWQbtx7/6RT1NWgXf0xEbwhed0/huc3VhD3QRluxkKuxaUuWrVlS+mRbjiCqm4z
 pKWcD56pWCpwCxStIm4WVykqOfcDFy7YZTDuSt3s5rxPTEkWutlE/sag3C3XQ8DXw76QWs8k3YE
 Aj5VT+19zWwY9Gsa7lvRt/KKMZpWgL2FZA+YPZHGspCt0j2sSimeiy3R0rUMnY7U+yVbXXAy1R7
 ely/fkQQKsGD6yfysPNqnHAvqiH4vxarsInC0k7iVnm8T8hj1Kd+axD2KUF+Ap1hUF8wvNRJY9O
 +8lEqFLj2LocXZuxPu+xEX1QvniXbD8I0kYayTZoa+jVonEkM36vST9pM1G2uzlrWhIDTSKn7S7
 mTyIm3ENeFrPMCA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083218_673389_BA286A37 
X-CRM114-Status: GOOD (  12.23  )
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
 drivers/leds/leds-sc27xx-bltc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-sc27xx-bltc.c b/drivers/leds/leds-sc27xx-bltc.c
index f04db793e8d6..cca98c644aa6 100644
--- a/drivers/leds/leds-sc27xx-bltc.c
+++ b/drivers/leds/leds-sc27xx-bltc.c
@@ -276,7 +276,7 @@ static int sc27xx_led_register(struct device *dev, struct sc27xx_led_priv *priv)
 static int sc27xx_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev_of_node(dev), *child;
+	struct device_node *np = dev_of_node(dev);
 	struct sc27xx_led_priv *priv;
 	u32 base, count, reg;
 	int err;
@@ -304,17 +304,13 @@ static int sc27xx_led_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		err = of_property_read_u32(child, "reg", &reg);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 
-		if (reg >= SC27XX_LEDS_MAX || priv->leds[reg].active) {
-			of_node_put(child);
+		if (reg >= SC27XX_LEDS_MAX || priv->leds[reg].active)
 			return -EINVAL;
-		}
 
 		priv->leds[reg].fwnode = of_fwnode_handle(child);
 		priv->leds[reg].active = true;

-- 
2.43.0


