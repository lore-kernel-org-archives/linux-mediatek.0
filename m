Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6F7C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 12:16:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F08FB2086A
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 12:16:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KDZawc0k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="no4C+nJy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F08FB2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l0eSrXWSKKosb+8CyB/wp/O9ngbnaj+mm9Hzj/pzS14=; b=KDZawc0kdvRjpNW/Zpqjd/bzf
	7quFN4t5jXHC9/O7Cq7MVcQSRIiJPqDkbJ9yDd97ov5aCgOUxr+BTnvs9R/jWaRKX+UlS0W3+fVgx
	Q9mpzFeNLlWoqsvVDu1AxOJXMvLR8zucxXsbjO12Cz0/gIdRjkg9F2OziYalONg7lVTsXEiluhQD9
	AbNxvFSApRex8rAOOUlsfSMaBHpcmy3C4uL0WD57OPdxWS9UmMTd7X3Cv4Kil7yQwzrxynv6V60qw
	EtC3wMPlSEdlwobvFiuqEyNRHidvmzRbOHiQrTusSnEVqVfHHctqRKu6o6XXnAPkaj9X/WKgyvr32
	C3rfd0A8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLmdu-0006aa-Eg; Fri, 25 Sep 2020 12:16:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLmdq-0006ZV-6k; Fri, 25 Sep 2020 12:15:59 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 989BA21D7A;
 Fri, 25 Sep 2020 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601036156;
 bh=kwR9lgq75oem2SESbbdu8Dipj1Q8zTQ+UnnWezcapFI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=no4C+nJyV2mcqN2CwSdvw/0kwskREmHydE8VA5s7AbOR06GF2CsyHrzSHOMM0Z3/t
 emMPgDLX9SOBleJLLUfsVNObhQW1CVUljmp3BccgSxyS2FIa8fje8dvxvlCpzo4SP5
 a6kO5w+gcFyndNxj5dH1yqRhVVV3CbXU4mcHjskI=
Date: Fri, 25 Sep 2020 13:15:50 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v5 2/3] Documentation: ABI: testing: mt6360: Add ADC
 sysfs guideline
Message-ID: <20200925131550.10717161@archlinux>
In-Reply-To: <1600687442-23658-3-git-send-email-gene.chen.richtek@gmail.com>
References: <1600687442-23658-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600687442-23658-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_081558_368602_1A49AC63 
X-CRM114-Status: GOOD (  16.11  )
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

On Mon, 21 Sep 2020 19:24:01 +0800
Gene Chen <gene.chen.richtek@gmail.com> wrote:

> From: Gene Chen <gene_chen@richtek.com>
> 
> Add ABI documentation for mt6360 ADC sysfs interfaces.
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
Hi Gene,

My first thought was we don't need this now we are dealing with
standard ABI only, but there is some useful additional documentation
in here which is good to have.

Looks good to me!

Thanks,

Jonathan

> ---
>  Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360 | 78 ++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360 b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360
> new file mode 100644
> index 0000000..e5a7b1c
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360
> @@ -0,0 +1,78 @@
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage0_raw
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 USBID ADC which connected to connector ID pin.
> +		Calculating with scale and offset returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage1_raw
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 VBUS ADC with lower accuracy(+-75mA)
> +		higher measure range(1~22mV)
> +		Calculating with scale and offset returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage2_raw
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 VBUS ADC with higher accuracy(+-30mA)
> +		lower measure range(1~9.76V)
> +		Calculating with scale and offset returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage3_raw
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 VSYS ADC
> +		Calculating with scale and offset returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage4_raw
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 VBAT ADC
> +		Calculating with scale and offset returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_current5_raw
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 IBUS ADC
> +		Calculating with scale and offset returns voltage in uA
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_current6_raw
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 IBAT ADC
> +		Calculating with scale and offset returns voltage in uA
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_current7_raw
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 CHG_VDDP ADC
> +		Calculating with scale and offset returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_temp8_raw
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 IC junction temperature
> +		Calculating with scale and offset returns temperature in degree
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage9_raw
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 VREF_TS ADC
> +		Calculating with scale and offset returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage10_raw
> +KernelVersion:	5.8.0
> +Contact:	gene_chen@richtek.com
> +Description:
> +		Indicated MT6360 TS ADC
> +		Calculating with scale and offset returns voltage in uV


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
