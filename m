Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591A5C04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryV0aYFzIMJdCddjHyuQKhuy2KCXWenwWutqfpLTYmI=; b=pM3270PmiSBQW1xAybQlA/xhUN
	0pZLSMTU7VRzk7YU3yLQ7C8NEz/if9c4zgi02JJfKRrmSigIenOr7Kq4EuWYhEPhSf92oRJzkdh/j
	+H4ntN4TTriNi9Lau4dpCukvbxrl700ClT/Uq+RVhMLA/fYNhG48h9J8JV17JvClhYgJTIpN5p/ct
	xp4xReZvad8qb8qOwcWz+3TIdTuLtFtj2+aoFmlyULYyMUD8J5G9/QLmnA6cR5SVnCEf6ldrvbQCY
	PG1NdvxJQe8rdGYQZN+42fN9utuYjEhbDwlPbU1lvlgg/isLxuySB5gF1Hya0zuh5INUE+sP67v7G
	5aWKTVvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s94kr-0000000Eohq-2SCs;
	Mon, 20 May 2024 15:16:49 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s94ko-0000000EohG-0SbW
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 15:16:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716218203;
	bh=iT54/HpDZG8UdWdWEo4UM/5Vmmtz6kPS3fZOIckwce0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PEM5ajG07x1wmKTgoTEoazS/bTJarTiT+sxB/IglZCSJOMS1Y+itH3w3KGVoenTrF
	 /bmBaeMBVyFHFkHWnGKJ4O81QJ3IY+QFcxKCuB7EnzXY7Xl7c5DkO+E6BxEMNbFlle
	 wskUYdjGCsSjekpTct7zzgAq7M30OxnzHZODxegIu/e1BNect8Rl8x/RnAHXEbaSaC
	 PxqKtOqf0jOYnK89+356X5iClHu4Xx4Ey0zWk7QqTN3GYPia0zXRlGkc+J82DldF1n
	 rnIaH7lRpT2HPR3zLfkmQMJibPtKKqxh9ppmk3c+1Q79F9i82UWrNvU6/0Jl7NpNMH
	 GScbg2diT5X2g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9C549378000A;
	Mon, 20 May 2024 15:16:42 +0000 (UTC)
Message-ID: <db915f6f-fa78-4747-9b1f-b36851d657f6@collabora.com>
Date: Mon, 20 May 2024 17:16:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] Mediatek thermal sensor driver support for
 MT8186 and MT8188
To: Julien Panis <jpanis@baylibre.com>, Nicolas Pitre <nico@fluxnic.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
References: <20240402032729.2736685-1-nico@fluxnic.net>
 <981a8748-16d0-4744-b097-aa9dd14c63a8@collabora.com>
 <eae892e8-f888-4d15-85a5-c89b6b6825f7@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <eae892e8-f888-4d15-85a5-c89b6b6825f7@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_081646_561208_5817E4CE 
X-CRM114-Status: GOOD (  16.58  )
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

Il 20/05/24 14:53, Julien Panis ha scritto:
> On 4/23/24 11:22, AngeloGioacchino Del Regno wrote:
>> Il 02/04/24 05:25, Nicolas Pitre ha scritto:
>>> This is a bunch of patches to support the MT8186 and MT8188 thermal
>>> sensor configurations. Several changes are needed to cope with oddities
>>> these SOCs implement.
>>>
>>> All values (calibration data offsets, etc.) were lifted and adapted from
>>> the vendor driver source code.
>>>
>>
>> I picked patches 7 and 12 (and also fixed them) introducing the nodes for the
>> LVTS controllers, but will not pick 9 and 15, as they're either missing thermal
>> zones and/or using the wrong names; let's wait for the next cycle for those, as
>> I will also be able to add the SVS on top (needs a bit of time for testing),
>> getting both SoCs complete on the LVTS side, without rushing.
>>
>> Cheers,
>> Angelo
>>
> 
> Hello Angelo.
> 
> I took over Nico's work, so I might have missed a few things, but I'm
> a little bit confused with patches 7 and 13 (you wrote '12' but meant
> '13' I guess, didn't you ?).
> 
> It seems to me that patches 7 and 13 were applied in next-20240503
> (f5bcf8ab0950 and d3dbc472ac66). But I don't find them any more in
> next-20240520. It's likely that I don't understand well the process, but
> I prefer being sure...Should I resend them in next series ?

Yes, please.

> 
> Just a comment about d3dbc472ac66. There's a typo error, I think:
> nvmem-cell-names = "lvts-calib-data1";
> ...should be replaced with
> nvmem-cell-names = "lvts-calib-data-1";
> ...according to the related yaml.

Yes, that was a typo :-)

Cheers,
Angelo



