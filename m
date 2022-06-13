Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEFBC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 20:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nd/8LeFbaSA/WRFfqL6ShbSkJoUnsdRWiio5gn2a1Zk=; b=I3gznIX6A6WG0M
	UXo8Rza0M69n3Kmtv5EISo5WzazaX90MIGhAvTMa1vLpqSPDQ/62FCjwME3Qkxc56+JVpgeaQJLVB
	AVx36/MaLQYNIt2naaTj84McEGzp2h92Q+yD5xCbwt1Jsh5jqT441N/Pjfo1sztMHSDngHpvqIhHI
	LGZW+hbo+PZ7Rl8KGzKIhoc3swXC4Be1EdwDgQzvL5Ko6THfq5ev8BSIlYOH3b6GS28NL/AKnydqU
	bufubCF5/p6Pzw5a3IZD8SbNEr/DtbeIUrj6Ccfpr/sDF/udGQKMhA1llc8KCkIsKb88FEKPE+ldB
	CrOB6nblQ/MoqMxJ7BPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qf2-005dn0-2z; Mon, 13 Jun 2022 20:27:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qVK-005ZNe-8F; Mon, 13 Jun 2022 20:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fBWi7QPO/F0ytmVW1WCvq92sKKuPA3DpoLxZ9CDOG/k=; b=P1VppJRSb+oHRmLr0pSpjezyww
	g2/6H9CewlIn9zZRkKrtbcQTPeE8uAqzG/2pPtz8cx+eX9/1EIKU5uu27T/j+zf8PAEq52J1Qf+HD
	qs9bH+cATvW4OI9AbR09GYH7TZFbFh1xn73nTAADt0Mie3mIhQ2Cqu8IDNfjMzcObV1KmTkvvfNsu
	Ji3pKltRIyqjnx3TreMEMhYTSRfuvzSI1OAwFOFnGskM+2YHfWASqe+qHrFBhlz6ArtvGEed2gMEH
	8Yd/bxVP+/1X1BojLJMzjqa/28vDKTpqNsjyo0f9qqR1kUzbpUDJigHN1QWRwVsW+sMXssao+NKH0
	XvAZL72w==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qVC-007fDz-Il; Mon, 13 Jun 2022 20:17:37 +0000
Message-ID: <915871e4-b156-ab19-043f-b719e03a5711@infradead.org>
Date: Mon, 13 Jun 2022 13:17:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 11/15] iio: adc: mt6370: Add Mediatek MT6370 support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com,
 ChiaEn Wu <chiaen_wu@richtek.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-12-peterwu.pub@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220613111146.25221-12-peterwu.pub@gmail.com>
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

Hi,

On 6/13/22 04:11, ChiaEn Wu wrote:
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 71ab0a06aa82..09576fb478ad 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -737,6 +737,15 @@ config MEDIATEK_MT6360_ADC
>  	  is used in smartphones and tablets and supports a 11 channel
>  	  general purpose ADC.
>  
> +config MEDIATEK_MT6370_ADC
> +	tristate "Mediatek MT6370 ADC driver"
> +	depends on MFD_MT6370
> +	help
> +	  Say Y here to enable MT6370 ADC support.
> +
> +	  Integrated for System Monitoring includes is used in smartphones

Please try again on the help text. I can't decode that.

> +	  and tablets and supports a 9 channel general purpose ADC.

-- 
~Randy

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
