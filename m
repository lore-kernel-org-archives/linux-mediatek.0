Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB15DC87FCF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Aug 2025 15:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOcSpQGkjekYmzTTJ25Wu7ILJc0aUS/cr5FdWEUb4a8=; b=2Z3d5qxH7dAOKoEIkNEtALq5iY
	/9PaHRlXty4TApcYpjFBPPbROlQ1/GPCf6+f9+QQxK2p/NfAbs0nsSLWVFC8qoWkVh3tfGkN8rT5m
	crd5l3cvVUyi54qQhFfFzWu4BmRtmI3BnteTi6oZBK15MzbHTzOQ1YWYJDeYv3QxDBOuR0WfEhOXn
	VlQIq8dGRnATq95CyUsfunStDsy0Pr7ZGZsglgKyDGeJkxnc6bf1hd5b/6nslhkSl6IekKnUJZpgG
	Ib337zeesb6wa2/PRQhg74V/4RB2k/AK2JHFiMoiFqU/RjoMjv2Y7HYMn78SV+1fioCv4hLVnESMo
	dlZ+HyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwkC-0000000Ak1D-0LeL;
	Mon, 04 Aug 2025 15:04:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiw4H-0000000AeTj-36Cd;
	Mon, 04 Aug 2025 14:21:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A6265C0EF4;
	Mon,  4 Aug 2025 14:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83E2C4CEE7;
	Mon,  4 Aug 2025 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754317296;
	bh=THg8fAXPOZpcU1UGe5NLfNZG1W+ChsloJhTKXS2XCtU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h3vhkvxabpJMXDlINEWLQk8ydeeUQRoRcThhCsg5uAbdxXPQbvYpZg5nRyu1GhkbH
	 xsuhqcazwRf8jzExikPL24G7pd8R3A+M16x7zSGSccfClPUb5CdUSFZACV99cW4OwM
	 Pg0lkkh+6B8JaE9n6NILQrWXifQkMzoENHQHlejpSMrXhbz90yDtmOEEXyBY6q4aqU
	 3HkTXAxdODW73D2tUacw6/rNrYztKUSgXZ+pHPX3YG9QB14JFGOW3uDH8je1sOt8ra
	 n+fuUtxXnIPUB4ArQkE5EloA0CL5QMZcPpzH8JZsUgIscFGshDWRWy79GeWTiCss0m
	 3/nUg3sie37xA==
Message-ID: <c16070db-c086-45b8-bc0d-9e3bc02924b6@kernel.org>
Date: Mon, 4 Aug 2025 16:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/27] dt-bindings: clock: mediatek: Describe MT8196
 clock controllers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Laura Nao <laura.nao@collabora.com>, wenst@chromium.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 guangjie.song@mediatek.com, kernel@collabora.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, mturquette@baylibre.com, netdev@vger.kernel.org,
 nfraprado@collabora.com, p.zabel@pengutronix.de, richardcochran@gmail.com,
 robh@kernel.org, sboyd@kernel.org
References: <fbe7b083-bc3f-4156-8056-e45c9adcb607@kernel.org>
 <20250804083540.19099-1-laura.nao@collabora.com>
 <373f44c3-8a6a-4d52-ba6b-4c9484e2eac1@kernel.org>
 <1db77784-a59a-49bd-89b5-9e81e6d3bafc@collabora.com>
 <e9ee33b0-d6b0-4641-aeeb-9803b4d1658a@kernel.org>
 <00a12553-b248-4193-8017-22fea07ee196@collabora.com>
 <2555e9fe-3bc0-4f89-9d0b-2f7f946632e7@kernel.org>
 <62edb8e3-aff6-4225-b520-f4b73aef145d@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <62edb8e3-aff6-4225-b520-f4b73aef145d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_072137_862991_4A61B1CB 
X-CRM114-Status: GOOD (  11.49  )
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

On 04/08/2025 16:15, AngeloGioacchino Del Regno wrote:
> Il 04/08/25 15:58, Krzysztof Kozlowski ha scritto:
>> On 04/08/2025 15:27, AngeloGioacchino Del Regno wrote:
>>>
>>> We discussed about aggregating votes, yes, in software - this instead is a
>>> *broken* hardware that does the aggregation internally and does not require
>>> nor want external drivers to do the aggregation.
>>>
>>>> Maybe it is just the name, so avoid all the confusing "votes" if this is
>>>> not voting system. If this is a voting system, then don't use custom
>>>> phandles.
>>>
>>> Being it fundamentally *broken*, this being a voting system is what the hardware
>>> initially wanted to be - but effectively, since it requires YOU to:
>>>    - Make sure that power supplies are turned on, if not, turn them on by "touching"
>>>      HW registers (so, without any assistance from the voter MCU), if any;
>>>    - Turn on parent clocks manually, if any, before using the "voter mcu" to try
>>>      to ungate that clock; and
>>>      - Enable the "FENC" manually, after the mcu says that the clock was ungated.
>>
>>
>> I understand that "YOU" as Linux driver, when you want to do something
>> (e.g. toggle) a clock?
> 
> "you" == Linux driver, yes.
> 
>> If so this looks a lot like power domain, although with some differences.
>>
> 
> A power domain ungates power to something.

Does more, it is not a simple supply.

> 
> These are clocks, giving a (x) (M)Hz signal to something.

Your earlier message about "YOU" said:

"   - Make sure that power supplies are turned on, if not, turn them on
by "touching"
     HW registers (so, without any assistance from the voter MCU), if any;"

so not a simple clocks stuff.

Best regards,
Krzysztof

