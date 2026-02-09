Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F77E81BA1
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Feb 2026 11:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONysd0XmPaCVxy1cOTkdRWd4Qhmxb142xQ4kKjK8kR8=; b=On07+J6squxtZqEs1l2ytVcavW
	5HQE246YhofqBc1aNB2UWgv7eseG1rYj6kpFWmuSHbmCC7vZruDaP+pVkAJtiyoLWoSBjyuHm4OCL
	F0cVoHqzpm9WRb6PXc6HG8K5Ec2U0rxpOBb2y30Uq5IA2dRFKJefj2CjD5JF4xIvXEWqQYur9iN4n
	HSeEvQX09nVsfKktaCuftk6bc/D+nYPedIPrTurRBSDseUZuEoVW3m3VOw39XBtQsRdQOmZpojjJP
	vjHmnOmpYWM4hX3e3D2cCOVPchocl+1XRdAFLYX8m2WGt87W/KihgdGIKfwUp+VEgyQFpYIeQw5D8
	rxb/Ix5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPed-0000000FJoS-1Q5W;
	Mon, 09 Feb 2026 11:42:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPeb-0000000FJo6-1mtT
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Feb 2026 11:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770637327;
	bh=UbLizSxhVVXAh/w7Ptx95cgdsgsfjuOy3Uoimq/uwnU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UJhaFLhY5cUPurgSiKNW+qV2sU1tqCeIBIPkRtaL8vF0snruWViLM+scsCLtPyu7P
	 jsywKHmvHokuyJrp0JcYTVJ1jmqaIGTp9uHBzWWVlV+H6wQtNIM35vT9+nEBqAXOWc
	 Tq4fHBjn9TjV+OF3uLFKxY/CtLI1iXEGVfEbrITZCSM2aAtAYZP/duPGrJFP+TytCb
	 OQk4ww2pkpMjvpVcV4UF0ocLBWSOrM0VrG0E6aQJcrrUyaGXnnYGhZTDFqB2d9bQiC
	 F9EQTYT2Vn2iLyIus99hnkPjpdnU3GFU1Z9oP4Ohd+Qa7XWZwuxNAFKDpQO9Uz6ixk
	 KnU1PqhXcHxPg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECBDD17E13D5;
	Mon,  9 Feb 2026 12:42:06 +0100 (CET)
Message-ID: <908f3c03-a8b0-4535-9cfa-294c6ade8152@collabora.com>
Date: Mon, 9 Feb 2026 12:42:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
To: Denis Gessert <denisgessert@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Evans Jahja <evansjahja13@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, =?UTF-8?Q?Otto_Pfl=C3=BCger?=
 <otto.pflueger@abscue.de>
References: <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
 <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com>
 <df6fcd73-fe0a-42fc-97ce-7e458c340553@leemhuis.info>
 <CAFLVeg-qeWu4ntgyqotsgjogPEyhqrMGG=UDWuZe+-D3K8YPTA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAFLVeg-qeWu4ntgyqotsgjogPEyhqrMGG=UDWuZe+-D3K8YPTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_034209_709218_27196818 
X-CRM114-Status: GOOD (  15.00  )
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

Il 06/02/26 17:58, Denis Gessert ha scritto:
> Thanks for the quick response. I compiled 6.18.9 with this patch
> (without reverting the previous commit) and it boots successfully.
> 
> Cheers,
> Denis
> 

Well, I missed all those replies to this thread, and sent a redundant reply
saying .. well, the same as Thorsten (hey, thanks for being faster than me!).


Happy to see further confirmation that the patch that we both mentioned is
actually fixing the issue.

Cheers!
Angelo

> Am Fr., 6. Feb. 2026 um 15:55 Uhr schrieb Thorsten Leemhuis
> <regressions@leemhuis.info>:
>>
>> On 2/6/26 12:33, Denis Gessert wrote:
>>>
>>> I found this email chain while troubleshooting why my Levovo Duet
>>> (with the MT8183 chip) would not boot using any 6.18.* kernel.
>>>
>>> I can confirm that on my device the current stable 6.18.8 does not
>>> boot unless I revert the commit
>>>
>>> commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
>>> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> Date:   Thu Jul 24 10:39:08 2025 +0200
>>>
>>>      arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
>>>
>>> mentioned below. With the reverted commit the device boots as intended.
>>
>> There is a fix for it from Otto here that I guess should help
>> https://lore.kernel.org/lkml/20260106-mt8183-display-graph-v2-1-e7e56054eef5@abscue.de/
>>
>> Side note: lacks a stable tag and maybe should have been merged this
>> cycle instead of the next. But given that 6.19 is immanent it might be
>> good if this could be backported to 6.19.y once it landed in mainline.
>>
>>> PS: Apologies for the potential double-mail.
>> No worries, happens.
>>
>> Ciao, Thortsten



