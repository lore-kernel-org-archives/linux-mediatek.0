Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D743C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 09:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpjyprPQQNb9xOkxsnC3Nc8mJa9+cU+29WsOfzzRRH0=; b=ln8oYY29yOtowIk6iIEXIRdWpY
	8azCPeMEL8o+AXSFlJRmQdOrbfu0Ip5b8TPmS9/kHEaWfCNJbgV0mxoedyXRA1Fb5gsgRb0MLh/Jw
	BrgPHAGFINXlOwgeekJ51b5xDBYaty4oObYGoPcgdDNgJM629RTAIy4FYtu6M7e3AEUDWa+SUEI0p
	/QG4WUvZVDaQUc31W7MFo/fwNG9bN472E3d/oLuB3Gvlk3Qv2LqzDTBNVgjbEemAv118x4Ij53T7j
	DMyHtX+87eBRXLuruVW+tvPWOgvP3YAn/YPw6S3oYIUuLTZ+FXf++OMeqRARA9+05JpiQIRdfPgdB
	IwKrSqlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxNnx-00000001Yor-0SJA;
	Thu, 18 Apr 2024 09:11:41 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxNnt-00000001Yo5-3FUT;
	Thu, 18 Apr 2024 09:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713431496;
	bh=YQ9vfsRGkhEbPOmWURxpZsYHOlp6fTaTFgW6oeH82V4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jfcYy2i/6n2qLpC6eIbBMym/USM1OFjmH4bFqlxZsr6sxzQ1ahI6TFrpcJuqNeptM
	 JcaHj1CQBNkSqgjpDGJhEPnzxPdIJ7822tHR74IMXuFxQDzU7b+WhiVUW2i7yGV5SV
	 2HW750fNTIeS7aNGdojbhWR36e0EuHIA3l0W9EUT2jr7JHbTrIJWRHK9kwYuvrViZq
	 d49CsrWQ2pLUp1EDLtp7sQZ/53stN5B8BWt1WZiWeK0fuH8WeEfLTMCZdK3SOVuYuf
	 LjM1lrOIecuVV9HgLbX+0cQ2gs9Cy/FtMUDN8I+yCmrPJ4xa11Y3DJ6GXT3/2QW/05
	 PI4vz51Gkp8vg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6B7B7378203F;
	Thu, 18 Apr 2024 09:11:35 +0000 (UTC)
Message-ID: <9fae0a42-76b8-4029-bd45-0cadd3b93464@collabora.com>
Date: Thu, 18 Apr 2024 11:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: add u3port1
 for xhci1
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>, stable@vger.kernel.org
References: <20240216095751.4937-1-macpaul.lin@mediatek.com>
 <cdcadfdc-1861-b3b3-eafa-22071516197b@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cdcadfdc-1861-b3b3-eafa-22071516197b@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_021137_973454_E0CB96CB 
X-CRM114-Status: GOOD (  28.18  )
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

Il 18/04/24 05:44, Macpaul Lin ha scritto:
> On 2/16/24 17:57, Macpaul Lin wrote:
>> This patch fixes an issue where xhci1 was not functioning properly because
>> the state and PHY settings were incorrect.
>>
>> The introduction of the 'force-mode' property in the phy-mtk-tphy driver
>> allows for the correct initialization of xhci1 by updating the Device Tree
>> settings accordingly.
>>
>> The necessary fixup which added support for the 'force-mode' switch in the
>> phy-mtk-tphy driver.
>> commit 9b27303003f5 ("phy: mediatek: tphy: add support force phy mode switch")
>> Link: https://lore.kernel.org/r/20231211025624.28991-2-chunfeng.yun@mediatek.com
> 
> Dear AngeloGioacchino,
> 
> Just a soft reminding about the patch has been sent a while back for the shared 
> U3PHY and PCIe PHY setup for genio-1200 boards. I'm not sure if you've missed this 
> patch in mail box. :)
> 
> The patch is pretty important as it lets the device tree (dts) decide whether to 
> enable U3PHY or PCIe PHY. Because this is a shared hardware phy and could only be 
> configured in dts to decide which function to be initialized, so it's something 
> that should be included in the board-specific dts files.
> 
> Do you think it needs to be resubmitted, or is it still in the queue for review? 
> It's meant to be ready for action from kernel version 6.8 onwards.
> 
> Looking forward to your thoughts on this. Let me know if there's anything else you 
> need from my side.
> 

As you can understand, I have to take care of many patches for each merge cycle,
and it may happen that inadvertently some patch goes out of my radar.

Please Macpaul, if this happens again, I appreciate that you remind me about
patches that I seem to leave behind, so please keep sending me such emails if
and when necessary.

Thanks!
Angelo

>> Prior to this fix, the system would exhibit the following probe failure messages
>> for xhci1:
>>    xhci-mtk 11290000.usb: supply vbus not found, using dummy regulator
>>    xhci-mtk 11290000.usb: uwk - reg:0x400, version:104
>>    xhci-mtk 11290000.usb: xHCI Host Controller
>>    xhci-mtk 11290000.usb: new USB bus registered, assigned bus number 5
>>    xhci-mtk 11290000.usb: clocks are not stable (0x1003d0f)
>>    xhci-mtk 11290000.usb: can't setup: -110
>>    xhci-mtk 11290000.usb: USB bus 5 deregistered
>>    xhci-mtk: probe of 11290000.usb failed with error -110
>>
>> With the application of this dts fixup, the aforementioned initialization errors
>> are resolved and xhci1 is working.
>>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts 
>> b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
>> index 7fc515a07c65..e0b9f2615c11 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
>> @@ -854,6 +854,10 @@
>>   &u3phy1 {
>>       status = "okay";
>> +
>> +    u3port1: usb-phy@700 {
>> +        mediatek,force-mode;
>> +    };
>>   };
>>   &u3phy2 {
>> @@ -885,6 +889,8 @@
>>   };
>>   &xhci1 {
>> +    phys = <&u2port1 PHY_TYPE_USB2>,
>> +           <&u3port1 PHY_TYPE_USB3>;
>>       vusb33-supply = <&mt6359_vusb_ldo_reg>;
>>       status = "okay";
>>   };
> 
> Thanks
> Macpaul Lin




