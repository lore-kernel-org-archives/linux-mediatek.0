Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96BCC43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 11:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9h4E8fzpkUKefQYXbM+5aTJxB/wkrGJJdLAlPHgwa7A=; b=dj4+2q+Xnmd07+iZf2BaTgTezg
	YDRmpglhmtCQ1REGUdoqGmwuXvE5zoUyt7rAVUGxcAgjW2UTxnfMHHMwyrDN3XSeZkIobDCZicNg7
	g5g38yGxhwPNvpuIsgcRCoRORtVoKuFIJQGG7SqU6jCUMYtqA8QpPSPhSYrBAr5I7pvYgYHmSAdPS
	p3thPpU6rP0aTiUXKN3N5o+M/XF3OK+gwynyyqwJJ5FdVmKsv7zYB7t+BJBk7ca+ERtefEaIf5V7Z
	fLcqHWEXpoDK/AmDqYVu3REAYL1L6hDsdEFyfe4yWEmzHdndtKFOiJ8CgeKXjJRaTtqauE/wq/Yh9
	sja6C1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQI3-0000000GzUk-0mKi;
	Wed, 08 Jul 2026 11:18:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQHz-0000000GzQC-1bwL
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 11:18:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493c83474ddso4881825e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 04:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509481; x=1784114281; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h4E8fzpkUKefQYXbM+5aTJxB/wkrGJJdLAlPHgwa7A=;
        b=DEK7+0hEK8b4uOWcWHLghNei18Aeq8zg/HCLeAnEoO98d5R4n5MzEUG8E6IFgHoxOy
         L1PTSmQ25Daiy4IytP8sX7OPjcnhb9H9fkD9BqdvshqbsOeexsq9dNoimNUsAa873Eiq
         4KkOMTp7OAqNQ25MXL7l+jAKLyAm0nyFp6Q0nxsf6VGPpMpjggHVVZxCe1nHNz/SeN98
         6W2eiR65Zt1fynJv1WuqhmX4J+qW5qiCsnR9NKGpqTnrLAWUtprN0KMXl0L8Bdo5ff1U
         l9/FQ1MoAObWEgHNwZLbAilLhOYagxaMytyfbxIL04uUyWYGxpdTXp6JajxRUpVQMVwm
         NYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509481; x=1784114281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9h4E8fzpkUKefQYXbM+5aTJxB/wkrGJJdLAlPHgwa7A=;
        b=Ssq1T6jCFJOFyQRO+HBTNYytFL3M/MiO5iajtPmSKzPgQuh3K4JWh3MQbVkd7rjpch
         z/aA8ixQqX58VUCD+zX57JcoWVr1blXD/LE2e+nCCZ6o4FuchGZIbLLjZ9ne99HmVVpz
         S7a2zEhgyM4J3Zz0Vhemj0tBUpVHv+0IcPe+LHuP9p/yC8rEywYY6Mo3AE3hJUJ573gY
         zqBFGV7YV+AxVjmKKgsJkV+ihLSrtj3wH3puClhWsBg2ImbQo+lwtYFjSHK3lOJ3roed
         dL7W9JoGl07hi2pblNW7E7lpjBea6jcm2mEecjMrYvZjVzXju9FgKPsCZJw9napVHKWJ
         w4MA==
X-Forwarded-Encrypted: i=1; AHgh+Rrt3X+rf2VJ5ccLZa/Y42vg4Bp/EGw9+bLNmWpycumbe24KnM32qRVGRxtcze6JGrnd51TWAXS6CdIJ7L6udg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+CXuc7lcBp6R8kMpuoq9xoHzoo45LxPD0oBeToNp9C2AFxQjk
	YY1EqiuNVwx9jdKV9OqdzB7aJRAtfTzX2hLjUk3hwgt27y26+bQ8oR+20ZRtpwhY3j4=
X-Gm-Gg: AfdE7cn1QQFeoNmGF/iuPiQ0WGIYOzLTpY4U8xMHsujtlQtdVZLZac6TvYeDIlzd0TL
	qe2AsRT4KxzKWvcVlgRuHuwVfKMwv/G4OVdBoQS8jGGi5CcX1gO30lU8yMic0sVJXBFw5a1eJ+c
	864LrYLTn2P/drNcu1DvRTRSc08Uycl6T587OoF0rzsM5Gnd8/ulL5V9/Ay8SNRzj+bePpjDGgs
	L4LvN9lbTlh30pWMDokbPCsnzQvZ5LvDh0rJzc80Qkb963aS+WPJRGukNphb9w5AMEDEp+rMbgk
	bYgCfbn7a8FuoVtt2lFj1nZaQHIeL83LGLAYTqagmEmeN+VwFRMj9QsFNMHTCAkbqduVDT80avb
	FkCEKtOU1O82VOQQf7BY3cK6Aud2w1ZROj0o7DAXRZlL1OtNqIKGV8p4KTo4D61Wob2P4r8wPDM
	PnmSAyeWBJt1wMDXxnzXueALKUN7n68e1OhgOzpYhgHZvnXWoM5AyvcuAiZ4CxbhKhIh41Tr54w
	cvsu7CReqh/cT2QDg==
X-Received: by 2002:a05:600c:a55:b0:490:469c:556b with SMTP id 5b1f17b1804b1-493e68bef13mr21155325e9.12.1783509481596;
        Wed, 08 Jul 2026 04:18:01 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa (host-79-16-115-126.retail.telecomitalia.it. [79.16.115.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm37867694f8f.31.2026.07.08.04.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:18:01 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Wed, 08 Jul 2026 13:17:41 +0200
Subject: [PATCH 2/2] serial: 8250_mtk: honor DT serial aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ccaione-genio-serial-aliases-v1-2-bf22229e9383@baylibre.com>
References: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
In-Reply-To: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
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
X-CRM114-CacheID: sfid-20260708_041803_437086_96397675 
X-CRM114-Status: GOOD (  15.36  )
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


