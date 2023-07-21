Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68F5EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 12:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LfYJxT8/PQgOI8EMuv1dYvPO7R8GSgfQTCAsknpK04=; b=W7tceJBXH7UC5p0gnNNCb6NlQr
	/myRAfHN26IjPYz4iyvhIGinXyWCI8raBRzj2Pef4BQEkbEbq4+nJuKfBH7g4K5ngRV9ng6HnH2ow
	h0itU3QfSKSG0TlkfyUcTtFOKKH4/2C7qDwU+GFR53zlk/Ja9eHMRIjSWsJKwmdQNyKk/1H2qIAed
	Gr+dUKCEPtGIyIQizRsUcnIQFvqdNlIc9af+B53+3k6uisxse29rYnNS4Fl5YSWPVO5Ao5L00d7kp
	tIJzP4NCzsp1s1J2mS3yVeY60yYylEq5aG9HPNjKq2suV2zssI9/Lo4bQQxXPGPsDLyxx5JfvY/Wl
	3pwxFoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoqw-00E0Tl-23;
	Fri, 21 Jul 2023 12:03:22 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoqs-00E0SU-2B
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jul 2023 12:03:21 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3142970df44so1461748f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Jul 2023 05:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689940995; x=1690545795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0LfYJxT8/PQgOI8EMuv1dYvPO7R8GSgfQTCAsknpK04=;
        b=W9dOJVxhBjvVomAhaW0PulNleqdkzk6xereHKsD3oXaTkxr1hd9dS3JIPkW2G7j3UF
         TKHDxN/ONQVQK7DvY7NJIdQhBicgCADuL8Mhvwbyaz/C1toIw9LG8xvrt1sz4rphnDow
         5Ky2V7Al3B/qtddK/pW7BMBrDKkzj4TYWml9Pbi1j2TPtBFOq6bFmWrDvscvaDffEVZ2
         e5gypLalY1SqzdfDpKRC3jj4pA5aetZcT6gfqYu+hUiRb6zrz8Jf61nFaRvhU1VkR/cl
         WBaelHocsGTIXau2pLRqC9VurkY4kCKiKr0q67zmlL2kRQBde0BPaMseXdSsqdfeSeTb
         Ltcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689940995; x=1690545795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0LfYJxT8/PQgOI8EMuv1dYvPO7R8GSgfQTCAsknpK04=;
        b=C8yUANZfz7pZE3Q90caNr5gK6pdeB+EQY7n8CFAoL4yzMGO+cciuD2YRrMGT8rcQO1
         EFVZsEjx+tWwO054jbljpX/k/2qS3zrycpl1cNrHup94g19hjGotB9fcMCmHhlImGMvc
         sOiPv+CP7uPsjVCQd3SZLEFSPBfRL5r+4sKHDl0Lm5IhuK6Q9ny2jKal8iyXrSSVM6Wv
         87+9LzN1rRJKbKSzAWylq25K2qVqOwFo0dEce7Td7meBQvGhL4NCx+PtJdy3f5pvSDtR
         cbv5hzJjOgZcsMTWYefT6C7D1LOKM32WGIex9CtfWzzREtn4JLTCRH4GknuXLRoa0oyB
         wd8Q==
X-Gm-Message-State: ABy/qLbbgjw89qPd3gbS9s1CCVzhDv5x+dyaPDrcDkq6P3xe8J5vFIhc
	bRSHVRQANKfkzBTS0EpoguhBQA==
X-Google-Smtp-Source: APBJJlGDdfidTPWDPa/uOrnnpikMk+ASrNSwczpIAbJ9RJi9RZki0USHaGyB+TQB/WJZCrRm4wDfbg==
X-Received: by 2002:a5d:4089:0:b0:315:93a1:c733 with SMTP id o9-20020a5d4089000000b0031593a1c733mr1154305wrp.20.1689940995332;
        Fri, 21 Jul 2023 05:03:15 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id o26-20020a5d58da000000b0030ae499da59sm3998420wrf.111.2023.07.21.05.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 05:03:14 -0700 (PDT)
Message-ID: <ed87a08c-363f-600e-6853-1a6009eb3c99@baylibre.com>
Date: Fri, 21 Jul 2023 14:03:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/3] MediaTek DRM: Clean up CMDQ support and ifdefs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, wenst@chromium.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230623094931.117918-1-angelogioacchino.delregno@collabora.com>
 <6c71deca-112e-2ef6-9098-902bc4b92324@baylibre.com>
 <d5c9f1c8-6c05-7679-777a-aa6cec01a3f6@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <d5c9f1c8-6c05-7679-777a-aa6cec01a3f6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_050318_906140_E1100D94 
X-CRM114-Status: GOOD (  15.49  )
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



On 19/07/2023 09:41, AngeloGioacchino Del Regno wrote:
> Il 23/06/23 14:49, Alexandre Mergnat ha scritto:
>>
>>
>> On 23/06/2023 11:49, AngeloGioacchino Del Regno wrote:
>>> This series changes MediaTek CMDQ support to use the mtk-cmdq-helper
>>> functions, removing duplicated cmdq setup code in mtk-drm and also
>>> removing all instances of `#if IS_REACHABLE(CONFIG_MTK_CMDQ)` while
>>> keeping compatibility with both CONFIG_MTK_CMDQ=n and =m/=y.
>>>
>>> This applies on top of [1] and [2].
>>>
>>> [1]:https://lore.kernel.org/lkml/20230524093412.92211-1-angelogioacchino.delregno@collabora.com
>>> [2]:https://lore.kernel.org/lkml/20230608084727.74403-1-angelogioacchino.delregno@collabora.com
>>
>> Hi Angelo,
>>
>> Can you provide a public branch to test it please ?
>> I tried to apply the dependencies but still have an issue with the 3rd 
>> one:
>>
>> https://lore.kernel.org/lkml/20230523104234.7849-1-angelogioacchino.delregno@collabora.com
>> OK
>>
>> https://lore.kernel.org/lkml/20230524093412.92211-1-angelogioacchino.delregno@collabora.com
>> OK
>>
>> https://lore.kernel.org/lkml/20230608084727.74403-1-angelogioacchino.delregno@collabora.com
>> KO
>>
>> Thanks
>>
> 
> Sorry for the very late reply; I've somehow lost this email in the 
> haystack...
> 
> There you go:
> https://gitlab.collabora.com/google/chromeos-kernel/-/commits/for-kernelci/
> 

Thanks Angelo,

I build/boot your branch for the i350-evk board.

I had to revert this commit from your branch:
"15f12798e218 TODO: soc: mediatek: mtk-pm-domains: Support CPU Power 
Domains"
Because it conflict with the "soc: mediatek: MT8365 power support" serie 
[3].

Also, I change back the defconfig to be aligned with the v6.5-rc1

After that, the board boot and drm/display seems working like a charm.

[3]: 
https://lore.kernel.org/linux-arm-kernel/20230713150414.891893-1-msp@baylibre.com/

-- 
Regards,
Alexandre

