Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3900EC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msjur9BIXfohR7MjKiHFK0aZDyGMTPkmem6NEGtsCjU=; b=L8tJjJ7j/9l+qqDGvHXeIgvY+T
	KdF9PukxA8IMa3dN1rWikltO25734c64MouKzJlVJqqYl43VLP98SOxr8TFjAeO68pf9vUe0bjW4W
	u6XeASh7vVpgoQf4gY2JBUuZhQ5LcbvsOPeRo5Sz2/HYhFU+R7mmvhp+g9zPGiVoLxwH6WxPC9C3y
	UcLYPXDHR0lkw5gC1tt3mywY0wr6clQiTzJpCdG88GH1h0mP0861dMlbX5qEN1z6C0HO4z5v8Lm7V
	Ka5P29OjnfLB6qDs9JzVc285G1hADhcWwthLqBmkM3roiV9TeSOzOkyv8tVWkchEMkGt6CgcCWzo0
	Sw86CKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLZt-002KaX-Cx; Sun, 12 Mar 2023 13:17:33 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLW7-002IS0-4d
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 13:13:46 +0000
Received: by mail-ed1-x52d.google.com with SMTP id da10so38595710edb.3
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msjur9BIXfohR7MjKiHFK0aZDyGMTPkmem6NEGtsCjU=;
        b=OjW7Ch3WzJANLx1nyByhnbnA+p4+Psja196A21bF0aDMZDj+CjUc/V3NpqZSVXJz7J
         Q4s69NqmOUkMcMhUM52lRFAx8K6Hn3pTbfhlcNGcvYtm9T/Xdmpa1eFwio1guKXpLMjx
         /GbbBdI/iGN+TR2BIZr+OCddK8GbN3qlNgAEbLoQvrd9hqX8CNUxQUr1whlLYlnttiCD
         2ppydo1QRfSLe7qEMLz239tuUQR12OAwkuyjl7KW/bFdhhaPMbQAkE3KxuO+3gWxoGJ9
         OsgpWpgMvsI/YzdsoXmnuGMMDhZQ/0cnC86nUpxdiwnlRbtFNGkMGuAkbk1zVOtaFonr
         m6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msjur9BIXfohR7MjKiHFK0aZDyGMTPkmem6NEGtsCjU=;
        b=vlNNbyYJeQ6/iCrJbm5WjREmm6GZqX+QT0IfqouHOvW3cDVY3uMwh+oHgyvEpjxi52
         fK5W/3TAq0NblhoQf2z6CTb01ugBnq8DA0x8RnTMl8e46rQZI+hUVw1gQcHvjZFqIRzn
         p38bMtg5snkv1kdZ7Wi+NMGrVC3p1MD9AlNotziNIZbS4/6UUnylEU291/4QKQxTfz/k
         qSwTceHx6PN3/XidFPJoZARRukyzseLiEE+FDkmPPGncnqWwaNTYDTYWXu2Yfuo/Vvr5
         XXlNUx4b7e+BZjlGUdGSZEbtgi1D0y6w+s0IKMT6sMg6oHJbF+deMj6vsQ42mpuNgl4j
         LZcQ==
X-Gm-Message-State: AO0yUKVsTMN5GvQ5ulbAekbgH9cJ3yWJCSiLqDIdJMtZCnq1wTh6pIl0
	nd12gOO62lYhHU7p5zCep89JCw==
X-Google-Smtp-Source: AK7set+x2TzZ8b+2TPoP/NPOIph3epGLp33Dj5+VNI5L1g2bCpHKzqAG9L+GEAXmbu6Kg//PKl57oQ==
X-Received: by 2002:a17:906:5206:b0:8b1:7fa:6588 with SMTP id g6-20020a170906520600b008b107fa6588mr30618440ejm.12.1678626813798;
        Sun, 12 Mar 2023 06:13:33 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Joe Tessler <jrt@google.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 05/28] media: rc: gpio-ir-tx: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:55 +0100
Message-Id: <20230312131318.351173-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_061342_615894_8B700B1A 
X-CRM114-Status: GOOD (  15.07  )
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF error:

  drivers/media/rc/gpio-ir-tx.c:24:34: error: ‘gpio_ir_tx_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/rc/gpio-ir-tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/gpio-ir-tx.c b/drivers/media/rc/gpio-ir-tx.c
index 2b829c146db1..1a8fea357f14 100644
--- a/drivers/media/rc/gpio-ir-tx.c
+++ b/drivers/media/rc/gpio-ir-tx.c
@@ -199,7 +199,7 @@ static struct platform_driver gpio_ir_tx_driver = {
 	.probe	= gpio_ir_tx_probe,
 	.driver = {
 		.name	= DRIVER_NAME,
-		.of_match_table = of_match_ptr(gpio_ir_tx_of_match),
+		.of_match_table = gpio_ir_tx_of_match,
 	},
 };
 module_platform_driver(gpio_ir_tx_driver);
-- 
2.34.1


