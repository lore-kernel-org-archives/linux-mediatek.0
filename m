Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jun 2022 15:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMtnjhjn8c+7JZqN1PoIhW0s0UbRV0nGTSe1Arv5NuE=; b=nC26akvRYJ/xmJSqK8VJiPlNoI
	91RhQ6ZZqUyscUNuSJKNQTq0CRQI2L6mfoC3uFxGkMK57OKaDege0e/MUf7F3MpYc81+GRb1sSG88
	ptZuXmZVp2I3ijQmUWBOzcqMJ2FmoUAg7fxuziBRt68TZB9LagokaljvBuE0aUv6UB/Mx5wpBvg1Q
	CYDcYx8krxgImLTE9Dg8PwHgniSv25zwQOyV0vDMVVV5ab1+evauZAKevEy7TphVqujx9BTwxpejU
	JqT4YBFijjDhkUR7ircf8e36eNqcVhOo+vcYdwRjEQvrtzp569Uaje1oU/GJ3ndf9k9AwyNq1TzVk
	zucoa5rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2aXg-00BgDw-Ch; Sat, 18 Jun 2022 15:39:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2aXU-00BgAm-Ik; Sat, 18 Jun 2022 15:39:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A23860ECF;
	Sat, 18 Jun 2022 15:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC6AC3411A;
	Sat, 18 Jun 2022 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655566746;
	bh=McuYUPbcTogh0Yrn7FSYihqEAcvdIVNBBIDilpwKOpE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dSnD0FK661SnooSn7Z/CDSOX3C3M6TplRlQ+BdTAy3J5UoTF1ZJhfy0liHIx9LLKJ
	 MmOBy6sUSheDILDX/FclyJ2ODmVSkJuDFnMF9EcDwWOK0MMT7rSQl26Krt7XqdvqGH
	 1ULRRVdc6QRCMSLjBZYYrmNqffXtEeuxOm9uPjF2u1F1Vqa3EQc2N58FHFgSv/NvSE
	 0gBc87cgiNXnUcjPnNOILCd+NQ1oVQDTlP3VULDcsL6ZpPWAwY2t8+39JcivJuquhJ
	 vVRYNmRbCwYBRuOwqx3C78E8ZqVCAyRz5L7XP3svJYw32ZsjUiJbfJih8B78n6II/1
	 HYiaISZCY5RRQ==
Date: Sat, 18 Jun 2022 16:48:20 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lars@metafoo.de, matthias.bgg@gmail.com, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, ChiaEn Wu <chiaen_wu@richtek.com>
Subject: Re: [PATCH v2 07/15] Documentation: ABI: testing: mt6370: Add ADC
 sysfs guideline
Message-ID: <20220618164820.2eeb8ae8@jic23-huawei>
In-Reply-To: <20220613111146.25221-8-peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
	<20220613111146.25221-8-peterwu.pub@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_083908_738022_F626F66A 
X-CRM114-Status: GOOD (  17.04  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 13 Jun 2022 19:11:38 +0800
ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add ABI documentation for mt6370 non-standard ADC sysfs interfaces.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>  .../ABI/testing/sysfs-bus-iio-adc-mt6370      | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370 b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> new file mode 100644
> index 000000000000..039b3381176a
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> @@ -0,0 +1,36 @@
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage0_raw

Unfortunately the kernel documentation build scripts do no support duplicating
standard ABI for particular devices so as to provide more information.
Hence you can't have anything in this file.


> +KernelVersion:	5.18
> +Contact:	chiaen_wu@richtek.com
> +Description:
> +		Indicated MT6370 VBUS ADC with lower accuracy(+-75mA)
Curious though, voltage with a mA accuracy range?
This scale should be presented directly to userspace anyway so no need
for this doc.

> +		higher measure range(1~22V)
> +		Calculating with scale returns voltage in uV

No. All channels return in mV. That's the ABI requirement as
in sysfs-bus-iio and we cannot vary if for particular drivers.  If we did
no generic tooling would work.

> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage1_raw
> +KernelVersion:	5.18
> +Contact:	chiaen_wu@richtek.com
> +Description:
> +		Indicated MT6370 VBUS ADC with higher accuracy(+-30mA)
> +		lower measure range(1~9.76V)
> +		Calculating with scale offset returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage4_raw
> +KernelVersion:	5.18
> +Contact:	chiaen_wu@richtek.com
> +Description:
> +		Indicated MT6370 TS_BAT ADC
> +		Calculating with scale returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage7_raw
> +KernelVersion:	5.18
> +Contact:	chiaen_wu@richtek.com
> +Description:
> +		Indicated MT6370 CHG_VDDP ADC
> +		Calculating with scale returns voltage in mV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_temp8_raw
> +KernelVersion:	5.18
> +Contact:	chiaen_wu@richtek.com
> +Description:
> +		Indicated MT6370 IC junction temperature
> +		Calculating with scale and offset returns temperature in degree


