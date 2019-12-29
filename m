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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC73C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:19:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BBD920722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:19:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cuM1sZIJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTWO/fAY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BBD920722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iLVhh4gmuEthR4ntA+1ZG+58qmUxwwHyXNXcQ5Q9s6w=; b=cuM1sZIJjvXOi/fhssD6NkLsUw
	z70F2VrEcU7Gd6BSm4TaGjYYuRM3Of6dw9eXpy5ZzEGaGa6/E9sJ5zeyjV1WtKMRna7lu+abBtVJW
	1LKTly7RxlJjwIQ4nHrfzSyx8wLBysyey4U2U0140ERTMDo9lCksNYt6NGpECB1JvMhXOW5vyBw6K
	fEGMBlklJOOYjSoCk7qxbpqee0+6qArPjISOFhExz5zpzxIY5qo4pTJgYlHupUhXXp4cI2NDPOI4q
	/dbfAjd0kzZGIMGRvb4XIskUk6qEcp04a3FH9LjgvZy7RYBoLsZ6PS2xaezQYYKu5dYLaJ0ChQ4qf
	1w4TM2vA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTnW-0006ba-VP; Sun, 29 Dec 2019 08:19:38 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTb4-0001BW-3V; Sun, 29 Dec 2019 08:06:48 +0000
Received: by mail-pg1-x544.google.com with SMTP id z124so16594579pgb.13;
 Sun, 29 Dec 2019 00:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1lmPaKxSSZ+I1fI6kH4nM+jOI/5GejnD0cSqURuaM4w=;
 b=JTWO/fAYYxaETHqpnuKD9DLLTqjCv39Prq8QcLSmKa7TIkCT0aEFEUaPQ1BSJ4gxV6
 vquaHEipI6ZUYuP7CGkLUKsAU/hXO55Nuu23P3ug3YdpMS1wBx5we4jPWkkG1Lj8dE9q
 +TWIwJEqwWbCpBl+tnLhpMT2uPvnHPGc9+Hm/prxi0dEZ/9u1sG8QALPAQL8Da2U41M/
 pYowafpSIYnA2gnaajAJ0yw6Dlcq3JTBCzR8d3bUUdN4Eh6QZM4YvpvHitboPZg1gqRc
 T76q1c9AA6cvzEC1urlM1xY6BVX0ye6OUxu77VOC7sY9WrjVP61g087TepnuO/r0gW+1
 3s5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1lmPaKxSSZ+I1fI6kH4nM+jOI/5GejnD0cSqURuaM4w=;
 b=KjpZnwiO9tIHVmrOrLx6/Vk0GBU7QVJ8BkbKvmzqioYxlbcGuuDVO2/7/XmAgoW0l3
 Qys/HQT+KdGIPvDsxXc+Tb4niMHh+kHBGDoc+lSbmBE3NsAGDFPA4XiFm+CR6CLrujNr
 zO1EwPDI2PF0w11Kj+oSHcbE1cNMMyWPelJH2wx9A6Pji3O2YEJlAynqPiW5fV54MSp4
 8wRb3lNwAgYOvc4dS7bvLYqFGqV7BFjjcyGbbKJUpVtH3iIj5rr2faQSHZ1qNE2Byl6u
 bqHpgeJkJ0MJLPUkQ1XpzcT0X1kC1kGGykiB5bbBz/+CQjC/UCpy6FuWt/XVnASqpWqD
 PFeg==
X-Gm-Message-State: APjAAAWbH5xssmjvv4bBNRjV6BkZceRtntWoMytET56i6o9oELI1TzEV
 e2Pcgten+uBGNGX4ghQfmb8=
X-Google-Smtp-Source: APXvYqzKZtQcfQAWux39vbt7X9KeBIFebdYzJJZStU3j6r/dp630EqJoFMufZdCAEbmgZ86mh155pQ==
X-Received: by 2002:a63:3f4f:: with SMTP id m76mr63383066pga.353.1577606804056; 
 Sun, 29 Dec 2019 00:06:44 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id x21sm45574889pfn.164.2019.12.29.00.06.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:43 -0800 (PST)
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
Subject: [PATCH 25/32] pwm: brcmstb: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:06:03 +0000
Message-Id: <20191229080610.7597-25-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000646_215677_9E5A5BA2 
X-CRM114-Status: UNSURE (   9.48  )
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
 drivers/pwm/pwm-brcmstb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-brcmstb.c b/drivers/pwm/pwm-brcmstb.c
index fea612c45f20..8b66f9d2f589 100644
--- a/drivers/pwm/pwm-brcmstb.c
+++ b/drivers/pwm/pwm-brcmstb.c
@@ -234,7 +234,6 @@ MODULE_DEVICE_TABLE(of, brcmstb_pwm_of_match);
 static int brcmstb_pwm_probe(struct platform_device *pdev)
 {
 	struct brcmstb_pwm *p;
-	struct resource *res;
 	int ret;
 
 	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
@@ -262,8 +261,7 @@ static int brcmstb_pwm_probe(struct platform_device *pdev)
 	p->chip.base = -1;
 	p->chip.npwm = 2;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	p->base = devm_ioremap_resource(&pdev->dev, res);
+	p->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(p->base)) {
 		ret = PTR_ERR(p->base);
 		goto out_clk;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
