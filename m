Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C58C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/YRZUiRRlbJLWENM+NSQQmzcXtRicUPgH83NuxZ3Fw=; b=DQUK7UndDnCfBR+r43hFGKo4gl
	lis+Jhutthjx6oraN2ZFPzacPxtQCEYIZgUIxQnFRDsaHUF0HzaeiiOTNYW13LPYwK4nXNIFXQEl9
	0pOy6mAH3Yr5eIyVPBisRVO5GLJ01gIJuWvABBsZtrHBWnS2s41Qb1Hy57Nqk5ZEHmKL0n+dRa8Oh
	PWHt/mBwmdkWokjrMlUU4Ab8PjOoXat63c+NZu8THZgH3bH720+BVRhvxWlSCugDPnh3Iue8S0eNK
	P/05bktamQMOF662xiVERFq2A4AMRTbHmtb+Euu6fA3dupodbesVK7RpP19YppiwFjaeLyqFDUytg
	4CZNEX8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jPU-002ZCD-Cz; Fri, 08 Jul 2022 08:32:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jLi-002XZ2-Oa; Fri, 08 Jul 2022 08:28:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D2A366016BD;
	Fri,  8 Jul 2022 09:28:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657268909;
	bh=eiEwqY/zQ39+iog6TzycknMj2PVHRqGNoVvlat2MSJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gcPcj3NtQ1QbAMFAEbJKKq7fKiSLQ6b+L9tPXomFZ6tbfvr+KpllZx25q0ZOnlJnu
	 YM4a6zLE5VH5OzqmVzyhqkdIWV9YTBdCNUCUr8RWS8/LQyyuzMxvtHrDL325JgXDoc
	 cF9BXXtQLGEMCPxW5G+l9Gtk0mNSrn6K0A+jDwoFc3Dpo0lVPgHoyt4f52oxmCJlrd
	 h5S3tZutHTqiv/yCfaIUD6RpKCVpM+o0jLWZv4ZqJZ1DgD+XnWI3fyu/Wc+yoLKMr7
	 erdBtphYHQx5xzbf7mespvAg+B1zkk0k97gWdLfQ4WjDMQ1ey5EUONUCGuNfbDiP2d
	 RXJOEgd1c9AvQ==
Message-ID: <2b25912b-85d7-8804-b973-6239545d19ff@collabora.com>
Date: Fri, 8 Jul 2022 10:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: add mdp3 mutex support
 for mt8186
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
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
 <243b30ca-a552-3cb7-8a4e-6e54a56ff60a@collabora.com>
 <55fafa62684e077f75c3b8b192a59df62ad01692.camel@mediatek.com>
 <2f2f8bfe-4c7f-d81c-30bf-bcd60b42e245@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2f2f8bfe-4c7f-d81c-30bf-bcd60b42e245@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_012831_301260_8CDD5CBC 
X-CRM114-Status: GOOD (  21.07  )
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

Il 08/07/22 10:19, Matthias Brugger ha scritto:
> 
> 
> On 08/07/2022 10:14, allen-kh.cheng wrote:
>> Hi Angelo,
>>
>> On Thu, 2022-07-07 at 12:59 +0200, AngeloGioacchino Del Regno wrote:
>>> Il 07/07/22 12:41, Matthias Brugger ha scritto:
>>>>
>>>>
>>>> On 07/07/2022 10:52, AngeloGioacchino Del Regno wrote:
>>>>> Il 05/07/22 14:26, Allen-KH Cheng ha scritto:
>>>>>> Add mdp3 mutex compatible for mt8186 SoC.
>>>>>>
>>>>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>>>>> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
>>>>>
>>>>>
>>>>> Please drop this commit. Adding a mdp3-mutex compatible is not
>>>>> needed here.
>>>>>
>>>>
>>>> Thanks for checking. We probably would need a fallback compatible.
>>>> We can only know
>>>> from the HW engineers that can confirm if the IP block is the same
>>>> as the disp
>>>> mutex or a different one.
>>>>
>>>> I'll drop both patches for now until things got clear.
>>>>
>>>
>>> They're located in a different iospace from each other, but either
>>> the platform
>>> data needs to *not be* joined together, or if they're together, I
>>> would not like
>>> having two different compatible strings for essentially the same
>>> thing.
>>>
>>> I would at this point prefer dropping '-disp' from 'mediatek,mt8186-
>>> disp-mutex'
>>> so that we would be able to declare two 'mediatek,mt8186-mutex' in
>>> devicetree...
>>> ...or simply have two mediatek,mt8186-disp-mutex (although logically
>>> incorrect?).
>>>
>>> Cheers,
>>> Angelo
>>>
>>
>> Thanks for your opinion.
>>
>> They are two different hardwares for different address spaces.
>>
>> I think we drop '-disp' from 'mediatek,mt8186-disp-mutex' will be
>> excessive because we also need to modify mutex node in all exited dts
>> files.
>>
>> I prefer havingg two mediatek,mt8186-disp-mutex.
>>
>> ex:
>> mutex: mutex@14001000 {
>>     compatible = "mediatek,mt8186-disp-mutex";
>>     ..
>> }
>>
>> mdp3_mutex0: mutex@1b001000 {
>>     compatible = "mediatek,mt8186-disp-mutex";
>>     ...
>> }
>>
>> What do you think?
> 
> I think that's an acceptable solution.
> 

I'm a bit undecided instead, now... because from what I understand now,
the platform data fields

	.mutex_mod  and  .mutex_sof

are *not valid* for mutex at 0x1b001000 but only for the instance at 0x14001000.

If we go this way, at this point, we would be free (and allowed by the driver)
to try to set these for 0x1b001000, and to try to set MDP3 table paths on
0x14001000, which is something that shouldn't be logically allowed, as the
hardware does *not* support that.

Unless I got that wrong, and these fields for MUTEX_MOD_DISP_xxxx do exist in
the mutex instance at 0xb001000, in which case, I fully agree with Matthias.

But otherwise, I have my doubts.

Cheers,
Angelo

> Regards,
> Matthias
> 
>>
>> Best regards,
>> Allen
>>
>>>> Regards,
>>>> Matthias
>>>>
>>>>>> ---
>>>>>> .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>>>>>>    | 1 +
>>>>>>    1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git
>>>>>> a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex
>>>>>> .yaml
>>>>>> b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex
>>>>>> .yaml
>>>>>> index 627dcc3e8b32..234fa5dc07c2 100644
>>>>>> ---
>>>>>> a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex
>>>>>> .yaml
>>>>>> +++
>>>>>> b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex
>>>>>> .yaml
>>>>>> @@ -30,6 +30,7 @@ properties:
>>>>>>          - mediatek,mt8173-disp-mutex
>>>>>>          - mediatek,mt8183-disp-mutex
>>>>>>          - mediatek,mt8186-disp-mutex
>>>>>> +      - mediatek,mt8186-mdp3-mutex
>>>>>>          - mediatek,mt8192-disp-mutex
>>>>>>          - mediatek,mt8195-disp-mutex
>>>>>
>>>>>
>>>>>
>>>
>>>
>>

