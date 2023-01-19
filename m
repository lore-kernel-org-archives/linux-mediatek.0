Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9FFC678DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1V+AlAQyMB4Uszzz/3gFiK+c3DQOnNxo0R2UN0oOwaA=; b=vY/xWN39mFiT6QlykwfhBq/Z5V
	fY+TRU7nouikiXmUh50haqOBDIVQEl9e+GfkjwbKXq0vqQ+PrXrzIgLLY1X/+LXIApHTV6iL93ptZ
	kfpChvxtbPn0TqhTvkaZ3drKM8a8rEzK9XefHNsEbVW5ueQmb3fZTLnweAY2oOnprWMS3+Ok1T446
	XGics/A6navq2LUBcKsU9x9zYPNco9vJfyS6LpkzgjCevk8okQx5/NFDEHkKuNxLhdctwpmE0GQL4
	YIRpadckP97B3+uM3M6qlOT+sbaKvI64iG5EfIv7ILab9L9AhydZRq5l2wqY20/StNyCmFokBO3dC
	tby3mE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXmm-005zAI-40; Thu, 19 Jan 2023 16:29:08 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXme-005z55-02
	for linux-mediatek@lists.infradead.org; Thu, 19 Jan 2023 16:29:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id r9so2406210wrw.4
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jan 2023 08:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1V+AlAQyMB4Uszzz/3gFiK+c3DQOnNxo0R2UN0oOwaA=;
        b=1Ii3UICPWS2xk2szN6TKxNtVqLxXZpXAyWJe4bS/rXv8cLPHGvbHaQzOUnUh3Lzbt8
         i7YVIBNfBGGGHisVBzp91eiLHjEorjIYfxIvxen4O6YtGtSglKYnpD+QeXdX5tJDdGOU
         W0SQ4HjqbOP6VFjjxdzGMHuKth2IEb1qPpZJ/+qTsQZufHnsLBhsLZUqHzNYHWTsegkn
         qhLdJMHLeT23BOgcm8b9IPTJcp88V1e8LLqkQaEe7LKeNqxnxbDVqB7AB8KfQXI/Y8sZ
         WWqLe3JaPHlVGyBrfsPDLDkDhhLqUkPMyukhTwrcH17yKCjv1f5QfhEJAyZ5iXcL1xhE
         7tMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1V+AlAQyMB4Uszzz/3gFiK+c3DQOnNxo0R2UN0oOwaA=;
        b=n8BvRkE3IicojK8OGc6GY57obJifFWINvy38WnaQFu/uA68KyEKRg1urMnTdGPahvW
         BWMWVy8b7F26BRZX0D3HxEhVgJiCWdaATiaUPU684A8ohhkSTQTyndQoUu6OBuDJZNgT
         jgYmRG/C5uejsN9Sb+BwiW50c+nJRZ+so0CUoqQthpuqwgUxvtaXW/JBn/S//y+mwe9x
         FCQp/lsgYvy1HAmtcHysHU1VnxkvHEM5k/Xw5cCOz2csf6AXYBgHwROM+FuSeqcqa3QM
         UPiJ82+8thSP6yK1carZ7Eg9aq77Vk2cmYZzHUF0xdH0r1HZ04PwRGdxBuGzYMKtxxja
         kbPw==
X-Gm-Message-State: AFqh2koAMof5ZnQtOmYypqcZaKFhnStmMUelN0q+BGcRH1mmai3SCPnO
	GU9yE8ty6EqInxwt6thRJQpGFg==
X-Google-Smtp-Source: AMrXdXsYJzDdhNIBBTnTZ+uBJMO11spDqDrXzN/K1DBeCx5SVzKoxdoPDU4KVOop7H0asFznIl+KFQ==
X-Received: by 2002:a05:6000:3c2:b0:2bd:beff:9c47 with SMTP id b2-20020a05600003c200b002bdbeff9c47mr11873335wrg.67.1674145738767;
        Thu, 19 Jan 2023 08:28:58 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f7-20020a5d6647000000b002bbeb700c38sm29008771wrw.91.2023.01.19.08.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 08:28:58 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 19 Jan 2023 17:28:50 +0100
Subject: [PATCH 2/2] spi: spidev: add new mediatek support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
References: <20230118-mt8365-spi-support-v1-0-842a21e50494@baylibre.com>
In-Reply-To: <20230118-mt8365-spi-support-v1-0-842a21e50494@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=jaqhN6R1aKzEEALosy8O3LyQm4i6Ldhz0IJK2z+QDNY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjyW/GtkBwodHdGFmD9EQ72UZXLlxvUINHBPmmk0JC
 B+idxumJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8lvxgAKCRArRkmdfjHURdICD/
 9F9RCFLu01N7iObG0wc8Tgvr5yA0aeHOWo2PIKNnIBPbNRGJo2GxkqaMVB/N4zsqUTyTbkZGeehH5f
 VbjrNWVxt8+z0YswLnMqAW/z5ENprKNWCRVYJ1h11Zs0EoOGJuH6YqlxqRf68Rnhg6cmIz4RNvxJYL
 vo+JgnI0jjNzSIgTD7hBxJ2g36GAXmUiZSHpy1JphA5cwICG1HXyhZtEbXFPusY7PAMLypd3fpC2O6
 rPUXwaXMorjnQ31ggwFU52/6ttIIfTs2j+UkrYGijX+SWGJ26kc2KHk9GATC4x0AfiJFge/hKmlHOV
 NXgmZ/Xer7iVmC7KByc+Q7RXWJPX1WThxL5jKUaOKJ0bhI2l7KHmY8atkfagQEVE8icPHwbwXqyrKH
 tXj4/hHHMrtdzK4ClyxLro3M7Vp03EZbQHT5Xt4gRauxQmz4eAyBaFy9t5ufMTiuykTunPUM4PXe2S
 oO5IYllFbAsyvws5IsWV5bvX40KwhtaYFXk7f68WqFY9repyroyxJlMYW+z7tiSBgxvRYPxiHh8EJX
 2an0sHMp3l9BOItxi1zUkjz5Wy48aEsYg/lm9P0I1ZtnaS0k/Wu/eJRbZ5C2C/W/TzGvFT6VFm3Cax
 f3oCaF6jsSD6Nvly3kvqP+sbaCX8xg91a6zvWkBv6ABz6VV1+RxmB/0V5seQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_082900_170594_FC7DFFE5 
X-CRM114-Status: GOOD (  10.26  )
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

Add the "mediatek,genio" compatible string to support Mediatek
SPI controller on the genio boards.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/spi/spidev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
index 6313e7d0cdf8..e23b825b8d30 100644
--- a/drivers/spi/spidev.c
+++ b/drivers/spi/spidev.c
@@ -702,6 +702,7 @@ static const struct spi_device_id spidev_spi_ids[] = {
 	{ .name = "m53cpld" },
 	{ .name = "spi-petra" },
 	{ .name = "spi-authenta" },
+	{ .name = "genio" },
 	{},
 };
 MODULE_DEVICE_TABLE(spi, spidev_spi_ids);
@@ -728,6 +729,7 @@ static const struct of_device_id spidev_dt_ids[] = {
 	{ .compatible = "menlo,m53cpld", .data = &spidev_of_check },
 	{ .compatible = "cisco,spi-petra", .data = &spidev_of_check },
 	{ .compatible = "micron,spi-authenta", .data = &spidev_of_check },
+	{ .compatible = "mediatek,genio", .data = &spidev_of_check },
 	{},
 };
 MODULE_DEVICE_TABLE(of, spidev_dt_ids);

-- 
b4 0.10.1

