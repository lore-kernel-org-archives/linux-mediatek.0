Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9071C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 20:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lj6+qm8z06JmPbkyzKRB68jeGztBRjTgMD+KBXDr6kw=; b=1hqMMWsEVNnIzh
	dGEEsrukvAhf9XGXmgEcI/wCwCVqbKAX2qdrm7tureUEQT6TWAnq+/IU5lRoBSlHB+lR0DNGwX/sf
	w8pNBoMjwrqdXRPgsOzoj2D9PSPJmdikd+/cODR96cK5ynX8HkUluiirgTl+yGRcgLyL9nMLFpJts
	t0FqD+sbIWuFqjjypo9LlMPpi+glWpnkoAmVJVWzq0vRfJvVpC7N5wz6CA0NCA+oycRQx7RUXYoBh
	zueBSe4JIB7BhIT40mxTeqiHH0qRGXlJeHXVvMiKNgfhzozrSbvcwgPk6rFvpK7C+axJ8ur77o4S5
	vxcvKB9jcHlYZW4L+k5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qdg-005d7g-7T; Mon, 13 Jun 2022 20:26:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qTT-005YOa-1G; Mon, 13 Jun 2022 20:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=b8nNT/xprutxuiBevYoYuq5d2FkteRl+uXtHRkddO1w=; b=Yww0fYQTyEmxuLew3Ionpx8OMF
	+g7pCz3zRQQ2OjT74EOB/aK/dKBfXJ737MYvDCWwla+U3+2mtAsnmAiqEJ+m8MN+Y8xvD/dr8Kk7+
	CTHDzxZHuUbX84iCMrvOenFQ90E0I7QbBDBpbpRcv9DHuB1PBMnj3fkLJuLOL7pAOAjKHnv/fZxcZ
	qBUgYfDwZbaAcDkLi/88MIc3QnzcG8sfkbK8gFuVv69yiLOeqZvVFHbgOvfC464+3bKiyAnRQs1T7
	zAg+DPfZjGpXLgfVKZtkDdrn2AUTr2iAOHaX3ptXEXn0pcM/4bla3HnDKKuUovF0Gd78dX+qMf6AS
	p+bpoqHg==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qTP-007fBI-DS; Mon, 13 Jun 2022 20:15:44 +0000
Message-ID: <31b588e9-2233-3b40-e452-83f0f6bfb744@infradead.org>
Date: Mon, 13 Jun 2022 13:15:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 10/15] regulator: mt6370: Add mt6370 DisplayBias and
 VibLDO support
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
 ChiYuan Huang <cy_huang@richtek.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-11-peterwu.pub@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220613111146.25221-11-peterwu.pub@gmail.com>
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
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index cbe0f96ca342..dcb6866dab53 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -804,6 +804,14 @@ config REGULATOR_MT6360
>  	  2-channel buck with Thermal Shutdown and Overload Protection
>  	  6-channel High PSRR and Low Dropout LDO.
>  
> +config REGULATOR_MT6370
> +	tristate "MT6370 SubPMIC Regulator"
> +	depends on MFD_MT6370
> +	help
> +	  Say Y here to enable MT6370 regulator support.
> +	  This driver support the control for DisplayBias voltages and one

	              supports

> +	  general purpose LDO which commonly used to drive the vibrator.

	                      which is commonly used to drive the vibrator.


-- 
~Randy

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
