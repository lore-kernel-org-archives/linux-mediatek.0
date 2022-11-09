Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27A6C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 11:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvtdKEg5HPVz3X+JgHtwGowTHYk1pgsNrv53DSwRrFA=; b=D98yaujVLpjKDeFl9o6WKKIDS7
	pq96Xyv36tPTqS46m9Qv4G+Vqmr1MIMZfvUCtMJ7IcNz3aHBUVxLNmdHIf2q5WQUwUFuoPcD/EyOj
	h21rFgMBPV6SVOefHW3NmZ96MnsalLHDq4HPqwh38d1QHAYy9Fr/mGYsKiJzjw72ndVZ17+2Ot0Eb
	JPnfnEArs84o7vdESUfjknm4H//ELOb4YAEy1VIPBzah32v19KNJbKqCjtsFw6Lru/Pltjl6E5xG8
	pCPA5xcL93EFqnvjK3PxzvLHq5BwzJSxcf8PgO7lyE7i/wq1S+UGcPND3NSoCAYhzYEE6RR1BfSXz
	NysZBOOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osj6h-00Cxe2-P0; Wed, 09 Nov 2022 11:18:59 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osj6L-00CxTC-Iz; Wed, 09 Nov 2022 11:18:39 +0000
Received: by mail-wr1-x433.google.com with SMTP id l14so25291408wrw.2;
        Wed, 09 Nov 2022 03:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvtdKEg5HPVz3X+JgHtwGowTHYk1pgsNrv53DSwRrFA=;
        b=dr/5x8PeQugDwz9zS/lRvw1wyHROVXsoNERq/mQA55Cw10aTLyWLE2xDhkrbNtQfQb
         9U9ZeAtu6osFQScxobESpVYxg9LEmAVE8HEeNV5p0q8b4wIrmlq4NAjb049xmjXOe1z7
         f6tt9aEucdDBFAC9y9DQzKLxobC2tK3YuO/tXHFlQuO4OttdIbIrcQ7PLQHLWcoTSIX5
         4LRqPSf5D/ez+6dfzAV/pliSjSzX1x6uV8vwhTnTSb3I9zeOhmnYC+BCqQ/uWSAlyx75
         ZbaBIF5K4KGAXl2kKxGIGpEx0+rNm7F0+l2rI2FHW6EQ8Uve+1vm+vmcKfayY/uFAjzA
         mtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvtdKEg5HPVz3X+JgHtwGowTHYk1pgsNrv53DSwRrFA=;
        b=VrpLvAX/9oUm8lyLTs4c8Pvxty2oNhp9T9iD7m4nekSTmfpdb10hFfaLoGolZ+ulxK
         d7HbPBrVyRHS/C+eBbR5ds5CP7GvhIdkZTnSJUfrlJOEf3S+KVRrU0qytKxkGXgMMKD6
         9NhReXshQ0c55TWfvJR9Ntn3fgq2pXDXYFvcdSeCIFiWt4t2jqbCH5YvC5GEOb9zuamt
         j9wQ/cR0K9lPdalO4AC7SXmvhrJr6NtspOjgUI9pD0Vk1E5z91Sr5xWFri0CqlY/aq1X
         GY8cWUOfP1ihGAnP+GCpKV93R70lnPfUX9Pr379xGMzGpA7ZE0o/OHgcDBbucJdnrx3b
         a+tQ==
X-Gm-Message-State: ACrzQf0salQ9WM3PtPtNetlH0z9XhkGabE+0bMxyOIc4C18RmsIFaTKy
	weYus/PWw+YnGjXCuJjZNbUh0d5O51s=
X-Google-Smtp-Source: AMsMyM6WJqLIdMRVHiViy2TilAyD/0aBmIfS1ZkVy/xQ6rNS2kHQtvnt87DvaPbI24ekuh55jHC+Hw==
X-Received: by 2002:adf:eec6:0:b0:236:aabb:8c90 with SMTP id a6-20020adfeec6000000b00236aabb8c90mr31041409wrp.199.1667992715589;
        Wed, 09 Nov 2022 03:18:35 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id h4-20020a05600c350400b003c6f426467fsm1333419wmq.40.2022.11.09.03.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 03:18:34 -0800 (PST)
Message-ID: <7eac9be2-a880-8971-117d-ec533eebaf4a@gmail.com>
Date: Wed, 9 Nov 2022 12:18:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v28 04/11] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys1
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-5-nancy.lin@mediatek.com>
 <90d8dfb1-2a37-e79a-b912-c77076e493c6@gmail.com>
 <20221108191008.lsasjskm7tzvpa42@notapiano>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221108191008.lsasjskm7tzvpa42@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_031837_644120_F9DFEC99 
X-CRM114-Status: GOOD (  15.62  )
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



On 08/11/2022 20:10, Nícolas F. R. A. Prado wrote:
> On Tue, Nov 08, 2022 at 06:46:54PM +0100, Matthias Brugger wrote:
>> On 07/11/2022 08:22, Nancy.Lin wrote:
> [..]
>>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>> @@ -80,6 +80,12 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
>>>    	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
>>>    };
>>> +static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
>>> +	.clk_driver = "clk-mt8195-vdo1",
>>> +	.routes = mmsys_mt8195_vdo1_routing_table,
>>> +	.num_routes = ARRAY_SIZE(mmsys_mt8195_vdo1_routing_table),
>>> +};
>>> +
>>>    static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>>>    	.clk_driver = "clk-mt8365-mm",
>>>    	.routes = mt8365_mmsys_routing_table,
>>> @@ -292,6 +298,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>>>    		.compatible = "mediatek,mt8195-vdosys0",
>>>    		.data = &mt8195_vdosys0_driver_data,
>>
>> It seems we are missing a patch in the series. vdosys0 also correct was
>> never introduced in the driver...
> 
> Hi Matthias,
> 
> as mentioned in the cover letter, this series is based on the series "Change
> mmsys compatible for mt8195 mediatek-drm" [1], which introduces vdosys0. This
> compatible entry specifically is added on patch 3 of that series [2].
> 
> [1] https://lore.kernel.org/all/20220927152704.12018-1-jason-jh.lin@mediatek.com/

My bad. Thanks for the link. I realized that yesterday but had to leave 
urgently. I'll have a look on this series now.

Regards,
Matthias

> [2] https://lore.kernel.org/all/20220927152704.12018-4-jason-jh.lin@mediatek.com/
> 
> Thanks,
> Nícolas
> 
>>
>>>    	},
>>> +	{
>>> +		.compatible = "mediatek,mt8195-vdosys1",
>>> +		.data = &mt8195_vdosys1_driver_data,
>>> +	},
>>>    	{
>>>    		.compatible = "mediatek,mt8365-mmsys",
>>>    		.data = &mt8365_mmsys_driver_data,

