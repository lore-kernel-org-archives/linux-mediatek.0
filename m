Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1799E68145
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Feb 2026 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:To:From:References:Cc:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RVH1ipZIHBe/R/M3jd5GddnpbaCXSeGBKFUjvszSCo=; b=o3+xOXKpBWrq1E7L9jiek6tx8a
	IVZpYIhwRkvX4QMj23WnKfgCy9ST0Ue1RYWaSSB6A6oBu6K/KSip/kuOXJfrmigci4KHTJnbfnFA+
	8R7tteW/0uls5y0/OXF8jjVQ9pMcB+K33UClv2N9sErPgzr/rbkaYSkkQ1x3hKCCwbahLpQ9NLdrk
	mnSWgAxxKzwx0S39Du884ooh6bL8ZR2VC+7wTBg95hCsjrggM5rIfHjeJQNXLeYyh9PKI8K+xPmxc
	e7C+PLgLpf/QO0121Wnn83llAFzlY1bbj+fGxjvOrXQshloabgzrLWXOtt7hBARUgd3U5IoIF5TU0
	e+6AC75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsGHh-00000007qaH-3WBr;
	Tue, 17 Feb 2026 08:18:17 +0000
Received: from relay.yourmailgateway.de ([188.68.61.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsGHc-00000007qZm-0RfR
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Feb 2026 08:18:16 +0000
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4fFXZj2MFDz73QD;
	Tue, 17 Feb 2026 09:18:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1771316285;
	bh=wNmASthUQB6K1/NE1lVtryc0WHAWlmUfvnJEL99T7II=;
	h=Date:Subject:Cc:References:From:To:In-Reply-To:From;
	b=K/INfGig2CqnhuhFu1l3cReb1UiZU0ljGlD2Ay1S+/Opx0y8AXgvZVUK4lrSrka81
	 RPr8l0PTa9CuY9CapWdjy4Dq+WueC/ipSxSnmd4Gm0LNoFrhNJ9b1h0LUU4qRgrCAZ
	 stAP+rAtnk0hvt0ykzH/WmnRdkhfefImMx9PfOUwigJQZZ5MNmGNmeD+Bz2B8JXWkX
	 gK/ZbXHhOmecX1JdOtchrAKRHSOXyVwnRfbXC+94c59EZMAAGfm3FTuKDGeh/2NxLe
	 +hqz5NOeurvA+fgZN+4Vig3SoJG4QbAE1CjwdmPiVkQlWR+sU8tznTQQjdIHsG8hZd
	 ETi+s84gglMqQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4fFXZj1djdz73QC;
	Tue, 17 Feb 2026 09:18:05 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fFXZg1pH9z8sbs;
	Tue, 17 Feb 2026 09:18:03 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 771AE67559;
	Tue, 17 Feb 2026 09:18:01 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6fce0406-1515-4cf8-afdf-24217148d1c8@leemhuis.info>
Date: Tue, 17 Feb 2026 09:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
Cc: Evans Jahja <evansjahja13@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, =?UTF-8?Q?Otto_Pfl=C3=BCger?=
 <otto.pflueger@abscue.de>, Denis Gessert <denisgessert@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
 <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com>
 <df6fcd73-fe0a-42fc-97ce-7e458c340553@leemhuis.info>
 <CAFLVeg-qeWu4ntgyqotsgjogPEyhqrMGG=UDWuZe+-D3K8YPTA@mail.gmail.com>
 <908f3c03-a8b0-4535-9cfa-294c6ade8152@collabora.com>
 <96e7f0fc-65f4-4613-b556-3a2d869dabb4@leemhuis.info>
 <86e2d0f9-5c25-4cce-b4a8-68fb569f987d@collabora.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Sasha Levin <sashal@kernel.org>
In-Reply-To: <86e2d0f9-5c25-4cce-b4a8-68fb569f987d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177131628267.3901032.8736787722890015484@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 771AE67559
X-NC-CID: P5UaJjDo5RUgOdWt7kmuYNYP5qwhRRqev6fiWP7bbNuOTjfyU6I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_001812_613936_5D60EA00 
X-CRM114-Status: GOOD (  15.87  )
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

On 2/16/26 11:46, AngeloGioacchino Del Regno wrote:
> Il 13/02/26 10:27, Thorsten Leemhuis ha scritto:
>> On 2/9/26 12:42, AngeloGioacchino Del Regno wrote:
>>> Il 06/02/26 17:58, Denis Gessert ha scritto:
>>>> Thanks for the quick response. I compiled 6.18.9 with this patch
>>>> (without reverting the previous commit) and it boots successfully.
>>> Happy to see further confirmation that the patch that we both
>>> mentioned is
>>> actually fixing the issue.
>> The big question remains: Now that this landed in mainline, should we as
>> the stable team to pick this up for 6.18.y and 6.19.y to get it resolved
>> there quickly? They might pick it up on their own due to the Fixes tag,
>> but that is not guaranteed.
> Yes, please, that'd be great.

Hi stable team! Could you please pick up be0b304eeb8c5f ("arm64: dts:
mediatek: mt8183: Add missing endpoint IDs to display graph") [merged
v6.19-post, committed by Angelo, who ACKed this request; see quote
above] for 6.18.y and 6.19.y? It fixes a regression in e72d63fa0563
("arm64: dts: mediatek: mt8183: Migrate to display controller OF
graph"). tia! Ciao, Thorsten

>>>> Am Fr., 6. Feb. 2026 um 15:55 Uhr schrieb Thorsten Leemhuis
>>>> <regressions@leemhuis.info>:
>>>>>
>>>>> On 2/6/26 12:33, Denis Gessert wrote:
>>>>>>
>>>>>> I found this email chain while troubleshooting why my Levovo Duet
>>>>>> (with the MT8183 chip) would not boot using any 6.18.* kernel.
>>>>>>
>>>>>> I can confirm that on my device the current stable 6.18.8 does not
>>>>>> boot unless I revert the commit
>>>>>>
>>>>>> commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
>>>>>> Author: AngeloGioacchino Del Regno
>>>>>> <angelogioacchino.delregno@collabora.com>
>>>>>> Date:   Thu Jul 24 10:39:08 2025 +0200
>>>>>>
>>>>>>       arm64: dts: mediatek: mt8183: Migrate to display controller OF
>>>>>> graph
>>>>>>
>>>>>> mentioned below. With the reverted commit the device boots as
>>>>>> intended.
>>>>>
>>>>> There is a fix for it from Otto here that I guess should help
>>>>> https://lore.kernel.org/lkml/20260106-mt8183-display-graph-v2-1-
>>>>> e7e56054eef5@abscue.de/
>>>>>
>>>>> Side note: lacks a stable tag and maybe should have been merged this
>>>>> cycle instead of the next. But given that 6.19 is immanent it might be
>>>>> good if this could be backported to 6.19.y once it landed in mainline.
>>>>>
>>>>>> PS: Apologies for the potential double-mail.
>>>>> No worries, happens.
>>>>>
>>>>> Ciao, Thortsten
>>>
>>>
>>>
>>
> 
> 
> 


