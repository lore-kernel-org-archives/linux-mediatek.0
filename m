Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFDDC63708
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 16:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YM8esfRUJI66AUcHAfU4GRcLBt7unfApTHLgo4eQjI=; b=HNFlmq+HyTqbc9LLB2aYlgemyC
	htDXvSoMl9KDeY/3Tgw+ydNXaEtoksfsBpwxBppN4Y1Ny47K4Q0rcfztjrlRndDlqG4ubRjKKEzAK
	RgQZ+ZCH+Fzcz/jUIoP8V2M9+oVyIoZ00NL95jmMTFWaYfVd6jvlgQQIzc1r04+i0AE3VXZjuz5KL
	Qbbt7dncVDA8rBhcWcVE4b2MkAxd+Ht3khihy8N2yDZsCCl35moPqEd8ku3skex54a4xwYnIFHa7t
	5abij9ejaWEJlqnx2dKsVXL0FYai55aTtiuy8gEUUm78/ttOseEyzP9XGBT1ncqgvKB0Gl4KAbtbV
	WKtJ/K8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3JoJ-005FHF-27; Thu, 08 Dec 2022 16:31:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3IrG-003Ud3-03
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 15:30:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id w15so2023561wrl.9
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Dec 2022 07:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YM8esfRUJI66AUcHAfU4GRcLBt7unfApTHLgo4eQjI=;
        b=pie0o9goXLxTxFDA4wcDy1QkVwL1bOKcv7mDRQAf3WeuYm3BAAAlDpu+FU0MBZcybk
         k8avyESThu3slr+rgSsV6dR1RvPy7V06I8Vm49srfp6xJvvo1CeRz8+RqyjgFVkq8fGv
         Lt8X3emhtDcbXvkbErRRYlG4gW4rF0WUKg992gH677fkHXcsCAiGWjNyd4Sa0N1pSAfb
         J1K/Ul2U+sU1MLlcXBjkDWdzoYHC6AQitcuixVlM2fhkfLJ1fOC0pl9gM9mZOmeFVW2z
         KwEk9Wm1bPMZNqLGSK5Uthq9wxcSRzsp4kRWXWUA02ehd0GpA49xJn+TY2jhJ0txBh7N
         /teQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YM8esfRUJI66AUcHAfU4GRcLBt7unfApTHLgo4eQjI=;
        b=wSROg3nBGuwLywYfe7aJm9eoARFvXFB1lUs/rmG3uUDIbRjIf9zVRBi+j3Oikoj94P
         A4v9oI63QO4zP1mgGNWRb4VlC9wlcdPc3DWZRy6g2FgtN+HeqCp2ir7jP00Rskw24cfM
         5Es1lNaDTqMAP7fr3jiXNgxHHTzmWj2Hzbdu4lqNTBNZA6k5xkz+9lbQhKPODv8A1oQL
         XhI359TyCtFCpWLrzDuG9MHQJgUwp76zE9StaTcmP9NE5yz3qmbnY55RhnLmZRwGAaJa
         JqslWp7E9JoU6Q/kDvlzroZSAgkWzHtQWhNrC35NQfu8mrhlXDTvIzf01wxsLyNIHVbZ
         qM2A==
X-Gm-Message-State: ANoB5pnwc4REQdzd8DABCyWYQ3UAa+HfCptL9/shZ3RGYsbT1wemwLpI
	zRmzVGfX4HaWCsuWMbBvPnjRRPfHiN2elN7JfzGe8A==
X-Google-Smtp-Source: AA0mqf6GZP9OH5wdGjbihY7E5o2kNENG7XJO2LlCOF0ySSKsJ5o9aJAkw7mGbagi4uWcljWa5J/rOw==
X-Received: by 2002:a05:6000:1d84:b0:236:3686:797 with SMTP id bk4-20020a0560001d8400b0023636860797mr1652958wrb.65.1670513444313;
        Thu, 08 Dec 2022 07:30:44 -0800 (PST)
Received: from predatorhelios.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d504a000000b002366553eca7sm10673239wrt.83.2022.12.08.07.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 07:30:43 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v4 2/7] dt-bindings: irq: mtk, sysirq: add support for mt8365
Date: Thu,  8 Dec 2022 16:30:35 +0100
Message-Id: <20221208153041.3965378-3-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208153041.3965378-1-bero@baylibre.com>
References: <20221208153041.3965378-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_073046_409791_27D4F6A8 
X-CRM114-Status: UNSURE (   8.96  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation of mediatek,sysirq for mt8365 SoC.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index 84ced3f4179b9..3ffc60184e445 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -25,6 +25,7 @@ Required properties:
 	"mediatek,mt6577-sysirq": for MT6577
 	"mediatek,mt2712-sysirq", "mediatek,mt6577-sysirq": for MT2712
 	"mediatek,mt2701-sysirq", "mediatek,mt6577-sysirq": for MT2701
+	"mediatek,mt8365-sysirq", "mediatek,mt6577-sysirq": for MT8365
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
 - reg: Physical base address of the intpol registers and length of memory
-- 
2.38.1


