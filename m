Return-Path: <SRS0=5MtA=2T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775F1C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:16:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4730E20722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:16:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wn/zfkWR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="usDW8hFU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4730E20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YH8WtIxMFc6I2lmubptkMF2Wa5MP1nJIxBMiD53Sg5g=; b=Wn/zfkWRK6k1YSFVzspV8fSyEp
	LALLbCaGQ/L28r6ysIpzG5hNyhf9tEpSPONSt7c9NStQwHt236fuMpumA0IfyTbip7ZuMJn1+GFIM
	Gt2yWxdJic28QYBGndHF7++7oUhwSoO3W7gpOpQtLvCRv61SHFy4x6fvALldyHd0KgqQ1K1vohgYj
	xmh9aZXrQNzKSfEJE8gmFMxoNdwQCZfcuRThvvBcsHjgm06jfyk8LSRkFb0i11bNFTKH2wZSMhBeb
	vkZfknG9C8zQp9QOV9LA+CybGcbhX4ucn8eaTMMNOdcpine9DvZ1kznmdzsCyMGT54EW4wBRG0tpF
	bvgec2uQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTkC-00031O-8d; Sun, 29 Dec 2019 08:16:12 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTam-0000wk-4N; Sun, 29 Dec 2019 08:06:29 +0000
Received: by mail-pl1-x641.google.com with SMTP id s21so10760774plr.7;
 Sun, 29 Dec 2019 00:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=r7yBzrky9isIDkwNYOWcYiIFvp7DVOIxh9G5y1D9XBQ=;
 b=usDW8hFUshmn8eVuGWMqg4B7C5LZWw/Wg2QrmoaVjXbM3JBFZmrOz+FqgQWJq5+t7I
 YaPOcvdt/Rc3MbjJkx99C+FtSfajrWtGzCd/3gbzr0KZp6KvpKNvprnBd4HU6xgN7bT1
 5SCxjsdAzmnCsn+WiD17WX6ysc8TcTre0+AFmaPbc0LoD94t8RCUm3HjhLI+BrMZVIpH
 whp5b7QAyhA1W8kNSbSqEOufLVVU8fVlpOP/zwpOiW1dW47fAxkbNwjchxDAhzTlpxnH
 fkdeALLLaMn6u4k7kzJ50g2XIIG8E965SJ8uIu0lNHDc6fV045vrCjEaWXgnanmHJJZY
 TeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=r7yBzrky9isIDkwNYOWcYiIFvp7DVOIxh9G5y1D9XBQ=;
 b=rO5Ckjm1Rt81epUCbumVmrM4POtlFkZloic7UUOSUl3noIDUOG7sozVGVaImsWaDew
 IqiFHDRT+T2En6uYIKBA++yBwn7DHGcqYwXuKAh065tnlM/i0R55YzqXquoPeIXPQJzE
 L76GPAeh4yxv38/J4/V62Mgl/w9pfQwnuUkf60W1MJmmg5wlvhYn7tZZbS3sKT9L8wpN
 u75aCAg7da17jQkKltiRrDBEumY+bkhbT0zsZeemGRdIsa1+M+4tlu8kqkSLFgE24rNv
 m4PB2TiobaGIRWHKqQQMopd9WrnBGOXMkBrDvHMSfJB9gRMuWbQFr0UKjyY5m0PAsMVc
 od9w==
X-Gm-Message-State: APjAAAVPibYn2fqaAkuZG8SrRoQ3L6FtGaWsp1IcqvHqGuzxGtwS6Ut8
 XftFzDq3FyZprsW3X6u6FZ0=
X-Google-Smtp-Source: APXvYqzv0No0diEA1DoLx1b6KestE0Bu3q6K4jZXDVxUtmPpun5145x0dvw4VMRReC+BmBSNqxiP8g==
X-Received: by 2002:a17:902:7288:: with SMTP id
 d8mr59572014pll.341.1577606786514; 
 Sun, 29 Dec 2019 00:06:26 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id r6sm46824501pfh.91.2019.12.29.00.06.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:26 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: claudiu.beznea@microchip.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
 nsaenzjulienne@suse.de, shc_work@mail.ru, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, vz@mleia.com, slemieux.tyco@gmail.com,
 khilman@baylibre.com, matthias.bgg@gmail.com, heiko@sntech.de,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mripard@kernel.org,
 wens@csie.org, jonathanh@nvidia.com, linux@prisktech.co.nz,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 10/32] pwm: zx: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:48 +0000
Message-Id: <20191229080610.7597-10-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000628_236715_B03DD0AB 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Yangtao Li <tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/pwm/pwm-zx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-zx.c b/drivers/pwm/pwm-zx.c
index e2c21cc34a96..0f5e8919b034 100644
--- a/drivers/pwm/pwm-zx.c
+++ b/drivers/pwm/pwm-zx.c
@@ -196,7 +196,6 @@ static const struct pwm_ops zx_pwm_ops = {
 static int zx_pwm_probe(struct platform_device *pdev)
 {
 	struct zx_pwm_chip *zpc;
-	struct resource *res;
 	unsigned int i;
 	int ret;
 
@@ -204,8 +203,7 @@ static int zx_pwm_probe(struct platform_device *pdev)
 	if (!zpc)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	zpc->base = devm_ioremap_resource(&pdev->dev, res);
+	zpc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(zpc->base))
 		return PTR_ERR(zpc->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
