Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9DAC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 07:54:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7AC361454
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 07:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7AC361454
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ax1zhp9GvlOnSIggCfgae9BIIw2gpp+W9Jd7eqVvjg4=; b=Fsb0WzMv36Z9w79OCyXx7PEes
	b7Yw3U1sbPBbKu189BnYXz6hjngto45WQ0DoqPn3IbDUQC8OgyWJ/sBKEFr49fPlXpYz23Hhp5PQj
	MRdzzCu+8dpJVuw4ifdQdo9ufEKxQsg2cDk3WDJenxIPx1gm8TiemUwuHuqJR23KemPyP133vAAok
	eu+OBG62SZgWv5s3XOyJUtivECPO7Usl93nYjve4xY40AzyHfNV7xKKeUlNMlNRRZCUYsQJaeY9OK
	MqyI+HaiALUogpJP20EtB/iLoz/93VG3bHSk1976aIDFcuPSDK/HfIvRXiR+gl61zH1qw99Xxvm0r
	C+gmj4ayA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhSeU-007Qbi-Ak; Fri, 14 May 2021 07:54:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhSeI-007QaU-QM; Fri, 14 May 2021 07:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Ykvto01E8V8AA7Ox++/StYivD+grg6Stg6zG7v0GCoU=; b=4ifD1tl5Tfet4Vt2pAQIbOuG5H
 u26inv8rNqY0MAMJ1R1k9Hktr3XJEohLgaEHlCYiae6MCM5uqtBok91iMI8eVywqwK56rxWre5cvq
 G03RiHsi6TYIqN/VpWn2Yhr88iYhy1kklUQefkSp+l1UDEKD2vejfo/ksoe6BhKsKqKOkiXT2D4v+
 T4l3q8fPFYpYHfLdyUikQO/wtGGWwmBI28d74zCVaT8dxkOHwkfx8le9M9dcOaflhGrV5+C2GzfhU
 FNFtUeHAYFe5kv9Ewl0mU3DkFW866ocDgDuw6WWWNARUDN/L1VmuEMuzDkWF4EY1Ur5ST8lCC97jU
 sGghMSEw==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhSeF-00BnI4-Vf; Fri, 14 May 2021 07:54:17 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v12so29136736wrq.6;
 Fri, 14 May 2021 00:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ykvto01E8V8AA7Ox++/StYivD+grg6Stg6zG7v0GCoU=;
 b=mnEhlVu9W/TQZgvV49Q3sKWTebZXK3Gad5gLJzr9IAen0upHzYG5Nrxqetr5aVA+ol
 706Y4erQa/sp0OHxFvFoG3BcI1WOs4VsNzE5vtTcQkdGtxz/H/ij0vw86riVcR4DptFr
 F/Q2yIJvkHBeE9MVwxqViTHoqAqV9uwrvjbM2xF5dw++JYOeWi4u96b0pcsnav2q856Y
 QYmeOX22bfgonIhhW1RLNxuCqm//KbczBKUCHQhFaF64UnBeiySivjSgIoW9hUa5d7/r
 kzKBx73S4QHBfY5klY89JUy3Dwg2nyTEzlWhc5eqCHhjssCDvzJyNp8z7mQe76QADHEk
 YEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ykvto01E8V8AA7Ox++/StYivD+grg6Stg6zG7v0GCoU=;
 b=KC0nTL34OiLtUqoQFwpqDBVt8hEOvop1pxD7q6rbmXtmI8Kko8dzirJwea5PZo8NNY
 aoWBQJxFJjTzdwJoweNdTAhIEJGPcz4j/OFp+DW56kMsHpQJ7MFh+KbjBC08jrWFz/R0
 NSD88+/KEzfLA34uyTQdmUCitd8byh7CceFrnsM4tlfC2hUQdAdfGOkm61jd3nX0+CnP
 XNHKE9b+nJnFf0f8AS1a2vD99pjBAmB2AZhOYQxyOKUb9cTfIIkOae1HmKK6xRoPHx5N
 iKhQlrtHu17yzJwvRpXpzRAn9SWMrN+ouEmxil1KMK36hzHTqR3bw0A6zEH0QIDs1L/b
 ARqA==
X-Gm-Message-State: AOAM532MkUcOOj5N0OGXbVZ10Qedy5qeN8elAels3eadXCXcq3hj1ox+
 F3cFIlckhJ3tnTmbi6ahavI=
X-Google-Smtp-Source: ABdhPJxloWHmCkAlje3svrOKge8TiIk+d4EffPK72H82lRIrFssg7tFsWJ0p3kTAYo3Jg+jIj3pbkA==
X-Received: by 2002:adf:e510:: with SMTP id j16mr58172404wrm.28.1620978854174; 
 Fri, 14 May 2021 00:54:14 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id n6sm5738895wro.23.2021.05.14.00.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 00:54:13 -0700 (PDT)
Subject: Re: [PATCH] arm64: defconfig: Do not override the MTK_PMIC_WRAP symbol
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Collabora Kernel ML <kernel@collabora.com>,
 linux-mediatek@lists.infradead.org, drinkcat@chromium.org,
 hsinyi@chromium.org, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Max Krummenacher <max.oss.09@gmail.com>, Michael Walle <michael@walle.cc>,
 Nishanth Menon <nm@ti.com>, Shawn Guo <shawnguo@kernel.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Luo Longjun <luolongjun@huawei.com>
References: <20210423075201.2616023-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <cb9c85d5-3467-c235-93cd-be23fb6e0a03@gmail.com>
Date: Fri, 14 May 2021 09:54:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210423075201.2616023-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_005416_059901_554CA69B 
X-CRM114-Status: GOOD (  19.44  )
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



On 23/04/2021 09:52, Enric Balletbo i Serra wrote:
> Commit 'fbbe38309d56 ("arm64: defconfig: Allow mt8173-based boards to boot
> from usb")' added the MTK_PMIC_WRAP config built-in. It needs to be
> built-in in order to be able to boot from USB or the MMC without needing
> a ramdisk, but that symbol was already defined as a module so now we are
> getting the following warning:
> 
>   arch/arm64/configs/defconfig:996:warning: override: reassigning to symbol MTK_PMIC_WRAP
> 
> Remove the MTK_PMIC_WRAP=m from the defconfig to remove the error.
> 
> Fixes: fbbe38309d56 ("arm64: defconfig: Allow mt8173-based boards to boot from usb")
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Applied to v5.13-next/defconfig

Thanks!

> ---
> 
>  arch/arm64/configs/defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 08c6f769df9a..9907a431db0d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -491,7 +491,6 @@ CONFIG_SPI_S3C64XX=y
>  CONFIG_SPI_SH_MSIOF=m
>  CONFIG_SPI_SUN6I=y
>  CONFIG_SPI_SPIDEV=m
> -CONFIG_MTK_PMIC_WRAP=m
>  CONFIG_SPMI=y
>  CONFIG_PINCTRL_SINGLE=y
>  CONFIG_PINCTRL_MAX77620=y
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
