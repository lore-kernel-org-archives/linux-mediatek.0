Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6419EC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 09:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4dlUk6zCYjIRkJTOWK57xQb/hFkk2kfE9c3RJ3UxEo=; b=joaGr7BMifY3u77Mvl/0qaB6w7
	+uwvVxKzqZMWmbjBcBzuHNcwzb/5RYrIk5q+EmIQhJzJRMN8aOY+xmEjzkfOg22+HIAVH96daclxF
	a/rNO93Jpkeg8hWfGJ21STNaQvfbY+/ewgrkDeLJhS7PBstYBGGDSX/bd6lFhKe37VqEUuLkdpEf8
	9rOEjmdRxDBSUCVVRkZ1JPslX4sB1hp2aBm9zJm9dHVmsWHPEwn/2OMC17imLXtwD5vAsLhN6oamL
	+0sI9ZCjKa5Cwp+sYVnfBJXXR5mn1bhLqZB2riUDhbdkcJl5mLsJzQJUgbbZus4yvbxom4/+0Nmyw
	asKAlWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0g2n-006Pts-Sy; Thu, 01 Dec 2022 09:39:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0g2c-006PpE-60; Thu, 01 Dec 2022 09:39:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2CB6A66025DF;
	Thu,  1 Dec 2022 09:39:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669887576;
	bh=Qw3YH+f30BJdWDMM8bR7CWNumBiXsSr+8uajFsp4ofE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dH+vRtlE/cMz7Oxdz/Y6sfn+HbIxfeb6SKNZnmBTDcl9mOJV2gbBj+FLRIRtbTxQO
	 T33xsOtsmBIdDS09W57WesVu9a/lQmH6+nqa9Vw8aN/Qy+EBY/hIi470ezDEXqI71G
	 VFZNGHHx7klThHCQSnLgzsOsoipNyPJCV66gHOKCbN0TTV1X74oAPf83QJDmaHfQkO
	 mLxXaxUwZyj2ieMDmq5dLnMfYhYZBc0R2PuGMM6R9oSy1FRv++eZw0JIzqf4nNswmI
	 c+GLM81oLtuzxY668FrzLyqPDNNbTpXx2brS09qPrUp3zX2pztZUB5SoIqMfh3/69O
	 veC4v5UUA+ZQA==
Message-ID: <8ae2a510-abf6-6e1b-9893-293db7d930e7@collabora.com>
Date: Thu, 1 Dec 2022 10:39:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] arm64: dts: mt8192: Add adsp power domain controller
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20221201073328.1559-1-allen-kh.cheng@mediatek.com>
 <ba14a46f-477f-70af-761d-696fe8a4f41c@collabora.com>
 <CAGXv+5Gg6ozYQcp_NPrAiH1kF-ZkfjVZhQZVhLnbSmjQBwsFwQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Gg6ozYQcp_NPrAiH1kF-ZkfjVZhQZVhLnbSmjQBwsFwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_013938_547520_A7A24D97 
X-CRM114-Status: GOOD (  24.44  )
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

Il 01/12/22 10:10, Chen-Yu Tsai ha scritto:
> On Thu, Dec 1, 2022 at 5:07 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 01/12/22 08:33, Allen-KH Cheng ha scritto:
>>> Add adsp power domain controller node for mt8192 SoC.
>>>
>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>> ---
>>> Ref: https://lore.kernel.org/all/2ec80bd8-dfef-d2e6-eb41-6e6088043e33@collabora.com/
>>>       [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
>>> ---
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt8192.dtsi | 8 ++++++++
>>>    include/dt-bindings/power/mt8192-power.h | 1 +
>>>    2 files changed, 9 insertions(+)
>>>
>>
>> Allen, thanks for this one, but it's incomplete...
>>
>> First of all, you must add the power domain on the driver itself, specifically,
>> in drivers/soc/mediatek/mt8192-pm-domains.h - otherwise this change will have no
>> effect!
> 
> Actually it's worse. The driver doesn't know about the new power domain,
> and so it will fail to probe. We might need to make the power domain driver
> fail gracefully and skip unknown power domains.
> 

Right. It's worse. I don't know, though, if gracefully skipping unknown power
domains in the driver would be a good decision... as sometimes error messages
go unnoticed.

When the platform "explodes" instead, you're forced to read that log carefully
and get it working again... Anyway, I'm only thinking out loud, nothing less and
nothing more than that :-)

By the way, we can probably expand on that topic a bit later, as it's outside of
the scope of this specific change.

Back to topic, if we get one series containing both changes (devicetree, bindings
and driver) with the right Fixes tags and/or Cc stable, we shouldn't have such
issue on backports so we can probably ignore that potential issue, I think? :-)

Cheers,
Angelo

> ChenYu
> 
>> ...Then, as Chen-Yu said, you should also add the power domain to the scp_adsp
>> clock node as that's solving the lockup issue...
>>
>> .......and last, but not least: we need a Fixes tag to backport this fix, here
>> and on the commit that adds the missing power domain in the driver.
>>
>> Thanks,
>> Angelo
>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> index 424fc89cc6f7..e71afba871fc 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> @@ -514,6 +514,14 @@
>>>                                                };
>>>                                        };
>>>                                };
>>> +
>>> +                             power-domain@MT8192_POWER_DOMAIN_ADSP {
>>> +                                     reg = <MT8192_POWER_DOMAIN_ADSP>;
>>> +                                     clocks = <&topckgen CLK_TOP_ADSP_SEL>;
>>> +                                     clock-names = "adsp";
>>> +                                     mediatek,infracfg = <&infracfg>;
>>> +                                     #power-domain-cells = <0>;
>>> +                             };
>>>                        };
>>>                };
>>>
>>> diff --git a/include/dt-bindings/power/mt8192-power.h b/include/dt-bindings/power/mt8192-power.h
>>> index 4eaa53d7270a..63e81cd0d06d 100644
>>> --- a/include/dt-bindings/power/mt8192-power.h
>>> +++ b/include/dt-bindings/power/mt8192-power.h
>>> @@ -28,5 +28,6 @@
>>>    #define MT8192_POWER_DOMAIN_CAM_RAWA        18
>>>    #define MT8192_POWER_DOMAIN_CAM_RAWB        19
>>>    #define MT8192_POWER_DOMAIN_CAM_RAWC        20
>>> +#define MT8192_POWER_DOMAIN_ADSP     21
>>>
>>>    #endif /* _DT_BINDINGS_POWER_MT8192_POWER_H */
>>>
>>



