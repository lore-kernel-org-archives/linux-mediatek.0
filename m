Return-Path: <SRS0=O+qu=CH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25040C433E6
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2020 17:15:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8F83206F0
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2020 17:15:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AzNx1tx6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2qANvniK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8F83206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0/F3UN7rWiooADavidt0kP1cyaosGvKO42LEBLVYq1Q=; b=AzNx1tx6aJwaNN3gXdklOEgGY
	NvDtq7Qw1dBA2LY3tU8FyVmIYhRjD8wD4kSsHc0RaocEi5ImNBpKqj2B5lnv2eXCCsDmV1ymbUA08
	45TY2WqgQNcbTh2ZDfY45GfmmVwC3mmRZT+yWEAal11NgGTxgEk6ml7KhWOEqQkuPwlC8tkYmbVbB
	rV6Y62FoK8svaySGWGTjuFWmXWTTLV8V8rOsfKU1W9YxWvWadHC1C/mtm5KCpzHMLtCSrKvwqgQai
	/F46eJfBdC6lNijyk/L6/CV5qbfkMJ4WN7dfrBPhhiHtTIzWBLCeB6hoHUlALUPz/a3CkTOYtha7j
	E3Z8A6fdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kC4S9-0002h6-4Y; Sat, 29 Aug 2020 17:15:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kC4Rs-0002aQ-IB; Sat, 29 Aug 2020 17:15:35 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 574E620707;
 Sat, 29 Aug 2020 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598721327;
 bh=yFdlUpmzfpHPN+BckagMXN8w6ogeGfkv5WdcU0OccqI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2qANvniKoV3Er+jHPqIWm0EcDFQ7XsexKbjnKGVFLx+lRNNeO47vTGlslo6entWl2
 aMZi6C4GPtkR8N9Zarg3mT0CVUMjb3lMHzLWXvQcy97F3buTwxt3PHZ2sRaDPvOufA
 GO3uXjzCoHl0zN4joJD4a+je7x3JzkOCpEqltdgw=
Date: Sat, 29 Aug 2020 18:15:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v3 2/2] Documentation: ABI: testing: mt6360: Add ADC
 sysfs guideline
Message-ID: <20200829181522.3664e1ce@archlinux>
In-Reply-To: <1598259985-12517-3-git-send-email-gene.chen.richtek@gmail.com>
References: <1598259985-12517-1-git-send-email-gene.chen.richtek@gmail.com>
 <1598259985-12517-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_131528_814156_F953B76E 
X-CRM114-Status: GOOD (  17.90  )
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
Cc: gene_chen@richtek.com, lars@metafoo.de, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 matthias.bgg@gmail.com, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 17:06:25 +0800
Gene Chen <gene.chen.richtek@gmail.com> wrote:

> From: Gene Chen <gene_chen@richtek.com>
> 
> Add ABI documentation for mt6360 ADC sysfs interfaces.

Please check this.  The actual filenames don't look correct
to me.

> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360 | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360 b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360
> new file mode 100644
> index 0000000..9dab17e
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360
> @@ -0,0 +1,83 @@
> +What:		/sys/bus/iio/devices/iio:deviceX/usbid_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 USBID ADC
Can we give a bit of text saying what that is?

It's nice if people writing userspace software looking at this don't have
to go find the datasheet just to give a human readable description of the
channel.

> +		Reading returns current voltage in uV
drop _current_ as that's a bit confusing :)

Reading returns voltage in uV

> +
> +What:		/sys/bus/iio/devices/iio:deviceX/vbusdiv5_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 VBUS ADC with high accuracy
> +		Reading returns current voltage in uV

Is this measuring output of a regulator which has taken vbus and divided
it by 5?  I'm rather confused.

> +
> +What:		/sys/bus/iio/devices/iio:deviceX/vbusdiv2_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 VBUS ADC with low accuracy
> +		Reading returns current voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/vsys_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 VSYS ADC
> +		Reading returns current voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/vbat_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 VBAT ADC
> +		Reading returns current voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/ibus_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 IBUS ADC
> +		Reading returns current in uA
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/ibat_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 IBAT ADC
> +		Reading returns current in uA
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/chg_vddp_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 CHG_VDDP ADC
> +		Reading returns current voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/temp_jc_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 IC junction temperature
> +		Reading returns current temperature in degree
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/vref_ts_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 VREF_TS ADC
> +		Reading returns current voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/ts_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 TS ADC
> +		Reading returns current voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/timestamp
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 timestamp
> +		Reading returns current timestamp in ms


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
