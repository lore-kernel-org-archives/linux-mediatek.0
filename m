Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6CAC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 07:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1218Q8hjcADaeitkBJ8qYgkPVJTD+QuHR2ne+rHmWHs=; b=IIZJ8ff6i2DQFFQXGmf07mKHDT
	AGwWH+cF668w/3+OfQc3Jf1gJtxeOZTDJwrsQNz4Dc70FGI0DXGsgFCdOd3HrKc3aIMxU0hoO8eAx
	CC6RCH/r71PaO9AzLD0p+WbrWoijc+gaLmC78JaixFNJrb5TwD0tLmu9PduoOJ+qYwNzwqre7MS2w
	EDaSPVNQ6lGGrorddYk9YV1VDnv/6y11PZuSvnSPH7adU1XNyxh7sGZDiB3dE4K7wKUFn3j663CjI
	Nw7g98eVqhDsFlLFlMRjf/hU8FN5M0JMMD84TWIhZC1g5RYlA+pltmDi9GlztAe/aIpXiUd5rltWo
	4q6tVyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okgh1-003fzt-Ic; Tue, 18 Oct 2022 07:07:15 +0000
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okggo-003fug-4v; Tue, 18 Oct 2022 07:07:03 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id 514442B067A5;
	Tue, 18 Oct 2022 03:06:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 18 Oct 2022 03:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1666076815; x=
	1666084015; bh=1218Q8hjcADaeitkBJ8qYgkPVJTD+QuHR2ne+rHmWHs=; b=W
	2e5lclZ/owkQ7qi7m8R+1jwwN+I8r2UBxPH5ix26g5O6MlAhPLVD48vnkG+zCG3a
	jH+goVwE65ty29gUdsdt7S5eGNphIA+iam2XVqp4eQF1QM9jxr4NtQPj5lmh6zKh
	REEKq49Jn9rgngzTw95OZgCrt3xhEVmOfHFuuSZ6MP1s6QqjUEqUMmGyUAgazghm
	xyUlLvl/O1zmHHMTRpuFmL0nzUEsFRtg70dUGPrbGuNn92cGW8m4pSvhhZ3GdXNB
	dOd5ji5FNslDEUOqoMSkLrAODL3Hl1TOUttps+9U8zh4G7mWlWdDonuO6YATVRuI
	Rp0jQcAT0v3YAQr6JG6FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666076815; x=
	1666084015; bh=1218Q8hjcADaeitkBJ8qYgkPVJTD+QuHR2ne+rHmWHs=; b=P
	aecRi+TYeNwR/aJhGVhKZPCjIyoAKZyYrOt0tbqgasVM34/2I9mV6AFjgOrIwRPj
	S2yaRSIhWZNaRYzPhOzJyFRm1lD+mdU+gHFKnpa9phBzGUmjM2A0J6IlAdoyx7GV
	b2mM68iYUe1lZceXF6aXO2KPd+JelO6GRYi6AMaGin2QxciCdw7jLi3T4ptVRFQi
	JoF1KAsvkvoE0pnaI83Xzl9teS3x+tMNHZSNKzroDA4FY/ImCZs3HI6XbrH/Uhyz
	zrUs0uax1ldsU4urwbCHGLuWrwgAWkzj9vZVcfd6KXi+5i5Vv5U6vohhnxiE4m6K
	R6b2VGiptoZHGOlknxbGw==
X-ME-Sender: <xms:j1BOY0DxVJYGUBCOE0xHbEk2IJa3420IDt9nHodS12WwGgEK5jQLYg>
    <xme:j1BOY2hU4IH-tbADU20zoo0df2NZVnEVq0gGYPPvFeteqkNBu-Kl8Xffswl3F-Lhv
    p8_MguTXIGs_bMGM50>
X-ME-Received: <xmr:j1BOY3m4mc_9X7W1nIf1IgthYp1Z7jk8s3t-tT9UR7mKytyiMqRaaZzrClLe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeltddguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgr
    gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
    frrghtthgvrhhnpeehjefffeeggfeiveejvdffgfdvgfehtdfgvdeujedvjefgffdvueet
    ieevudefvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
    thgvtghh
X-ME-Proxy: <xmx:j1BOY6ytn8Io7uaztRRmd7eAQTYLvNT71Z-xoHTiki_x_Kwq1E3tYQ>
    <xmx:j1BOY5Q-2dLqSnhCECSat6OAKIFLt2-7MCpPz2BW5KAl50QEMXPpjw>
    <xmx:j1BOY1Y5D370Daoca6PZS6-0UqSTRVXqNh5TweGOftnEIL7uSNCElg>
    <xmx:j1BOY6SxO4vIjvfMtU9LPGXRTnRzovI2VtfsOP5LpQRq_Ya1_ksI7n_xdWw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Oct 2022 03:06:54 -0400 (EDT)
Date: Tue, 18 Oct 2022 09:06:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mturquette@baylibre.com, matthias.bgg@gmail.com,
	chun-jie.chen@mediatek.com, miles.chen@mediatek.com,
	wenst@chromium.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: mediatek: clk-mux: Add .determine_rate() callback
Message-ID: <20221018070653.gsvnacqe7chvzux2@houat>
References: <20221011135548.318323-1-angelogioacchino.delregno@collabora.com>
 <20221012085555.3nls7ja56vlnaz2w@houat>
 <c4a1eb9f-016d-c184-e494-c869038b87ff@collabora.com>
 <20221012094004.jgiyvmbgomiyedik@houat>
 <6e76f90f-3b6a-330d-6902-b31bf3d33ad4@collabora.com>
 <20221012114813.6d6adro746w5bd7c@houat>
 <decfd5e5-a48b-b2d1-f21b-1a4d52e05538@collabora.com>
 <20221012135619.wxyzuqheolhypoec@houat>
 <20221014193652.0C745C433D6@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221014193652.0C745C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_000702_399476_85038BC4 
X-CRM114-Status: GOOD (  27.75  )
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

Hi Stephen,

On Fri, Oct 14, 2022 at 12:36:50PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-10-12 06:56:19)
> >=20
> > I think we need to address this in multiple ways:
> >=20
> > - If you have ftrace enabled on that platform, running with "tp_printk
> >   trace_event=3Dclk:*" in the kernel command line on a failing kernel w=
ould
> >   be great, so that we can figure out what is happening exactly.
> >=20
> > - We really need to merge your patch above as well;
> >=20
> > - And, if we can, we should forbid to register a mux without a
> >   determine_rate implementation. We have to take into account that some
> >   muxes are going to be RO and won't need a determine_rate
> >   implementation at all, but a clock with a set_parent and without a
> >   determine_rate seems like a weird combination.
> >=20
>=20
> So should I apply this patch now on clk-next? Given this regression I'm
> leaning towards not sending off the clk rate request this merge window
> and letting it bake another cycle.

I saw that you sent the PR, thanks

We spent some time with Angelo yesterday debugging this, and it's still
not clear to me what happens.

He provided a significant amount of traces, and we first checked that
the round_rate part of set_rate was returning something meaningful, and
it does. The rate is fine, the parent is too, everything's great.

Next we checked the decisions by clk_calc_new_rates, and it does return
the proper top clock, and its proper rate.

Finally, we hooked into clk_change_rate() to see what kind of decision
it was enforcing, and it seems to be ok as well. It doesn't change
parent, and it sets the proper rate, in both cases.

There's still one thing we haven't checked: one of the clock in the tree
(the parent of the one we want to change the rate on, and it has
SET_RATE_PARENT) has a notifier. As we've had a bug recently over this
I've not ruled out that this could be a similar bug.

I don't really think it is though, since the notifier callback doesn't
use the data provided by the framework:
https://elixir.bootlin.com/linux/v6.1-rc1/source/drivers/clk/mediatek/clk-m=
ux.c#L279

I've pushed a branch for Angelo to test, just to confirm.

So... yeah. I can't explain the regression at this point. Do you have an
idea?

The good news is, since you merged this patch the regression is
invisible now to that platform. We still could encounter it on another
platform, but maybe it will also have a more obvious setup to replicate?

Thanks!
Maxime

