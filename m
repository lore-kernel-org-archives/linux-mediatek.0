Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1153E784AF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 09:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwQS1I2S/UPYL/Sf2BTeKAyKxjWoqdfF0azKmWY199s=; b=zVktNXPPy85FuV0rRn1jguGKLO
	J+A0lSuc8DYUKqFqW2wn0PGaN/u3RmaBLw5lnxs1XsTzIiSsvFdOMpIDwOamY2j+nhDRZev8YyhBa
	HOPAlK82NIoQcRg+1P2wM4F9DR0zPRconLMgXqzDygFbd3bXt39siP19VnTrDtgzKp6zRsUtI4hYH
	ejuCIdk71rtOC7ZWQcfzSmgImpiugFHhflrWf9XZTuL23XvQ7MKSFMHQ+uTQTASzLdBjY+jGBo0Lz
	3t60Uxpk1H4iZdCxb1R+EKx+2vJv0R0OvOuUl0bnlnHn2vz24d90J+QxFqyVMC4lvlNne9/lsuF7N
	4EvgaZrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnFR2-00CFZG-1a;
	Mon, 02 Oct 2023 09:41:52 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnFQy-00CFY4-16
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Oct 2023 09:41:51 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-53447d0241eso15190813a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Oct 2023 02:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696239705; x=1696844505; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwQS1I2S/UPYL/Sf2BTeKAyKxjWoqdfF0azKmWY199s=;
        b=RKOngAgdTN/fauzjYiHOltXZX37ZHtphVWwXqXPgXR8915R+FitEyY67sqtMZvn7HJ
         /X2XgkHqkM83+PmGM3LWXlaywG0otEtQ5aj+D9peuq5H54/Dw5w1JNiIcxyEXSaHJ2Vh
         KaKt6jDhCoqFkifW64jMOe3oxJj/fOyCFHzNhV00Eqyq7U0echZGUKvSwoe3USKmNNrN
         Av7ixdv+2d/GLBfHevnSxWhZr2enN9xNYDeDPBg1/S4qIOJRMcenpCBBtDHrALn4+N1W
         8PmeNyLBP026FO3Zc7zfhtOMIXzeINfuZFZZV26H4z8xDdtQ8FMryjt2DzuQPEp3BTr4
         pIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696239705; x=1696844505;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwQS1I2S/UPYL/Sf2BTeKAyKxjWoqdfF0azKmWY199s=;
        b=esknkGojjlBpckaHBT2FvUL4w2QxGpoQ+Z2zM0/OpzkiyzPFW9Ib2HNL1J6aWbLl9W
         CJVUglgUKKk0JJ2/OgvO9bSL+vCUofaz8WQfZixWOlZk6YThcCuR2t+5SjeViXvW/cN4
         Lb0A8TnSo6IUHpkuO2IckhrqqYGtXjNYe2cwzVsWSSUKlva0erOt1aMVLMkbmiQ2Gv4j
         cfBkEkRSli5Q2aWTNC3+W6A8bmUZ2kAGCbtJfYmQeNjtkEdMUa+fRNcnZxWahyNDAl1x
         6f02LivrTu9QOEMbvAPo9J1mSF+OXlAG0tstm2+fHkmoUFY7AI8ldTXpWkXMWBonHPL2
         xkxA==
X-Gm-Message-State: AOJu0YzzFdUZhvJykfKMDT/3cWjHPHuztwPCh8xrMHmMwJKMrPVzvjxZ
	MZsP63g9h63QMHHeiZcBII0=
X-Google-Smtp-Source: AGHT+IEo7YjT0mHXU+8kOwIQ0etcMXrU15cDO31hE8GbdKC1lD5TANXkhm2jyPryZoGR1Fn9McKpiA==
X-Received: by 2002:aa7:c2d7:0:b0:534:2fd8:a9e1 with SMTP id m23-20020aa7c2d7000000b005342fd8a9e1mr8947588edp.22.1696239704650;
        Mon, 02 Oct 2023 02:41:44 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id b18-20020aa7cd12000000b00537efd5f1a8sm4454057edw.69.2023.10.02.02.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 02:41:43 -0700 (PDT)
Message-ID: <d26ee3f8-d5d3-e46d-4d79-098992d13790@gmail.com>
Date: Mon, 2 Oct 2023 11:41:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: nfraprado@collabora.com, wenst@chromium.org, robh@kernel.org,
 amergnat@baylibre.com, arnd@arndb.de
References: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
In-Reply-To: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_024148_386561_F8D1AB5A 
X-CRM114-Status: GOOD (  25.98  )
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



On 29/09/2023 10:20, AngeloGioacchino Del Regno wrote:
> I am a top reviewer mainly for MediaTek SoC related patches in most
> subsystems and I've also been upstreaming both improvements, fixes
> and new drivers and devicetrees when required.
> 
> The MediaTek scene saw a generous increase in number of patches that
> are sent to the lists every week, increasing the amount of required
> efforts to maintain the MTK bits overall, and we will possibly see
> even more of that.
> 
> For this reason, and also because of suggestions and encouragement
> coming from the community, I'm stepping up to be a co-maintainer of
> MediaTek SoCs support.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks Angelo to volunteer on this. It actually was on my list for the last days 
to ask you to help me out as I'm not able at the moment to cope with the review 
process. That's unfortunate and we missed one merge window (August) where I took 
no patches but after holiday situation didn't get better. I don't want to be 
break in the MediaTek upstream development, so it's great to see you stepping up.

As I read in the thread, I agree the best will be to have a share tree at 
kernel.org. It seems I can't share my tree with you, so hopefully you will get 
access fast.

My idea is to not disappear and create a collaborative process for us on the 
maintainership in the future.

> ---
> 
> P.S.: I tried to reach to Matthias for almost two months, but I couldn't
> find any way to talk to him and he has been unresponsive on the mailing
> lists as well.

I think you didn't tried matthias.bgg@kernel.org, but that should be no excuse 
from my side for being unresponsive. Thanks for your help!

Please contact me on IRC for any coordination.

Regards,
Matthias


> 
> P.P.S.: This also comes after Rob Herring's suggestion to have myself as
> a MediaTek SoC co-maintainer [1] and support from other people.
> 
> [1]: https://lore.kernel.org/all/20230804225813.12493-1-robh@kernel.org/
> 
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 208cfcc1aee3..211a8322c801 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2330,7 +2330,7 @@ F:	drivers/rtc/rtc-mt7622.c
>   
>   ARM/Mediatek SoC support
>   M:	Matthias Brugger <matthias.bgg@gmail.com>
> -R:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>   L:	linux-kernel@vger.kernel.org
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)

