Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBCAE77188
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jan 2025 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7vYfoIccjBDkjw6cbBAv2evM0j3S7+LR3G5bMrrAjuw=; b=Id2va7pvKkOOa7KJA8AKGlZSSw
	cOSoTAM2Qs849XlpsmkXnj/ArGaH4xFGBvAI3uShyq/XedVeBXi82xJSulf6b8RKIJRovx9eNi3r9
	0TF0DIKQNVEHhccMwPHA+1f3ZW990yH7J6ytRtaADqHSuj+NXurTcFZDQum+4bWcEZYU+cJ+v+82j
	yv4RITw+Rgn4zSy/LXH+FyR5Ru9VI14wVLa9h4aJ339wFKuRiBmGyRdg6Yi/FIydzjZHX1tj6vqX6
	KSYHR1XioVZxpnxWkTEeBZIh5DHjzdfUir+PAgiK5wNQCEI0qweHdrtL2cuHsjM/gtAtH3ujO0Eyj
	L1oVI8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU50n-0000000F5tl-36Nt;
	Sat, 04 Jan 2025 14:20:21 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU50l-0000000F5sP-1hXf
	for linux-mediatek@lists.infradead.org;
	Sat, 04 Jan 2025 14:20:20 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d3da226a2aso2454038a12.0
        for <linux-mediatek@lists.infradead.org>; Sat, 04 Jan 2025 06:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736000417; x=1736605217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7vYfoIccjBDkjw6cbBAv2evM0j3S7+LR3G5bMrrAjuw=;
        b=C2esGhh7PYxLxqHsMdv4IB1omYFNn6FjRDKYAU+hoL8VzHPUIKPigQZkN34+rxl9y4
         5pU661Grd9dp4eLIDHCDKcyf/EL12Pd87sfyNgHtBB86FAbEHNdeYZchp5dXpTpZpKUa
         WzW1dULGKf3/4BxxtbVOC0TXsw6/PlYklgdZShxzE1gO6OddP8jezPNqTphL9g1a7X0G
         2CVJBL3XB/Tv0Guiv262y5LSqpLD6pRWzlPbWMquqzStDbAqFBny91TINXJSe8chN4sy
         +wrcd1jYHRoo0caXR3DUTTa44bY1K6Jv5D+1yLAyXlA3abf4EjwMLt0Cyq8riNGxPyMw
         wdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736000417; x=1736605217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vYfoIccjBDkjw6cbBAv2evM0j3S7+LR3G5bMrrAjuw=;
        b=PdWS0v6WE3zPNMN3U8ZMx1aIiuTup5Rv9BDvBkdi+ZpFVzVGXP+UyXnPv864uPJwqX
         A88skG3vpG+MZoHxWcbJV4vJBO0ytvZuELdLhJt7ZJR+pDrjXg210rZmWXX1gnkTMciV
         /yTFE7Hhw+8GFwKgh25b53FyOcg7BPR+yvdcXkC//bPWCLdXxGiUi/VhrA95/hD+h3ms
         JZSCH7jQMp1+whVTo2+Tdjpk7phXOt/Q1ZvmzJGTy8L3a4Uyiw36Cw/KXrhL8iAWlc71
         U21E+gyga1Rr6KBbti63T2USQTmU2KxSns6/DhPLw/z2ua9/4hblzoPevOKpDc1VugMV
         mgDg==
X-Forwarded-Encrypted: i=1; AJvYcCXViRFrkYd2OEQnHXh+oenvpr/4MtHMsxkAlwyxYgyBe5ffu1WpGx/f7qtMe4BfIov1DL9ohDCuPJjSrxu31w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeSCDiKtSFXW5UIUcdoMAg7VFusk3cLlOy7jt9rNKHn6XCzy/y
	h9Nt6JcMq6dBGw7IabefLcjpxigFXxcCcTgnstjQGqi/zwaAb1ZFRushMl/QRqM=
X-Gm-Gg: ASbGncs1tYIyc5lDDevDwoEZKboIGuOUw6iA57iExpYdjDlrnVQ0enEzDZ2WLSkyrRB
	vf2RWblWtLpBrnEjm4EW7sGIi/3MluYs1AoafQ+RiCKeuq6uAFNI/TzcFgB8lJxjH5pNH2dAlP9
	NKlOxLzVlr41AcHjVRqpPy5PR9jvlxTERCURuRf1A3IY1wMOFer8tkvcxwAuGPZutZ4l+u9dUUA
	KU5l8VMojrs1VpDpqkrlhMkJcTGX+pRLb3Tkx++eX2vExzAwxcY8lAbCxAC/Z3dbs53CoE=
X-Google-Smtp-Source: AGHT+IGha3K/A9wzcwndXIIgjH9svK3Rsjac/aT49HWWAWPNoZX3f2AfqQT6YbI2NKa2kWUjRR+k4w==
X-Received: by 2002:a05:6402:4309:b0:5d0:bcdd:ff9b with SMTP id 4fb4d7f45d1cf-5d81de1c2f0mr18117836a12.9.1736000417341;
        Sat, 04 Jan 2025 06:20:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed4e1sm21376270a12.70.2025.01.04.06.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 06:20:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neal Liu <neal.liu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] soc: mediatek: mtk-devapc: Fix leaking IO map on error paths
Date: Sat,  4 Jan 2025 15:20:11 +0100
Message-ID: <20250104142012.115974-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_062019_441861_C82BD7FA 
X-CRM114-Status: GOOD (  11.42  )
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

Error paths of mtk_devapc_probe() should unmap the memory.  Reported by
Smatch:

  drivers/soc/mediatek/mtk-devapc.c:292 mtk_devapc_probe() warn: 'ctx->infra_base' from of_iomap() not released on lines: 277,281,286.

Fixes: 0890beb22618 ("soc: mediatek: add mt6779 devapc driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/mediatek/mtk-devapc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index 2a1adcb87d4e..500847b41b16 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -273,23 +273,31 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	devapc_irq = irq_of_parse_and_map(node, 0);
-	if (!devapc_irq)
-		return -EINVAL;
+	if (!devapc_irq) {
+		ret = -EINVAL;
+		goto err;
+	}
 
 	ctx->infra_clk = devm_clk_get_enabled(&pdev->dev, "devapc-infra-clock");
-	if (IS_ERR(ctx->infra_clk))
-		return -EINVAL;
+	if (IS_ERR(ctx->infra_clk)) {
+		ret = -EINVAL;
+		goto err;
+	}
 
 	ret = devm_request_irq(&pdev->dev, devapc_irq, devapc_violation_irq,
 			       IRQF_TRIGGER_NONE, "devapc", ctx);
 	if (ret)
-		return ret;
+		goto err;
 
 	platform_set_drvdata(pdev, ctx);
 
 	start_devapc(ctx);
 
 	return 0;
+
+err:
+	iounmap(ctx->infra_base);
+	return ret;
 }
 
 static void mtk_devapc_remove(struct platform_device *pdev)
-- 
2.43.0


