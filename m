Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB1FCEACDD
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 15:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8C8gN+r2U7cAyrAU2/VREbLr3+eutPQWNzqTWWnO2Y=; b=mv2hzXLOT3jkEMgEmshqjHBYUf
	GjLkaq8QVv51I3tDlT2ZoHD+q621Cqttysm6ovZCKz0xHmivuprheML4k/o2CqFu9gA5xFBJqiFkR
	AKJMlta9/jJV4bGQF4G88dXYPTyeHZphnthtuml8EJQAgli6tpHhMiMfISh1/Xoliq+aEvIWZ1i0A
	9KDfP2LXiokPdHSDm2EpbDanv/uCQm64okE6HU2Bd/CoUc7DUTiqEQkCO+FOmjHxx2E+zBUARZaIE
	/m9buwwsDKZdrUQOWyYLo77gIEuEiDueUBFfDpoE7mg4zOBN/8+LFXbCEhAKqPDfP6sGimI1Ebo4j
	UPFRYTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svef4-00000003J9W-0lqL;
	Tue, 01 Oct 2024 15:19:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svedn-00000003J0d-2aEV;
	Tue, 01 Oct 2024 15:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727795897;
	bh=WzhQBUU0W7hHsulAWgsxJ5bVS81u+Wqsj4XE0fczMc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PpGB4869JZUQPobQgIGGkmTjpZKJCRR7GbmEqWYRA6/4yIxwZ4wyiHSDsd/daymrh
	 XHxqyQUjXlzd7A6gYO3mZm8lI9r5UBhsLXuTNSKD60B+QdYRXfzuxGlHMhSNtdygQ8
	 fTEpiqN/H4gCtTlYj5Zek81ZncDnNk5XScu7CQ8g5zOh7A0T7aRJZIEPVtCZLd23SS
	 ktL+Ubx4lonnuck0uYMmQc6uXQTNV5jYviBdZPZzWhA/JxQAk3N1RELRiVsaVf0jVS
	 3J6oHkSYO3TVxgcy77Aj2gkovVMrg/A3IT94sCMQcsX9OqnRRRyDZPrJrtmy6nFlUy
	 ftTTCyW8Kl5/w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A1CE17E0FD5;
	Tue,  1 Oct 2024 17:18:17 +0200 (CEST)
Message-ID: <908e6fcb-d1bc-4ab1-b4b8-6a13096b837c@collabora.com>
Date: Tue, 1 Oct 2024 17:18:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] nvmem: mtk-efuse: Enable postprocess for mt8188
 GPU speed binning
To: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240927103005.17605-1-pablo.sun@mediatek.com>
 <20240927103005.17605-4-pablo.sun@mediatek.com>
 <57dfe684-c9a1-4cb3-8c87-9d2fef09aed7@collabora.com>
 <329b554b-e029-0dfe-7c18-67c7c58f8302@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <329b554b-e029-0dfe-7c18-67c7c58f8302@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_081819_833107_144BA5A7 
X-CRM114-Status: GOOD (  31.03  )
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

Il 01/10/24 05:38, Pablo Sun ha scritto:
> Hi Angelo,
> 
> 
> On 9/30/24 17:40, AngeloGioacchino Del Regno wrote:
>> Il 27/09/24 12:30, Pablo Sun ha scritto:
>>> Similar to mt8186, the efuse data for mt8188's GPU speed binning
>>> requires post-process to convert the bit field format expected
>>> by the OPP table.
>>>
>>> Since mt8188 efuse is not compatible to mt8186, add a new compatible
>>> entry for mt8188 and enable postprocess.
>>>
>>> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
>>
>> I know I told you to just reuse the pdata from 8186, but there's something else
>> that came to mind, here...
>>
>> ...actually, the efuse block from 8188 is indeed compatible with 8186, meaning
>> that the register r/w, etc, are all the same (bar the addresses, yes)
>>
>> So, I wonder if it's not just a better idea to not even add mt8188-efuse in this
>> driver's of_device_id array, and just add that to the binding so that we permit
>> using
>>          efuse: efuse@11f20000 {
>>              compatible = "mediatek,mt8188-efuse",
>>                       "mediatek,mt8186-efuse", "mediatek,efuse";
>>              [etc]
>>          }
> 
> Thanks for proposing this. I agree that in the case of Mali GPU speed binning
> info, mt8188 behaves exactly the same as mt8186, only the cell addresses are
> different.
> 
> I wrote "mt8188 efuse is not compatible to mt8186" because I thought
> different eFuse cell layout leads to incompatibility, but it is correct that
> the cell layout differences can be expressed by the device tree nodes,
> so they are actually compatible in terms of hardware interface.
> 
> I'll drop this patch ("nvmem: mtk-efuse: Enable postprocess for mt8188 GPU speed 
> binning")
> in v3 and update dt-binding "mediatek,efuse.yaml" instead.
> 
>> Means that in mediatek,efuse.yaml you'll have to add...
>>
>>        - items:
>>            - enum:
>>                - mediatek,mt8188-efuse
>>            - const: mediatek,mt8186-efuse
>>            - const: mediatek,efuse <---- or without this, even.
>>
>> In the end, the "mediatek,efuse" property is somewhat deprecated, so that'd
>> also be a good time to start the dropping process, as I imagine that future SoCs
>> would also need the same speedbin transformations - which means that they'll all
>> be compatible with 8186....
> [snip]
> 
> But I am not sure if we should now drop "mediatek,efuse". The post-process for
> GPU speed binning info is only applicable to ARM Mali. Since there are MediaTek
> SoCs that are not using ARM Mali, or not having GPU at all, would it make more sense
> to keep the "mediatek,efuse" fallback compatible for those cases?
> 
> 

No, not really... because a specific SoC may *either* have Mali *or* PowerVR...

Counting that every SoC will, in any case, need a model-specific compatible (as in,
you can't ever have `compatible = "mediatek,efuse"`, but you will always have
`compatible = "mediatek,mt(model)", "mediatek,mt(othermodel)"` or similar), you
will still have to add that new SoC to the binding.

In case, that SoC can be still added to the list in the driver if there's any
incompatibility with the others (such as different register layout or binning
interpreter).

But then, keep in mind that the code that interprets the binning data in the fuses
is converting it from MediaTek format (1-2-3-4..etc) to the "generic" format that
is required by the OPP framework, which is *not* specific to ARM Mali.

Just to say - if the (MediaTek) format of the fuse data for binning is the same
for both PVR and Mali (so, it's still always 1,2,3,4,etc), then there wouldn't be
any incompatibility between the two, as PVR anyway uses OPP tables as much as Mali.

Cheers,
Angelo

