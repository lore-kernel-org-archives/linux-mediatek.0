Return-Path: <SRS0=AZ7y=DR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BDEC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 16:57:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6E802242E
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 16:57:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kx36GPTH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgbF8bwi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6E802242E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gq/dEvLvsgRBfZVPErB8/vQ3oXl4skuzDJowjDa0VBA=; b=kx36GPTHZw/HpDyTAaWFJpQGl
	LFWYWiI11TGE/XbhwSP2vUJ7cHrvoEmyNKIXMn7k/Gw65lkvOJ/WlFkji/UuEtlBaCIEmI54iRzya
	SlVCcw/P+P9fI0PYutKR5I6I8DbAsFiYu5s2v0QAmC3I3pGeO3DJolMjAsAQPMBjuRAku/bIiByGq
	O7WeJHZ6FjSl5W6UTtgueunHDRV18rFjgAnToaaMBjUiupG6A97LkYZLFn4oJPC3je39scCTo/aZV
	rOngXnF9YyhBPykwwMzQRMrLD+K3nTH+iTa6wZksctl1dWOeX3zC2K3v8yvhNqz7CCFlH7KL8dCJu
	mIx9yCB4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRIBT-0003Q5-W2; Sat, 10 Oct 2020 16:57:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRIBO-0003PN-1w; Sat, 10 Oct 2020 16:57:22 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 112712242B;
 Sat, 10 Oct 2020 16:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602349041;
 bh=tvRSA9R+WFrxxVwgdjd4mNTVYdF+H8JAqH74nfC64co=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZgbF8bwi2UcwgQkisyGyNYTjjBlwqldV4vgAnD3Jv5bGIF2p9LtXEWQc1F+78JT0D
 xY4+fZfeFRbH0/40ELyQHlLcLjTNDdVRKOYQhEiTuNQ+liidwbYO0y4f7u9DpGQ5lN
 EVgZQalZesICskJ4Xb2cFQ0mX0R9DnjdXxYF+l3c=
Date: Sat, 10 Oct 2020 17:57:14 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v6 0/3] iio: adc: mt6360: Add ADC driver for MT6360
Message-ID: <20201010175714.0fb968ab@archlinux>
In-Reply-To: <1601542448-7433-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1601542448-7433-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_125722_200919_B2D39A3E 
X-CRM114-Status: GOOD (  18.46  )
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

On Thu,  1 Oct 2020 16:54:05 +0800
Gene Chen <gene.chen.richtek@gmail.com> wrote:

> This patch series add MT6360 ADC support contains driver, testing document
> and binding document
> 
> Gene Chen (2)
>   dt-bindings: iio: adc: add bindings doc for MT6360 ADC
>   Documentation: ABI: testing: mt6360: Add ADC sysfs guideline
>   iio: adc: mt6360: Add ADC driver for MT6360

Hi Gene

This looks good to me.  I'm just waiting now on some final
reviews for the patch that adds the label attribute support.
Once those are in I'll pick your driver up as well.

If I seem to have lost it, feel free to poke me!

Thanks,

Jonathan

> 
>  Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360                 |   78 ++
>  Documentation/devicetree/bindings/iio/adc/mediatek,mt6360-adc.yaml |   34 
>  drivers/iio/adc/Kconfig                                            |   11 
>  drivers/iio/adc/Makefile                                           |    1 
>  drivers/iio/adc/mt6360-adc.c                                       |  362 ++++++++++
>  5 files changed, 486 insertions(+)
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
