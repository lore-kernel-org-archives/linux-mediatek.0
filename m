Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6C4C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 08:30:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CC9E206E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 08:30:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3isE9cDh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JEo04xjD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CC9E206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tk2jILBTIsyey/2PwMEJ1Cfm+GYQ8wDlwlIW71ssgDc=; b=3isE9cDhcqEdZIi+d6dVhs/f9
	uraw2QNm2kTkvIeWm67m485f3iHnZNKk5GJvZOqasY7mgTTYgVS9ouxBYD+AETQHdKzWQqQc4+JL2
	hvO8xJg3uh/v3MAQH0+pOK4Xf2Ju45P4/wuwbqpP91H1wdKIrT5e/jRzGLzqPpI2H32fAVqiBbiPH
	fzv9cD0x7mB17pF78ogheXItBbbZB2mbC2J8K7V0HdmOuEKs5fNaoS+TjIQGIavhPSzoABKOlRqpo
	4U0ofCIf+YhCaaMEdkwR1buZf2kWLnH3BWsJWKfcRP7ZlMEPYejuDlAHxpvjWLCe2sPXUodp1/c/6
	0RhEpbFyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Vqx-0000Cw-SO; Mon, 03 Aug 2020 08:29:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Vqu-0000BT-Cj; Mon, 03 Aug 2020 08:29:49 +0000
X-UUID: 94700880e51a447ba0b08b1a9e749672-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=EuuyH2OVGmIhL/U3X6SY1BLzxNovAUS15W1lABzBFs0=; 
 b=JEo04xjD0JDyd4pfKxqCnA10Gh276qX9+c+0J29zY6ug5ZRwjeOGJPdq8rnw45o3qGSG7o9cnA6mi2T+T+K1IXGtgQW79E63Q26z4voGvtd/RASfsdg/jBhMrqKZUVpxqY6Cje02zeZPo92TgekHdQe8dy9DVPZYYpyKeI7pHsE=;
X-UUID: 94700880e51a447ba0b08b1a9e749672-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 477312050; Mon, 03 Aug 2020 00:29:36 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 01:29:39 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 16:29:37 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 16:29:37 +0800
Message-ID: <1596443379.31084.3.camel@mtksdaap41>
Subject: Re: [PATCH 1/8] mfd: mt6358: refine interrupt code
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Mon, 3 Aug 2020 16:29:39 +0800
In-Reply-To: <20200727154840.GY1850026@dell>
References: <1595509133-5358-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1595509133-5358-2-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20200727154840.GY1850026@dell>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_042948_558395_1066D4FA 
X-CRM114-Status: GOOD (  23.61  )
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
Cc: devicetree@vger.kernel.org, Josef
 Friedl <josef.friedl@speed.at>, srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, hsin-hsiung.wang@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, 2020-07-27 at 16:48 +0100, Lee Jones wrote:
> On Thu, 23 Jul 2020, Hsin-Hsiung Wang wrote:
> 
> > This patch refines the interrupt related code to support new chips.
> 
> Refines in what way?
> 
> What makes this better?
> 

Thanks for the comment. I will add more information into comment message
based on my below explanation.

> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >  drivers/mfd/mt6358-irq.c        | 65 ++++++++++++++++++++++++-----------------
> >  include/linux/mfd/mt6358/core.h |  8 ++---
> >  2 files changed, 41 insertions(+), 32 deletions(-)
> > 
> > diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
> > index db734f2..4b094e5 100644
> > --- a/drivers/mfd/mt6358-irq.c
> > +++ b/drivers/mfd/mt6358-irq.c
> > @@ -13,7 +13,9 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >  
> > -static struct irq_top_t mt6358_ints[] = {
> > +#define MTK_PMIC_REG_WIDTH 16
> > +
> > +static const struct irq_top_t mt6358_ints[] = {
> >  	MT6358_TOP_GEN(BUCK),
> >  	MT6358_TOP_GEN(LDO),
> >  	MT6358_TOP_GEN(PSC),
> > @@ -24,6 +26,13 @@ static struct irq_top_t mt6358_ints[] = {
> >  	MT6358_TOP_GEN(MISC),
> >  };
> >  
> > +static struct pmic_irq_data mt6358_irqd = {
> > +	.num_top = ARRAY_SIZE(mt6358_ints),
> > +	.num_pmic_irqs = MT6358_IRQ_NR,
> > +	.top_int_status_reg = MT6358_TOP_INT_STATUS0,
> > +	.pmic_ints = mt6358_ints,
> > +};
> 
> Dynamically assigned driver data is usually preferred.
> 
> Why have you gone static?
> 

Do you consider the memory allocation?
Below modification is to assign necessary data dynamically and the code
will become longer with more chips if we assign every member of the
structure.

@@ -180,17 +190,18 @@  int mt6358_irq_init(struct mt6397_chip *chip)
               int i, j, ret;
               struct pmic_irq_data *irqd;

-              irqd = devm_kzalloc(chip->dev, sizeof(*irqd),
GFP_KERNEL);
-              if (!irqd)
-                              return -ENOMEM;
+             switch (chip->chip_id) {
+             case MT6358_CHIP_ID:
+                             chip->irq_data = &mt6358_irqd;
+                             break;

-              chip->irq_data = irqd;
+             default:
+                             dev_err(chip->dev, "unsupported chip: 0x%x
\n", chip->chip_id);
+                             return -ENODEV;
+             }

                mutex_init(&chip->irqlock);
-              irqd->top_int_status_reg = MT6358_TOP_INT_STATUS0;
-              irqd->num_pmic_irqs = MT6358_IRQ_NR;
-              irqd->num_top = ARRAY_SIZE(mt6358_ints);
-
+             irqd = chip->irq_data;
               irqd->enable_hwirq = devm_kcalloc(chip->dev,

irqd->num_pmic_irqs,

sizeof(*irqd->enable_hwirq),

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
