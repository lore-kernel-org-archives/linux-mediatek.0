Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A81EC56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 03:53:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7208A221FC
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 03:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kyzAdHWg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WiYeA9PY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7208A221FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fKHMixOJdHNxFCtJlKiT0X6ohl/k/ZEevVbYHaOmHeA=; b=kyzAdHWg27bQznQkJb1pxzxKo
	mG7YbA8N1EpPxa/blT127i96JDhxYTuzfEGUcCTdBsh8bosL483Nbj9b9+5x8+5y3YMmcJq2jfPJJ
	Bv6rl6BjFSqzd/hKdm/VzFmCC+WEMg+kQ0OrZEN48pEkcAEl7yx7P9zwk+ZMA4/d8vPFB4qdNoAI4
	4m0yt5WOZRjeeXuU3kG+3xlJ5OOu7xW7djMMsTpzaPicLZxtj66VSFc0r6ywRsVhy9wlX2ANKHYmy
	1wIoIfovyXhL0W46jKv9iVB4xK6xQxsDGHm+IToJMP9m/YKzJ/oEXI2kkE0B+VvECwecNCPklk5YB
	k2YK8cm3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfEWy-0001BU-IE; Wed, 18 Nov 2020 03:53:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfEWu-0001AU-8w; Wed, 18 Nov 2020 03:53:13 +0000
X-UUID: 41c8e127be6b4451a98e645ec56a663a-20201117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kF/INCW/2jYXxM9LXFS6EoXUIq77hAmvBpBxqoM7wak=; 
 b=WiYeA9PYRytVY6p5c9gU/8YBSAk0bSP68tCA7ideHpQJX5WPJGQJAV1nwvdnM2YZZmcZootKZF0kuntPtpXBeLqS4Eq4KJrQdxnt1C3E8dp7+psTp9XJnR/c655J8VQj1DgONhnvbwukgLtx/jbm1XTexebE1xw55nX2iyWFly8=;
X-UUID: 41c8e127be6b4451a98e645ec56a663a-20201117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 239118447; Tue, 17 Nov 2020 19:53:03 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Nov 2020 19:49:43 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 11:49:42 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Nov 2020 11:49:43 +0800
Message-ID: <1605671382.23622.8.camel@mtksdaap41>
Subject: Re: [PATCH v5 14/24] clk: mediatek: Add MT8192 imp i2c wrapper
 clock support
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Date: Wed, 18 Nov 2020 11:49:42 +0800
In-Reply-To: <1605667293.8636.5.camel@mtksdaap41>
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
 <1604887429-29445-15-git-send-email-weiyi.lu@mediatek.com>
 <1605667293.8636.5.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_225312_463066_A5A9401D 
X-CRM114-Status: GOOD (  24.28  )
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
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-11-18 at 10:41 +0800, Yingjoe Chen wrote:
> On Mon, 2020-11-09 at 10:03 +0800, Weiyi Lu wrote:
> > Add MT8192 imp i2c wrapper clock provider
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  drivers/clk/mediatek/Kconfig                   |   6 ++
> >  drivers/clk/mediatek/Makefile                  |   1 +
> >  drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c | 119 +++++++++++++++++++++++++
> >  3 files changed, 126 insertions(+)
> >  create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
> > 
> > diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> > index eb549f8..8acc7d6 100644
> > --- a/drivers/clk/mediatek/Kconfig
> > +++ b/drivers/clk/mediatek/Kconfig
> > @@ -515,6 +515,12 @@ config COMMON_CLK_MT8192_IMGSYS
> >  	help
> >  	  This driver supports MediaTek MT8192 imgsys and imgsys2 clocks.
> >  
> > +config COMMON_CLK_MT8192_IMP_IIC_WRAP
> > +	bool "Clock driver for MediaTek MT8192 imp_iic_wrap"
> > +	depends on COMMON_CLK_MT8192
> > +	help
> > +	  This driver supports MediaTek MT8192 imp_iic_wrap clocks.
> > +
> >  config COMMON_CLK_MT8516
> >  	bool "Clock driver for MediaTek MT8516"
> >  	depends on ARCH_MEDIATEK || COMPILE_TEST
> 
> <...>
> 
> > +
> > +static struct platform_driver clk_mt8192_imp_iic_wrap_drv = {
> > +	.probe = mtk_clk_simple_probe,
> 
> Good to have this generic probe function. Now several mtk clk drivers
> are just a few data.
> 
> But this series still add >10 configs for mt8192 clock drivers. Why do
> we need separate configs for clocks of different domain? I don't think
> they need lots of resource. We should review the rationale and reduce
> the numbers. 
> 
Hi Joe,

Thanks for reviewing.

There have been some discussions in patch[1] as to why the subsystem
clocks are now separated by different configs.
And we do need these clocks to be optional on some MediatTek SoC
platform.

I thought it it now a rationale number of subsystem clock provider
drivers. In this series, we have reduced from 23 to 12.

[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/1460621514-65191-5-git-send-email-jamesjj.liao@mediatek.com/


> 
> Joe.C
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
