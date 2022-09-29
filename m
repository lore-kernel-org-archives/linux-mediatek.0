Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F2FC04A95
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 08:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjBurnUQ6PY/Vc/K+0Oe5QgMxheQUlk4a1/e2Sohso0=; b=kR5AUHZEvNmocCKnNPlFsdujVz
	7sD0A/ot4L/nT+2sQbgm26iAWnSTvhSsP1iHzmBVD1h/M32ZkAkGUQNQe5JHEVgmdmP//T3JxM32U
	0437RDsAqHgvYS1K2LYPfQ1bI3CW/yKC2X+UVXUDDcVjBLpw82xMB9eQUWVuHDF0hMqUUlu9lU/XN
	37qWZUP9rsuHlxMInrMtX0g4PC7y7iXe86idjzL3oaj1NoiXUP9t0Vv2TUOYpxL5e4wwpDWkSBAAg
	m86S6Ix92I0mVMtsFYqp3I9Yyx+c4LybtVmy/cGkJEFOCCqCNWKkDZl8syRhpcwobam36kz6ZnXqx
	R6r1TeZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odowj-001qqd-Va; Thu, 29 Sep 2022 08:31:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odowJ-001qhb-Nn; Thu, 29 Sep 2022 08:30:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F233466022A4;
	Thu, 29 Sep 2022 09:30:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664440238;
	bh=HVln2XQjo1/6453DUDMrhYEM8FW/l3NioWcqHa6H5w0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SMePAmrCy/8UBc2cvHQg5288l2wp2jh/iO+V7KyBjom8Yibaa5ZP0lhC9jAU/XdBr
	 IxtosWx+LSCHCeXZ61G+N2WKr9mNddShrW97enlB+1iYR902ceDqJFmiF934GSK8jQ
	 qMmuE8ebmOd+zKQBiS0lmEqJ4MGCUzhfSJsIX6IE18nK0o9liq31eIUCYjXL1yum3a
	 FvZyMlkp9zfPxkki3ucn1SqKx/902MY5M822GfwvG9InvNPwOVXXRJH4+K6zR8C+Eh
	 P/BELo023rezJDNp1Jrx7TpllCCLkbMMU+80eWPrDZOc4x87s2mE3vaFeZkaaWNYNY
	 IVB4vPfQ/+tiQ==
Message-ID: <514f8de1-1a23-1947-80cd-6136e17af490@collabora.com>
Date: Thu, 29 Sep 2022 10:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] arm64: dts: mt8192: Add vcodec lat and core nodes
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20220926105047.19419-1-allen-kh.cheng@mediatek.com>
 <4d1e8600-f73d-8d2b-2e7a-1b75be7624bd@collabora.com>
 <d71334b63427df73d01ff1b9fa4d2dec94ad9c95.camel@mediatek.com>
 <05ed341b-2db3-620f-7a70-dcebfaa66f1a@collabora.com>
 <172e10ee-22fd-ccec-1a5a-7bd0a29dbfc4@linaro.org>
 <68e1c8b0-04cf-acf8-b6b6-97d9eb8a7c4a@collabora.com>
 <186bc17e-56d2-f125-aab9-f47bf3f45b79@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <186bc17e-56d2-f125-aab9-f47bf3f45b79@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_013039_939057_87E87A71 
X-CRM114-Status: GOOD (  18.97  )
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

Il 28/09/22 19:26, Krzysztof Kozlowski ha scritto:
> On 28/09/2022 09:58, AngeloGioacchino Del Regno wrote:
>> Il 28/09/22 09:04, Krzysztof Kozlowski ha scritto:
>>> On 27/09/2022 12:17, AngeloGioacchino Del Regno wrote:
>>>>>>
>>>>>
>>>>> Sorry, my bad. I alsways run `make dtbs_check` to confirm dtb with
>>>>> bindings. I just think we didn't limit node names in mtk-vodec
>>>>> bindings. I will pay attention next time.
>>>>>
>>>>>
>>>>> Since currently the vcodec lat and core nodes are absent from the mtk
>>>>> dts, do you think the child node name should be changed to something
>>>>> more general (ex: video-codec) in mediatek,vcodec-subdev-decoder
>>>>> bindings?
>>>>
>>>> The video codec is mt8192-vcodec-dec, while the other nodes are describing
>>>> the VPU instances (and/or vpu cores)... I'm not sure.
>>>>
>>>> Krzysztof, please, can you give your opinion on that?
>>>>
>>>
>>> What's the difference between them? I understand parent device is entire
>>> block of consisting of multiple processing units? If so, video-codec
>>> actually could fit in both places. But feel free to call it a bit
>>> different (video-codec-core, video-codec-lat, processing-unit, even
>>> something less generic). Sometimes it's tricky to find nice name, so I
>>> wouldn't worry too much in that case. Just not "mt8192-vcodec" :)
>>>
>>
>> The parent device is the entire block consisting of multiple processing units
>> and has "global" control registers; children are LAT(s) and processing cores.
>>
>>   From my understanding, the processing cores are physical cores of one big VPU
>> and, depending on the actual (current gen) SoC, the VPU may have one or two
>> cores.
>>
>> Right now, the bindings want vcodec-latX@addr, vcodec-coreX@addr (where X is
>> a number, like vcodec-core0, vcodec-core1) but, in my opinion, changing that
>> to video-codec-lat@addr and video-codec-core@addr would be more descriptive.
>>
>> ...Or should we simply leave the bindings as they are and just go with the
>> abbreviated "vcodec-(hwtype)" names?
> 
> video-codec-lat sounds better, but I am not sure if it is worth the
> churn, so I am fine with both.
> 

Thank you Krzysztof!

Allen, can you please change the binding to use "video-codec-lat" and
"video-codec-core" (so change "vcodec" to "video-codec") and then use
these names for this commit?

Doing the change right now won't break the ABI, as there's no devicetree
using that binding yet (with this commit adding the first user), so you
can safely go for the rename without any complication.

Regards,
Angelo




