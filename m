Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E06C71135
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 23:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gNeyiiatnOg12pB5RbWcv5kPhqcJXqPYg/9AFCOdp0=; b=BbfU2ustLOwkcvkuedOpjMvxI6
	Wl8yX7CTOXlBT6L0yM+eCiqdAgrYY1Z1Uw/LtZsBpsu7rhPqOHZYdwCC8O+JD2bDkgzmip0qB1qfM
	QGyC2cOPT3AXKnus3SR73TWPNPAlKgCsi3W0pmJidf6ckzMpWzfa+w3fzSIVIXmKU+c59dXXi4pha
	8NF8BJU9rnWzS91DnMrrBHUDqYt+a46iapSy0Q/7+bwP97OoCRr8I17JTXFx4JiTcKtNUPVgAr2WY
	TjrpleqRGCvJfPmFCP6TPkqPr6o+tVumh9hQ3KvBPhqn+zqA7zeZfQ+V1Ey9j0SAsbmJGWxcg7nkw
	VkgFxNYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVGI-0000000Bj5V-0QOC;
	Wed, 11 Jun 2025 23:53:42 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9r-0000000BVib-0I5y
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 22:43:00 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-408e0986303so224439b6e.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 15:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681778; x=1750286578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gNeyiiatnOg12pB5RbWcv5kPhqcJXqPYg/9AFCOdp0=;
        b=S3N01YpkCaoLjlMooEKzbhBwDCofDN1T749AmvusSbI0kMStYKZKhKe+Yt5YEq4IBj
         n3lOwJbF9V5cf5QHSxnDdBViyI10thRfUUv7f3qtf5ktW1JbP7ojur2DOeSVANVksea3
         mCE9dhi+27dQRRyD021FftaCfhg3rr6QMeroNQwyG7gV7f7BfsxJ7DUlxGKoilNlMF+k
         yJDgvf17akjZNwplZuv5eYQjwiXP9kqDxEu5yU0811sqeYv4HrUnLz+atf2dQhllzgQK
         X+gbCQQkWmIQntc1YSIKnGLGdoyDlUrxs+3hC61kQhLWWuhOev18YM5UEDFcW4wuWLDU
         Y69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681778; x=1750286578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gNeyiiatnOg12pB5RbWcv5kPhqcJXqPYg/9AFCOdp0=;
        b=QIagG0YjbUclKp8opqfyAO1w0TqQrfYxSmAm6FLlbwN06itJ6QwTxCmeGShV4P1jiY
         R7+9oq33ZQRDaSdZkmnyAdo011t65AKr2sRWTUj+HyDOfLzGSkyWwNPIrDeCAXHYgFXu
         kcL8NxN+cDLAWXDNqPlQ97qBpeLt68IPIasYOXp6FeiVAcjzNOB5YF7CYwF4qm09fG1L
         rcWcnNq6lGOfem/dmLJLzTXijw4Za24HklmDPhacWJsHNTNvXX2fm0e8cDxfLM/mX89M
         OiA0pG3O9lDAEZMQQ5AKajGFGTQLZz17U0U5WLoxiBMjTLs63vqgChKL2zLPXLVXNmn8
         VZ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1lTUhI9K2j+/Ud/MMb4ivsmoRwcoglnRl4nKHMfY7QMSafrGisWjlntFWwcqYkHhwHnwJjlQaKyAzAHXrtA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGhM4aiys1OB65H9HIRc2tEiutkuLa8sU97qFK/IrN0vr3GTqT
	O6X9yyqmz6IdKx44iGk2e/YRHAp1AAAZ+Q6sZVZOXcFWqlWcw9ZA4K10Wkeg1lkpfRM=
X-Gm-Gg: ASbGnct2LMRGy/cub0xxJ/JR2uUGt8TmWiQxbu6ollGvLn0hnx0p4Q4YgEll4g0M0j1
	eBJymdzlBfJokFAoLyr6FOertSYvpUzXeyBde9XIKTI8Oy4nkVh0miQzJYH/FuzL7FaUo/kCYjF
	ED4b1S7BFWVmCPXSQMt9ZdNMNipKgCelhGHCPSHwncX0A1gxU0Erg9soL2rhUhuWGpOEVd/IfYk
	plETDspDjGN7eEv4+70QiEC65i32z+WQgvgLe48hHSLN6ALnOU+a0v0DGrRd108nRZMTNSerR2h
	6klZO+9aT5fn2rH0zsQmKACIhteRHnW3tIzOwNxSjTfSfsRvgIzsCRw99YCzgzkHU086
X-Google-Smtp-Source: AGHT+IF8vLl1oZyRXlNmWN4+7O4lpLib8z/LRQvjmS2nfSR+pVwcY8I2vpYyrg4nGSIO9hYnaIgubg==
X-Received: by 2002:a05:6808:2395:b0:406:59f3:738d with SMTP id 5614622812f47-40a65f82d85mr1058633b6e.4.1749681778380;
        Wed, 11 Jun 2025 15:42:58 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:57 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:13 -0500
Subject: [PATCH 21/28] iio: light: veml6030: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-21-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=804; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=iremmMu1ndnd7A4Ps07xEYpBZI14kNGzGGkmeue7GjM=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgYP8WsYQcwPg/QZttEVQAubGL55qot8Hvrta
 PXX1og+vq+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGDwAKCRDCzCAB/wGP
 wMjAB/9UreFKkkIj5dONnjnnK8DcB0PP9NwVYQE0mLIdoU7NMfJo1xDYNFB//ohFjvbKA3cP7xn
 TZULWqPy8UzorusrfpYLqSjNuqe/iSnOJUyt0URfEW+PFO2iBTYLbevM1E3jZs4OP3y1H9P0LkP
 lzFF9/gmEjEOZ8TX2HDvoHjSthCnmkIbB0rZgSAWzV2CtwsWAbz3cJmYxU45vdgfhXTi5o81ife
 +AQ7EmHHgG7cy49HOGnvublhmnWgpvoPulkVMW5/n7FkpryUfUCAzJ65gmUs/8B74qZPpycDA+E
 4e5skikbdS1v1z198Lxa16R09kc1jTul4iUxmi1lPrhTkD4C
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154259_122873_C5086351 
X-CRM114-Status: GOOD (  10.73  )
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

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/light/veml6030.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
index 473a9c3e32a3a53f373595a5113b47e795f5366c..0945f146bedbda79511e704158122acaac5e60c1 100644
--- a/drivers/iio/light/veml6030.c
+++ b/drivers/iio/light/veml6030.c
@@ -892,9 +892,7 @@ static irqreturn_t veml6030_trigger_handler(int irq, void *p)
 	struct {
 		u16 chans[2];
 		aligned_s64 timestamp;
-	} scan;
-
-	memset(&scan, 0, sizeof(scan));
+	} scan = { };
 
 	iio_for_each_active_channel(iio, ch) {
 		ret = regmap_read(data->regmap, VEML6030_REG_DATA(ch),

-- 
2.43.0


