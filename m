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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351A1C2D0CE
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:19:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02EA620722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n7jvewXo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcjs/+PL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02EA620722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KbVpZKimHNzilYeCHoPSHDxoWfXTr+kJclnS4zGIfb4=; b=n7jvewXoHbXS0yz5cOCKgQca0H
	eXHaMUpAJfyPV5eTaLQVc+7ZuRhFzUEnnM80YPgap0/q+WrQ2+5HJVZfZqUQHZrxd1d5euPsfycyd
	FTH6GxYexBgpxXyGZmEcKk/7sogP4Ps7uTgqy+HqhB+DrRqXOahcGtNLITlFFzsz3dy5ae1AUP4LE
	HI8slnBHvsxAw05At0cry3zD8Zh/jf03l3DO+WpCr2DWLdFQW+UmROBXsoskU8y0gUXx0Nkqry/l9
	OIw2iXj3hNJ8c/BVReCspv4FCgk5i1CWQGCIlCNk5pQbrq8/Fg5L8tVqrWQJiQ6cAr5oH8IxRg0vj
	VyQJ/1LQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTnZ-0006ec-3z; Sun, 29 Dec 2019 08:19:41 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTb2-0001Ar-LW; Sun, 29 Dec 2019 08:06:46 +0000
Received: by mail-pf1-x442.google.com with SMTP id w62so16880061pfw.8;
 Sun, 29 Dec 2019 00:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7C9csqsnQvcsncB7BFqdTNUWmGo/VsO+LA8tqtfgkPA=;
 b=jcjs/+PLV2JXKvRK5ziMpwAysMkDPC8s9r4UV5yKxf4yhxZbU8xB5E75T6G/P7ulXb
 jMY8puOpg9UcDUg+10rYov5RFZx8U6pvz4XAD5KpWg1cX8Siwjtz26KDB7AsB2gVNtQq
 CdAnqGPr372cK1kcSr9c2X17LwY8wOcSstoRm94NWpcEYAserNiA/w0Fz2JVpBDTPH3+
 ZA0RD/rOJvts3a0XWraMURs26hCaQ8lK+tQcN5PLYuiY9GrIdZaJdFguQV38dmJ+UQmc
 I+hhBYo+RfLtod0vQrpGTa2vLgx4GA/hKk8mkWnVqFHW1XLgE+QVEHR369nWbR8cE3fo
 iL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7C9csqsnQvcsncB7BFqdTNUWmGo/VsO+LA8tqtfgkPA=;
 b=HigiZ3wUCrmi/EILaph9vLqirnS9orkhsJpbpQUB3Ejwil9vDkamb6ebj7Crx9GKLE
 eqMEx3LfxaHd58RcwE5JiDkE8KSf3ZPKqJlLlVz0iW71n6wlj+tcyWvwbHh/M00pzSsX
 XETV0WQs1TDRNWR5eHAvp4TlUYzolEZJy8D2aW0l4tSn8ZqclII3Zr2pSYtNwS2/3Y8O
 IqkLGBN+6gVyqrdsXxQa/dTSk1LdaxD8IUoSI6ljlbxp2zov1v7dYUkKZ0g3uxYUU58L
 stvBqOCe0rzOjkoNb2Hb13jXQuSWGsD7aXkq03LYiRSNAXyGd3QGU7hNeGc375t2g9QE
 gfVg==
X-Gm-Message-State: APjAAAX3la+eE7UTp8p576nE0uTF+h5Lb3PFr2n95PcqDu2Lmke7kAEh
 vuLSosTxNh+ERpAwzPoKfFo=
X-Google-Smtp-Source: APXvYqzUdmO2Rv7imffzZ5diTgtjXIZc+zetWCpfjNYcI++CXUFajSDwDRs8JEjaQLkbgWwatBbprA==
X-Received: by 2002:a62:a515:: with SMTP id v21mr65261927pfm.128.1577606801886; 
 Sun, 29 Dec 2019 00:06:41 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id d21sm16349375pjs.25.2019.12.29.00.06.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:41 -0800 (PST)
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
Subject: [PATCH 23/32] pwm: berlin: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:06:01 +0000
Message-Id: <20191229080610.7597-23-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000644_840357_485839A7 
X-CRM114-Status: UNSURE (   8.99  )
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
 drivers/pwm/pwm-berlin.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-berlin.c b/drivers/pwm/pwm-berlin.c
index b91c477cc84b..fe405289e582 100644
--- a/drivers/pwm/pwm-berlin.c
+++ b/drivers/pwm/pwm-berlin.c
@@ -186,15 +186,13 @@ MODULE_DEVICE_TABLE(of, berlin_pwm_match);
 static int berlin_pwm_probe(struct platform_device *pdev)
 {
 	struct berlin_pwm_chip *pwm;
-	struct resource *res;
 	int ret;
 
 	pwm = devm_kzalloc(&pdev->dev, sizeof(*pwm), GFP_KERNEL);
 	if (!pwm)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pwm->base = devm_ioremap_resource(&pdev->dev, res);
+	pwm->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pwm->base))
 		return PTR_ERR(pwm->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
