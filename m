Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9745C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 08:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCPlm1ET25q8lKgKQqsCSt4ku0aDJpqUlXyRtt9ALKs=; b=5Fgzhv0fgQPI/9eK7CsMvn6wYn
	/JGPamyyB4/hMJd773tAHfCIp32KNcNJFgCXqjrkY/AmB5bY0DHxFTgAKHU94QNdfU21iFxk0tMQ2
	Nnf/1rBC+Msmanf6WTWz/3hu8CM68CCVuMX4TnQ4CulmQA4p8ndgBbYhGPhyGyHYMscjB05qBFrub
	6MolV2lcCB7q1nyvXx8ID3ruyaY0fA+YBrASMMn9mpWmUo8b0a5o/3+/dOJApzxOf7Dc/qyxZFQKV
	z7mjKX8US9LpoTILtGwiN6+crotw5Jh3spkQXBhuXILSzfLGCKjEgynATxvosb/MnXYc48CtH+kE1
	qLnYc6nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjeP-0000000Fk3e-2ZWS;
	Tue, 30 Jan 2024 08:39:25 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjeL-0000000Fk1I-3Rrx;
	Tue, 30 Jan 2024 08:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706603960;
	bh=9fYopgXzbpsQiE7E/H2LDcOlBUc/v20dA7T49dXOcZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KJ//jMYd/5xJLL/l0JF6Usg6KpSaxKV6UEPWTOzcid5hnldRaFoWyGoZlVjfNpJAU
	 8v6aiI+zOR2OKs0pzqlTJZiCRsYVHVHl3y1EuYQudeWWIdSX8ThAkp730BLsd+8Fr+
	 Kd3VTLJcS/JBsbjk9vsVk+NE5jvLAvmDDBCy1LpxaEgldCbLzRm8JlaawMlrjzBISX
	 9A4zAwP7HJTScRIy4RL0jCNcmLQgLxuqf58R1H27MMTEocRm67PUoYS60mauL/BXXw
	 WasRNhhfC5eo0Z/xe6ASTBU+C6xhY5QsnH9Miy4ob7yJo9lHLMagZ41e6nYQEYgzyh
	 mzS/uShqbszZA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0719C3782076;
	Tue, 30 Jan 2024 08:39:19 +0000 (UTC)
Message-ID: <bc1d5824-fc34-4c04-b375-1f506a358193@collabora.com>
Date: Tue, 30 Jan 2024 09:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: media: mediatek-jpeg-encoder: change
 max iommus count
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240127084258.68302-1-eugen.hristev@collabora.com>
 <170652472373.127352.5854831299483160743.b4-ty@collabora.com>
 <282822ba-0e96-4078-a807-4b0b08e42014@collabora.com>
 <CAGXv+5Em3HUJV1pv177LUwf9iMhKSLcGhVAt6ON9YZMNaT2oZw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Em3HUJV1pv177LUwf9iMhKSLcGhVAt6ON9YZMNaT2oZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_003922_005386_363D3AC3 
X-CRM114-Status: GOOD (  10.43  )
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

Il 30/01/24 04:24, Chen-Yu Tsai ha scritto:
> (Drop a bunch of people from CC)
> 
> On Mon, Jan 29, 2024 at 6:48 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 29/01/24 11:41, AngeloGioacchino Del Regno ha scritto:
>>>
>>> On Sat, 27 Jan 2024 10:42:57 +0200, Eugen Hristev wrote:
>>>> MT8186 has 4 iommus in the list, to cope with this situation, adjust
>>>> the maxItems to 4 (instead of previous 2).
>>>> Add also minItems as 2 to keep compatibility with current devices.
>>>>
>>>>
>>>
>>> Applied to v6.4-next/dts64, thanks!
>>>
>>
>> Sorry, typo: v6.8-next/dts64
> 
> I was wondering, what script produces this email?
> 
> AFAIK `b4 ty` gives a simple thank you letter without branch or commit
> hashes.
> 

That's exactly `b4 ty` :-)
You can use a custom template, so that it reads something like

`Applied to ${branch}, thanks!`

Cheers,
Angelo

> ChenYu
> 
>>> [1/2] dt-bindings: media: mediatek-jpeg-encoder: change max iommus count
>>>         commit: b824b32dd5e98221cbe2e8bcccc6fb4134e35fc1
>>> [2/2] arm64: dts: mediatek: mt8186: Add jpgenc node
>>>         commit: 4c5b46fbf52d52b0f392f0fc3913560bad438e49
>>>
>>> Best regards,
>>
>>


