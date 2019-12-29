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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E90C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6D9620722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qFdkqsgD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+5CpJmn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6D9620722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=z5/gHDJ6YGk1QaxkF3L1XsJDn2X+4ctwn2/aUZ66neg=; b=qFdkqsgDK7HaFEInVTuCq/OWDf
	c8jtQTPolwY+pQTlrisyAKrk2umue/c09HHH+1nj7I0459FKZZo97xQDM4+tgrjLeRFZzTnzXyo6X
	yDmJWk3nFojqmQC358yMv6ZTx57Zr+Dq6blFummTeH//zfGni9vhioi0+M1JXwGg11qeTW0yZs+m4
	tR8miNnzkZUuBP2RwRFvS6W+LnFl+Akbz1OyQhXUbsV2+8y6Wo1lRCQH9cbPdERkxelCHaUKjLaxG
	vGhBWfG5lS3tfsxlNBZZm9yXqfSTcRMHp5TpUm/kZggYpyBZLSc3yRE2fmAIb8ofKm/9gwkMK0BT6
	EyTidG5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTms-0005nm-7C; Sun, 29 Dec 2019 08:18:58 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTaz-00018M-GB; Sun, 29 Dec 2019 08:06:43 +0000
Received: by mail-pg1-x544.google.com with SMTP id b137so16613990pga.6;
 Sun, 29 Dec 2019 00:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=upleNgTFfAza3FZg7/9VQrzMx7En/pvAOWEfdB18Fmk=;
 b=r+5CpJmnN4vOgNpA/om76KyWVgPXmGGC6EM7e5tj8W5dRFmK9Jkqc2gpIh53oz+Caa
 LIAb7jx83j8Ef0YXJ+NgKqL+7LJQg65TOGqsZoPIvZ60GJD9V6T1XfllJWEYAOC9zjC4
 e5Fwd3jau7TGVaFrOBgX4MJw717C0exQVM327OITBjJHfTlLyasNoUZW60EPSsKOahBN
 VKs9jK2lf7hwyWdfhUxHR0emWL9IeIGRgxvkc6IgY468vxtmtW34CNrEIahXOtQOhoD5
 xP0Sbw1eW1+RTFzSeJ8/41p7VFsupzRE/i76xGj+KTN0wZvgVjqLudZI1p/vmdak/z7+
 cZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=upleNgTFfAza3FZg7/9VQrzMx7En/pvAOWEfdB18Fmk=;
 b=g7cxpiHudGdUBJIEmF5H8rzlL19YKOcOXxcaUXONtQSIpmuzHXaz1r6wNaacQr4sLQ
 WB5w61WvPKFyvf7BpDYLL/tlaROsZwc3Jcf/ViPPq48Ub6aUzZXKsNQNhwZvQMQjZ9fa
 jfFAaZQNn8OsKz4oNjroHvGvrzj5TCPd00f6cqwX/J1UBBN6/M3wQA8orvK/4BSnTaNT
 UYhrIpzDE8jFxYGEmtuRIw84GOiC2xG3lAjcHfe+T5n2s6+wc8HewhtYhtUZbV0O3kBJ
 b1g+npBQ6fl3GKCUVd7vCR69HYrYgcpXNLetrAS0772AJBYqIAooJLmfBGAEDYUWR/3T
 MLKg==
X-Gm-Message-State: APjAAAUO8DHGo6MpdzZheMt14Zks9pBVZFCDi0RFu5cKQxorRWNCy5K6
 fFz4saXflPF2KWQINjXQxgk=
X-Google-Smtp-Source: APXvYqy4BUrAwHcEQW7eOd+3yd2eT1ZZTaKeli2o7/H94zl8bi+IzfTqBBlbxhAYoRaHMAsNYRzH0A==
X-Received: by 2002:a63:fc01:: with SMTP id j1mr67311075pgi.220.1577606799597; 
 Sun, 29 Dec 2019 00:06:39 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id m6sm19934565pjn.21.2019.12.29.00.06.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:39 -0800 (PST)
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
Subject: [PATCH 21/32] pwm: tiecap: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:59 +0000
Message-Id: <20191229080610.7597-21-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000641_626816_4DB70E1C 
X-CRM114-Status: UNSURE (   9.63  )
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
 drivers/pwm/pwm-tiecap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-tiecap.c b/drivers/pwm/pwm-tiecap.c
index ab38c8203b79..3a9885cce386 100644
--- a/drivers/pwm/pwm-tiecap.c
+++ b/drivers/pwm/pwm-tiecap.c
@@ -196,7 +196,6 @@ static int ecap_pwm_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct ecap_pwm_chip *pc;
-	struct resource *r;
 	struct clk *clk;
 	int ret;
 
@@ -230,8 +229,7 @@ static int ecap_pwm_probe(struct platform_device *pdev)
 	pc->chip.base = -1;
 	pc->chip.npwm = 1;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pc->mmio_base = devm_ioremap_resource(&pdev->dev, r);
+	pc->mmio_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pc->mmio_base))
 		return PTR_ERR(pc->mmio_base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
