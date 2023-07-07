Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B9AEB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 08:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RonwMVaBvWQmSi3r+Kkntsh5m0Ec56tiZ8ERWy6JfI=; b=uvvo+fYPxJKbzbVpYfcai6R9bL
	vZxlGPd3fleWSc+pjGLU3d3Gz4/RWkmXvHXfBDpj5+GKmwLPMnpd6EzxXPlFFr+I5dZBCOOkqq5zp
	q63h6fQZ7LW9aTo7MgNnVD4nlwZx135cXiy8v4vJcivzPlqUBEI0YYkw3mkzyJRZIVNCrpmVQifL4
	h6uHOmDvvNgwRXKNKN43VRoy9dUAeyDXNdiSVW1kKN9hCo5d4yqxYi9cL/R17W1UPogOUVHRWFvWI
	d0eCWE4ohJztvXPOIw33aaaSORQs6/j04MKbHL+UwB094y+NYIPvelwwnaUmcNlJatl8toilWbKSQ
	69Ysj35g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHggT-003xpf-20;
	Fri, 07 Jul 2023 08:19:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHggP-003xnf-2d;
	Fri, 07 Jul 2023 08:19:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ADCD36606FCA;
	Fri,  7 Jul 2023 09:19:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688717954;
	bh=V2zCa6YQcn89QUk+30ncJYOiCspZ2CW7lvzYLcoBYmw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EKago4s9/yPqzmRoj0O5g0MNg5s9C9Xge7/MwV8FE8TRU2SGLJxDeIdahrJXMvmwj
	 Z3w/3sIgqHZV8eK3VVGFX7Cfyc7mYfTmfiv65T6vsZsbZftmU/Y42RStc0XhkWyN1E
	 IZUA+jJRMx2Mpc1+t+0qAIkj0Rx2L8z6ZsPAUU2vHU9iAcUrPonmC/MNMcqwUHiBR1
	 1yRpFuvEBuuaWDgrZZquwRyGapgqeKZUz6rCRN4VAwv0f86ErE9Lkdy8wFtZ80tab5
	 YygvdisRuod+sWxfylNiarkLIdTTAP+dOXQGJzh/SClusExi6ev+6mIk9yWobhhEq3
	 ZS7LhUVVs3Jkg==
Message-ID: <63457512-1cf4-d2a6-7afc-daa579de99e8@collabora.com>
Date: Fri, 7 Jul 2023 10:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Fix PM suspend/resume with
 venc clocks
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 yong.wu@mediatek.com, tinghan.shen@mediatek.com, weiyi.lu@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230706095841.109315-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5HsScBVMOY4JcSNS_ZZdpLnNAYWUKohwmfQr6gJJv26CA@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5HsScBVMOY4JcSNS_ZZdpLnNAYWUKohwmfQr6gJJv26CA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_011918_173443_9DB55F44 
X-CRM114-Status: GOOD (  22.18  )
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

Il 07/07/23 07:06, Chen-Yu Tsai ha scritto:
> On Thu, Jul 6, 2023 at 5:59 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Before suspending the LARBs we're making sure that any operation is
>> done: this never happens because we are unexpectedly unclocking the
>> LARB20 before executing the suspend handler for the MediaTek Smart
>> Multimedia Interface (SMI) and the cause of this is incorrect clocks
>> on this LARB.
>>
>> Fix this issue by changing the Local Arbiter 20 (used by the video
>> encoder secondary core) apb clock to CLK_VENC_CORE1_VENC;
>> furthermore, in order to make sure that both the PM resume and video
>> encoder operation is stable, add the CLK_VENC(_CORE1)_LARB clock to
>> the VENC (main core) and VENC_CORE1 power domains, as this IP cannot
>> communicate with the rest of the system (the AP) without local
>> arbiter clocks being operational.
> 
> Somehow I feel like this is papering over some dependency issue in Linux.
> 

It felt the same here, but then, if you disable the video encoder driver entirely
(or even both enc/dec drivers), you'll still get issues with the LARB20 timing out
on the SLP_PROT_RDY check, as there's something in queue going through that larb,
probably from something done by the bootloader before booting Linux.

Note that I'm pointing my finger to the bootloader because - again - even disabling
the venc entirely produces the same issue, and if you disable probing the LARB20
you will anyway get sleep issues (wakes up immediately after going to sleep).

That said, there is another possible solution to that (but even then, I think that
we still need those clock assignments that I've done here), which is to implement
the SMI power domains (mtcmos...): we'd be saving *all smi registers*, resetting an
entire SMI ctx with a poweroff, powering back on and restoring all registers *but*
larb20... at least that's the only solution that I've seen downstream (android
kernels).

...and that's why I believe that this commit is correct.

Of course, if there's something that I'm underestimating here, I'd be glad to
understand.

Cheers,
Angelo

>> Fixes: 3b5838d1d82e ("arm64: dts: mt8195: Add iommu and smi nodes")
>> Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> index 95bd058d6083..5c670fce1e47 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> @@ -626,6 +626,8 @@ power-domain@MT8195_POWER_DOMAIN_VDEC1 {
>>
>>                                          power-domain@MT8195_POWER_DOMAIN_VENC_CORE1 {
>>                                                  reg = <MT8195_POWER_DOMAIN_VENC_CORE1>;
>> +                                               clocks = <&vencsys_core1 CLK_VENC_CORE1_LARB>;
>> +                                               clock-names = "venc1-larb";
>>                                                  mediatek,infracfg = <&infracfg_ao>;
>>                                                  #power-domain-cells = <0>;
>>                                          };
>> @@ -688,6 +690,8 @@ power-domain@MT8195_POWER_DOMAIN_VDEC2 {
>>
>>                                                  power-domain@MT8195_POWER_DOMAIN_VENC {
>>                                                          reg = <MT8195_POWER_DOMAIN_VENC>;
>> +                                                       clocks = <&vencsys CLK_VENC_LARB>;
>> +                                                       clock-names = "venc0-larb";
>>                                                          mediatek,infracfg = <&infracfg_ao>;
>>                                                          #power-domain-cells = <0>;
>>                                                  };
>> @@ -3094,7 +3098,7 @@ larb20: larb@1b010000 {
>>                          reg = <0 0x1b010000 0 0x1000>;
>>                          mediatek,larb-id = <20>;
>>                          mediatek,smi = <&smi_common_vpp>;
>> -                       clocks = <&vencsys_core1 CLK_VENC_CORE1_LARB>,
>> +                       clocks = <&vencsys_core1 CLK_VENC_CORE1_VENC>,
>>                                   <&vencsys_core1 CLK_VENC_CORE1_GALS>,
>>                                   <&vppsys0 CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1>;
>>                          clock-names = "apb", "smi", "gals";
>> --
>> 2.40.1
>>
>>
> 




