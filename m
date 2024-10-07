Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212F9CFB43F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 14:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eX/lBDlu6eVaHXeVn1R4rm2cMn9nhxGdKxxIMSGCXas=; b=CZ2iglgYdC3Of4860vCfFNBrIj
	XiktaAqc1sMleEtx9frVkPor7BczMTh9eHU2V/5rhp73zfx5jyC+mUNjq7fL7WSESQIUZdNtTiebE
	kjPhmfyyXIiel04a7d7R1UakNm20XPgK6KF3Sh2wqFQrGdjBTHnMKkICqiOkh7nhrUlDhojnNIS/v
	0VlfaueorjMH8LylRa0Gc0efsLgfAk4v5V8deF1Kb+Str1/N6n0mexSKi1EzCyACw7YsQsmGljwJb
	mXuG0HtNN1w7u0AwLRYJVeHG+yzpMXZx19pO+gGRqEqEBc9Qq/S3BhhYLf8SBtjB1CveeBhqZgzLK
	5306nA+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoxx-00000002mOk-0drM;
	Mon, 07 Oct 2024 14:44:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoqN-00000002ksc-00IM;
	Mon, 07 Oct 2024 14:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728311772;
	bh=YJBNkZmTCp4yDDi7LsNaw3f1xXzAird2t/fP2QX/qC8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OsjNRe8wVTqml8K0/JnJEGb2DitpIeHBMcTzxMA2oWb1pRDsZUtT03s/fhUcMdb7r
	 Gmy0XxxRNIsurmwSPoFbC5Vb2UkQiyI590xRX11I5yTDFz+uG1qp4JxiVYa1tzJleK
	 6rZBJuw5Eg26a+lNufv8VA2O19Ma22AW3qEqVi/Eerkuqc6DZ1Bx68xzznWXc64Fyn
	 Y4FWr+V90Enh/3eeQ+IzbIa5BvDdeW5h6XlqLQ7SsHY2dzzBqzZPuRTzVjcNJMqaEf
	 sdNOYKG682vHEOod6C23/priHckbxyUbO4Y4plnixQxg4CLKTxRBqJx499aJci5Nn0
	 sAeRUCqOzCC3A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A7C5C17E35FB;
	Mon,  7 Oct 2024 16:36:12 +0200 (CEST)
Message-ID: <8471ba7d-20a3-487a-8abe-f0fcf844c709@collabora.com>
Date: Mon, 7 Oct 2024 16:36:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] soc: mediatek: mtk-cmdq-helper: Various cleanups
To: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20240918100620.103536-1-angelogioacchino.delregno@collabora.com>
 <172786008674.33539.15432336067797076322.b4-ty@collabora.com>
 <3e0c8b18-81ce-4c9b-886f-d7c50fdf4c3d@gmail.com>
 <ae5eb5a8-d843-488a-8b68-9f6dd5d4603d@collabora.com>
 <2ebe6831-f213-4026-b7b9-689b3b5e78a3@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2ebe6831-f213-4026-b7b9-689b3b5e78a3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_073615_238652_81D8264A 
X-CRM114-Status: GOOD (  14.15  )
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

Il 07/10/24 16:33, Matthias Brugger ha scritto:
> 
> 
> On 03/10/2024 10:08, AngeloGioacchino Del Regno wrote:
>> Il 02/10/24 15:00, Matthias Brugger ha scritto:
>>>
>>>
>>> On 02/10/2024 11:08, AngeloGioacchino Del Regno wrote:
>>>> On Wed, 18 Sep 2024 12:06:17 +0200, AngeloGioacchino Del Regno wrote:
>>>>> This series performs various cleanups to the MediaTek CMDQ Helper lib,
>>>>> reducing code duplication and enhancing human readability.
>>>>>
>>>>> This also avoids double initialization struct cmdq_instruction as,
>>>>> in some cases, it was stack-initialized to zero and then overwritten
>>>>> completely anyway a bit later.
>>>>> I'd expect compilers to be somehow smart about that, but still, while
>>>>> at it ... why not :-)
>>>>>
>>>>> [...]
>>>>
>>>> Applied to v6.12-next/soc, thanks!
>>>>
>>>> [1/3] soc: mediatek: mtk-cmdq: Move mask build and append to function
>>>>        https://git.kernel.org/mediatek/c/2400e830
>>>> [2/3] soc: mediatek: mtk-cmdq: Mark very unlikely branches as such
>>>>        https://git.kernel.org/mediatek/c/21ab3dae
>>>> [3/3] soc: mediatek: mtk-cmdq: Move cmdq_instruction init to declaration
>>>>        https://git.kernel.org/mediatek/c/66705b89
>>>>
>>>
>>> You probably oversaw the sparse warning email on 3/3?
>>>
>>> As I oversaw that you already merged this.
>>>
>>
>> Yeah, I did. There's no problem anyway, as we can always replace the commits
>> without noise, I haven't pushed anything to -next :-)
>>
>> I plan to do that (drop patch 2/3, delete `.mask = 0` on 3/3) soon, at max
>> next week anyway.
>>
> 
> Perfect, before you do any locally please pull from remote as I did some changes, 
> not sure if you saw my message on IRC.
> 
> Regarding -next: we don't need to keep commit history in linux-next neither, to 
> even it got pushed to -next, we can drop patches in the queue with any problem.

My day was pretty full, I didn't. Thanks for shooting the email :-D

> 
> Have a nice afternoon :)

You too!
Angelo



