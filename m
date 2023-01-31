Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B003C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 11:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sW62DMTy5EqgKSNNUYpAySNKtv/AINuLthr/sG7sIQ=; b=Hl6N6/zQo5zPtsiosXug/cRO3x
	TEUiR4kYfZDmRryUui4rWvjXg6Z3xR5oeHsFOrJI3ry0HGsI2fS/0T3b+SKi0GaHwtwib16axeZQe
	+zfVXiyG/gEWGBid5C+f/tmk6t6YkC8cDfVBlGCi6tnPV2EulbUQNJecuyzejLjDPsjx+w352O8MY
	wNO17rP9H5gh+pMb6/wBdpyOpjjSf1TsGXFvBw7C0SmHJnxrZPwnyR1iJjb1mriJatpzoeJ+f3wL5
	gIJa2BHXqqJPxHKYNZQCU+oLJibOiVt3d7AZr6ss6OI+JIIJvHMGTOrHOWIeL6sonpEd01SPh6mZG
	FRl3ufXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMpD5-007mdK-GN; Tue, 31 Jan 2023 11:53:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMpCv-007mbP-D0; Tue, 31 Jan 2023 11:53:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id k16so10149215wms.2;
        Tue, 31 Jan 2023 03:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/sW62DMTy5EqgKSNNUYpAySNKtv/AINuLthr/sG7sIQ=;
        b=P7HidmQxcYS0re1+EP13CCT/aPeprxqNnSZTM7pkLhyPxcPhPCKbRE2VyO7dksODVy
         mx+V1Qfy1qDrilZ6yhfrjQ+PLYWh7Ykx+KIm9x6tpWsnwPaUdPa2CqiZ/h6t5wa1/WYo
         WohYNasX4O8kEk4bQHEmdfVnwNjXQlDrLiFhd6wIZv8P9pbLVOCjgayTXrVT+I5DowWN
         QnPy5s5R+plB2nlwnPCbD0NPffc/YOwx79bz5jHVKd7z0LFjTH6gtYZ53MHpOi+2T9pD
         oOp/xoVdPrUvIANGPIoUFoM7IDWNETElXyTilmooYUOHNZ+S1NKdrFagAdgcWyzrywfJ
         +z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/sW62DMTy5EqgKSNNUYpAySNKtv/AINuLthr/sG7sIQ=;
        b=thDJo4daIw4Yq35+sFIuLcW1mPmcahg8/mWMLqRQ9asEPbJ3vBTAm3PvesAdTU0wxn
         IbSUCTPgc5eIsGTI+DzCjnYA2cAuswCB4dCVicJv5zQLtICgrRiXphkDtDMW9008iaVz
         gBN8W9DquRB5HB/PLYzgS7pX/O3hm+fYS/E+L2sEERwbDxh35wG+sqViCT7F4IcDWYff
         6WgdrXd42VPENogBc5wnFNACLadlfIleWRfWt+Qky/olb8eaIZy/aC8spTSSwx858dl7
         6WL1vHPMrCib7iPhhsfc4HvcTp/2M9AY220SG5H67nCeOeKbInnZajOQ6WX4/bQtOq/e
         4KsA==
X-Gm-Message-State: AFqh2ko07uj90lFJ9t/gII8D9WGdrruP6sDA3ULn0dBgW8bBOowsthyp
	u4p+42kvFXFXDzdCUwiuZWM=
X-Google-Smtp-Source: AMrXdXt1IGeKX76bTVMTsuhqWoe17sqb3Y+5/yY7YCGvTxFaLYcwfWYXtjd7ZCU0sZ+bPAw6+C8PQA==
X-Received: by 2002:a05:600c:1d8e:b0:3d9:f9ef:3d23 with SMTP id p14-20020a05600c1d8e00b003d9f9ef3d23mr56709754wms.23.1675166027140;
        Tue, 31 Jan 2023 03:53:47 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id t19-20020a1c7713000000b003dc48a2f997sm10411048wmi.17.2023.01.31.03.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 03:53:46 -0800 (PST)
Message-ID: <e4e1b1a2-8e52-779f-ab4f-239b6a401c3f@gmail.com>
Date: Tue, 31 Jan 2023 12:53:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/5] arm: dts: mt7623: add gmacs to mt7623.dtsi
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 frank-w@public-files.de, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>
References: <20230120205318.519493-1-arinc.unal@arinc9.com>
 <20230120205318.519493-2-arinc.unal@arinc9.com>
 <BAF25F3F-7B1B-4E9D-A0D9-89DB663B0AB3@public-files.de>
 <3ab1b3d2-f9fd-e64d-6346-1d80e7f57dba@arinc9.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <3ab1b3d2-f9fd-e64d-6346-1d80e7f57dba@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_035349_460048_FF7ED699 
X-CRM114-Status: GOOD (  13.78  )
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



On 25/01/2023 17:52, Arınç ÜNAL wrote:
> On 25.01.2023 19:45, Frank Wunderlich wrote:
>> Am 20. Januar 2023 21:53:14 MEZ schrieb "Arınç ÜNAL" <arinc.unal@arinc9.com>:
>>
>>> index 25d31e40a553..5eb698a90d34 100644
>>> --- a/arch/arm/boot/dts/mt7623.dtsi
>>> +++ b/arch/arm/boot/dts/mt7623.dtsi
>>> @@ -981,6 +981,20 @@ eth: ethernet@1b100000 {
>>>         #address-cells = <1>;
>>>         #size-cells = <0>;
>>>         status = "disabled";
>>> +
>>> +        gmac0: mac@0 {
>>> +            compatible = "mediatek,eth-mac";
>>> +            reg = <0>;
>>> +            phy-mode = "trgmii";
>>> +            status = "disabled";
>>> +        };
>>> +
>>> +        gmac1: mac@1 {
>>> +            compatible = "mediatek,eth-mac";
>>> +            reg = <1>;
>>> +            phy-mode = "rgmii";
>>> +            status = "disabled";
>>> +        };
>>>     };
>>>
>>
>>> diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts 
>>> b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
>>> index 5008115d2494..a5800a524302 100644
>>> --- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
>>> +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
>>> @@ -175,9 +175,7 @@ &eth {
>>>     status = "okay";
>>>
>>>     gmac0: mac@0 {
>>
>> Should node not be accessed with label (&gmac0) instead of defining it again 
>> and shadow the one from dtsi?
> 
> I think that's up to preference. I kept it the current way as it's cleaner than 
> taking it out of &eth.
> 

I'd prefer to do use the label, so that we stay consistent in the source tree.
I'll remove the whole series for now. Please provide a v2.

Thanks,
Matthias

