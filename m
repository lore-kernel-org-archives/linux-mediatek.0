Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F3BC3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jul 2024 15:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JccdUYB+LGO+RF8WWrekrKmzDCqO/Tfe5Pj31g7M/tI=; b=i6WGqACPYjTNIebzJ/KDSJn1MN
	Gjdijc3h1PGMTzfBdKI8YWSKPA5LZGDOSN3geqjhtGjfJSP7coPZKh99+MQwdOfGJNaqXgUd3ju/c
	cVRJGPC6ac0eNcPRvKbrUCLa/H8mE1HG8p2Q55s65M3TsNNsimgZRrg28bTet9qQ/+vaS1KJN4XcJ
	Vkzd0G6FUN0QLbtO2N+FLXS6xkm6AykPPgjqzF3HyLbu/KfEVllTRoOwGpZREJPEaHv8oLHatL+2M
	eXl3mNNO0oCVozbxy1/ZY7gpjmipOv3V7IHrs0O4tZ+59vYoAd56nrYEYts/prZfqC+90vFH2kGF9
	FYe16Q4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRw1L-0000000EYJo-1x1P;
	Thu, 11 Jul 2024 15:47:47 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRw12-0000000EYEd-2xh5;
	Thu, 11 Jul 2024 15:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720712846;
	bh=L+LYclixtCcrtlqbI+TdhTA4XOTPSUYDQzsfnwjFUJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I1RFhTyJH74XM5imDRCJNROAmCZgab1GXYa2MWRxwmRrHCozts5rTL0A0IYQsdxsk
	 stdikU3aRtK6JUZzo9eBZpz7v9mupwSECQO7BUqWdhsa+PuEVfNj5CI/5qYfJHheiV
	 6rk1rUuIhsdsk269Kb6VEA6P+t2ssW7YFOlZLGtSJ9eDkpQBmyFjhUqYGbes4b3DSR
	 jl1SSKKXZiDhmkyadI+/TrUGWa2RsjuSHn+wybOsfRhG+F96b7xGUsti7d2zfCKyUy
	 R+a4h+TaWN2Tw0XsoiP3DW+guDEhXvQ1KhjyXbqdTMeigN92JCT6IRig/u2GU0DlBv
	 nDjDrwTafHbCg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5426F3782207;
	Thu, 11 Jul 2024 15:47:25 +0000 (UTC)
Message-ID: <f9e2605d-3931-4b59-81e9-8fe9329f05cb@collabora.com>
Date: Thu, 11 Jul 2024 17:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Add power domain to
 secondary XHCI
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, tinghan.shen@mediatek.com,
 seiya.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org
References: <20240711093230.118534-1-angelogioacchino.delregno@collabora.com>
 <4ac0e464-5ef6-445d-a784-fe367ea23a2d@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4ac0e464-5ef6-445d-a784-fe367ea23a2d@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_084728_931996_9FC593BD 
X-CRM114-Status: GOOD (  17.83  )
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

Il 11/07/24 17:00, Nícolas F. R. A. Prado ha scritto:
> On Thu, Jul 11, 2024 at 11:32:30AM +0200, AngeloGioacchino Del Regno wrote:
>> The secondary XHCI controller, using a PHY that is shared between
>> it and the secondary PCI-Express controller, gets powered by the
>> PCIE_MAC_P1 power domain.
>>
>> Add this power domain to the usb@11290000 node to fix probe.
>>
>> Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
>> Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com> #KernelCI
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Hi Angelo,
> 
> thanks for the patch, but unfortunately it doesn't fix the issue:
> 
> [   10.772128] mtk-pcie-gen3 112f8000.pcie: host bridge /soc/pcie@112f8000 ranges:
> [   10.788914] mtk-pcie-gen3 112f8000.pcie:       IO 0x0024000000..0x00241fffff -> 0x0024000000
> [   10.802111] mtk-pcie-gen3 112f8000.pcie:      MEM 0x0024200000..0x0027ffffff -> 0x0024200000
> [   10.941278] mtk-pcie-gen3 112f8000.pcie: PCI host bridge to bus 0000:00
> 
> [   10.785937] xhci-mtk 11290000.usb: uwk - reg:0x400, version:104
> [   10.796352] xhci-mtk 11290000.usb: xHCI Host Controller
> [   10.810530] xhci-mtk 11290000.usb: new USB bus registered, assigned bus number 5
> [   10.844258] xhci-mtk 11290000.usb: clocks are not stable (0x1003d0f)
> [   10.844262] xhci-mtk 11290000.usb: can't setup: -110
> [   10.844266] xhci-mtk 11290000.usb: USB bus 5 deregistered
> [   10.861969] xhci-mtk 11290000.usb: probe with driver xhci-mtk failed with error -110
> 
> In fact it seems to have made the issue more frequent, as it happened every time
> for the 5 boots I tried.
> 

Oddly this did fix the issue on my Tomato R3.... but there's clearly something else
that is going on.

Let's keep trying.

Thanks!
Angelo

> But that gives me idea to try booting with clk_ignore_unused and
> pd_ignore_unused. I'll update the report with the results.
> 
> Thanks,
> Nícolas
> 
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> index 2ee45752583c..96ad1b14626e 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> @@ -1445,6 +1445,7 @@ xhci1: usb@11290000 {
>>   			reg-names = "mac", "ippc";
>>   			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
>>   			phys = <&u2port1 PHY_TYPE_USB2>;
>> +			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_MAC_P1>;
>>   			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_1P>,
>>   					  <&topckgen CLK_TOP_SSUSB_XHCI_1P>;
>>   			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
>> -- 
>> 2.45.2
>>



