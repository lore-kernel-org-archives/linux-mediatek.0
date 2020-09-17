Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EDEC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 17:43:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F7DA2137B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 17:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zbnRWsz6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nsg/QuUf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F7DA2137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lGcKCaFqF9mrmUb3stjCrIhKLsJx6a1KOen9ddTHEJA=; b=zbnRWsz6zqYKzo0avi1xFzPGF
	/lzvM4U0MPFlzKen4XyqlaYIWAxEOh0dSVpvRvZBtjlos+xgSrb7kPDQPsgB5V69EV8rqpNFVpNsr
	Az1BytQiqVvJX9m/DBxk/wNtqkkxubXihhc0Sc/LRhaINDO1OvUYdGll73PAMG4ouMLMyoA5EZDjL
	inYjVdMByY+TXqlzixZdwtm2C4skQd3AX1CXZnxFXVD1st07Qa6GCxavjLlY9c9fWJdlmcE+zswR2
	OkzeaihjzACF2wpnnSbPog7habJ/TIx6kLYf1gSunZwE0PfuXYXI4Kacmc0vlC3tYEmHLuBQvS+os
	66q4RgIzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIxw7-0008Tl-6j; Thu, 17 Sep 2020 17:43:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIxw0-0008R7-1S; Thu, 17 Sep 2020 17:43:05 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C5E5208E4;
 Thu, 17 Sep 2020 17:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600364583;
 bh=bi6TmqYi2rgk/B1f4FxQaiZqBpH7FUeVuFmqBR3sG9g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nsg/QuUfuwuQSZssMC9S7zpn1F9Tedcy1flb1AOphcnmFIQd6pBJnjjd4hh58vLa6
 q0jW6lytqDQPixY3l2OxJWzCbPVJvHQfpe2tCCbaMJTT1Z4MN+F4bdYVW1RXrUe2Zu
 Vt1X7KJcaUN+dqNrzdGLIyp8oQjRAhtchTDnRzS0=
Date: Thu, 17 Sep 2020 18:42:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v4 2/3] Documentation: ABI: testing: mt6360: Add ADC
 sysfs guideline
Message-ID: <20200917184256.71328701@archlinux>
In-Reply-To: <1600191369-28040-3-git-send-email-gene.chen.richtek@gmail.com>
References: <1600191369-28040-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600191369-28040-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_134304_244582_3489CFE7 
X-CRM114-Status: GOOD (  17.58  )
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
 Cristian Pop <cristian.pop@analog.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 matthias.bgg@gmail.com, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 16 Sep 2020 01:36:08 +0800
Gene Chen <gene.chen.richtek@gmail.com> wrote:

> From: Gene Chen <gene_chen@richtek.com>
> 
> Add ABI documentation for mt6360 ADC sysfs interfaces.
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
Would you consider using the proposed label attribute for channels?

https://lore.kernel.org/linux-iio/20200916132115.81795-1-cristian.pop@analog.com/T/#u

I'm hoping that will remove the need to have ext name used in the majority of
cases and would like to know if it would work for you?
It may not work for this particular case of course.

Other comments inline.

> ---
>  Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360 | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360 b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360
> new file mode 100644
> index 0000000..4b1c270
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360
> @@ -0,0 +1,83 @@
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_USBID_input


The mixture of case is a bit ugly.  Could we do 
in_voltage_usbin_input?

> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 USBID ADC which connected to connector ID pin.
> +		Reading returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_VBUSDIV5_input

> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 VBUS ADC with high accuracy
> +		Reading returns voltage in uV

Why would we ever read the low accuracy version?  

> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_VBUSDIV2_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 VBUS ADC with low accuracy
> +		Reading returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_VSYS_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 VSYS ADC
> +		Reading returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_VBAT_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 VBAT ADC
> +		Reading returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_current_IBUS_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 IBUS ADC
> +		Reading returns current in uA
Given voltage and current are already clear from the channel type,
could we avoid the repetition?

in_current_bus_input perhaps?

> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_current_IBAT_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 IBAT ADC
> +		Reading returns current in uA
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_CHG_VDDP_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 CHG_VDDP ADC
> +		Reading returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_temp_TEMP_JC_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 IC junction temperature
> +		Reading returns temperature in degree
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_VREF_TS_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 VREF_TS ADC
> +		Reading returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage_TS_input
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 TS ADC
> +		Reading returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/timestamp
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 timestamp
> +		Reading returns current timestamp in ms

That's an odd bit of ABI.  Why would we want to read the current timestamp from
sysfs?  Timestamps in IIO also tend to be in nano seconds.





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
