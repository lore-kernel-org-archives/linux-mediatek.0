Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0E0C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 08:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vG2WT3fdaeDWRRLWds3qHBvdF671x6f6MUFtocxYOJs=; b=2qFYCeJ/rqcwdA7rlG+/YJlB+0
	N7eLXbjvBm+PwBVtBZ9P9uk7x2l77pB3c7puMfIKZyhjKEDT45uWOCQU3LUZycsTHKyMFEAz3AHFc
	3JnG/3hbEtUtfh+oX9n1ZhjcXHy8t0764R5l6pWaumPPkM9NuUKRfscDRpDgfSiu1DKowR3xzbPZA
	5owKvlDFAKC5MswTSMNeE0ZJGMIehPe8PeUSc0Ukcl3hSpl8jl3BFMyX1ghivwLGmKJ8AmRTkln+8
	ouSQ7i6mVBSb3t1m02I81aK4uaGuBx4OrsSsV+C1YkJ51w+o27RnKUlXUpN91plePEATY5kAeq1ZI
	ZkXDJ52g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnAZ-006Fwg-LK; Fri, 21 Oct 2022 08:14:19 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnAI-006Fmn-C0; Fri, 21 Oct 2022 08:14:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 15288660252D;
	Fri, 21 Oct 2022 09:14:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666340041;
	bh=C5fhU6Bgv3bCUz3Llyic5ABqZ5cYvuR764ThhvuGkiQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K/xUneU4RGgtP+eNwsviIlPLkiYs7DAZX7HoYSaBiqyLqlxfwxcSJ1fSBUU4SaYWd
	 sxw4A3qpi17wjVv0k7VKK0Fa7r18A0qDU8sWFkg/IWhd3lBdW3RAYCM+/fY8tAxFLw
	 b1O+wMZUKG2L/4cF5eby0idvdK1DLImAukrFXCZclFYedHyYWtLMjMpM9SG5b//iwu
	 FfUDpKj3yVl2Taql1hPMcREnj8a3UxS/Mr0MpP/z8wejQGbkKBiQS/Nz0YEX7AB4Lv
	 UXCcD6Qny5H6GmKvxVmISPDYSC5vLnpg6KohB9uHOsO9xo57WSFUT6d1h0EOVLJgDa
	 zMelP1w+1snnw==
Message-ID: <185de97b-4cf5-3b3a-e7a4-2967dc54db1f@collabora.com>
Date: Fri, 21 Oct 2022 10:13:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 6/8] arm64: dts: mt2712-evb: Fix usb vbus regulators unit
 names
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sam.shih@mediatek.com, hanks.chen@mediatek.com, weiyi.lu@mediatek.com,
 zhiyong.tao@mediatek.com, andrew-sh.cheng@mediatek.com,
 viresh.kumar@linaro.org, fparent@baylibre.com, mars.cheng@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
 <20221013152212.416661-7-angelogioacchino.delregno@collabora.com>
 <3b7fc7414f282ca044c24dae280f9bc9533a5b7b.camel@mediatek.com>
 <96ab6836-4650-ee53-a0c9-54b8328b8667@collabora.com>
 <616a128698656e71a4e28d59bbced17443c5cebc.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <616a128698656e71a4e28d59bbced17443c5cebc.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_011402_589625_C3F5B6B7 
X-CRM114-Status: GOOD (  13.91  )
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

Il 21/10/22 08:25, Chunfeng Yun ha scritto:
> On Fri, 2022-10-14 at 09:35 +0200, AngeloGioacchino Del Regno wrote:
>> Il 14/10/22 04:43, Chunfeng Yun ha scritto:
>>> On Thu, 2022-10-13 at 17:22 +0200, AngeloGioacchino Del Regno
>>> wrote:
>>>> Update the names to regulator-usb-p{0-3}-vbus to fix
>>>> unit_address_vs_reg
>>>> warnings for those.
>>>>
>>>> Fixes: 1724f4cc5133 ("arm64: dts: Add USB3 related nodes for
>>>> MT2712")
>>>> Signed-off-by: AngeloGioacchino Del Regno <
>>>> angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    arch/arm64/boot/dts/mediatek/mt2712-evb.dts | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
>>>> b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
>>>> index 638908773706..d31a194124c9 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
>>>> @@ -50,7 +50,7 @@ extcon_usb1: extcon_iddig1 {
>>>>    		id-gpio = <&pio 14 GPIO_ACTIVE_HIGH>;
>>>>    	};
>>>>    
>>>> -	usb_p0_vbus: regulator@2 {
>>>> +	usb_p0_vbus: regulator-usb-p0-vbus {
>>>
>>> Can we modify dt-binding of fixed regulator instead of changing the
>>> node name,
>>> since all nodes using fixed regulator may need be changed.
>>>
>>
>> These regulators have no MMIO, nor need any index, so it would be
>> simply
>> wrong to change the binding and leave them as they are here in the
>> devicetree.
> You are right, then many files need be modified?
> 

Yes Chunfeng, many files need to be modified due to mistakes made in the past.

No big deal though: as long as we're all aware of what needs to happen, it's fine!

Cheers,
Angelo


