Return-Path: <SRS0=ZPt7=EH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75799C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 15:40:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10E0F2224F
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 15:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="udi2FTY9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6mj5mGL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10E0F2224F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9fNeln+lZqczh3SCexzVPLuc24LppHlOmE6aHp45wMA=; b=udi2FTY9TTIOcFdplYaZZsple
	m9rJKHUSXD4b34YZm3CqQ7UyJIBaxKT1acake8Q4Xae3gKQhnTIeflg/P8OKk6nXilAyu6IgsrCGc
	k1lLNkR2/81f8aKSHk62Q1SlrICOxBfbMSvvoeJKfjxMLkZuiqVyOE7c5FYEFkG5JBNSgWCEbf8rD
	JqFA1J3YJhXzL/LM1uR2Bff9bKb++m3gS16so5HIH10bTyH9w/KV3lEdmg4vnDeF4EgL990Dl2rGE
	sO8gzJSwVYIcDkrZHQtljTo1I57UmgY+aeoT1Vd+r0YByoXSQSCTME4YKWwd9YUS/EHBOqfCWMunq
	DVmRlGLNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZFT3-0004vU-NM; Sun, 01 Nov 2020 15:40:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZFT0-0004uV-2s; Sun, 01 Nov 2020 15:40:27 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C86DD22246;
 Sun,  1 Nov 2020 15:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604245225;
 bh=wQmipAoDhEbdujXSTlXDShPDCg7E6gH2wo7ek0okswY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F6mj5mGLGhVITvzq0x+G7O94aulBjPSZ6sbGvqxuWSQg002gGXZvPv734jui+jdxN
 ZE+dvg8m5UnfsqgwbgJXaDCbbvp41qOjtyrBPCji59FGE/wyi3XfEfbu5RbkE4Zgdq
 UyL3XdGeM+OOynqLzJPJM/D7GRpLQjub9pHZbDWo=
Date: Sun, 1 Nov 2020 15:40:19 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v7 0/3] iio: adc: mt6360: Add ADC driver for MT6360
Message-ID: <20201101154019.39932a2e@archlinux>
In-Reply-To: <1603181267-15610-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1603181267-15610-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_104026_473666_E722816F 
X-CRM114-Status: GOOD (  17.54  )
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

On Tue, 20 Oct 2020 16:07:44 +0800
Gene Chen <gene.chen.richtek@gmail.com> wrote:

> In-Reply-To: 
> 
> This patch series add MT6360 ADC support contains driver, testing document
> and binding document
> 
Hi Gene,

Other than that small edit needed in the dt binding this is stalled on
the label code getting upstreamed into the core.

I've asked Cristian to repost that so hopefully we can resolve that dependency
and get this merged fairly soon.

For the dt thing I can just drop the description entirely, but would prefer
if you sent a v8 fixing the tags issue Rob pointed out and also fixing that
description.

Thanks,

Jonathan

> Gene Chen (2)
>   dt-bindings: iio: adc: add bindings doc for MT6360 ADC
>   Documentation: ABI: testing: mt6360: Add ADC sysfs guideline
>   iio: adc: mt6360: Add ADC driver for MT6360
> 
>  Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360                 |   78 ++
>  Documentation/devicetree/bindings/iio/adc/mediatek,mt6360-adc.yaml |   34 
>  drivers/iio/adc/Kconfig                                            |   11 
>  drivers/iio/adc/Makefile                                           |    1 
>  drivers/iio/adc/mt6360-adc.c                                       |  372 ++++++++++
>  5 files changed, 496 insertions(+)
> 
> changelogs between v1 & v2
>  - adc: use IIO_CHAN_INFO_PROCESSED only
>  - adc: use devm_iio_triggered_buffer_setup
>  - adc: use use s64 to record timestamp
> 
> changelogs between v2 & v3
>  - Rearrange include file order by alphabet
>  - Set line length constraint below 100
>  - Add Document for testing adc sysfs node guideline
>  - Set compiler 64 bit aligned when handle iio timestamp
> 
> changelogs between v3 & v4
>  - Fix sysfs guideline description
>  - Replace iio channel processed by raw/scale/offset
>  - Add comment of read adc flow for special HW design
> 
> changelogs between v4 & v5
>  - Rename dt-bindings aligned to file name
>  - Aligned sysfs node name with driver and add VBUSDIVX description
>  - Add ADC channel sysfs node "*_labels"
> 
> changelogs between v5 & v6
>  - Memset aligned adc data
>  - Remove strong casting void pointer
> 
> changelogs between v6 & v7
>  - Avoid adc polling infinite loop
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
