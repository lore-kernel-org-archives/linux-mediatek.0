Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D19606A88C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 14:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OKQ5LBlt;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=K1DONkXq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3HNDQJmc29jy0IK6/7l9qO0GFwyZeGN08+WQOfCbao4=; b=OKQ5LBltALieA3
	AQxhyqRrCkn4JhxlculDFMEzhOuRF17+AZAZOYu6WmFFUX5/sQhCqQ+Xf+w+iVD7bh3TYqrJBbYW0
	OP1Z3vFo21Jka3GyaDn449jWAwomez8BjXxfR7/sQz3DasA9sYwgRfjUAJNyBgwr1T+yX05rHYVOY
	dRNQWBXjyNAS0gIT04ts6VH4gXzgjAcOJNTUnAJ4FAu37DMBFydm2KlU8ibpEComDtNU88LFpHkTc
	d1jus9GJhlKprcMbYWxeBeb60bLRvIn88o/3PLL9eENFZt5vsxFJ/WRgZCSBUmaMc1x8jb7jRsSL1
	Z0tIyCaVwiG3AFHw2b/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKcr-00000006Egy-3WXt;
	Tue, 17 Nov 2026 14:57:37 +0000
Received: from mail-10629.protonmail.ch ([79.135.106.29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKcq-00000006Eg3-10b3
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 14:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794927453; x=1795186653;
	bh=3HNDQJmc29jy0IK6/7l9qO0GFwyZeGN08+WQOfCbao4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=K1DONkXqDBJE2jvxVX9QD2z5LQtCtJrMJAvtuQFlUBiPu+FdXNP8upOI1HB1LskS1
	 9M7l5Q1lOjn2QnW+I1hKW/g64/QBKGPmmnuuOq810fsiN979Wci/UYTlamuF4nlYnM
	 RICc8S5u+KdJTE17Qta3jefN0/pyQ7xVwpz4dFcSRkdIQkwGwIkGTd4vthlLAMrMLF
	 V94FcP5/jVcMjxKn+BHhQeCj+bGAGCZQ3cya1OeBZLEGxq/2lELps43ROF1yN9XfKm
	 HqKdVXxzC5BR25jfLrbgOqCSE/n/fD2KoKYddaZWOSM6JQdReVz5rl7P+xzkZBBKI3
	 Jw6hjLH2Tss8w==
Date: Tue, 17 Nov 2026 14:57:28 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Srinivas Kandagatla <srini@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v5 3/3] ARM: dts: mediatek: mt6323: add EFUSE support
Message-ID: <9o4MhYmOJZrc_PLX4fAynHoliyOLUUfB2X8kqS_FZFKiogtB45CEIgwF6MDJXEMr-jGh6fwofTSyymtxjuJOQcMQU3Zx7Lbu_OYTejzyVDs=@protonmail.com>
In-Reply-To: <3fa52671-642d-49cb-8323-8e9b4066a06d@collabora.com>
References: <20260921-mt6323-nvmem-v5-0-2f5d308369f0@protonmail.com> <20260921-mt6323-nvmem-v5-3-2f5d308369f0@protonmail.com> <hfElNICOLYWph6ayG04s_yQbkHLXmu6qzdWeR5ObRNxVsBtq86bjnERSJx427OwwrZYipLAOrUGBU8zvYtXEV1ixQ3YBzAZYQ3ypouA66T8=@protonmail.com> <3fa52671-642d-49cb-8323-8e9b4066a06d@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: bd764bf8d0257cbcd00e0a09e063d7cfc28c1ae8
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_065736_435160_1BAF80B2 
X-CRM114-Status: GOOD (  20.18  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tuesday, November 17th, 2026 at 4:50 PM, AngeloGioacchino Del Regno <ang=
elogioacchino.delregno@collabora.com> wrote:

> On 11/17/26 15:43, Roman Vivchar wrote:
> > Hi Angelo,
> >
> > Could you please take a look at this patch when you have some free time=
?
> > All other patches were applied by mfd and nvmem maintainers. This patch
> > will be required for enabling thermal on the mt6323 PMIC.
> >
> > Thanks,
> > Roman
>=20
>=20
> Hey,
> thanks for the ping - sometimes I just lose track of patches around - so =
don't
> worry and keep doing that.
>
> For this patch in particular, nice job about adding the efuse support, bu=
t now that
> you have it... well, adding the compatible to a devicetree alone makes it=
 probe, ok
> but then what?
>=20
> You're not using it for anything, right?
> So those 3 lines are "useless" on their own...!

We could say the same for auxadc I guess... There's no in-tree consumer
for it (yet).

>=20
> If you also add a user (someone reading an efuse from this controller) I'=
ll be
> truly happy to pick your additions ;-)

Do you suggest moving this patch to thermal series?

> This fuse array stores thermal calibration as far as I can see, so I gues=
s that the
> user will be the thermal node?

Yes, I have sent thermal patches some time ago, but I have to make a new
revision to address some feedback. I'll send it a bit later.

Best regards,
Roman

>=20
> Thanks again!
>=20
> Cheers,
> Angelo
>

