Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61ACC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 10:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sO4cl5xjhBVd3+iJHoMx+vhvACtxqzk7PC5Y+IYSlGo=; b=nFeMFjeft/YyJFlmbHXmiM0gNz
	oafhwpcuueym1/pUO9199jzY4vqjJ3JeRz5t+NaoR10ALbE1mJlRoZqb75KaAD707mZAKVNy1AGe1
	zapibqGa9Dqje56LdHck7MHkVkk91OoGgfsBpWw2GdlSRe7n7cvMC5nPswphCHuaXfHAJb8XCYZl1
	Fc4DdEYXqvXcj8KdHrU7i9DnVGLs30yp9CIln/ez6r+ecfi9tl7qeLSFELTGyOZDjY/5cImBeMtWz
	95vhYEzqf6AfX/FQOUq3JLDk5iM5SEZvr5PDIm+VDlxg9jRKxpe6l+Jsk9dDkq305h9UI8UALfuHR
	vvzvBUoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68Ea-00EC1L-IA; Fri, 16 Dec 2022 10:46:32 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68EN-00EBx4-Sk; Fri, 16 Dec 2022 10:46:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id m14so2065983wrh.7;
        Fri, 16 Dec 2022 02:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sO4cl5xjhBVd3+iJHoMx+vhvACtxqzk7PC5Y+IYSlGo=;
        b=U+wbUqs6y5Ha3t9PLfeWlC2Tn5Exdl4K5spuYibUc5x4Tako5sn+lV2bE7eNBDrXHY
         TphwwB5MfnzepvG/hWZZBVC2+59pd3VSdorV4S1rQRJpujtVaPon1fkyvAv35JO63SpW
         DMAvbbLO8MAPK05sKTQWD/lsr6eZ1zmwpB0dM0PlrTWBFwMoso37SLjeIlIGak0TFaMq
         Idfn+zrcnNvR7XcyxkzF1B65JRBzk+MjX6RVkutgYUJ8l1mDq5K6ze7/FVgvuow77c0q
         7NioshZexPrE9jJ/SWXfGZFbNm65oL75dnovVmi1hDXz/AMqAdPaF3HezRiydofhTUcx
         nJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sO4cl5xjhBVd3+iJHoMx+vhvACtxqzk7PC5Y+IYSlGo=;
        b=oci8QJrNwrVqlfGn9rcpTC8cOMt/pRGSpNP7hQrBp2vjv0+sS8r7mqAlLB9QjitYdI
         BYCrcSEgyukJQEibnKv379yCWAxs9YFVe4mxX/nO8ZaTdC0azyxhhtOPAJ0LZ+36tAEk
         WDjrSU8Vw3XNJDvm3AZFPgeqMN+5vFICXDkFbp5lHTMB/lC0Q6R4lsMKEUqXFCzt0wL8
         bNPbW8+zaYwnk92CrUTM9PA7q00ly0EH5/rggaLr951K+6UBnSnyKbxGHH424oJID9b6
         mB7kb/lFs4KDoYtGUsW1j3e3jk0YA5pOSmdSNvuCy8gOj9PqwZZ/DEvwmI3cRmwXHYee
         mCuw==
X-Gm-Message-State: ANoB5pkHwBmiHYcSVKAG89TYY+wbiELSxqlCCuQcldwLai9ihrdFM3OL
	alZzCTo8L1tOGPkrqibTKOE=
X-Google-Smtp-Source: AA0mqf4HOHiYTqq0kp7OdkUCzJ8BQs4DBeNan81nRQTiiI1Wk2/CM9cRgA6TnfWggcAf6dckKY2Xsg==
X-Received: by 2002:adf:a44f:0:b0:242:63e5:2449 with SMTP id e15-20020adfa44f000000b0024263e52449mr22819655wra.69.1671187575593;
        Fri, 16 Dec 2022 02:46:15 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id r4-20020adfa144000000b002367ad808a9sm1974295wrr.30.2022.12.16.02.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 02:46:14 -0800 (PST)
Message-ID: <ebc435fd-0acb-6588-8acd-c8d504ad4289@gmail.com>
Date: Fri, 16 Dec 2022 11:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 01/10] arm64: dts: mt8183: Fix Mali GPU clock
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, wenst@chromium.org,
 miles.chen@mediatek.com, rex-bc.chen@mediatek.com,
 chun-jie.chen@mediatek.com, jose.exposito89@gmail.com,
 drinkcat@chromium.org, weiyi.lu@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com
References: <20220927101128.44758-1-angelogioacchino.delregno@collabora.com>
 <20220927101128.44758-2-angelogioacchino.delregno@collabora.com>
 <20221206183037.3jnssar4yxcx5hpb@notapiano>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221206183037.3jnssar4yxcx5hpb@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_024619_957615_46884007 
X-CRM114-Status: GOOD (  23.91  )
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



On 06/12/2022 19:30, Nícolas F. R. A. Prado wrote:
> On Tue, Sep 27, 2022 at 12:11:19PM +0200, AngeloGioacchino Del Regno wrote:
>> From: Chen-Yu Tsai <wenst@chromium.org>
>>
>> The actual clock feeding into the Mali GPU on the MT8183 is from the
>> clock gate in the MFGCFG block, not CLK_TOP_MFGPLL_CK from the TOPCKGEN
>> block, which itself is simply a pass-through placeholder for the MFGPLL
>> in the APMIXEDSYS block.
>>
>> Fix the hardware description with the correct clock reference.
>>
>> Fixes: a8168cebf1bc ("arm64: dts: mt8183: Add node for the Mali GPU")
>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Hi,
> 
> it seems that while all other patches on this series were applied by Chen-Yu
> through the clk tree, this commit never made it to the mediatek tree.
> 
> As a result, MT8183-based machines (or at least mt8183-kukui-jacuzzi, where I
> tested on) currently hang during boot not only on next, but also on mainline,
> v6.1-rc8. With this commit applied I've confirmed that the machine boots fine
> again.
> 
> Matthias, could you please apply this commit and make sure it makes its way to
> v6.1? Given the Fixes tag it should eventually make its way there anyway, but if
> still possible would be good to have it fixed right from v6.1.
> 
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Applied now.

Sorry for the late reply.
Matthias

> 
> Thanks,
> Nícolas
> 
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> index a70b669c49ba..402136bfd535 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> @@ -1678,7 +1678,7 @@ gpu: gpu@13040000 {
>>   				<GIC_SPI 278 IRQ_TYPE_LEVEL_LOW>;
>>   			interrupt-names = "job", "mmu", "gpu";
>>   
>> -			clocks = <&topckgen CLK_TOP_MFGPLL_CK>;
>> +			clocks = <&mfgcfg CLK_MFG_BG3D>;
>>   
>>   			power-domains =
>>   				<&spm MT8183_POWER_DOMAIN_MFG_CORE0>,
>> -- 
>> 2.37.2
>>
>>
>>

