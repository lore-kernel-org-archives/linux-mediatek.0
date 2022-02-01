Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B9FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 12:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qilFeeA+ArhEXLw+oMKu+hGcbpcPfrlhTnCnjx/S0c=; b=W3AMFEaUoQ4AMx
	6ynU/OuDPS/m+/J/vHJwwv0kO4Q6laRkDUEtz9fPNxM+4o24OXYj4H0swAh6wHjdIw2HLdY0sPPr6
	ibDYzxbDLO9pjk9kTVB0wyW8nWoMrfnxH3wLL2smCdYbV9qu+sxUmdFitVl+kShLj0ZxpGsMx678F
	GtZXNGcphQm7ghcfebAa4heanav73dCS0WSvrLS7hSQ8E3Ar5OyZBgegHC+n6gLbm9dWmUR0X7rjf
	vZZQ192sE5rJ1uGpHKjryGPIrdCpe1tNPkMFe7ECjINDF7UuINL1JmvxObjfk/cWVnoSAjz7kRbiF
	qBYz6uRwle5hH75ULSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nErx2-00BzFt-A2; Tue, 01 Feb 2022 12:08:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEru1-00BxeD-21; Tue, 01 Feb 2022 12:04:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 869FA6131C;
 Tue,  1 Feb 2022 12:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC4CC340FC;
 Tue,  1 Feb 2022 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643717013;
 bh=ivwGxoRB89+AhyONe21DIuW5LDCQ0oy5QMR/jN8ut1M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=koIbWbowa86u/1r+2OMJQNwsohG4mHkjIFv7bejQVnYV3AST+uthS03wdMI1zL/3g
 keo3JM5GtSkXjZRsN9htAnq49Zhm73ZTOGe0BOV3GdQDJkD77l+XAhlL26pqWrG+YY
 XHKQNk0CUtx7vs45R8AP60t0nEuXz7LwMbOOH3/vlW0R53eJiWjH7Vb2Ouwvcg/cmO
 hs/U5Om/63ajNH76ATJuCdejzCdus+ejzryevimpYaCsYH5et9kBPH5PbJGMPmxDjI
 9j5YT3H5KbJeM1aWtC+xyWXf0CIZKYH5X9+xTYOVTeX6AOq39W6mk7ldT1o5ByVMXN
 48GSl3qna0qCw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1nErsh-004d46-AA; Tue, 01 Feb 2022 12:03:31 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH 06/12] gpio: mt7621: Kill parent_device usage
Date: Tue,  1 Feb 2022 12:03:04 +0000
Message-Id: <20220201120310.878267-7-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201120310.878267-1-maz@kernel.org>
References: <20220201120310.878267-1-maz@kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, matthias.bgg@gmail.com,
 grygorii.strashko@ti.com, ssantosh@kernel.org, khilman@kernel.org,
 tglx@linutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 kernel@esmil.dk
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_040453_187944_0F8534E8 
X-CRM114-Status: GOOD (  12.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This gpio controller sets the parent_device field, but doesn't have
any runtime PM functionality. Get rid of it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpio/gpio-mt7621.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index ccaad1cb3c2e..d8a26e503ca5 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -239,7 +239,6 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 
 	rg->chip.offset = bank * MTK_BANK_WIDTH;
 	rg->irq_chip.name = dev_name(dev);
-	rg->irq_chip.parent_device = dev;
 	rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
 	rg->irq_chip.irq_mask = mediatek_gpio_irq_mask;
 	rg->irq_chip.irq_mask_ack = mediatek_gpio_irq_mask;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
