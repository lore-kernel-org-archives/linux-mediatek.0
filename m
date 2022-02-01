Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58D9C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 12:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XluZWpoKl/x4+Ci4wgK71UA2lo8A9qzjQtoHbtmbT4o=; b=vxc7QfYtRA6oIE
	zMbZk6SuHBU17210SbhQXlz4TOJ4jf5XqumxfZ8fZHt3wDv9OZiFAwA6ttmWJkipCgJ9n7wvSCeVm
	9GX3qThyBXvqBWvO+dlOVBrJNIlfpRNAiGg1+KewfsbQ+MVHoCtXwBuuJKtx9Uy9XqgAB5VlOdXmt
	lWfOqTcSLXND6dI0/RXfaa/glrzsnMmi8cYJcLzfc7pzaCElaDBgDL6hPmkMXXYxf+mvoKEONW9xb
	Rn4+Uj3mgBkw/QYbspNRWSunPvjl/s2ftLtrIKqfLYBQYXIPN3LY8b8owhTS2jCLZw6EWup+Dd0+c
	lY8jpc56DluGLxKPXeUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nErtM-00BxF7-M8; Tue, 01 Feb 2022 12:04:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nErsn-00Bx2S-LH; Tue, 01 Feb 2022 12:03:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 67A11B82D9D;
 Tue,  1 Feb 2022 12:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D16C340F6;
 Tue,  1 Feb 2022 12:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643717014;
 bh=ilwI/e1ttHjdl7xv7YPOr3xUTctN1SCSeqI4kAUKElM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uxffx4+hJrtA2LBp/3HCvF7Chr3pzY2PaAh9Rf/14mXpPqlHS4xR1e4wW4t1jBEt4
 4P027AejzUZwke716bMW26OvM6EE3W4CkZol6c+Pk2oWIqwuXuER+yHw7GeRxChRmj
 qIFXfzD2tZWRB7SyZ4XFM6vupJQf5zDminaKH+LpITDS9rm9Spwl+sPPfvSB63xQkN
 gN+G08wUArGZsNWbAnCJKrkntfp89yg+rnoLatfDtBOBnkG2bpc4JLdaHRUQgbwATs
 VwApeLfCBiMhT1KglPM7YD46TsoCJHe9V4P61cd3zmRgRh9tLpGJsgprlxVgP2Jifg
 LWlBGER8Lp3yg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1nErsi-004d46-GH; Tue, 01 Feb 2022 12:03:32 +0000
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
Subject: [PATCH 09/12] gpio: tpmx86: Move PM device over to irq domain
Date: Tue,  1 Feb 2022 12:03:07 +0000
Message-Id: <20220201120310.878267-10-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20220201_040337_879158_A9A4054F 
X-CRM114-Status: GOOD (  14.08  )
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
 drivers/gpio/gpio-tqmx86.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 5b103221b58d..fa4bc7481f9a 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -281,7 +281,6 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 		u8 irq_status;
 
 		irq_chip->name = chip->label;
-		irq_chip->parent_device = &pdev->dev;
 		irq_chip->irq_mask = tqmx86_gpio_irq_mask;
 		irq_chip->irq_unmask = tqmx86_gpio_irq_unmask;
 		irq_chip->irq_set_type = tqmx86_gpio_irq_set_type;
@@ -316,6 +315,8 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 		goto out_pm_dis;
 	}
 
+	irq_domain_set_pm_device(girq->domain, dev);
+
 	dev_info(dev, "GPIO functionality initialized with %d pins\n",
 		 chip->ngpio);
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
