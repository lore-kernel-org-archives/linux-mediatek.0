Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E30EC49361
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 06:32:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 597A46128D
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 06:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 597A46128D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UH7buqBggZluRr7b2NX2IzyCB8k5xqlRN3EhSGNsAt8=; b=rqn1k6V/ist1mx
	Zys9TvqhxAgLsDQZkMY46NynvciXmLZchREjb1RHgR7YcBQG+LTuBK1Y98S5ObqEucYps4rEjNay4
	UzFYwGbZvMsEfagFMviWSO+vOmrDDMk7/T8ijRUe5cC8DGcv9px+IBZC2b9RKFz535ZAXHprbfgOh
	D3a54JM4gQCGzZaWuMZ7fIdsmXwhK6ZTSOPM1Vh3IPZvzkmxQCqFFy0z9U4on2dO09ABQm4uqZzSk
	M9VSh49ShuQUIhvVSjYy6bGeiOnMeO0F+8jqdCjQVENvHQwWPFZd/RlpUMBJLVcNFmvSt9ANZF6DH
	+VNN9aCLKDOBp6ufAVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu83V-00Cr5R-UC; Fri, 18 Jun 2021 06:32:41 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu83T-00Cr4V-Gl
 for linux-mediatek@lists.infradead.org; Fri, 18 Jun 2021 06:32:41 +0000
Received: by mail-lf1-x136.google.com with SMTP id p7so14649943lfg.4
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Jun 2021 23:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FcqiM6OKoI9kz5wi4xxOdBHKAWW28rWhb54WENTCYlg=;
 b=as0jcEU2Kw4vkeFE9aQYOArqSa433Qcii85hTVwoWOm1lj5H2Q/pzP+059YsRJhLdC
 eTERXFkcC+sRTzDUKybkwsVujdqr+hY3rO8f4j0L2lPXNbNldXWJ0Xa2hkgr+/X/6xF7
 DmxiDcEMOvsQdahRV0GMXc8McRfczsfsUqGbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FcqiM6OKoI9kz5wi4xxOdBHKAWW28rWhb54WENTCYlg=;
 b=OMOw1Nm5rsyTRz7wDCGWQaw4BvAonBYIDogIuPy6kEsahwk6vXl4qQATokjE8zETU9
 ZyIzRk+yt9NLzbECFBorJ55OIejsKbmXw/g6Pz+ofpvbyV1N/51TRGiFx9RYfBFldC0t
 A0cKpVwNIg/P9tGPb5pFNsiPofFfjP0CFuT00/LM7q6NRSxZLGXOe0/JSe1aF+LnLUWw
 B3ifnMjAFkuRQcS/lLSZuUilFa+v+FqTkVeywprnrSeODQVj4+7RQGyeFHQem1ZSAx6Q
 D02jfvuQRmoA7NL97G4wzESjj3dZVxo8kw/vthLY2i4cZUUEbfkqBZTqX211f6im/OZ3
 hw2g==
X-Gm-Message-State: AOAM530/zm+BlE2Ku0w2Imvu4ZbWyTB6wLT2K0gbT39z9OCctERLRguq
 9NH7vFVxevG1kgQMp81TonwW1yhAMmxGWYc2qRQQ7A==
X-Google-Smtp-Source: ABdhPJz9n25XQXeae5FgmLVYRSWumiYzvEvvgvJUqRLfLsqolm6mHnftZfZe24scZrNt+nSJwTtlDhigDROdPGjiHR4=
X-Received: by 2002:a19:f809:: with SMTP id a9mr1983941lff.342.1623997956967; 
 Thu, 17 Jun 2021 23:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-2-chun-jie.chen@mediatek.com>
 <20210602171201.GA3566462@robh.at.kernel.org>
 <66e017401ab93aa02c5d2bbf11be9589b36649ac.camel@mediatek.com>
 <1f59ed31-4a0e-9719-bf84-1fe4cdd6c57d@gmail.com>
 <162334689784.9598.2709970788186333494@swboyd.mtv.corp.google.com>
 <de082c64-ace3-30b5-7404-1f4b607a83e1@gmail.com>
 <c8e8535cef67adeaefcfe943bbd8287806921e03.camel@mediatek.com>
In-Reply-To: <c8e8535cef67adeaefcfe943bbd8287806921e03.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 18 Jun 2021 14:32:25 +0800
Message-ID: <CAGXv+5HcV6jbyDdZGzRX-2NHMztSONBKxmLxLQX6k+aQrwJ1ww@mail.gmail.com>
Subject: Re: [PATCH v9 01/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of imp i2c wrapper controller
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_233239_598786_BF276076 
X-CRM114-Status: GOOD (  40.40  )
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

On Wed, Jun 16, 2021 at 2:34 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> On Fri, 2021-06-11 at 11:56 +0200, Matthias Brugger wrote:
> >
> > On 10/06/2021 19:41, Stephen Boyd wrote:
> > > Quoting Matthias Brugger (2021-06-08 07:45:49)
> > > >
> > > >
> > > > On 07/06/2021 07:20, Chun-Jie Chen wrote:
> > > > > On Wed, 2021-06-02 at 12:12 -0500, Rob Herring wrote:
> > > > > > > +
> > > > > > > +description:
> > > > > > > +  The Mediatek imp i2c wrapper controller provides
> > > > > > > functional
> > > > > > > configurations and clocks to the system.
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    items:
> > > > > > > +      - enum:
> > > > > > > +          - mediatek,mt8192-imp_iic_wrap_c
> > > > > > > +          - mediatek,mt8192-imp_iic_wrap_e
> > > > > > > +          - mediatek,mt8192-imp_iic_wrap_s
> > > > > > > +          - mediatek,mt8192-imp_iic_wrap_ws
> > > > > > > +          - mediatek,mt8192-imp_iic_wrap_w
> > > > > > > +          - mediatek,mt8192-imp_iic_wrap_n
> > > > > >
> > > > > > Looks to me like these are all the same h/w, but just have
> > > > > > differing
> > > > > > sets of clocks. That's not really a reason to have different
> > > > > > compatibles.
> > > > > >
> > > > > > If you need to know what clocks are present, you can walk the
> > > > > > DT for
> > > > > > all 'clocks' properties matching this clock controller
> > > > > > instance. Or
> > > > > > use
> > > > > > 'clock-indices' to define which ones are present.
> > >
> > > Is the idea to use clock-indices and then list all the clock ids in
> > > there and match them up at driver probe time to register the clocks
> > > provided by the IO region? Feels like we'll do a lot of parsing at
> > > each
> > > boot to match up structures and register clks with the clk
> > > framework.
> > >
> > > If it's like other SoCs then the clk id maps to a hard macro for a
> > > type
> > > of clk, and those hard macros have been glued together with other
> > > clks
> > > and then partitioned into different IO regions to make up a clock
> > > controller. Or maybe in this case, those clk hard macros have been
> > > scattered into each IP block like SPI, i2c, uart, etc. so that the
> > > clock
> > > controller doesn't really exist and merely the gates and rate
> > > control
> > > (mux/divider) for the clk that's clocking some particular IP block
> > > all
> > > live inside the IP wrapper. If it's this case then I hope there are
> > > a
> > > bunch of PLLs that are fixed rate so that the i2c clk doesn't have
> > > to go
> > > outside the wrapper to change frequency (of which there should be
> > > two
> > > "standard" frequencies anyway).
> > >
> > > > > >
> > > > > > Rob
> > > > >
> > > > > Some module is divided to sub-modules which are designed in
> > > > > different
> > > > > h/w blocks for different usage, and if we want to use the same
> > > > > compatible to present these h/w blocks, we need to move the
> > > > > clock data
> > > > > provided by these h/w blocks to dts, but we usually use
> > > > > different
> > > > > compatible to get the h/w blocks data in
> > > > > Mediatek's clock driver, so do you suggest to register clock
> > > > > provided
> > > > > by different h/w blocks using same compatible?
> > > > >
> > > >
> > > > The mapping of them is as following:
> > > > imp_iic_wrap_c:  11007000
> > > > imp_iic_wrap_e:  11cb1000
> > > > imp_iic_wrap_s:  11d03000
> > > > imp_iic_wrap_ws: 11d23000
> > > > imp_iic_wrap_w:  11e01000
> > > > imp_iic_wrap_n:  11f02000
> > > >
> > >
> > > Sure. What is their purpose though? Are they simply a bunch of
> > > different
> > > i2c clks?
> > >
> >
> > That would be need to be answered by MediaTek as I don't have access
> > to any
> > documentation.
> >
> > Regards,
> > Matthias
>
> We describe which clock controllers are exist in dts and
> get the clock data provided by clock controller in driver data
> by matching device compatible.
>
> The clock data contains several clocks which includes the clock index,
> parent clock source and the details of reg control inside the IP block
> of clock controller.
>
> In MT8192 platform, some IP block is divide to several sub-blocks and
> each sub-block provides clock control by itself.

Some more information:

Based on what I read in the datasheets, I'm guessing that MediaTek groups
the I2C controllers into several groups and places them in different parts
of the die. The suffix of imp_iic_wrap_XXX is likely pointing to the
placement of the group. And the imp_iic_wrap_XXX is what the name suggests
a wrapper around the group of I2C controllers. The wrapper contains clock
and reset controls, as well as other things that I can't make out.


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
