Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195DAC27C76
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 19:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RAf+FoD3kD3uKp2a9aXTt0ztNoNqQfHHQT67AwEHFY=; b=Tsinqy7HJhKPQg5dzf026f+8no
	Qu2sR/Bi6XHR7tlzUspXcK5zSVkB8TJkQMCTaZIYhOZd9nIByXLz1YcTfdPHX7HmPmo84Wp7/+1vM
	cmYLigmx+Cp+YHMsyZb971f4M0TYteUY7u5sfRNEBbzukKHpoRSQtxYMVjRbIFyfYl9ap6RLfnSPs
	xemJ2oAM2/Vq/1E6OGZSWTUUDtQ9sCZlqjqWFT/5oSEMx45mG+ePNRtbhPESnLjH9R1Vv0zyjA/ba
	9zn6iobVcF1oua2TGCyWu7EnOV5Zu9C/Ge05APi5myk4rZeLsbInCmL1MaQZgpcJAyt8LSmCF9DBW
	8H+ON8Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKl97-008Qqt-TN; Wed, 25 Jan 2023 19:09:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKl8w-008Qle-OW; Wed, 25 Jan 2023 19:09:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso2034218wmq.5;
        Wed, 25 Jan 2023 11:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5RAf+FoD3kD3uKp2a9aXTt0ztNoNqQfHHQT67AwEHFY=;
        b=b6H4AGc9EcLzEpPx1uNxpDkYcPOiFlaHxDr1dtMOdeYAPKhbJX0M9HTALOa/5GWWPk
         4KkMruQx7gIRtMa+nf670ZzvrfPJYOHUioW8A8fRWRwY4IPBliEFosyiKOJ1FjOf9Bk1
         siz60TgzggOI4I2fMZl2Hot3etpGe3VykDi23cXOhcuxouCac0nrAcQqxUAJMYEx440P
         vR2KOKNnnIKkgkcfFTGpABIswcbBF3vxsVFNVMmekAwzbmo2of95dYp6sSKNTWYFLQ7w
         DDfKiFfXvHjApYrFYcW7ESGEJkwnIdK9TaNcUmMcUDwv1Uft6+xArMMyIxUSotu41N0Y
         z6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5RAf+FoD3kD3uKp2a9aXTt0ztNoNqQfHHQT67AwEHFY=;
        b=onwRTk5LjuPYZAQHTuDej+RaZccp+BYgdAELd9XHuNChHokiS5fPmh8452HVlAo+jG
         XsQGVwz634wuIFkQhTR8l08PEmEJP/T2yPxv9ZBAe3qn8Qsh3usUMZhu98f8Bzn+VIcz
         qdDaEjGcVAoVrBpW7z/KmPMHacQ833itZaYhc9XeLSXM/bQV92Z8m3LTFsf4aYqORrXb
         ulXOhbhFSWexw0HuBRh09F2s+P3L+v+fXu4peWBgMwbDbYDdsYRXXh/qnhoD3XYgsS/m
         LpWFk2YGyRn3aaqeg9vAj4zMeTfG0hZrbFEl15P5mJrZnS01PpXlza360xDRGOViULNM
         q9pQ==
X-Gm-Message-State: AFqh2kq712ssJnX0SwP8UKL+6fad6BFNkxrXbfX6qUxH7upHZrxN0pCv
	qAynX7L82AZlSltn/H+abZU=
X-Google-Smtp-Source: AMrXdXvtMXyMvraIkniFaiTIvZWVgPXmcScLBOxVnQYgvmZhBJMkq+rEi0E9cvgaQW5EFnA9zYXaZQ==
X-Received: by 2002:a7b:cb88:0:b0:3d9:f801:73bf with SMTP id m8-20020a7bcb88000000b003d9f80173bfmr32430098wmi.12.1674673746896;
        Wed, 25 Jan 2023 11:09:06 -0800 (PST)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id b5-20020a05600c150500b003dafb0c8dfbsm2998092wmg.14.2023.01.25.11.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 11:09:06 -0800 (PST)
Message-ID: <243ad9f8-76f6-3e60-91ae-21d04ba6f262@gmail.com>
Date: Wed, 25 Jan 2023 20:09:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v11 5/6] arm64/dts/mt8195: Add thermal zones and thermal
 nodes
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org,
 rui.zhang@intel.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230124131717.128660-1-bchihi@baylibre.com>
 <20230124131717.128660-6-bchihi@baylibre.com>
 <80ce4ea3-6ebd-c249-45bd-a2f04343690b@collabora.com>
 <CAGuA+opCcdbPbasadEFbKw1nSy-kbK3WzKG=wXn6dtzynjrY1Q@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAGuA+opCcdbPbasadEFbKw1nSy-kbK3WzKG=wXn6dtzynjrY1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_110910_842308_EC76098F 
X-CRM114-Status: GOOD (  15.24  )
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



On 25/01/2023 16:10, Balsam CHIHI wrote:
> On Tue, Jan 24, 2023 at 4:37 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 24/01/23 14:17, bchihi@baylibre.com ha scritto:
>>> From: Balsam CHIHI <bchihi@baylibre.com>
>>>
>>> Add thermal zones and thermal nodes for the mt8195.
>>>
>>> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
>>
>> You should change the commit title to reflect the same syntax that you can find
>> in a `git log --oneline arch/arm64/boot/dts/mediatek/`.
>>
>> arm64: dts: mediatek: mt8195: Add thermal zones and thermal nodes
>>
>> or
>>
>> arm64: dts: mt8195: Add thermal zones and thermal nodes
>>
> 
> Hi Angelo,
> 
> Thank you for the review.
> Should I resend with the fix?
> Or you would fix it when applying it like Matthias did for "[PATCH v11
> 3/6] arm64/dts/mt8195: Add efuse node to mt8195"?
> 

If you need to send a new version for any reason, then please update. Otherwise 
I'll fix it once I can take it.

Regards,
Matthias

