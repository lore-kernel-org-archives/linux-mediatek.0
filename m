Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6154CA5FDD
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2026 17:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVpkGJ1xxwLinZ+PqsTSo9xnvUSVxp77MIy/WKYmLyE=; b=FsiYnQVlNyURxHv2LIiVuu51cp
	xNyWMsLOkq6Q7s5nQG+k/egqqDrJwSPG8qMB1JpNvt66U3rMCP/0AAuVHx6KdOSQ9udlFeS/63ciP
	ylLz24fCFqlSz5Sff3PcGcFSCIdYBmeTg+iRTNA5OFnmyl4dJG1r3hBQs9wbZoK5768OEOcle4KDR
	TYnyzW8AFBzrzNFNeggx2DVnNMnUJgvi603gKUH67jWG2zATjeiN1mgmt+R7AaWlKiiLNR3+h4PAH
	y9IBmuLCNz3LqYynS+iPSsguXvIVgUxCaO1syFu7TGBEi3myKqA73j5TIzVVlxCBD0GnAibK8RQCr
	hFNA6cLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCh76-0000000CAGZ-1fIM;
	Fri, 02 Oct 2026 17:32:04 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCh73-0000000CAFs-32XG
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Oct 2026 17:32:03 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id AA95B240027
	for <linux-mediatek@lists.infradead.org>; Fri,  2 Oct 2026 19:31:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1790962315;
	bh=RVpkGJ1xxwLinZ+PqsTSo9xnvUSVxp77MIy/WKYmLyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:Content-Type:
	 Content-Transfer-Encoding:From;
	b=Yo7jqArnMBYJ7KtXMfzz996WdcYsoeysPeJs8tspFWd7Z4QgtnmOB7rxTjNqZjWWW
	 +g5NMznaMNDRpI61BOkLXhCS4mXLcD1i75i1XU10oVxFmNmTOpnMwuy7Jx97vb+VIf
	 I/VQAcwL+OfQ2PH1TEA6UaDyVM7z0YRs8FGO/xtH7ERtkKqRo0C/o+y/GnezMrQA1U
	 LYnn++DCZVIszMjyMFPRo58YM452mGVo3jyg+HFHvNryKgWPHR3ricww/YFWC7zb96
	 BZ6chLTnujFB5cltQPqbshz9eChz+rfr16etpGjdKrphCYj38B1NmNJfEipn2u72uE
	 3ieS1gKBWUJng==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hxG6x74FMz6txy;
	Fri,  2 Oct 2026 19:31:53 +0200 (CEST)
Message-ID: <d10ae529-968e-4cf8-bf28-b704755f124f@posteo.de>
Date: Fri, 02 Oct 2026 17:31:55 +0000
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
X-CRM114-CacheID: sfid-20261002_103202_070592_41F84235 
X-CRM114-Status: GOOD (  22.67  )
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

Friendly ping on this one - any news on the mt7925 MLO stall?

No pressure, I know everyone's busy. My setup is still in place, so
I'm happy to build and test patches or collect further traces if
that would help. Nothing has changed here: still reproducible with
the 5 GHz + 6 GHz pair.

Thanks for all the help so far.
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

