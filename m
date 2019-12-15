Return-Path: <SRS0=PXBb=2F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE01DC43603
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:56:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A930F24679
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:56:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NfCbpQ8L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUB0KVQA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A930F24679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZACjpzh+SiKQOyTY1u4VvRQ4a/5ZAiEQ57dJ40QwEGc=; b=NfCbpQ8LJxrcY9GpM8yZaKWBOV
	o0J+tH13Cg5dH6iq4PzH0RMOnht6z72LK7mzM6bvh8HYWpjMqFSFQz7wXqPc7Q19XFlKVk/XWVG1k
	jepQkPINcBNc9DtL3UjX2Y5XYS2m8p+HAapgjb8McjVPtXra/prE51RxhCtBTztQa/Ogwp47qu7MO
	hXztTJzBWEn4738whrUuEHbrZyO0sEAj9FrgPxR7B4flImybtCai/2VwGTnohngM6Cy0EvhIaSYh2
	Zv/AMr7xDrJBhaZK/ckiDRtX+oASPEGWCOYw99Udz3tIZwG6j3jvtTw/O1n0GGGAi8z/bA1mfOHhN
	yOKVLYWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igY8R-0000nY-6q; Sun, 15 Dec 2019 17:56:51 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igY3d-0003qd-1i; Sun, 15 Dec 2019 17:51:56 +0000
Received: by mail-pl1-x643.google.com with SMTP id g6so3451908plp.7;
 Sun, 15 Dec 2019 09:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/cz4vRUnbRV9SZ3G6wT7uGNBKfnOEqLWr9ZhQq3aPJY=;
 b=VUB0KVQAHEHprXd8JPg/0jED90d4vxehQR5oM13rBTaAw8YxpSr2SHoeE4jGTI7E22
 9CU2zoUYjBTnG3V+h4FvWpk0N4jlhpjp3RLjpQqDiDyO3pz0inFoNokv0y6Fsu0Awb+b
 M7s6Pjtbd8WVa7wOSJJuhjTi8zjBu2AzhoYEhH4fmQZO8q7pTFpxAYhgqOwQ4eb0W5aG
 zmAXTggqqLYOk2JsO0UFqjCtuNRE80TkubJxiCWtarkBSzlpDy5d5eZOKISXqW7sd+ap
 kPsjx2a3CPqG9IkXh3otL1pUVKFSZOoFGepy/lTbYnDJhLyZkz4V+bsRjFtnTv1ABJz3
 6zqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/cz4vRUnbRV9SZ3G6wT7uGNBKfnOEqLWr9ZhQq3aPJY=;
 b=DzAQhV7W/31HWtDn9jEfwhGAUVeioOedGsYLg4wXu+C2e6hKSB4BWKBLY4ow735L4T
 msybYdhI+CgdERjujO7hPq4U0HlpEOs47qyTaq/NsW6yPT1dXbN9+fIC+Qn3Co9rNAdg
 3SsCaYcCWZiiHwuYgm1VVgK3WwSPrljPSD1dqsO72KFHX2HffXIH+8rYb6yUhNhHhoDp
 fV9IVO8j2AUa1b75SZXzTjfJn5VWg9DPkAqYkUY6PJZ6aa8jV4csBTXhdUAOH+t/M9tn
 /jmAfp1Kbop9n86ySYA0wfxRyoZJ/40GiYsdMiyx5xIe14/6C3FINmag8Gn61keE6mPn
 mG+w==
X-Gm-Message-State: APjAAAX2AWwfg66NvdjPWz8Fi7+OeGkBG+MgqX42d5QVICYzMY7Cb/eF
 1/bu9Fd27ENXWswWadb9vF8=
X-Google-Smtp-Source: APXvYqwynwF10fAEJxkpOjzXrYzf6q0kcA5H9tyhmFPNupU2grFmbw3V9ozwvElSbTNjK4798iHyCA==
X-Received: by 2002:a17:902:d708:: with SMTP id
 w8mr11897094ply.280.1576432312130; 
 Sun, 15 Dec 2019 09:51:52 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id h3sm19102447pfr.15.2019.12.15.09.51.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Dec 2019 09:51:51 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: manuel.lauss@gmail.com, ulf.hansson@linaro.org, khilman@baylibre.com,
 chaotian.jing@mediatek.com, matthias.bgg@gmail.com, nico@fluxnic.net,
 adrian.hunter@intel.com, agross@kernel.org, bjorn.andersson@linaro.org,
 ben-linux@fluff.org, jh80.chung@samsung.com, vireshk@kernel.org,
 mripard@kernel.org, wens@csie.org, wsa+renesas@sang-engineering.com,
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
 yamada.masahiro@socionext.com, tglx@linutronix.de, allison@lohutok.net,
 yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
 linus.walleij@linaro.org
Subject: [PATCH 13/13] mmc: au1xmmc: switch to platform_get_irq
Date: Sun, 15 Dec 2019 17:51:20 +0000
Message-Id: <20191215175120.3290-13-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191215175120.3290-1-tiny.windzz@gmail.com>
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_095153_119417_DAA6CCC7 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: Yangtao Li <tiny.windzz@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

platform_get_resource(pdev, IORESOURCE_IRQ) is not recommended for
requesting IRQ's resources, as they can be not ready yet. Using
platform_get_irq() instead is preferred for getting IRQ even if it
was not retrieved earlier.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mmc/host/au1xmmc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/au1xmmc.c b/drivers/mmc/host/au1xmmc.c
index bc8aeb47a7b4..8823680ca42c 100644
--- a/drivers/mmc/host/au1xmmc.c
+++ b/drivers/mmc/host/au1xmmc.c
@@ -984,12 +984,9 @@ static int au1xmmc_probe(struct platform_device *pdev)
 		goto out2;
 	}
 
-	r = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "no IRQ defined\n");
+	host->irq = platform_get_irq(pdev, 0);
+	if (host->irq < 0)
 		goto out3;
-	}
-	host->irq = r->start;
 
 	mmc->ops = &au1xmmc_ops;
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
