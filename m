Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD0EE7BD8C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Feb 2026 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99nJyG38AdT6lfENG9BsH6/GyJNIEWjsDvdcblfA61g=; b=VeQ2KBHFtybQlcbFGdOgiLO2D2
	NQlg1KnTrdLJXf5y/XUIpSLYCavO6Hg2Yp7BhEoaXio0tz20oLxB8UkUKkksnXm54Y05iONOglT7w
	hskO+hfFi2NbKFKEHvMjqHnO1ZpporxQkjMJxhTNpa/0jIjVPR4n669FyMQOz4NP15J6TT3B3lpq+
	mgSAs8kPuYQQBR/O23ZnJQiYn+hg2eHrfKHK33c3ux0d00pgVwRAldbFUcpx/U9BpZfExamRB9lRv
	+e1d2dr/6dJoSzN37cyzJ9TM9zxODqMU2eCd12/HMyWP1FZsUrsh1k1PMjvo4uT7TTjX9JTeVVKrC
	95mXraXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrw8A-00000006NZK-0tnq;
	Mon, 16 Feb 2026 10:47:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrw87-00000006NYz-2axm
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Feb 2026 10:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771238820;
	bh=Zzin5ThTM9Imyf75zYHV+Tk+Fha+1QurOEuuq7ZkmWQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fT7TaQ0C/ikyDEBGY2C7G+7P/fo4AtNST7bMbWiKDKrmMe+1gy65BjnWZ54PG1+SE
	 qQDSOTWFjnImyYE30/10pcSWSECaBtFIDN0LThfDdpr7NZIokMjZMuyvPU8zmaaSNL
	 lbcY1b1SCUMDf7J2pbOWZM4w0D9pY6Hrmk51j5J0UwJMFJN6i9XBLi53U9hrav2InY
	 oNpaqeAVirbCTqX25CntkeQaRHqIQG9amW2BSA902jnQuRw/Mqf7F1w+KKplsPLVyx
	 rwimIZmdoETkP7/bYVZG8mWBi8h1UqreKXMrbdVpCXMjdU/bYVzkTaxSAGTdsVX6Gp
	 5MZMdzkuSwsqA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 973AF17E1523;
	Mon, 16 Feb 2026 11:47:00 +0100 (CET)
Message-ID: <86e2d0f9-5c25-4cce-b4a8-68fb569f987d@collabora.com>
Date: Mon, 16 Feb 2026 11:46:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Denis Gessert <denisgessert@gmail.com>
Cc: Evans Jahja <evansjahja13@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, =?UTF-8?Q?Otto_Pfl=C3=BCger?=
 <otto.pflueger@abscue.de>
References: <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
 <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com>
 <df6fcd73-fe0a-42fc-97ce-7e458c340553@leemhuis.info>
 <CAFLVeg-qeWu4ntgyqotsgjogPEyhqrMGG=UDWuZe+-D3K8YPTA@mail.gmail.com>
 <908f3c03-a8b0-4535-9cfa-294c6ade8152@collabora.com>
 <96e7f0fc-65f4-4613-b556-3a2d869dabb4@leemhuis.info>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <96e7f0fc-65f4-4613-b556-3a2d869dabb4@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_024703_879478_98A03859 
X-CRM114-Status: GOOD (  16.57  )
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

Il 13/02/26 10:27, Thorsten Leemhuis ha scritto:
> On 2/9/26 12:42, AngeloGioacchino Del Regno wrote:
>> Il 06/02/26 17:58, Denis Gessert ha scritto:
>>> Thanks for the quick response. I compiled 6.18.9 with this patch
>>> (without reverting the previous commit) and it boots successfully.
>>
>> Well, I missed all those replies to this thread, and sent a redundant reply
>> saying .. well, the same as Thorsten (hey, thanks for being faster than
>> me!).
> 
> Happens. :-D
> 
>> Happy to see further confirmation that the patch that we both mentioned is
>> actually fixing the issue.
> 
> The big question remains: Now that this landed in mainline, should we as
> the stable team to pick this up for 6.18.y and 6.19.y to get it resolved
> there quickly? They might pick it up on their own due to the Fixes tag,
> but that is not guaranteed.
> 

Yes, please, that'd be great.

Cheers,
Angelo

> Ciao, Thorsten
> 
>>> Am Fr., 6. Feb. 2026 um 15:55 Uhr schrieb Thorsten Leemhuis
>>> <regressions@leemhuis.info>:
>>>>
>>>> On 2/6/26 12:33, Denis Gessert wrote:
>>>>>
>>>>> I found this email chain while troubleshooting why my Levovo Duet
>>>>> (with the MT8183 chip) would not boot using any 6.18.* kernel.
>>>>>
>>>>> I can confirm that on my device the current stable 6.18.8 does not
>>>>> boot unless I revert the commit
>>>>>
>>>>> commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
>>>>> Author: AngeloGioacchino Del Regno
>>>>> <angelogioacchino.delregno@collabora.com>
>>>>> Date:   Thu Jul 24 10:39:08 2025 +0200
>>>>>
>>>>>       arm64: dts: mediatek: mt8183: Migrate to display controller OF
>>>>> graph
>>>>>
>>>>> mentioned below. With the reverted commit the device boots as intended.
>>>>
>>>> There is a fix for it from Otto here that I guess should help
>>>> https://lore.kernel.org/lkml/20260106-mt8183-display-graph-v2-1-
>>>> e7e56054eef5@abscue.de/
>>>>
>>>> Side note: lacks a stable tag and maybe should have been merged this
>>>> cycle instead of the next. But given that 6.19 is immanent it might be
>>>> good if this could be backported to 6.19.y once it landed in mainline.
>>>>
>>>>> PS: Apologies for the potential double-mail.
>>>> No worries, happens.
>>>>
>>>> Ciao, Thortsten
>>
>>
>>
> 



