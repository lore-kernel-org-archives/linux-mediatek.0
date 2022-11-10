Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A2DC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJihVigxc3YBQCdD/qaXAkslKdIoK8zbFHIY6LxE+sk=; b=hGLnpqEwxVM4Q/d9du8Ib1a9dw
	u1CASzY5/5rJ3eWv8YTH1gmcYjilIW9oG0mWt8TCiq74v9Rs8bjknvvud12fs7aPOL4Q3j8rXACWT
	aMeIpaHrWSRTFjkAc4WZWiO4bo04RWHvo9GoNDwbPZpLS0d/6YN63tcdNdIbTt30mJoTfGJ8Ey5pi
	h0fu7g4vY2vTQ9hjFcqpbMvyDwSU6rXIkBwQOSyhBjAmDcVhBvYJEcpO5J38KIAedEp1nspmMxt1/
	WkJvQ08nmoX0lGJuJukknvWr//iQpFPWe0QqS1DEpS5h2xIcvpcbE08yGE4HwtdXr/knBQG+oBvZT
	OR0hxZ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot7Pd-005xhw-Di; Thu, 10 Nov 2022 13:16:09 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot7PR-005xe4-BE; Thu, 10 Nov 2022 13:15:59 +0000
Received: by mail-wr1-x431.google.com with SMTP id y16so2181177wrt.12;
        Thu, 10 Nov 2022 05:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJihVigxc3YBQCdD/qaXAkslKdIoK8zbFHIY6LxE+sk=;
        b=EYgiAWcjV27JiZUmxRn5Tr2Ji8RqFCHAaiTBcThLsYWgWQxcfP+hAU4CMPTlb0iEmE
         xQUX+NrxXcwNXhQIAexVwZ1J0DmstP1eLy+x65HkZ1rsSiv2ZowF++0Q29UJffbyPfCx
         MgIGDRzt0mBWhWPGW3NJuEkculyGnj0CRLcgZj/AEqcRYBK5I7EjgP9++qd6kO9hHon+
         iTtuAPt1uONNQztNkn6ixMF8aaONJYtc2JiD8QrSgYVonz7w0gZM3P8/vfL93YZvgs/A
         IZe5xEAHJk8RsDegi8Dz3YjXNMLU4Oz24RK6HhOCu5OIg87zRKKgnTW/sjovl0AsdGp2
         7nUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJihVigxc3YBQCdD/qaXAkslKdIoK8zbFHIY6LxE+sk=;
        b=UWrZV6fn9bbXy2e2SxA2lmsWn5x3KCqwt7Mn2OiSzTuFsNH07Jmcdu55Kj1kSrNuxq
         7VR9sfVZt56jjepH765fFogF8K2kiwE2PUzJJV4KYFMklB9Md7/4XgG997knJlsXIEhY
         9hO+SuyqPo0g6MXPj9HeVJEIyefZFCO+LpYPbOSjLrOeX6DRKzontLsXaWdzqbaDOkGx
         vY9zOXeUhSnCfp47r0udwOIuzFiw5lL1PgZYKsSvKQJWgOYEsHb+9XHwN9ac5eiqE+Gc
         Lz8XkQpY2n3uDIN9jmZhiJ4o0g/RZa35Z35WiLOeOk1GZrdGL93LbyrTJF6oi2nz6Huq
         JDhA==
X-Gm-Message-State: ACrzQf3dNtT57V3T8LsZV15+rQ1XJ5ATtMqU5HQWKuBn9sn8SegKgo9I
	iwXay8bhXPFQ1hyJs3G5jTI=
X-Google-Smtp-Source: AMsMyM5g4mhTFAFCs2FPncVjkJu2yntcuKmfiDvf/4whVmdZ2/hBYfOyLbb4MJ1Nb6H9pW2fAAPuzw==
X-Received: by 2002:a5d:650c:0:b0:236:49d9:8e83 with SMTP id x12-20020a5d650c000000b0023649d98e83mr41300085wru.714.1668086155058;
        Thu, 10 Nov 2022 05:15:55 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c358b00b003cf47fdead5sm5688374wmq.30.2022.11.10.05.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 05:15:53 -0800 (PST)
Message-ID: <a77e722d-6354-c670-281d-f10217c73927@gmail.com>
Date: Thu, 10 Nov 2022 14:15:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 0/3] mediatek: pwrap: Add mt8365 pwrap support
Content-Language: en-US
To: fchiby@baylibre.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 "Zhiyong . Tao" <zhiyong.tao@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>, Sen Chu <sen.chu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221031093401.22916-1-fchiby@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221031093401.22916-1-fchiby@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_051557_431568_13208874 
X-CRM114-Status: GOOD (  13.36  )
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



On 31/10/2022 10:33, fchiby@baylibre.com wrote:
> From: Fadwa CHIBY <fchiby@baylibre.com>
> 
> Hello,
> 
> MT8365 requires an extra 2 clocks to be enabled to behave correctly.
> This series contains patches adding the support of mt8365 pwrap.
> 
> changes in v3:
> - Modify "sys" and "tmr" descriptions to be more generic.
> Changes in v2 :
> - Rebase on top of linux-next/master
> - Link to v1 "https://lore.kernel.org/linux-arm-kernel/20220530135522.762560-1-fparent@baylibre.com/"
> 
> Regards,
> Fadwa CHIBY
> 
> Fabien Parent (3):
>    dt-bindings: soc: mediatek: pwrap: add MT8365 SoC bindings
>    soc: mediatek: pwrap: add support for sys & tmr clocks
>    soc: mediatek: pwrap: add mt8365 SoC support
> 
>   .../bindings/soc/mediatek/pwrap.txt           |   3 +
>   drivers/soc/mediatek/mtk-pmic-wrap.c          | 114 +++++++++++++++++-
>   2 files changed, 113 insertions(+), 4 deletions(-)
> 

Whole series applied, thanks!

