Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9E1C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqnvu8e5BxdxEQxTzumthghfrEuZ7r4SRpLOXCrpQuo=; b=eOZ6S429j7zltIXJ9U2Mrwo06q
	13Kk0PKoNu89j5/KvBQk+3V05ll1vEXuDRCMMC62wQDOXhqo0qxFirhuGtvv5ys/XWmnuLK6YAdtP
	NWMdVq4YL7MJMV1Dbi4v4944lmuy3HWZOvOjI4lKxg80HZUNOewZm43wc7TFP2d541KsKvVG6X5yY
	QE4n0mgNNYftAgAtjWN9qqTElDuvx1bAJ3LQ/l9D/rjj3EFOPqzamRGboz3a4pKEnKNAOO1sJeRaI
	5iFMBAcYnAQ/VBH8gVe2jrp66UyhfIT7KcuXhmcLtewh4ltCpNgZde3w37KXZ8zBo7pdHUgqjD4Mf
	Y7CfGfxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9NR-00Ep0C-2b;
	Mon, 18 Sep 2023 08:13:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9NN-00EoxL-30;
	Mon, 18 Sep 2023 08:13:03 +0000
X-UUID: 2b760ce855fb11ee86758d4a7c00f3a0-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kqnvu8e5BxdxEQxTzumthghfrEuZ7r4SRpLOXCrpQuo=;
	b=afTrg5B8iZFmMfi+TL9Chc4sBpKokhlcMESjDopFTRL3jur8nGfpd9c9J98vFp2z1ef+1mCNvnkNkMhmeu41xqGoLXFinfKyoBXRVgvRp9dlMuo4ymrmN4vPekM4ywU8iIw9M+4uW3YUvN7eybpr+bTyvuhGXe8nq7NMcMaC29w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:cfe193b3-374b-4b2c-a900-378ce0aaf95a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:3938f6be-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:817|102,TC:nil,Content:0|-5,EDM:-3,I
	P:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2b760ce855fb11ee86758d4a7c00f3a0-20230918
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1787645198; Mon, 18 Sep 2023 01:12:54 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 16:12:51 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 16:12:51 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <jannh@google.com>
CC: <akpm@linux-foundation.org>, <andreyknvl@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <dvyukov@google.com>,
	<glider@google.com>, <haibo.li@mediatek.com>, <kasan-dev@googlegroups.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-mm@kvack.org>,
	<mark.rutland@arm.com>, <matthias.bgg@gmail.com>, <ryabinin.a.a@gmail.com>,
	<vincenzo.frascino@arm.com>, <xiaoming.yu@mediatek.com>
Subject: Re: [PATCH] kasan:fix access invalid shadow address when input is illegal
Date: Mon, 18 Sep 2023 16:12:50 +0800
Message-ID: <20230918081250.143237-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <CAG48ez3GSubTFA8+hw=YDZoVHC79JVwNi+xFTQt9ssy_+O1aaw@mail.gmail.com>
References: <CAG48ez3GSubTFA8+hw=YDZoVHC79JVwNi+xFTQt9ssy_+O1aaw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.802200-8.000000
X-TMASE-MatchedRID: HXSqh3WYKfs4HKI/yaqRmya1MaKuob8PfjJOgArMOCZb6PBUqmq+Uq7d
	jM7nXzpjKDVpUrn+OoQmNpzri1sed7Ud2R7XKvn3dAg4yd14qARUXmZR3qwgxiS30GKAkBxWqjK
	1cw/inhPUdOHHz4uZ2bNVqZo4wx+HlOGdJawUY9voGS5BmR0KUThaxI2If9ReK7S6qybDnxlvKp
	xZPgVlFySl042qLBGShRAr0eCrd7QLd3u89FoqUbiMC5wdwKqdvtVce6w5+K/US7RV+C9GRaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrZRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.802200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 526554D9131F0E7FF150090659C59FFAFE008B7EB75342DF66FB39481924F4332000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_011301_977914_1FC93322 
X-CRM114-Status: GOOD (  21.46  )
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

> On Fri, Sep 15, 2023 at 6:51 PM Andrey Konovalov <andreyknvl@gmail.com> wrote:
> > On Fri, Sep 15, 2023 at 4:46 AM 'Haibo Li' via kasan-dev
> > <kasan-dev@googlegroups.com> wrote:
> > >
> > > The patch checks each shadow address,so it introduces extra overhead.
> >
> > Ack. Could still be fine, depends on the overhead.
> >
> > But if the message printed by kasan_non_canonical_hook is good enough
> > for your use case, I would rather stick to that.
If we check shadow address before invalid access,
we get below message before oops:
"
BUG: KASAN: invalid-access in do_ib_ob+0xf4/0x110
Read of size 8 at addr caffff80aaaaaaaa by task sh/100
"

We get below message while using kasan_non_canonical_hook:
"
Unable to handle kernel paging request at virtual address ffffff80aaaaaaaa
KASAN: maybe wild-memory-access in range [0xfffffc0aaaaaaaa0-0xfffffc0aaaaaaaaf]
"

Both indicate the original accessed address which causes oops.

> >
> > > Now kasan_non_canonical_hook only works for CONFIG_KASAN_INLINE.
> > >
> > > And CONFIG_KASAN_OUTLINE is set in my case.
> > >
> > > Is it possible to make kasan_non_canonical_hook works for both
> > > INLINE and OUTLINE by simply remove the "#ifdef CONFIG_KASAN_INLINE"?
> >
> > Yes, it should just work if you remove the ifdefs in mm/kasan/report.c
> > and in include/linux/kasan.h.
> >
> > Jann, do you have any objections to enabling kasan_non_canonical_hook
> > for the outline mode too?
>
> No objections from me.

Thanks.
Shall I send a new patch to fix this problem by using kasan_non_canonical_hook


