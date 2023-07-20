Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D64EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaGgfMAK24xIDWN4a7lji8OIXbDghDdykVgMN7BuAHE=; b=mJ5KydovvrdqkALd6xPmX88r28
	j6cstWBLnAYyA3Ft7SICsqD49CGkECBqt9bSKHkD/y3KMkNcf+6RnolK/lNc8g3ILDPv6SubdWMao
	tGEDwtWUmjA/+LmvNLONecyBrkvqMHR0h9VGk1eaDzl6cC2luqI9gicK1F23W5YsGYodnXMZ8PXv7
	LN0Ig/TKCXKdWJcrP4HxMRFfEEGhhocKvpDIe6eGG7ycYIyNXZ8cnqa0KUKU1fVtB/k9wToO+BWSi
	RJykQddIzPm54XqNXbxFvtgeMovqncw+3K9yHjLx/gW8q2igvpEIPmu5UPMHubt//lW6ca09C7kV3
	kG1ezE2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSPP-00B51U-03;
	Thu, 20 Jul 2023 12:05:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSPM-00B50r-0H;
	Thu, 20 Jul 2023 12:05:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DBDD16607083;
	Thu, 20 Jul 2023 13:05:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689854722;
	bh=4zdlMTy2Q9xaiOXHklHe2EJ+an362L+tbbNoTvs277Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PHtnqlc7wNEtf+0+9asTEBLPgo5wze4be0hStobRTy0R6rwA22zNO9NTVSd9r8rKx
	 FsPD10bOkxbdjvSH3z2HjVy7ztDBTVIFCXA2vqM0y20mbdfYMdAA8xOgp6UkHKPZnE
	 yiSQ+uiIySkDWLCvRWVt9J0Kk0zn+r/hMmm/e0ipaDxBoYMhnGrKZFPGKFPAvgxCtp
	 m4v31whL4HjmrG+VOJfAwwyYiuINYXe77MWs0qyrTViuXb5K6tjla+hQ7OQQlESjKL
	 VHVqO4rq0ri1s8iilG/b65BdyjvhVD5xQI4L2LVikN6flY2YLaVXo7waj2GZl4wPRP
	 lBFFvT60bwfoQ==
Message-ID: <ac583fec-d991-713b-8329-96b3626465ef@collabora.com>
Date: Thu, 20 Jul 2023 14:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt6795: Add support for display
 blocks and DPI/DSI
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, kernel@collabora.com
References: <20230720091559.86406-1-angelogioacchino.delregno@collabora.com>
 <20230720091559.86406-2-angelogioacchino.delregno@collabora.com>
 <0809ac02-b8bf-ed63-9e2e-e77cd7e93464@baylibre.com>
 <d892a76c-165b-dbeb-79aa-70f3ebd7f07c@collabora.com>
 <ab463c69-59e0-99b5-1526-7c344fcc593f@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ab463c69-59e0-99b5-1526-7c344fcc593f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_050524_252495_6BA1C2F0 
X-CRM114-Status: GOOD (  15.42  )
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

Il 20/07/23 14:01, Krzysztof Kozlowski ha scritto:
> On 20/07/2023 13:52, AngeloGioacchino Del Regno wrote:
>> Il 20/07/23 13:35, Alexandre Mergnat ha scritto:
>>>
>>>
>>> On 20/07/2023 11:15, AngeloGioacchino Del Regno wrote:
>>>> Introduce all nodes for all of the display blocks in the MediaTek Helio
>>>> X10 MT6795 SoC, including the DSI PHY and DSI/DPI interfaces: those are
>>>> left disabled as usage is board specific.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    arch/arm64/boot/dts/mediatek/mt6795.dtsi | 252 +++++++++++++++++++++++
>>>>    1 file changed, 252 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>>>> b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>>>> index 597bce2fed72..d805d7a63024 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>>>> @@ -2,6 +2,9 @@
>>>>    /*
>>>>     * Copyright (c) 2015 MediaTek Inc.
>>>>     * Author: Mars.C <mars.cheng@mediatek.com>
>>>> + *
>>>> + * Copyright (C) 2023 Collabora Ltd.
>>>> + *                    AngeloGioacchino Del Regno
>>>> <angelogioacchino.delregno@collabora.com>
>>>
>>> Shouldn't be like this ?
>>>
>>>    * Copyright (c) 2015 MediaTek Inc.
>>>    * Copyright (C) 2023 Collabora Ltd.
>>>    * Authors: Mars.C <mars.cheng@mediatek.com>
>>>    *          AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>
>>>
>>
>> I don't think that there's any rule about this?
>> Also I don't really mind the strings order, but if anyone really does, I can change
>> it....
> 
> These have two entirely different meanings. Your patch suggests you hold
> copyrights (which is usually not true if working for employer).

Right. Thank you, I'll send a new version tomorrow :-)

> 
> Best regards,
> Krzysztof
> 



