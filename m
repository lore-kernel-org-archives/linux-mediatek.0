Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C431CC61DCB
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2026 22:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEeHLrnYsBvpTM/fHeB1jhya7c/n4Di8M999P+UK9gI=; b=j098H2pBpu1Ws23YE/SShnaJiJ
	WNHt3uRnD60zsg6/VrwtLez+FNaSqtjoUcUFEjj2D7rMnCWl/rehzVSkbEC+IUZKWVUZfFPUdbCPH
	ljupSbTIsSIBpn+IOIrOn/4vXw6xGoEwxbjTCfiifNojNZL364zhji38Eh/2+AD2V3DkzFWxr7tcp
	UECKs5szaTJ3v0Cp6omUlx0YGqST79CZKlSmrFQYpsC5mcSx7/UysiYfmraUObXJlOHugRyD+AQNl
	e94i5PoXIU/w3Bm/1K4sOJ18QAvZBX/aVNQGXeAkqOWSzuzngOAMF7TFICrHZZ8R+otIh6XjuM50n
	H9J4Y2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0RIz-00000007MHu-0mbX;
	Sat, 29 Aug 2026 22:13:41 +0000
Received: from out-128.mta0.migadu.com ([2001:41d0:1004:224b::80] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0RIv-00000007MGv-1LDn
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Aug 2026 22:13:38 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=cmGv3INF7CjXFYHoCdz/i7fRZHrlOBuYR43kDH8a1kM=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788041613; v=1; x=1788646413;
 b=K1s0SziR/lV8TeafvK+KC9JEMw0D58FgJB2qxHlWPkwCL3ypPjU09qq/NvPQkwIguJ3zXgA5
 nz6qPh4bl84vNOClV/KzXL5W8MjqyTwbSWUOekVPTrbyW0NNbfFK+0pq9vNmhZ7jkYw/UNHoZYy
 U4DkNH9wdY3foe4pj/1lfDtNBtLe/+pgKj5ZL/Vlc53cTX+Gt+N0/vGMEPDuYi5p3uWFWIzmNyU
 1UE5D25GHIr7zUd6WN3M5rCZYUaPF301Pm672ssxw9xSeyrRmEqbfqzQagjjypRhSFLCitt9bS3
 k1PIRrlrOdi71DDaHcaplmONJh+8RpDSNtDkY5egZg6FA==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2d95993bb1fe720b;
	Sat, 29 Aug 2026 22:13:22 +0000
X-Mizu-Trace-ID: 2d95993bb1fe720b
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Jonas Hort <jonas.hort@posteo.de>,
	Sean Wang <sean.wang@kernel.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	lorenzo.bianconi83@gmail.com,
	regressions@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [REGRESSION] mt7925: MLO connectivity silently stalls with 6GHz link active
Date: Sat, 29 Aug 2026 15:13:19 -0700
Message-ID: <20260829221319.25334-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c9f984c4-e3c4-4e41-a502-99db97ce724b@posteo.de>
References: <503eb10e-80cf-493e-95fd-04fc0f94ce01@posteo.de> <e4bc5ce3-9a6f-4365-9d36-f6440ded0865@posteo.de> <c64f5fa6-4c61-45b6-a513-b971e59d7723@posteo.de> <476e7721-580e-4a6b-86e5-5ed782a2c7ec@leemhuis.info> <c9f984c4-e3c4-4e41-a502-99db97ce724b@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_151337_763840_77B9F55A 
X-CRM114-Status: GOOD (  11.44  )
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

On Mon, 2026-08-24 at 08:18 +0000, Jonas Hort wrote:
> Setup is still up and I can build and test whatever is useful.

Your bisect holds here, on a different machine and a different access
point, running your June firmware. Three states, each replicated:

  both commits reverted        clean, two runs of six minutes
  only the later one reverted  stalls, two runs
  neither reverted             stalls, three runs

Tail welded and head climbing, which is your signature. The tree is
7.2-rc5 with one unrelated ACPI patch of mine, nowhere near this path.

db134691924f lands fifteen commits after ff643b81bc38, and reverting it
alone still stalls, so the builder rewrite is the one that matters.
Reverting the builder on its own is not available either: v7.0's version
dereferences a link pointer that the later commit leaves unpublished
until after the firmware call, so it would need a check neither version
has.

A correction to my last message. I pointed you at the link count, since
the new code reports one link whenever the update concerns the primary.
That undercount is real but it's not the cause. Telling firmware one
link always is clean over two six-minute runs. Skipping the
undercounting update entirely, so firmware is never told anything wrong,
stalls on both runs. Writing the entries in v7.0's order stalls on all
three.

On the August firmware, stock still stalls, twice, the detector firing
95 and 141 seconds into the run.

The band pair matters. Same driver, same August firmware, two runs each:

  5 GHz + 6 GHz     stalls
  2.4 GHz + 5 GHz   clean, full duration
  2.4 GHz + 6 GHz   clean, full duration

Not the channel width. Narrowing the 5 GHz link to 40 MHz, so that pair
carries the same narrow-plus-wide mix as the clean ones, still stalls on
both runs.

The sharpest pair there is the two runs where the iperf3 stream never
established, leaving only the UDP pressure: 5 plus 6 stalled with the
queue peaking at 187, and 2.4 plus 6 stayed clean at 186. The other
three clean runs peaked above 1000.

Sean, the two things I can't see from out here: what firmware does with
a multi-link record naming one link while a second is associated, and
why 5 plus 6 should differ from 2.4 plus 6.

Jonas, thank you for the bisect. Five steps, every bad verdict confirmed
on the queue signature.

Devin

