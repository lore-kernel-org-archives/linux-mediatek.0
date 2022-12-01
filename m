Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033BEC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qKuTYY7Z1nj0LQIWFYuKi0dnnF/GbIxaRDJqeVElrM=; b=IwH6k1a37EifvqC7x2tGCz5mfS
	H86OEQkISNkqgkd70J4Mon6BTJKWJSPOghhH01P2ZMNRQs+K3lLlnZQS7qmuFD872Mf1BCHOLx+3w
	b6viudgro0msfV9rJkU+oPyx7CXj8HXLgqSs0s1jHMmasy9hoVgPoVLiEtZPbO0dn/TVvbTPCfMZo
	Wuwxzau7Z+tPMKpf602wU/K2xvV1+tebeWii3vnq+uiAJoiOwFEYyUG6XnZJD++4LpBWmFGZvJA6N
	QKm+2E79JbEfCIxLbQywYMLGcUFlyxdezHZ/0bdYua7SLekZoPnOahYcXzSe6oy4ANNq+0jNPG2ke
	EJqN3IhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gWq-006bKR-6Z; Thu, 01 Dec 2022 10:10:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gWc-006bE7-26; Thu, 01 Dec 2022 10:10:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 792856602AC1;
	Thu,  1 Dec 2022 10:10:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669889433;
	bh=T8Mv1kLojBuRdbHzbub+mx4q2+A4SuXT+pni77g+sfs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kAynYHE5O4jVBHrd3yKzNM+aWXpDQfzOZO55Qdq2Ca1rrXt56jMmq/Vz4A+/Nw/nj
	 tn6H8N8e3wkAY27aSAS85AUa4IXr4rhxBjbahsl2fmz9fWJJ4jnECB10TbHEkq5yMg
	 GzzxqlxTUBEUSkBmW71YPu5ncOzzfMO+12oMQKu9ZKq0+RC/ULt+xgU5ursrPGlz2I
	 GZmBgpFyKNryvSMAwpUXb/wz7LvT73kf6iezQ7UiYz7t57F2y198JhdUdgo539gKNb
	 Nj4wImy6gmZ+eknVMNJapnmfybq2lrgbm7+3cUHW8nYJfF79Yvkoskw7teIwCKHCAC
	 8itwbZJs3JX2Q==
Message-ID: <28d94df0-6e87-3019-dc10-a587f84488fb@collabora.com>
Date: Thu, 1 Dec 2022 11:10:30 +0100
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
 <8ae2a510-abf6-6e1b-9893-293db7d930e7@collabora.com>
 <CAGXv+5H+msQ1ct5CUzYnT_BmYPnS72HbivvyO39uOfMfXbo5qg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5H+msQ1ct5CUzYnT_BmYPnS72HbivvyO39uOfMfXbo5qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_021038_588673_C48B0007 
X-CRM114-Status: GOOD (  29.23  )
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

Il 01/12/22 11:05, Chen-Yu Tsai ha scritto:
> On Thu, Dec 1, 2022 at 5:39 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 01/12/22 10:10, Chen-Yu Tsai ha scritto:
>>> On Thu, Dec 1, 2022 at 5:07 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> Il 01/12/22 08:33, Allen-KH Cheng ha scritto:
>>>>> Add adsp power domain controller node for mt8192 SoC.
>>>>>
>>>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>>>> ---
>>>>> Ref: https://lore.kernel.org/all/2ec80bd8-dfef-d2e6-eb41-6e6088043e33@collabora.com/
>>>>>        [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
>>>>> ---
>>>>> ---
>>>>>     arch/arm64/boot/dts/mediatek/mt8192.dtsi | 8 ++++++++
>>>>>     include/dt-bindings/power/mt8192-power.h | 1 +
>>>>>     2 files changed, 9 insertions(+)
>>>>>
>>>>
>>>> Allen, thanks for this one, but it's incomplete...
>>>>
>>>> First of all, you must add the power domain on the driver itself, specifically,
>>>> in drivers/soc/mediatek/mt8192-pm-domains.h - otherwise this change will have no
>>>> effect!
>>>
>>> Actually it's worse. The driver doesn't know about the new power domain,
>>> and so it will fail to probe. We might need to make the power domain driver
>>> fail gracefully and skip unknown power domains.
>>>
>>
>> Right. It's worse. I don't know, though, if gracefully skipping unknown power
>> domains in the driver would be a good decision... as sometimes error messages
>> go unnoticed.
>>
>> When the platform "explodes" instead, you're forced to read that log carefully
>> and get it working again... Anyway, I'm only thinking out loud, nothing less and
>> nothing more than that :-)
> 
> Me too. :)
> 
>> By the way, we can probably expand on that topic a bit later, as it's outside of
>> the scope of this specific change.
>>
>> Back to topic, if we get one series containing both changes (devicetree, bindings
>> and driver) with the right Fixes tags and/or Cc stable, we shouldn't have such
>> issue on backports so we can probably ignore that potential issue, I think? :-)
> 
> Everything goes through the soc tree, so they should appear in Linus's tree
> and get picked by stable at more or less the same time. I think we would
> want the driver change to appear before the dts change, for bisectability's
> sake (because of header dependencies and driver errors).
> 
> So we probably want:
> 1. driver + binding header changes
> 2. dtsi changes
> 
> And have these merged through fixes so that the history between them is linear.
> 

Perfect, I fully agree.

> 
> ChenYu
> 
>> Cheers,
>> Angelo
>>
>>> ChenYu
>>>
>>>> ...Then, as Chen-Yu said, you should also add the power domain to the scp_adsp
>>>> clock node as that's solving the lockup issue...
>>>>
>>>> .......and last, but not least: we need a Fixes tag to backport this fix, here
>>>> and on the commit that adds the missing power domain in the driver.
>>>>
>>>> Thanks,
>>>> Angelo
>>>>
>>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>>>> index 424fc89cc6f7..e71afba871fc 100644
>>>>> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>>>> @@ -514,6 +514,14 @@
>>>>>                                                 };
>>>>>                                         };
>>>>>                                 };
>>>>> +
>>>>> +                             power-domain@MT8192_POWER_DOMAIN_ADSP {
>>>>> +                                     reg = <MT8192_POWER_DOMAIN_ADSP>;
>>>>> +                                     clocks = <&topckgen CLK_TOP_ADSP_SEL>;
>>>>> +                                     clock-names = "adsp";
>>>>> +                                     mediatek,infracfg = <&infracfg>;
>>>>> +                                     #power-domain-cells = <0>;
>>>>> +                             };
>>>>>                         };
>>>>>                 };
>>>>>
>>>>> diff --git a/include/dt-bindings/power/mt8192-power.h b/include/dt-bindings/power/mt8192-power.h
>>>>> index 4eaa53d7270a..63e81cd0d06d 100644
>>>>> --- a/include/dt-bindings/power/mt8192-power.h
>>>>> +++ b/include/dt-bindings/power/mt8192-power.h
>>>>> @@ -28,5 +28,6 @@
>>>>>     #define MT8192_POWER_DOMAIN_CAM_RAWA        18
>>>>>     #define MT8192_POWER_DOMAIN_CAM_RAWB        19
>>>>>     #define MT8192_POWER_DOMAIN_CAM_RAWC        20
>>>>> +#define MT8192_POWER_DOMAIN_ADSP     21
>>>>>
>>>>>     #endif /* _DT_BINDINGS_POWER_MT8192_POWER_H */
>>>>>
>>>>
>>
>>

-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718


