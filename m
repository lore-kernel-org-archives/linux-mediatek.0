Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0ACCD5BD5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2026 05:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UPw/V+LAVSuor63USgPv09byyI8x96rZTzcQF3nCLY=; b=wZjly5qLOvx/jXQO86oATeRHCA
	sAp7Ee2e0WtHi5XDvh1nMoWO4HCKaW1OtImGyjn7YrUQjT9QVuqfdFxdLFNtizC48hvq9qxd3pC4I
	HT/MB5vb4PaD4Iy2w7+CA3Dgmqv0Ev9PocU0pwn6Bk6Qweo2ayW/px+bLwgTRjuzsbYcnmqPtYhCi
	OhngCK3AdDGgfNUCey8ybRaOpAcusGeyHJlCuurEG5PHSEIOEDYP5miJrcoxGNe1jkfqxsxP2CSSf
	KrJcXFg3Mp/KepVxLckPxS5tAERejJ3znLt7qCPXnblU52k58gJmrXyW53B6QroByLpbKI/ME5O2J
	zF+nCYoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTCd-000000058U0-0PiP;
	Thu, 28 May 2026 05:22:43 +0000
Received: from chamillionaire.breakpoint.cc ([91.216.245.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTCZ-000000058TZ-1g6G
	for linux-mediatek@lists.infradead.org;
	Thu, 28 May 2026 05:22:41 +0000
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 18FBB60503; Thu, 28 May 2026 07:22:35 +0200 (CEST)
Date: Thu, 28 May 2026 07:22:34 +0200
From: Florian Westphal <fw@strlen.de>
To: Adrian =?utf-8?B?QmVuyJtl?= <adibente@gmail.com>
Cc: pablo@netfilter.org, netfilter-devel@vger.kernel.org, phil@nwl.cc,
	nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
	andrew+netdev@lunn.ch, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, daniel@makrotopia.org,
	coreteam@netfilter.org, linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH net] netfilter: flowtable: fix offloaded ct timeout
 never being extended
Message-ID: <ahfRGvxRKoggA_26@strlen.de>
References: <20260526060138.3924-1-adibente@gmail.com>
 <ahaek23tB7D8tQUe@strlen.de>
 <CAC2HPwt_3D7k7tYr8OqNiguc-jMF3PEKtayFKmvOp37M2=QCZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAC2HPwt_3D7k7tYr8OqNiguc-jMF3PEKtayFKmvOp37M2=QCZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_222239_583797_D25CF96A 
X-CRM114-Status: UNSURE (   6.11  )
X-CRM114-Notice: Please train this message.
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

Adrian Ben=C8=9Be <adibente@gmail.com> wrote:
> adjustment: changed min_timeout from u32 to s32 so the
> "expires >=3D min_timeout" comparison has both operands signed.
> Compiles clean.
>=20
> Tested on MT7986 with the WED-offloaded flows that originally
> reproduced the 300s drop. The flows now stay up well past 300s with
> normal offloaded traffic, solution works fine.
>=20
> I'll send v2 with this diff and Suggested-by: you, unless you'd
> rather submit it yourself.

No, please go ahead.

