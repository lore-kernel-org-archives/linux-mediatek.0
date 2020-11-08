Return-Path: <SRS0=xa7l=EO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F3CC4742C
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2020 16:24:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2672208B6
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2020 16:24:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uj5RHYKr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xZeW3GZj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2672208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ncE9nS6uHZXdehC1jb5I1tX0DlHJ7VdBcV1IdoI2634=; b=uj5RHYKrUJb9SHOuNE9ZrZ+To
	ybE9e6wmbcqAhRD90scEewL0EHfEae6gcJDBVtG0ZyXeOuRevwzRTsPEleqFHmAuG6+X62tu98VBP
	7UenxViK6U5sQMyqdyJwBdZ4W+1XIATqWn8k0ziI/bMzeWqyaVESxo2vryShY9fGH+NjZ5aO+BbPP
	Rz8KhfTu8Tt4vU5UwM9Aq4dJcQVSKuAO1mVjc58kvcHxItUymuqSe4FIbjZMOosWJPe7R2Ft5yAVs
	kCL6Wtea/oXtF7I/jC2uJ3jxACssa8KXdBFt8XQ+7MsOIsYD9y28g9RP78wo3jf2DR5EngiX5wck7
	FCxDOR/zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbnU2-00081V-LL; Sun, 08 Nov 2020 16:24:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbnTy-00080V-TK; Sun, 08 Nov 2020 16:23:59 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED226208B6;
 Sun,  8 Nov 2020 16:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604852635;
 bh=avBVJRnkd7Xw7yPfPzdT/w2Ilk+ZbHTnHDLOiYSuk1M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=xZeW3GZjrpTZY/b5Slt348II/ReXiYPkl27WWHfiYzP093VzGFnkMwRCzwW2E3Xl7
 2aP/y3w+02WcSNvd4to5ETYmZKZfHPrqVUPFboJRCgswI8ysk5rVbO+RdgmY/sgIM6
 eO5MrjojHnkgKsrk7GHVOX+BOdrKMJvUsF6rIvzg=
Date: Sun, 8 Nov 2020 16:23:49 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v7 0/3] iio: adc: mt6360: Add ADC driver for MT6360
Message-ID: <20201108162317.598ae8cc@archlinux>
In-Reply-To: <20201101154019.39932a2e@archlinux>
References: <1603181267-15610-1-git-send-email-gene.chen.richtek@gmail.com>
 <20201101154019.39932a2e@archlinux>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_112359_082487_A2189D23 
X-CRM114-Status: GOOD (  22.22  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 matthias.bgg@gmail.com, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 1 Nov 2020 15:40:19 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> On Tue, 20 Oct 2020 16:07:44 +0800
> Gene Chen <gene.chen.richtek@gmail.com> wrote:
> 
> > In-Reply-To: 
> > 
> > This patch series add MT6360 ADC support contains driver, testing document
> > and binding document
> >   
> Hi Gene,
> 
> Other than that small edit needed in the dt binding this is stalled on
> the label code getting upstreamed into the core.
> 
> I've asked Cristian to repost that so hopefully we can resolve that dependency
> and get this merged fairly soon.
> 
> For the dt thing I can just drop the description entirely, but would prefer
> if you sent a v8 fixing the tags issue Rob pointed out and also fixing that
> description.
I've tweaked as described and applied to the togreg branch of iio.git and
pushed out as testing for the autobuilders to poke at it more than I do.

Thanks,

Jonathan

> 
> Thanks,
> 
> Jonathan
> 
> > Gene Chen (2)
> >   dt-bindings: iio: adc: add bindings doc for MT6360 ADC
> >   Documentation: ABI: testing: mt6360: Add ADC sysfs guideline
> >   iio: adc: mt6360: Add ADC driver for MT6360
> > 
> >  Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360                 |   78 ++
> >  Documentation/devicetree/bindings/iio/adc/mediatek,mt6360-adc.yaml |   34 
> >  drivers/iio/adc/Kconfig                                            |   11 
> >  drivers/iio/adc/Makefile                                           |    1 
> >  drivers/iio/adc/mt6360-adc.c                                       |  372 ++++++++++
> >  5 files changed, 496 insertions(+)
> > 
> > changelogs between v1 & v2
> >  - adc: use IIO_CHAN_INFO_PROCESSED only
> >  - adc: use devm_iio_triggered_buffer_setup
> >  - adc: use use s64 to record timestamp
> > 
> > changelogs between v2 & v3
> >  - Rearrange include file order by alphabet
> >  - Set line length constraint below 100
> >  - Add Document for testing adc sysfs node guideline
> >  - Set compiler 64 bit aligned when handle iio timestamp
> > 
> > changelogs between v3 & v4
> >  - Fix sysfs guideline description
> >  - Replace iio channel processed by raw/scale/offset
> >  - Add comment of read adc flow for special HW design
> > 
> > changelogs between v4 & v5
> >  - Rename dt-bindings aligned to file name
> >  - Aligned sysfs node name with driver and add VBUSDIVX description
> >  - Add ADC channel sysfs node "*_labels"
> > 
> > changelogs between v5 & v6
> >  - Memset aligned adc data
> >  - Remove strong casting void pointer
> > 
> > changelogs between v6 & v7
> >  - Avoid adc polling infinite loop
> >   
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
