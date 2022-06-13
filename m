Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD8CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 20:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ylOM4xsAYSBLV7Utap+lrf6PIUy+bN5uHl/VgKEEfM=; b=q9Io2RIPxcAjuA
	sdAafCMSEhW98Az4rOhkcUuGRm5UQY0e0wrox3JOv0NsfnqoVEjvnRTZZogmVBGqdMaM12zvdWCt2
	8ae2T9DPw7dHLpr43aaqzHulllHvYuzl7txnpz5hQxpHzvxigJLQs2o6XhIwvZgx7XZ/NRO8kasUM
	rrwF2zC0cAXXqWu3rAcXuQfWzuj4XBkuOVyZcACUBiZvEGxDhLp9UJn4pvw3Ffv4b7aklr3+Djs2b
	bvGENqxpb+YhBZkHGIMslY2ppNWpmCtdDej+1y/Gz22z5YogyFADau8ayh96iEbRocFN2pTLb4jBe
	RatvzraWJWEeCpSdQNVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qhX-005enk-EU; Mon, 13 Jun 2022 20:30:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qZO-005bGB-0V; Mon, 13 Jun 2022 20:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8O3gyMH/DIarLtUQIeptn6LXzo+PYX0mLfSnGbw2a7g=; b=NiCUaEIDQk/r/vKjMnabo0T1aj
	KK3IXgeBZZBkAGgl4TSxcVArNoBIV/AKyyLi9t5a07UnCfbFSwN2nvXFXzLDYNNMAXXD2fr3a3lXn
	5qBH/nL9tJX2J7QQ4kM/7UEN+euVSEGc7b6Ex8N+TV4DQW9YU3BeLEFg/YHZyrRBVB4eOurKWVCUV
	3dbn5FrNEUgwk3XQpLPNxo6eOD7VlDnTDsuYkubKzs3hE1PvMf7ii7WpSMRyCQ1xaKSHGQwOi4VXv
	BhCrf7pxathZUx6m7wZ/N1DXG7+13m4woNibuhLDnSJXchPFtBME85NedsEqI+ptN5vbrVryuRlDS
	RIIm5mxw==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qZK-007fIG-L3; Mon, 13 Jun 2022 20:21:51 +0000
Message-ID: <424b4f90-138c-d71f-0f1c-12c60e44c1c2@infradead.org>
Date: Mon, 13 Jun 2022 13:21:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 15/15] video: backlight: mt6370: Add Mediatek MT6370
 support
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
 <20220613111146.25221-16-peterwu.pub@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220613111146.25221-16-peterwu.pub@gmail.com>
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



On 6/13/22 04:11, ChiaEn Wu wrote:
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index a003e02e13ce..ec1589ad88bb 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -268,6 +268,15 @@ config BACKLIGHT_MAX8925
>  	  If you have a LCD backlight connected to the WLED output of MAX8925
>  	  WLED output, say Y here to enable this driver.
>  
> +config BACKLIGHT_MT6370
> +	tristate "Mediatek MT6370 Backlight Driver"
> +	depends on MFD_MT6370
> +	help
> +	  This enables support for Mediatek MT6370 Backlight driver.
> +	  It's commonly used to drive the display WLED. There're 4 channels

	                                                There are 4 channels

> +	  inisde, and each channel supports up to 30mA of current capability

	  inside,

> +	  with 2048 current steps in exponential or linear mapping curves.

-- 
~Randy

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
