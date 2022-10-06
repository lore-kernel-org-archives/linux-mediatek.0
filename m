Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D57C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 08:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCUjcYkHbcVyXLIT9cdtUDJfGRTFG6dpI97uyyTBB1A=; b=pSV4JHMnRXUsbmdf/A0BtS5tUT
	0EjmjeZoiYGg/GLJ6YLREG+uITx1JklLE44QQ1lbv18HvkOT/aBHY3FngcezstdcF6EOBJXzS07u4
	H2hOLnOea+yv+hTL2+QV8QZV3plTESKyVf/jNqherDtSy9RfRya9iRh2Kfxdcm7urp5VN2xQhuJDQ
	Cd8rhfzkOyUU5qkrmKA2Z78bB0to5cYag1nS5eRtuc1uenkrDmU5BYJIheIICstsHKJexqrLw8gea
	hqDRMBiYmUxZYKvZw70NiRb5aUtJaxjbh5DLJDSaQ2882XVhs2y80nBIGjqYQIu2xHwm8WILetpFZ
	v3G9PRbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMMu-000jst-U5; Thu, 06 Oct 2022 08:36:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMMg-000jkc-Gn; Thu, 06 Oct 2022 08:36:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6220E660226D;
	Thu,  6 Oct 2022 09:36:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665045380;
	bh=wFoOAN7bFW7ZcEUlEyrquYeMDkaLoO1zFNmCBqZXDyE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=momluOxPJp6aehDMfKrO28U93jCgFg9oTviy7NW67owqYTPG4f0TkFEupHLBgRC88
	 k2W81OkStlQz7uoLtA5s6btCHdRqP6S3AX5PV7nC75yx4plhMfRTB0nCCE8l2dpWL0
	 TtOKECUYee50s+C/6dGykHim1Ja96+N4BsyOimlx3eUYe+HfJqI3hiPgzHFhD2kCVx
	 MD/W25E6ru32yDnbQZez5rUHISK6ab6OjIeslrRu5dMETwe96zK7+30CPfk04DKcz1
	 /kaB1AW13g865R7QugWoz5WMb44P0I7d7Br6RPPq6lz5BY0+N1x5qh02OUm9c/QrbK
	 BBPmjoMgb8/TA==
Message-ID: <56aadffa-82be-f8ff-03d3-2a880b50ef49@collabora.com>
Date: Thu, 6 Oct 2022 10:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek: Convert mtk-wdt to
 json-schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 wim@linux-watchdog.org
Cc: linux@roeck-us.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 allen-kh.cheng@mediatek.com, seiya.wang@mediatek.com,
 tinghan.shen@mediatek.com, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
 <20221005113517.70628-4-angelogioacchino.delregno@collabora.com>
 <1f3ebf6f-117f-62a7-8e02-3e8a3bcf7e9f@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1f3ebf6f-117f-62a7-8e02-3e8a3bcf7e9f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_013622_800559_0CC89F91 
X-CRM114-Status: GOOD (  11.26  )
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

Il 05/10/22 18:33, Krzysztof Kozlowski ha scritto:
> On 05/10/2022 13:35, AngeloGioacchino Del Regno wrote:
>> Convert the MediaTek watchdog bindings to schema.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> There is already work in progress:
> 
> https://lore.kernel.org/all/20220422121017.23920-3-allen-kh.cheng@mediatek.com/
> 
> Best regards,
> Krzysztof
> 

I'm sorry, I forgot about that.

Allen, how do we proceed? Do you want to send a new version of yours, or should
I go on with a v2 for this one?

Regards,
Angelo

