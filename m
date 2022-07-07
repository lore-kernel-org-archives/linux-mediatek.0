Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B216C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 11:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laa01Z9ThJW6Tse/Ll0TvQqINCmdIJiCEgp3d7b9XJA=; b=BkV8n/BX7OV63CqZQCrw2Z/8/A
	wuKNVOCYs+52xrvHSonBbgM7PPYzjx/+qcIevpKo5UVyAE/ing/cQEqw2gP++FEZiyy4XVEAR0zMW
	p339HH8v6/OfCRI0QlsvMjr/4oxZkGcpyHqppDjY+XnlKHn9vOG3AKzRwCB2Mc1DkXlTwLQY746nF
	NaFR0G9MAAE298N9nIQLAZdeMAEmQCaEuhrVClffc6y8NBkptZXHrMmvF5vn/gE82EzVw6f+kwi42
	ayKSfRyeHTvG783JOb/SKsmJNsjUcL7Hu9nvmz1wZU4hsdY4HWty4EIfWvqWyLhbeD5IRPPOCOYze
	1KX5YetA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9PEu-00FiL0-He; Thu, 07 Jul 2022 11:00:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9PEe-00FiDl-HS; Thu, 07 Jul 2022 10:59:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0319466019AF;
	Thu,  7 Jul 2022 11:59:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657191588;
	bh=Ncasodb0mlhKue8G5um/dzJDJSNHJ442SPjDYU2q3GI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G3Wb0DHsH05SDtLOudN/tZyJYo7/p+kDkzNgTgA/qmXdIPemFSZ5Gp8mg7sHTnbo8
	 EPxxgeujFcYAVjQWRmi3qfj0zHSvYLfSCJC7H6tEaliGTh6w4anzitaB/H/gJ5bKg8
	 y6mxUghQ6cvnE7Zbp3n7ePsPsO2hydtEIAZvXjCZTbehGd3YfouYSxL2CMjMF8WUsR
	 sVeeDqcJCbu71+gQBISChVWgpY4jm8gwFQ158lXk2y0LfWpX3u9/isgH09jXZ5KUkd
	 LNYC/F0a9UMtAqWxw34Bh3k+NGCc4o611IAAe3qUf2hkIaZgOGItUzdibxR5gvgoB4
	 joD5hcJd9qoBg==
Message-ID: <243b30ca-a552-3cb7-8a4e-6e54a56ff60a@collabora.com>
Date: Thu, 7 Jul 2022 12:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: add mdp3 mutex support
 for mt8186
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Xiandong Wang <xiandong.wang@mediatek.com>
References: <20220705122627.2273-1-allen-kh.cheng@mediatek.com>
 <20220705122627.2273-2-allen-kh.cheng@mediatek.com>
 <5916c91b-41a1-c97a-84b4-7d48739a0639@collabora.com>
 <640c1a9b-f8b5-aa89-19af-7d6f5c55eb12@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <640c1a9b-f8b5-aa89-19af-7d6f5c55eb12@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_035952_843228_F065A339 
X-CRM114-Status: GOOD (  16.17  )
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

Il 07/07/22 12:41, Matthias Brugger ha scritto:
> 
> 
> On 07/07/2022 10:52, AngeloGioacchino Del Regno wrote:
>> Il 05/07/22 14:26, Allen-KH Cheng ha scritto:
>>> Add mdp3 mutex compatible for mt8186 SoC.
>>>
>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
>>
>>
>> Please drop this commit. Adding a mdp3-mutex compatible is not needed here.
>>
> 
> Thanks for checking. We probably would need a fallback compatible. We can only know 
> from the HW engineers that can confirm if the IP block is the same as the disp 
> mutex or a different one.
> 
> I'll drop both patches for now until things got clear.
> 

They're located in a different iospace from each other, but either the platform
data needs to *not be* joined together, or if they're together, I would not like
having two different compatible strings for essentially the same thing.

I would at this point prefer dropping '-disp' from 'mediatek,mt8186-disp-mutex'
so that we would be able to declare two 'mediatek,mt8186-mutex' in devicetree...
...or simply have two mediatek,mt8186-disp-mutex (although logically incorrect?).

Cheers,
Angelo

> Regards,
> Matthias
> 
>>> ---
>>>   .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml         | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml 
>>> b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>>> index 627dcc3e8b32..234fa5dc07c2 100644
>>> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>>> @@ -30,6 +30,7 @@ properties:
>>>         - mediatek,mt8173-disp-mutex
>>>         - mediatek,mt8183-disp-mutex
>>>         - mediatek,mt8186-disp-mutex
>>> +      - mediatek,mt8186-mdp3-mutex
>>>         - mediatek,mt8192-disp-mutex
>>>         - mediatek,mt8195-disp-mutex
>>
>>
>>


