Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEB3C10F25
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 03:49:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2FAA215A4
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 03:49:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FaOva+0k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qXsTTh3r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2FAA215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWAOicOWO6Ft5pKbjvs0WUjP2yuKiYndpqJcaY1DNKI=; b=FaOva+0ka4e9k2
	MkKCtIm+glj8olUq7JjgxylomkZUb2Qaq6Z4JNPOvhUmr3xNlrBTGtotXMw9gqQMJ3TabT4uQFMqT
	MZGgIpihf0W9oL7t08XpYeI2ZdI2sT8IS7QaL7NNCG3vgAqFNd8zH1lU9RXBY39azCv7P7/hjJcz6
	frBXPdGYrGLST3Esm1KnFoGuelLWRlSu00F3gOpm5vKEx0TftwofJiFxrr+C0q4L8mIitOPHTDPyh
	snuZdhtFCnpdmnmB4K1xj9FEeAvx4COvr4+Vjcmf1jOXSdma0z9ucCO1/1IVX0VVnYQgTaDjMEowu
	WvB5LcHH8vWud1/Pb3Kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBsMn-0005uN-Sb; Wed, 11 Mar 2020 03:49:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBsMW-0005e8-3O; Wed, 11 Mar 2020 03:48:53 +0000
X-UUID: 9c16a21819a3455881486ae2bb588844-20200310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cMby1nCgA1pDUmKWXFEsXyQ9QhGgBEre690yHGxnHko=; 
 b=qXsTTh3r0gGGJwE3in7s8hEI7gDm3EFS8mST4H1eGhl+D6/GzUo75Wfc2Y4HtGZlW7rnTQ49Nq2Tr1+/H6n29TO+8JyVQdtVKxq1GlZ/1o3/9gGeOlB9m4w6atDhFDO4IqNJnsoOJONLxB3utkv+JKG1VwV6yZcAtu8l+Zzhxe8=;
X-UUID: 9c16a21819a3455881486ae2bb588844-20200310
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1092678057; Tue, 10 Mar 2020 19:48:49 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Mar 2020 20:48:54 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 11:47:13 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 11:47:48 +0800
Message-ID: <1583898520.17060.1.camel@mtksdaap41>
Subject: Re: [PATCH v9 3/5] mfd: Add support for the MediaTek MT6358 PMIC
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 11 Mar 2020 11:48:40 +0800
In-Reply-To: <CANMq1KDF32v-YnFRcz8BT6tnD0yq2OOBy9t-R09yA+4zNUZj3A@mail.gmail.com>
References: <1583835040-19157-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1583835040-19157-4-git-send-email-hsin-hsiung.wang@mediatek.com>
 <CANMq1KDF32v-YnFRcz8BT6tnD0yq2OOBy9t-R09yA+4zNUZj3A@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_204852_149274_CFF37EF7 
X-CRM114-Status: GOOD (  21.85  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, Frank
 Wunderlich <frank-w@public-files.de>, Josef Friedl <josef.friedl@speed.at>,
 Ran Bi <ran.bi@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Sebastian Reichel <sre@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Richard Fontana <rfontana@redhat.com>,
 Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 Lee Jones <lee.jones@linaro.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
Thanks for the review.
I will fix the mistake in the next version.

On Wed, 2020-03-11 at 11:24 +0800, Nicolas Boichat wrote:
> Thanks, much better. Just one issue left.
> 
> On Tue, Mar 10, 2020 at 6:10 PM Hsin-Hsiung Wang
> <hsin-hsiung.wang@mediatek.com> wrote:
> >
> > This adds support for the MediaTek MT6358 PMIC. This is a
> > multifunction device with the following sub modules:
> >
> > - Regulator
> > - RTC
> > - Codec
> > - Interrupt
> >
> > It is interfaced to the host controller using SPI interface
> > by a proprietary hardware called PMIC wrapper or pwrap.
> > MT6358 MFD is a child device of the pwrap.
> >
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >  drivers/mfd/Makefile                 |   2 +-
> >  drivers/mfd/mt6358-irq.c             | 238 +++++++++++++++++++++++++++++
> >  drivers/mfd/mt6397-core.c            |  55 ++++++-
> >  include/linux/mfd/mt6358/core.h      | 158 ++++++++++++++++++++
> >  include/linux/mfd/mt6358/registers.h | 282 +++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/mt6397/core.h      |   3 +
> >  6 files changed, 733 insertions(+), 5 deletions(-)
> >  create mode 100644 drivers/mfd/mt6358-irq.c
> >  create mode 100644 include/linux/mfd/mt6358/core.h
> >  create mode 100644 include/linux/mfd/mt6358/registers.h
> >
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index b83f172..9af1414 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -238,7 +238,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC)        += intel-soc-pmic.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)     += intel_soc_pmic_bxtwc.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)     += intel_soc_pmic_chtwc.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)  += intel_soc_pmic_chtdc_ti.o
> > -mt6397-objs    := mt6397-core.o mt6397-irq.o
> > +mt6397-objs                    := mt6397-core.o mt6397-irq.o mt6358-irq.o
> >  obj-$(CONFIG_MFD_MT6397)       += mt6397.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)     += intel_soc_pmic_mrfld.o
> >
> > diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
> > new file mode 100644
> > index 0000000..0b99a39
> > --- /dev/null
> > +++ b/drivers/mfd/mt6358-irq.c
> > @@ -0,0 +1,238 @@
> > [snip]
> > +static irqreturn_t mt6358_irq_handler(int irq, void *data)
> > +{
> > +       struct mt6397_chip *chip = data;
> > +       struct pmic_irq_data *mt6358_irq_data = chip->irq_data;
> > +       unsigned int bit, i, top_irq_status;
> > +       int ret;
> > +
> > +       ret = regmap_read(chip->regmap,
> > +                         mt6358_irq_data->top_int_status_reg,
> > +                         &top_irq_status);
> > +       if (ret) {
> > +               dev_err(chip->dev,
> > +                       "Failed to read status from the device, ret=%d\n", ret);
> > +               return IRQ_NONE;
> > +       }
> > +
> > +       for (i = 0; i < mt6358_irq_data->num_top; i++) {
> > +               for (i = 0; i < mt6358_irq_data->num_top; i++) {
> 
> Only one loop needed.
> 
> > +                       bit = BIT(mt6358_ints[i].top_offset);
> > +                       if (top_irq_status & bit) {
> > +                               mt6358_irq_sp_handler(chip, i);
> > +                               top_irq_status &= ~bit;
> > +                               if (!top_irq_status)
> > +                                       break;
> > +                       }
> > +               }
> > +       }
> > +
> > +       return IRQ_HANDLED;
> > +}
> > +
> > +static int pmic_irq_domain_map(struct irq_domain *d, unsigned int irq,
> > +                              irq_hw_number_t hw)
> > +{
> > +       struct mt6397_chip *mt6397 = d->host_data;
> > +
> > +       irq_set_chip_data(irq, mt6397);
> > +       irq_set_chip_and_handler(irq, &mt6358_irq_chip, handle_level_irq);
> > +       irq_set_nested_thread(irq, 1);
> > +       irq_set_noprobe(irq);
> > +
> > +       return 0;
> > +}
> > [snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
