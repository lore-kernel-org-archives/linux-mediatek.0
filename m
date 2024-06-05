Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE649C25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 11:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWaZI77Qzez6Y93ITSzkhMcOk1Fl4rTbbkKH0dw8HSU=; b=YAPwDinwyHbXP/xTZDj6fdYvK5
	8YiTJe3IE6wVgCYUbfTFAVjTAH7oyCp3r0uWDvWdQ6Yn8ZlB2zGFecGNR5L5XXdcIqKvFjAgXz65t
	KCgbzFBTpAfJj8IrUD9HrocxS++qt+ox0BozymsOhzcR7oHTfvZcQf7iDURYHXk4wWSmb4JmgZmcd
	IyLlPc8ZWebjWtwQ662cQBTUyPFmL3toqsVeicZMz5D/wTXQDFp/GStLHDCvHgLMMnO2E+WNM6SEa
	FF0u5UxQrGzlZdMoUnEvZeLiC0hdMd7XCqAA4XK1i6SEZTR293HWpC1zzk8r3BoCiBYUcavQOZdkX
	3p5iIk7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEolu-00000005hpW-1EDN;
	Wed, 05 Jun 2024 11:25:38 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEolr-00000005hp5-0cvj;
	Wed, 05 Jun 2024 11:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717586733;
	bh=7SIN4Dh8iWcVPhTl6XQdG+T06wZg5VrgK1Kuc/BrCRg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fHqPZ+f929TcIW07N83k9cmzcGHyGqXjJXzqbRkm31WabNru7K32nQxkpmAtpYpRl
	 3DV8huTacAXKoHT3Prhx45lx0rnsOOriqVi+NIJIT8HyLUu9TRTfay4HqlWFKMljVO
	 O9IDgbRz4vd0m6txJnKQ+K5lOxc0msPngVnLZtrbwPvL7ccKORG01DuoN+WNg+Ip9k
	 2OUqS9mvf/tXMhvDMitt3od5KZiHx/jMft+wAuJgQU70GSaC72/FaHzCHl305al8xW
	 gsaEek6mucH75sS0AlsJihhUYcPKroXvzvL4tNvrSQpII891M0adsUnf0YIMypqba2
	 9Kr22dFmP5Vyw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7A8343781139;
	Wed,  5 Jun 2024 11:25:32 +0000 (UTC)
Message-ID: <08256a88-7165-41ca-b484-4acf1c8e316b@collabora.com>
Date: Wed, 5 Jun 2024 13:25:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power
 domain clock
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-6-wenst@chromium.org>
 <4f20f130-c9ab-43ea-a758-e29d7be10db0@collabora.com>
 <CAGXv+5GuGz-KahcbKtuyUA1-59sMWSL0QucOdp8FPoQWrc9YUQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5GuGz-KahcbKtuyUA1-59sMWSL0QucOdp8FPoQWrc9YUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_042535_422720_F6A7B6B9 
X-CRM114-Status: GOOD (  24.67  )
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

Il 05/06/24 10:25, Chen-Yu Tsai ha scritto:
> On Thu, May 30, 2024 at 6:03 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 30/05/24 10:35, Chen-Yu Tsai ha scritto:
>>> The MFG_ASYNC domain, which is likely associated to the whole MFG block,
>>> currently specifies clk26m as its domain clock. This is bogus, since the
>>> clock is an external crystal with no controls. Also, the MFG block has
>>> a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
>>> diagram, gates access to the hardware registers. Having this one as the
>>> domain clock makes much more sense. This also fixes access to the MFGTOP
>>> registers.
>>>
>>> Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.
>>>
>>> Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>
>> Just one question... what happens if there's no GPU support at all and this
>> power domain gets powered off?
>>
>> I expect the answer to be "nothing", so I'm preventively giving you my
> 
> Well it's powered off by default. Just double checked, and without the final
> patch:
> 
> # cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> domain                          status          children
>              performance
>      /device                                             runtime status
> ----------------------------------------------------------------------------------------------
> mfg                             off-0
>              0
> mfg_2d                          off-0
>              0
>                                                  mfg
> mfg_async                       off-0
>              0
>                                                  mfg_2d
> 
> And with the last patch but with the powervr removed:
> 
> # cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> domain                          status          children
>              performance
>      /device                                             runtime status
> ----------------------------------------------------------------------------------------------
> mfg_apm                         off-0
>              0
> mfg                             off-0
>              0
>                                                  mfg_apm
>      /devices/platform/soc/13fff000.clock-controller     suspended
>              0
> mfg_2d                          off-0
>              0
>                                                  mfg
> mfg_async                       off-0
>              0
>                                                  mfg_2d
> 
> Things seem to work OK. I can SSH in, and the framebuffer console on the screen
> works fine.
> 
> 
> Note that accessing the regmap through debugfs doesn't do much good. regmap
> doesn't handle runtime PM. And the syscon regmap isn't even tied to a
> struct device. Dumping the regmap through debugfs while the power domain
> is off gives all zeroes, likely due to bus isolation.
> 

The last part where you say "gives all zeroes" is actually the best outcome that
I could have ever expected.

So, well, many thanks for this very nice analysis and test.

>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I confirm my green light. It's beautiful when this kind of patches come upstream
especially with your replies actually removing any kind of possible doubt.

> 
> Thanks!

Thank *you* for caring about this old platform!

Cheers,
Angelo

> 
> ChenYu
> 
>> ....but if I'm wrong and the answer isn't exactly "nothing", then I still agree
>> with this commit, but only after removing the Fixes tag.
>>
>> Cheers,
>> Angelo
>>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> index 3458be7f7f61..136b28f80cc2 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> @@ -497,7 +497,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
>>>                                };
>>>                                mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
>>>                                        reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
>>> -                                     clocks = <&clk26m>;
>>> +                                     clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>;
>>>                                        clock-names = "mfg";
>>>                                        #address-cells = <1>;
>>>                                        #size-cells = <0>;
>>
>>


