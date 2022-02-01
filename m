Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2163C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMXHZ5NlZsCHZy5pSsojMRTu3rQmdFcorD30+BoS+FE=; b=ejm/N8HaCnyL4N
	H5Wts9vzV2KJDMUuoIiEuHDWCr1FNsiWGRzXXtxnFJSbcw1ooSDG/CArcEUcuxYZJJ+Y0QVIcnoD1
	VkU7L2rsbFrnMWXoPtaRMGLGfMq+ioB0u4EuiuAmYzu4Ezxl4GoC+POf4HIrUsxT8JO5k/evMZCgg
	OGzxft195egF9ffKdLiEW51eWX5dldDK/DvmtOdU2/DIwmKICzv12sl2mTb0SpYAY5yNCL5mP5rsq
	RFtJhohdlqiKNLWBNrkUDMgNZRaWZqYPJeDxKRkGu0i7U11RLmmWg6zXzz0YCx1Rq+RKWIBKul9c6
	VdIwyjNxwJgjmf7NE0Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nErwP-00Byyo-4a; Tue, 01 Feb 2022 12:07:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nErtv-00BxZi-Cu; Tue, 01 Feb 2022 12:04:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B71D6152E;
 Tue,  1 Feb 2022 12:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DD8C340ED;
 Tue,  1 Feb 2022 12:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643717012;
 bh=QTDSEgjqP7luf2gRYl6YaKV1lykiDQuMO/rtSnXfIBQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pzn11U8lQ1sbaHCow3r6eDwYc2MZzV4EVDyNLziribjv2My7HV33Ol7cUiYEezoK0
 2CwmjT7tFW6lvCgaKsavTR0fs+5RY0crIroGHo/FDBzKkWXb2Tk5VFCFoH0ePPX8bU
 Zmt4UXLJLHgRJOzqN9u6iI6ZpOvyGY5lvVo9RchKWPmCRfauEVTEbJvZjP03x3nuFj
 zLmqMuok3fZDYAyg8RCGklZihz4kNBbGOTtU+cFWM2vODOtlz5QiIS2kvAuUitjffx
 /1AisSz+WYe9g/h2+aV/0WQ0aFWVshkLJRhrzoulJ6YemrwLQlyxODBXrNeHYv3QIr
 lhBCCz5/kyx9g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1nErsg-004d46-CE; Tue, 01 Feb 2022 12:03:30 +0000
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
Subject: [PATCH 04/12] irqchip/renesas-irqc: Move PM device over to irq domain
Date: Tue,  1 Feb 2022 12:03:02 +0000
Message-Id: <20220201120310.878267-5-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20220201_040448_608667_A4BC8653 
X-CRM114-Status: GOOD (  14.67  )
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
 drivers/irqchip/irq-renesas-irqc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
index 909325f88239..1ee5e9941f67 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -188,13 +188,14 @@ static int irqc_probe(struct platform_device *pdev)
 	p->gc->reg_base = p->cpu_int_base;
 	p->gc->chip_types[0].regs.enable = IRQC_EN_SET;
 	p->gc->chip_types[0].regs.disable = IRQC_EN_STS;
-	p->gc->chip_types[0].chip.parent_device = dev;
 	p->gc->chip_types[0].chip.irq_mask = irq_gc_mask_disable_reg;
 	p->gc->chip_types[0].chip.irq_unmask = irq_gc_unmask_enable_reg;
 	p->gc->chip_types[0].chip.irq_set_type	= irqc_irq_set_type;
 	p->gc->chip_types[0].chip.irq_set_wake	= irqc_irq_set_wake;
 	p->gc->chip_types[0].chip.flags	= IRQCHIP_MASK_ON_SUSPEND;
 
+	irq_domain_set_pm_device(p->irq_domain, dev);
+
 	/* request interrupts one by one */
 	for (k = 0; k < p->number_of_irqs; k++) {
 		if (devm_request_irq(dev, p->irq[k].requested_irq,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
