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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F9AC2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:19:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9D5320722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:19:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j3kytV0J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/JzGOtp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9D5320722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PTfIp2jed+uc3HR+FO4TG9TQ0FaPIuI2Hzg7JKcNuxM=; b=j3kytV0JJbx/FH/6508xu0QQ1S
	oPSPXEbQiTrlqafh/6lOvT+gkMWY/3RDCMCBjuuY4s/ShoQ4NlzphXtiN54XP2mpfx5x1EwEq+P95
	rBqFLrWLs0TI0Ku+pBJi49B5arZKzsJ5kow+ZLyCRTpG0RMBeE38FdyLdtwGZyupco8WpOxXJiew0
	UB1FBiN/TJz5f43gQBhpN4vcHVaW7EdHBzs62sSLXquZYBtWLaqPJ6rTny7A4YnHPKYZxTv8dNY8R
	olgvzEq4/9qw05sfpJopAnLoCK1TBsPqWs+BACN6D2Sd4KV8OcYFAgP9bpDUFqTvbHwFdWphfeZ8y
	L9EfeXrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTnh-0006pu-2X; Sun, 29 Dec 2019 08:19:49 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTb5-0001Dm-TR; Sun, 29 Dec 2019 08:06:49 +0000
Received: by mail-pf1-x443.google.com with SMTP id q8so16881822pfh.7;
 Sun, 29 Dec 2019 00:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zcHD+rWT+BbboeyvNLj2n3ooAcJQzfyFO4UCzDGkuhw=;
 b=E/JzGOtpfinHn+r6Nqt4BI5pFks+bjbqVron4JoRxP94w0UIFIVAEzNAykvpZoDTHG
 YdpP4wRAK6M/FQIdpYYxzBLZOmoog2O1Y40cOyLcpnDo/2O9fxR4NFzOaZ1x0EmaujHB
 Vov8M5Z25EwOhuPEoRoEFu/dM5gTDeGkLvqCDdPZaObFIo5vY7JIpHeZfiIFIeDhprQE
 u04G5AatFvvQ7aoNiA0/W7lgxLSTfHxFlafECN0owOb2uTbRi1abpNLb+TGTQxNmryPh
 gpocdwGzgwwZYgjXfmEJf96i9Gz2VuYiig3Dzl2RXfsSMky3WavexL5Kr3R4FWeDNl3p
 DeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zcHD+rWT+BbboeyvNLj2n3ooAcJQzfyFO4UCzDGkuhw=;
 b=PY3x46GF+VgzfNawl/5NXPNQ/A6X1vkN1stJ8TJ6rxrd0bTiMQvx+RhiWCd6JJ9cUV
 hXope451nSDAgC53VRXNtKMkXKzGVwo+uOqij5iJ6GFufO/rsQrunatSHg+xTqQNX+h7
 Y2McX1vzaiMl8pc2OSzfwyFHUP5rBht7vdm+J7s0cwxckK6YeeGuFy4Zyi70UZnhBnzW
 81bhRlII6v2hnMrnqPjeA2mJ5guKM+djy5wH/aklRR6Bc0Y9ZMplVXQLtyG0dv+3hNSh
 zoAmEZ6COCoBWlH4tvuqyu45yJq6xkKsw8yhsDZF2/gOmHvtHEo1tcaYqLQz+YCxVKE5
 OAWQ==
X-Gm-Message-State: APjAAAXTmOmL8eEN3f2ZxWBCicx1GCIQyPXJruViUNCdmEEKBDuVUKVh
 F1s2NAlF2npwbiiTvGN8HqU=
X-Google-Smtp-Source: APXvYqwWymCsuMsS6doL78LFT042zKrJjX+UYK0FXE7pm0oZc+RfEaCYhPRMzd55UCYO0aSn6F1J+A==
X-Received: by 2002:a63:134e:: with SMTP id 14mr65912691pgt.115.1577606806183; 
 Sun, 29 Dec 2019 00:06:46 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id a9sm19507006pfn.38.2019.12.29.00.06.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:45 -0800 (PST)
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
Subject: [PATCH 27/32] pwm: clps711x: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:06:05 +0000
Message-Id: <20191229080610.7597-27-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000648_016421_15BA066B 
X-CRM114-Status: UNSURE (   9.21  )
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
 drivers/pwm/pwm-clps711x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-clps711x.c b/drivers/pwm/pwm-clps711x.c
index 924d39a797cf..e69a5877cec6 100644
--- a/drivers/pwm/pwm-clps711x.c
+++ b/drivers/pwm/pwm-clps711x.c
@@ -113,14 +113,12 @@ static struct pwm_device *clps711x_pwm_xlate(struct pwm_chip *chip,
 static int clps711x_pwm_probe(struct platform_device *pdev)
 {
 	struct clps711x_chip *priv;
-	struct resource *res;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->pmpcon = devm_ioremap_resource(&pdev->dev, res);
+	priv->pmpcon = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->pmpcon))
 		return PTR_ERR(priv->pmpcon);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
