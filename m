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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94641C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 07:54:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDC1B61454
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 07:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDC1B61454
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+2Qy2jtlzzlaZF6Z/vf2eV0lRYb62bbfBFQrYAPjTHE=; b=mscMzh4fQjo856TmaxNRes8xm
	Mquvj/nfvIErHbLjP+mt1+bGtvFkhPC5TFeexDhyDmpOZZkc6jTt1U2Z3qw+BsHAxCcaORZPVcyiD
	ovJJp+dsqACiQU604f431H6k/DaPGrVnrOju+w/pIcd/Nfjetf3iaov/w2Jybyrzb0lMi9A/ynD4U
	5fBDb/vd/y2KQ+uxHzl5sj0EUE0+fie+b5oHL3R2y6v5LtTm8WQw9eau30pd52zOyAofwZAgd77+/
	iKV6dt9BTf1g1fhm7g18uXopLBihizYdI31NhWt6qOEFG9k7Rz8Fy+2oakqpKj5aRC8iWGcboxKTg
	IwBzM7+Eg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhSee-007Qdl-Qi; Fri, 14 May 2021 07:54:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhSeT-007QbV-SV; Fri, 14 May 2021 07:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=FbGTVWfDS8cQxtpKVogvmAa19HBXse2riK6QNgECFH0=; b=wUKNbEjtj1BDmiV+K9jtQouQ4z
 Z/VHbnPO0HZ8aw3XbL5i7ErWisYIh0cP93acnxRSNuLMAFWIzhzHZ3ICR0fJ9h5hOzNsTmhlssFdG
 mS5+D1qQbTbAuupMNkNSvzlEXTBC/ZjZHH0v3vC+mEeV5AN5SvqC5UCpwaUhJTUkclvjLsmp4k7w2
 Y4t3yIa0ua6dzORCCmh4BqYzwGZ3njsRQg9G43PNmLNya97F+nMJdY95pQta16+jokP0nVQrREBQb
 +PVXoqjkWA6mRv59aVMp6BV2Z+69cvtA8K9Lyfwr0Woca1CclgSedRJHZ79PFSaC5LWfRaKdxpE9G
 gpobXpDg==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhSeR-00BnKG-DH; Fri, 14 May 2021 07:54:28 +0000
Received: by mail-wr1-x431.google.com with SMTP id a4so29186151wrr.2;
 Fri, 14 May 2021 00:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FbGTVWfDS8cQxtpKVogvmAa19HBXse2riK6QNgECFH0=;
 b=Q6qpTyejKg9P5pbjlb9OBXFbZrpYh9c5b7ybGw1+n1x0RHPwkGzKUMGbxTFVNHD4pk
 e6JbmRKDlMDXGJUmPVsVjqeWXruW91aeugzhTpl4H6R2xf9KEO7UH+Nb3eMknW2WQHJe
 tpWNIEPTotB19XzCmximUJ9NyAUP/j3ksCSrviJXoOS8mMEWsHuEvSQFbhX7UxXnAu4E
 7yhHWwEQYTb3qJkQEqToVB74upMfr2Yw+m7IPBAy1N6n+RRgS1UyBVLlTqwER+hrEFTX
 2Bi12Vafq6wwNQo4lFG2ked7x1TID+I24bv1UC27Ew0ai260oud7WsqmmdFPT2QAyZfK
 WEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FbGTVWfDS8cQxtpKVogvmAa19HBXse2riK6QNgECFH0=;
 b=tt+X9uhcYrF8MAlDIbii5aTDPEDsChryPjp9KDsfSzJdMT1wDvW6t4yWrZRKEOfwgY
 ZdjLqxY88fx+ZKNkAA2TQsHf9U+nKyE1h5/nG3U4wW2wZoOma+PHMV0wTHUo6EMoAhZw
 kgTKsl23R/uTpcoxlpDxxilIpQ6iat8PknH/xCvLNzNbb0YGF9sZ0MrGk9YCTLSgEcJh
 9wisGSzvWALsUp3lG+XTNCPCGkgUZ6AjXD+/8Za+coGji3pexUGFAaxFeY7BReTO01BB
 mrnHpXGvr89EMhB4CcvybwdB/KonfSsfcUVZ4oHb160mAMwTTIsXg/fi25zHWLgXP9Jp
 mHFg==
X-Gm-Message-State: AOAM533NEJS/qLj4Gz5zXsKFYXnMrsi7ILtDl5ay6UJap7mfZLMEt5+i
 Eq8clJ3QEpJW/3tjHwuKp0olJFMa7gQv0w==
X-Google-Smtp-Source: ABdhPJz1Y01d/RaSBoTNvcjRbbII61UcK2e1OHyQzttzkylztFb1W9bZhck1gfshbYO+IUiACQjQ+g==
X-Received: by 2002:a5d:4151:: with SMTP id c17mr6875305wrq.262.1620978865974; 
 Fri, 14 May 2021 00:54:25 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id e10sm5895391wrw.20.2021.05.14.00.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 00:54:25 -0700 (PDT)
Subject: Re: [PATCH] arm64: defconfig: Allow Mediatek boards to boot from the
 mmc
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Collabora Kernel ML <kernel@collabora.com>,
 linux-mediatek@lists.infradead.org, drinkcat@chromium.org,
 hsinyi@chromium.org, Anson Huang <Anson.Huang@nxp.com>,
 Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?Q?Guido_G=c3=bcnther?=
 <agx@sigxcpu.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Max Krummenacher <max.oss.09@gmail.com>, Michael Walle <michael@walle.cc>,
 Nishanth Menon <nm@ti.com>, Shawn Guo <shawnguo@kernel.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20210423075250.2616275-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <8f5ba7d9-cae0-dde6-6d20-f6e37cbe6338@gmail.com>
Date: Fri, 14 May 2021 09:54:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210423075250.2616275-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_005427_482163_FC159503 
X-CRM114-Status: GOOD (  17.36  )
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
> Enable the MMC_MTK option necessary to boot Mediatek boards from the
> mmc. Booting from the mmc is the common method used for a bunch of
> boards, specially Chromebooks, to boot from. Hence this driver is
> built-in.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>


Applied to v5.13-next/defconfig



Thanks!

> ---
> 
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7b4be3807b6d..acb718160345 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -851,6 +851,7 @@ CONFIG_MMC_DW_K3=y
>  CONFIG_MMC_DW_ROCKCHIP=y
>  CONFIG_MMC_SUNXI=y
>  CONFIG_MMC_BCM2835=y
> +CONFIG_MMC_MTK=y
>  CONFIG_MMC_SDHCI_XENON=y
>  CONFIG_MMC_SDHCI_AM654=y
>  CONFIG_MMC_OWL=y
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
