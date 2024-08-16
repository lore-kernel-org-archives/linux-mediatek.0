Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD39C5320D
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 16:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmSp/tI6/cAsvRbhfMHRpQD46ohRd+mOrBdZEg+M/0c=; b=5AYfgWusTVQyg6Ypn9Y3LsAHng
	ql1lVm8rr+lc80IeZ9315GdkqJhofoqEp7nvEr3R+iv5HkPberzJ6Ml/Afwk+CERdenfC6Urk8y4/
	cW+xKGIzsUJyu3JWAaT2O2R4K40XstficD+Vw7wUQDIvspZ7ZwJbQlU/VK4EkSpCd1HOCbMI21AWj
	wNR+By8L8wZo/jxbIfYUzyUPatsm9X3zH898PQMxWhIZtTbQJ2Otqihjgen5JF7TOetanHeUS+hPk
	LMLlF5qK6aMwdtiVWnNq+lCWFFJpa7k2wIyJgyfFhzGsRkg/qaTSc1pgXaoKj9+W/1OPME/PlRVSX
	Bdo9BP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf05h-0000000Dcc3-1Epv;
	Fri, 16 Aug 2024 16:46:17 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyvq-0000000DOYJ-2tIO
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:04 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3718eaf4046so957505f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822320; x=1724427120; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmSp/tI6/cAsvRbhfMHRpQD46ohRd+mOrBdZEg+M/0c=;
        b=Ed22lDrTxO1eZ9POux8kq6GpyGJ+0rAWKqd33KNKwKICv4JVLaPU+FlapRixzkNhmR
         zqaomoh4UH7KD11YovfFdqWY8FQ+yDqsgAj17yt3wsLpC2KgakgAypqNqLe6nGJOZUeI
         GnNBrlEo3uuGTwRDkvnr43FyMiHgQG83s6Av3gZWLc8iftdGsOG/ONYNDpz5Hox/Cwnn
         JAtB6+D5EL+ugXbYEFQ0YQLFyJIPtCJN147ROH3o+n0vj63g8Ubx9ZmXkbGSYckFx3rN
         aJt1s7srekWCS56lPWdRRy4nUyVR5Kywbh2FXsA3bw2Nh/STVRFCS0tfLamo4mIo5AOs
         exSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822320; x=1724427120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmSp/tI6/cAsvRbhfMHRpQD46ohRd+mOrBdZEg+M/0c=;
        b=Kz0PuRdqvaZOiAGQYmbiRmRvQM6i2+zj+pFeCNv9hNbphL8XriMcZ0T9SreWT/hMh1
         12sjL5R2xhvqjIEiB9t8lB6eLCT4QtgVD7DUMOZZqyqDUvFigvgstxAxXHvUtz2DcD9a
         0aCb2Ypk/9RAzdIaybYmY6+tw60nT4yE+IufIArMfynhCVnk21sKQUlzDdoA5e75lpQP
         2u6tRbTqYiIWKEXxp7+pQpyelveqNE21/ah0/sVP5aI9WMFK4fJCgmUJIxtSJE2XHiYR
         B5kjhiWT+Ye87sCowrbPdCA8EY8OwrTWc03QLARma2slwFUn6wKaVyNa/kJHASBef9JX
         Aanw==
X-Forwarded-Encrypted: i=1; AJvYcCVFtWfzj8FWBNpl9grK9LoT1c7DVoiUNphpzh6DUpp46Sizt4eLQBTCvBfibXRxmAl3a1xfZNP3ai6p05v/+PvBtEYXEH3/HCwR6wBI6gxzL7aw
X-Gm-Message-State: AOJu0YyBaZgcRQY2BoYNYT3Ykt4o1WTeDcvRLP2BGm9VO4pLvPXHO72R
	42SkJ6ZiAx80A7Em8mp84AHznuA9cKprYAGhIlXfgad7vGNPO0/DV6OEFgEzVWg=
X-Google-Smtp-Source: AGHT+IENvgflPrCRLHnfFtaGxKPmZxIFqASabhejGrvVmiQr8wKujrxn8UdnFq1rYdKsHedXwj+CoA==
X-Received: by 2002:adf:a443:0:b0:368:7f8f:ca68 with SMTP id ffacd0b85a97d-3719464e70fmr2963005f8f.30.1723822320474;
        Fri, 16 Aug 2024 08:32:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:36 +0200
Subject: [PATCH 04/17] leds: max77693: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-4-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=haphcDVabNY+m5Vrc9+jwTzdz2gW4B9j++QCcBv7uus=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DcFsjEVoUNxcpg4fNpAtVDyd+JTLcgwo8Hw
 k/LlBeAdrSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w3AAKCRDBN2bmhouD
 17zkD/0b5uHnjnzjPvy7kRfLttY9Q5sWPLsfyEq6CLUzPTCBewXF8K27CAlQIluNVr9MosDCghO
 U7QGtLk8uSvJj9KQ02Yig2QWAcy/s5wRX+ONqPYRue6VOXglHUB0PaP/hurfyKbriRaOUyg3bm3
 Ffad+VfZ46D5xsiEVre/lHkn2amNZE4K2cYDi73IjaGDH4+rdGn/xY4GWlBlA0sDiFaaZbq9mE9
 1bHtk3cykDUdm2ykX4X+1ycApN5D9e0drHjadREgiSLjd8NQmMWPwb9yroUwjZSfEPsFZzXEiGH
 ESatJmodVxi+VpuKSU6tN+pn36jp7Uvo8oJLg2ciIqkhH7l/8f26PToam8oq0III9BmKa7K+WE2
 SA2i561NmARvZKIb7ov2/YXtvUFPzgn/7ENHvP3gnz3QrvNmc6UPPaGIWeENQnPPlEqh9VDOciQ
 GtOI3WZtohFdCug3984yJMuJtGZ2lScEuevzxO0cF2t1KI8+qhrQ4yog1t0e/OS5HQT8Iz4fa8g
 XzXe3ZIxRQQ4cV9Dazp74uPSEkMMyN8EKzdftcVEuL48b9NbqZBencwcIcjhkt6pPpRXBMgLvu4
 weZ7WS3MKriAVqcl2tPp4IjWatK/agobg3xKELYxOlZDdKiHQJc6uUI665Mi9MamHNKIXUMmcyo
 ejGSHUPPEivrccw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083202_780086_55EC8F60 
X-CRM114-Status: GOOD (  11.59  )
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
 drivers/leds/flash/leds-max77693.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/flash/leds-max77693.c b/drivers/leds/flash/leds-max77693.c
index 16b169e658de..90d78b3d22f8 100644
--- a/drivers/leds/flash/leds-max77693.c
+++ b/drivers/leds/flash/leds-max77693.c
@@ -599,7 +599,7 @@ static int max77693_led_parse_dt(struct max77693_led_device *led,
 {
 	struct device *dev = &led->pdev->dev;
 	struct max77693_sub_led *sub_leds = led->sub_leds;
-	struct device_node *node = dev_of_node(dev), *child_node;
+	struct device_node *node = dev_of_node(dev);
 	struct property *prop;
 	u32 led_sources[2];
 	int i, ret, fled_id;
@@ -608,7 +608,7 @@ static int max77693_led_parse_dt(struct max77693_led_device *led,
 	of_property_read_u32(node, "maxim,boost-mvout", &cfg->boost_vout);
 	of_property_read_u32(node, "maxim,mvsys-min", &cfg->low_vsys);
 
-	for_each_available_child_of_node(node, child_node) {
+	for_each_available_child_of_node_scoped(node, child_node) {
 		prop = of_find_property(child_node, "led-sources", NULL);
 		if (prop) {
 			const __be32 *srcs = NULL;
@@ -622,7 +622,6 @@ static int max77693_led_parse_dt(struct max77693_led_device *led,
 		} else {
 			dev_err(dev,
 				"led-sources DT property missing\n");
-			of_node_put(child_node);
 			return -EINVAL;
 		}
 
@@ -638,14 +637,12 @@ static int max77693_led_parse_dt(struct max77693_led_device *led,
 		} else {
 			dev_err(dev,
 				"Wrong led-sources DT property value.\n");
-			of_node_put(child_node);
 			return -EINVAL;
 		}
 
 		if (sub_nodes[fled_id]) {
 			dev_err(dev,
 				"Conflicting \"led-sources\" DT properties\n");
-			of_node_put(child_node);
 			return -EINVAL;
 		}
 
@@ -681,10 +678,8 @@ static int max77693_led_parse_dt(struct max77693_led_device *led,
 
 		if (++cfg->num_leds == 2 ||
 		    (max77693_fled_used(led, FLED1) &&
-		     max77693_fled_used(led, FLED2))) {
-			of_node_put(child_node);
+		     max77693_fled_used(led, FLED2)))
 			break;
-		}
 	}
 
 	if (cfg->num_leds == 0) {

-- 
2.43.0


