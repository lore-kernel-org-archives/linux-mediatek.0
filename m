Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A17BCA5FD4
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2026 18:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQXYj5vzNTW49jPfnwyMevRJEY7OOX+I2jx8ra6cAeU=; b=njELIZUTpMvn+J2VnWBPcfN4Ft
	WMwThZWSNuq3K/LD4btMJWvxdCrekDNFRPJVPMVQIWwkzbGRjJI9Fa2HnWZfCAmw3IUq6dv3PeMC9
	XVgryTaU1osRDlz1j7XcRjYFVsJ8Nv8A4QMtfs9f9cP7P2eLntZsqqvREmu53blWiXPsHExoKjX4V
	7tz8HdwyGZK1iLat5XUGmxrbxKxVdgiOb7P71tCyPBdHKFI+dGdGwC8w3tViJnWj7sErAK+5RXIsA
	tjWnbxgLSa/5vBhkpFEVk/S9WequTdNPSxl2/6pj/LZIOehNtCydVeyQZ5raq5dPghNH5SweEm7+r
	xd3j4flg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChiy-0000000CFlQ-3B2S;
	Fri, 02 Oct 2026 18:11:12 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChis-0000000CFkO-0srZ
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Oct 2026 18:11:10 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 86713240105
	for <linux-mediatek@lists.infradead.org>; Fri,  2 Oct 2026 20:11:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1790964662;
	bh=FQXYj5vzNTW49jPfnwyMevRJEY7OOX+I2jx8ra6cAeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:Content-Type:
	 Content-Transfer-Encoding:From;
	b=BEvsMMIh+99TUyEf90jTp5qFk31b+Hh1i1Di8InZzWayemsQDtK+SW5Qh2LFJilIX
	 OgysMd2B5H7G4G61tzHK94lM6gehdpPbfyiPNcUDmGlqizEIqU19vRpPuTA+6otyvm
	 b1TYcD4tczEe8vDJRRGs4PAKyI/zEAouIMedSVU+hQn+Cqx7Cjxgh9QXAiUPCHUPoA
	 fzsdXOXzmkDOmx6IloO+LQSujUajnBvSMNmkkgG42FVEkeLTcBfdR9ZDVZn+I29GEg
	 NAi2a4GZlgF+/S1+u3EgNs8SP0CmKhcoGSrcwu3Y8i/mVW1D9yArlS0cEZMWS66Z1A
	 3bXoledpY3UCg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hxH043lzRz6v1h;
	Fri,  2 Oct 2026 20:11:00 +0200 (CEST)
Message-ID: <d245c4b1-dfba-4507-85a2-c6883f5eae64@posteo.de>
Date: Fri, 02 Oct 2026 18:11:01 +0000
MIME-Version: 1.0
Subject: Re: [REGRESSION] mt7925: MLO connectivity silently stalls with 6GHz
 link active
To: Devin Wittmayer <lucid_duck@justthetip.ca>,
 Sean Wang <sean.wang@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Sean Wang <sean.wang@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 lorenzo.bianconi83@gmail.com, regressions@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <503eb10e-80cf-493e-95fd-04fc0f94ce01@posteo.de>
 <e4bc5ce3-9a6f-4365-9d36-f6440ded0865@posteo.de>
 <c64f5fa6-4c61-45b6-a513-b971e59d7723@posteo.de>
 <476e7721-580e-4a6b-86e5-5ed782a2c7ec@leemhuis.info>
 <c9f984c4-e3c4-4e41-a502-99db97ce724b@posteo.de>
 <20260829221319.25334-1-lucid_duck@justthetip.ca>
Content-Language: en-US, de-DE
From: Jonas Hort <jonas.hort@posteo.de>
In-Reply-To: <20260829221319.25334-1-lucid_duck@justthetip.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_111107_915397_8E31678D 
X-CRM114-Status: GOOD (  22.06  )
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

Hi all,

I just came across this patch from Andrei Rusu de Castro, posted on
2026-09-02 with "Fixes: ff643b81bc38" (the commit I bisected to):

Patch wifi: mt76: mt7925: stabilize STA_REC_MLD link selection
https://ratatoskr.run/linux-wireless/2026/09/17497919

Could this be the fix for this regression? Devin, you mentioned the
link count undercount is real but likely not the root cause - does
this patch change that assessment?

I'm happy to test it on my hardware if that helps.

Thanks,
Jonas

Am 30.08.26 um 00:13 schrieb Devin Wittmayer:
> On Mon, 2026-08-24 at 08:18 +0000, Jonas Hort wrote:
>> Setup is still up and I can build and test whatever is useful.
> Your bisect holds here, on a different machine and a different access
> point, running your June firmware. Three states, each replicated:
>
>    both commits reverted        clean, two runs of six minutes
>    only the later one reverted  stalls, two runs
>    neither reverted             stalls, three runs
>
> Tail welded and head climbing, which is your signature. The tree is
> 7.2-rc5 with one unrelated ACPI patch of mine, nowhere near this path.
>
> db134691924f lands fifteen commits after ff643b81bc38, and reverting it
> alone still stalls, so the builder rewrite is the one that matters.
> Reverting the builder on its own is not available either: v7.0's version
> dereferences a link pointer that the later commit leaves unpublished
> until after the firmware call, so it would need a check neither version
> has.
>
> A correction to my last message. I pointed you at the link count, since
> the new code reports one link whenever the update concerns the primary.
> That undercount is real but it's not the cause. Telling firmware one
> link always is clean over two six-minute runs. Skipping the
> undercounting update entirely, so firmware is never told anything wrong,
> stalls on both runs. Writing the entries in v7.0's order stalls on all
> three.
>
> On the August firmware, stock still stalls, twice, the detector firing
> 95 and 141 seconds into the run.
>
> The band pair matters. Same driver, same August firmware, two runs each:
>
>    5 GHz + 6 GHz     stalls
>    2.4 GHz + 5 GHz   clean, full duration
>    2.4 GHz + 6 GHz   clean, full duration
>
> Not the channel width. Narrowing the 5 GHz link to 40 MHz, so that pair
> carries the same narrow-plus-wide mix as the clean ones, still stalls on
> both runs.
>
> The sharpest pair there is the two runs where the iperf3 stream never
> established, leaving only the UDP pressure: 5 plus 6 stalled with the
> queue peaking at 187, and 2.4 plus 6 stayed clean at 186. The other
> three clean runs peaked above 1000.
>
> Sean, the two things I can't see from out here: what firmware does with
> a multi-link record naming one link while a second is associated, and
> why 5 plus 6 should differ from 2.4 plus 6.
>
> Jonas, thank you for the bisect. Five steps, every bad verdict confirmed
> on the queue signature.
>
> Devin

