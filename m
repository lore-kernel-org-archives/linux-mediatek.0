Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E91AC531FC
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 07:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9h4E8fzpkUKefQYXbM+5aTJxB/wkrGJJdLAlPHgwa7A=; b=sjImIFn7c8vG02JmIMaZSQs45l
	mcWggfCg88TxUXCrhDrjdxN96XIqgEmamk9LqRJYuComLEzpcBJE+bJuQKGYLEbeu+iSHEuH8fw7L
	OnrMb/bXSa3sOAp1oRwjEx/HnBgy78Tn0sRqfoRlhqep4lAufl8ul7SlJ2fc3Y/wP1JaDNPcT6SE5
	bZ9f5JJRaaL9rtdiwVCtmWN2a5pmKBIFIwJBLHog/NqyX0TNr9HZkPtlLTVEdriSaJRi5ZA+Ut+n9
	ENkjXx2dZqBQVvkDDCYELX8owedttdX1tUV8tdBtp0vSN7NMmnNfSbDLATbh12zbnQbLulrlZ5W/B
	1H97M48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFx8-000000029DS-3OZG;
	Mon, 27 Jul 2026 07:40:46 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFwz-0000000298g-1mXs
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 07:40:39 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1937063f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 00:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785138036; x=1785742836; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h4E8fzpkUKefQYXbM+5aTJxB/wkrGJJdLAlPHgwa7A=;
        b=PL2TV8REoHJ8IelVvZFJY5A2KFYAPHSVvxZ2vJ7G2A3+mvzQXaffJpQkAtV1+DRWwv
         fN3qlDcwvOHSeQsauSW1lVO2GLp3VbyjW1pBA4MYIR97TLwlEpGeDzE7nt3Q3wayrDGQ
         TCDe97UYd2V+Fcq/fKq07iuZEuD+pEQT29E0SRyNPZXVUqF4qVQHXcX8+Zt4AdaAi/vV
         q3U7XMjX9FBAukFfqOw78WEZxf6Gu9qvsuc6Pw0ku62Co8vG/F9+D/wKT7C5xDhMkFcO
         qvJoo2epFHd831ydzif7Pc5ul3NteDYFEZ29ojIzf5WJjMBWoXg/PFGsct/btpnOgBYU
         hXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138036; x=1785742836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9h4E8fzpkUKefQYXbM+5aTJxB/wkrGJJdLAlPHgwa7A=;
        b=Nv1KY31z8XZY5z8Ck2lSLsZhzh51t0EMNGpSmfRrO4jeqznrVzV/58i2TfChjXCeQM
         krkbUh89e8NY7rpyo2HkEYAOyqttgD7V5tRcOVq2yODxFTUZB+7XL3uxWK4qyLxiOoIk
         6VTSuayIpXuEhX2wpqZWYnn9H3cYmgpcghciI+fxA0oNrrHerJH1p0W0GzddyeLl6cej
         iVkZGcW7T+ecEt/mRTpq8vfinsAUzhhBYSkTpkjntxZFRaVOnN9xMMnskwXEdiSbJPkw
         c/DIj85v8Dkzivb8cipi9wEV6bmNTi0jmbcLPFHr4A+fQ8EZPl7c0JtLm499VAas5Gip
         rvxw==
X-Forwarded-Encrypted: i=1; AHgh+RodFh0Nh71bkxOnsDpMDj3DuGyW1LePC5CoLjRz2mWfBCa8JWpr++lQ8l41uLC2yoWrRCRsvyoBpy6E89313Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/zd/LcvKopjYY7Qr0lmj29eoO/ykvigp2ai6ml5+UsdCZGFLH
	4vbDOPM6Pe/nNZI+bWH0xCTWET2P2B1qRmGhCf3Kv2faTeAj4Jc3DN5hLiiN4wJdI4M=
X-Gm-Gg: AR+sD12dyyAY+XStIsULy72w3uy/6aZHWBddsykqly9Y2v51wh81b9j4BdD2rkXtqRl
	wew1C6TsEYud7Wvsb7e3a9IvsZHutEZQWIe+YILm7OqM/w1sXX4deLjYaTpdL9ZoDSyrvm99LWu
	jXFxJ+YQM5GV0xjOuFsrb629PKGKPaVCMxSQcICQ6Zes8OhVpyWVTsBtaCglvDY/J2lEXb7QOup
	VVvUPw5DmaC80JZL1bA0rwFv/LL5DF++rLyI9OBRBdbXr3SezLzO4AveZv4yfFvrmVfcd19k/3N
	7ns0XN0zn/3yaFE3EQTvz+N36LWmumSK0ogZLs5EkyfNX/dJPO551HVWvHMzqAs9ypc39SaCd/l
	mK5LN29nIgMsDJ+NCu1x8Y7RrVSmCWC/lfu8l/ueyZdiUWj/ditwLuzyFSrxw2kwlbUPTgWG5tN
	f5UlRgC6cZBuDB15m6wQnfR5sc+IMSuGj4tX4yg3NMlG+RVdg2jBfBAnteI0YN+OhPGN4XGj1sD
	gRaWTKsZpFgGmsbKUIRqSyZLw==
X-Received: by 2002:a05:6000:4382:b0:47f:45fa:98e0 with SMTP id ffacd0b85a97d-47f9febc7e5mr8981992f8f.57.1785138035650;
        Mon, 27 Jul 2026 00:40:35 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm43677682f8f.10.2026.07.27.00.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:40:35 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 27 Jul 2026 09:38:09 +0200
Subject: [PATCH v2 2/2] serial: 8250_mtk: honor DT serial aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-ccaione-genio-serial-aliases-v2-2-0f2ae41a8e89@baylibre.com>
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
In-Reply-To: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_004037_484625_80F17461 
X-CRM114-Status: GOOD (  15.15  )
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

The Genio board DTs provide serial aliases for all enabled UARTs, but
the MTK 8250 driver still registered every port with the default line
number. If uart0 deferred and another UART probed first, the 8250 core
could still assign ttyS0 to the wrong port despite the DT aliases.

Read the serial alias during OF probe and seed uart.port.line before
registering the port so the 8250 core reserves the requested ttyS slot.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index e6a56cf54ae0..841d64f6a707 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
@@ -521,7 +522,7 @@ static int mtk8250_probe(struct platform_device *pdev)
 	struct uart_8250_port uart = {};
 	struct mtk8250_data *data;
 	struct resource *regs;
-	int irq, err;
+	int irq, err, line;
 	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 
 	irq = platform_get_irq(pdev, 0);
@@ -575,6 +576,10 @@ static int mtk8250_probe(struct platform_device *pdev)
 #endif
 
 	if (is_of_node(fwnode)) {
+		line = of_alias_get_id(pdev->dev.of_node, "serial");
+		if (line >= 0)
+			uart.port.line = line;
+
 		/* Disable Rate Fix function */
 		writel(0x0, uart.port.membase +
 			(MTK_UART_RATE_FIX << uart.port.regshift));

-- 
2.55.0


