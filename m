Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4FCC74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4ZtIXw0ir18QEQZljYtT4f7hKsW6tJ5NYQpUlJrVvM=; b=cx5mzHAjZsrzm/gFIuAsVal+AI
	4LsNSHzfb07KnJn/KnGSQAMYQZ55boMYsn75LOYkQ/HnJK7SOoap3nqm8WdToJndpdrYVeRJ+g7Hf
	4+IJr3pgg41pPgEROjQIHrYzE4KwDb/XqEk90ghFiS8GJQyAHp4sTxAJ6P2+762sscXiiPeWgp3ms
	T2rrDHwKZt6ICAmyndOjSnPebRH4I8jMKMev+HV+rr8UIDwL2Fluphf1rB/qIZqID66r6Ue7wFnM1
	iP0PiehT3uGHTO7/BdSlalSRZxxu7hQZ/DlSqlTR1aKLofgVaam9raHwwDXHRBA5kUDu5R6T6GXmN
	NUUwvlMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6XG-001lRZ-2u;
	Fri, 17 Mar 2023 09:38:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6XD-001lQC-0D;
	Fri, 17 Mar 2023 09:38:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AA6F3660309E;
	Fri, 17 Mar 2023 09:38:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679045881;
	bh=rmmWudAsSvMomWU/4fDVcXJ8Rtt1hVjirKy1iG0ELDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aBnKahfJNgs/WHPGR5Z2WVQlkVBpkAadZjyTZUgUEZ7nZDC3i5EGLvepHobwTWD4D
	 7vc9MJxqJk6pXw3GuXacqWZCXQmuh4te0jaQ7SUBdz5Kr0E94PFH+S40qtVlqZ3Y3x
	 4rYQTCMbfHKf462ylqImBcZTQQnypHMvt8RoueLMyjyukz/HjOHI0r+vbFvQ+Buurk
	 WZQdnuhpNmvPbSY2HKe4LJtO0I+1ySONKuAA8FluTO2fRg0Ag7XYdk6c5AsgkGu8bZ
	 Cd24vQ4qRawksvtR02G+AVvYBdzWwzwCmu0EDGB0YL4qO7VGAKyerLfkU4AHZttOqQ
	 cqnUwyX3YSyPw==
Message-ID: <fdd0a157-eedb-bf21-c632-79b02a4cd6b0@collabora.com>
Date: Fri, 17 Mar 2023 10:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v29 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
 <ck.hu@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>
References: <20221227081011.6426-1-nancy.lin@mediatek.com>
 <20221227081011.6426-2-nancy.lin@mediatek.com>
 <4aff6a7a3b606f26ec793192d9c75774276935e0.camel@mediatek.com>
 <2700bd6c-f00d-fa99-b730-2fcdf89089fa@linaro.org>
 <1d65e8b2de708db18b5f7a0faaa53834e1002d9f.camel@mediatek.com>
 <b04eb48e-c9aa-0404-33ec-bef623b8282f@linaro.org>
 <e5ceec9e-d51b-2aeb-1db7-b79b151bd44c@collabora.com>
 <0ebf187d-972e-4228-d8a0-8c0ce02f642d@linaro.org>
 <72cf6344a1c5942bff0872d05dce82b787b49b76.camel@mediatek.com>
 <4027714e-b4e8-953b-68e2-f74f7a7f0e8e@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <4027714e-b4e8-953b-68e2-f74f7a7f0e8e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_023803_365584_97B650B0 
X-CRM114-Status: GOOD (  15.42  )
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

Il 17/03/23 10:03, Krzysztof Kozlowski ha scritto:
> On 17/03/2023 08:55, Nancy Lin (林欣螢) wrote:
>> On Thu, 2023-03-16 at 12:36 +0100, Krzysztof Kozlowski wrote:
>>> On 16/03/2023 10:53, AngeloGioacchino Del Regno wrote:
>>>
>>>> Hello Krzysztof, Nancy,
>>>>
>>>> Since this series has reached v29, can we please reach an agreement
>>>> on the bindings
>>>> to use here, so that we can get this finally upstreamed?
>>>>
>>>> I will put some examples to try to get this issue resolved.
>>>>
>>>> ### Example 1: Constrain the number of GCE entries to *seven* array
>>>> elements (7x4!)
>>>>
>>>>     mediatek,gce-client-reg:
>>>>       $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>       maxItems: 1
>>>>       description: The register of display function block to be set
>>>> by gce.
>>>>         There are 4 arguments in this property, gce node, subsys id,
>>>> offset and
>>>>         register size. The subsys id is defined in the gce header of
>>>> each chips
>>>>         include/dt-bindings/gce/<chip>-gce.h, mapping to the
>>>> register of display
>>>>         function block.
>>>>       items:
>>>>         minItems: 28
>>>>         maxItems: 28
>>>>         items:                     <----- this block doesn't seem to
>>>> get checked :\
>>>>           - description: phandle of GCE
>>>>           - description: GCE subsys id
>>>>           - description: register offset
>>>>           - description: register size
>>>
>>> This is what we would like to have but it requires exception in
>>> dtschema. Thus:
>>>
>>>>
>>>>
>>>> ### Example 2: Don't care about constraining the number of
>>>> arguments
>>>>
>>>>     mediatek,gce-client-reg:
>>>>       $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>       maxItems: 1
>>>>       description: The register of display function block to be set
>>>> by gce.
>>>>         There are 4 arguments in this property, gce node, subsys id,
>>>> offset and
>>>>         register size. The subsys id is defined in the gce header of
>>>> each chips
>>>>         include/dt-bindings/gce/<chip>-gce.h, mapping to the
>>>> register of display
>>>>         function block.
>>>
>>> use this.
>>>
>>> Best regards,
>>> Krzysztof
>>
>>
>> Hi Krzysztof, Angelo,
>>
>> Thanks for the comment.
>> The Example 2 can pass dt_binding_check.
>>
>> But the example in the binding has 7 items [1] and dts [2]. Does the
>> "maxItems: 1" affect any other schema or dts check?
> 
> Ah, then it should be maxItems: 7, not 1.
> 

Keep in mind for your v30:

maxItems: 7 will pass - but only if minItems is *not* 7 :-)

-> (so, do not declare minItems, as default is 1) <-

Regards,
Angelo

> Best regards,
> Krzysztof
> 

