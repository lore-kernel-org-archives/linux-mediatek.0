Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD25C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 12:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHO3Tw13BKmCUqAk3/7QxvItyHsl50a2wYLndNovNQ0=; b=xTfaO/EU/5Cv/s
	vPSvczkuQuySoNBXAdUwfhtTRfDiSTAocbkKCiUf3n6WsSx0GgX9zcZf9fnzZtUj0sJxyqMevsTp4
	aponk1UFBo0alu/A/3cRKiU9ptMz94KcmIw9HeJqYPu9cBgqcVAz2AE08KdaDoLNtzB3huIoULME6
	m0/X320frm2RKd04ROG7rmfF7iBpncUfko5tj67tVfbizSv4zGD/w/ZidAEG1N+1gIJBoseAsI5/x
	JzPtK/I86ixFRs1o7UEOj349fk4omyzELM+pbGhKjCdkgTnlajKskowiKs7/nMEusjltYrMhpkk7s
	A3EQBuAXionBRNL3vpTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nErt0-00Bx6K-2B; Tue, 01 Feb 2022 12:03:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nErsm-00Bx25-Dj; Tue, 01 Feb 2022 12:03:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 06917B82D94;
 Tue,  1 Feb 2022 12:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BB1C340F4;
 Tue,  1 Feb 2022 12:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643717011;
 bh=YxUhAytU1qz50wvHotC4mB4j7vpAWyADT+uiET7smKE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EE7vyV5SqkuaLLegplb4E6pVIwwq6soYGTYeqAZljIA/qOOiIb4y0QnbWcGysY6Sq
 H+9xwsaJ5HLq2jsHAN9x61D0DICfUqDMc/au/n/fBRhvij9hyvb42SNhd3UUr2dAC7
 2leI7oR+UAkQXOzU1Rb6M0TAP29bS9bFxhdOI0Z29Kt4CX+0DyV4jNE11Gog0DuC0O
 6E4HQLlkenpNfS7PrdeXlQYpAsFX5oDyhln0TuEwdClddRjHKmNHaEHogEIbnbCN1d
 C/P9Hp5oJx4e4OYDmS45zHrSsgxk77iQA8hyb4tcemxYXY2MZjF6zFdwRcqSvBxWD8
 VpAt0rbtS2jBw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1nErsf-004d46-Sj; Tue, 01 Feb 2022 12:03:29 +0000
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
Subject: [PATCH 03/12] irqchip/renesas-intc-gpio: Move PM device over to irq
 domain
Date: Tue,  1 Feb 2022 12:03:01 +0000
Message-Id: <20220201120310.878267-4-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20220201_040336_630915_001A037C 
X-CRM114-Status: GOOD (  15.00  )
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

Move the reference to the device over to the irq domain.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-renesas-intc-irqpin.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-intc-irqpin.c b/drivers/irqchip/irq-renesas-intc-irqpin.c
index 37f9a4499fdb..e83756aca14e 100644
--- a/drivers/irqchip/irq-renesas-intc-irqpin.c
+++ b/drivers/irqchip/irq-renesas-intc-irqpin.c
@@ -508,7 +508,6 @@ static int intc_irqpin_probe(struct platform_device *pdev)
 
 	irq_chip = &p->irq_chip;
 	irq_chip->name = "intc-irqpin";
-	irq_chip->parent_device = dev;
 	irq_chip->irq_mask = disable_fn;
 	irq_chip->irq_unmask = enable_fn;
 	irq_chip->irq_set_type = intc_irqpin_irq_set_type;
@@ -523,6 +522,8 @@ static int intc_irqpin_probe(struct platform_device *pdev)
 		goto err0;
 	}
 
+	irq_domain_set_pm_device(p->irq_domain, dev);
+
 	if (p->shared_irqs) {
 		/* request one shared interrupt */
 		if (devm_request_irq(dev, p->irq[0].requested_irq,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
