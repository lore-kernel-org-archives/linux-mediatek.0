Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3132C2BA83
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 17:16:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5439206D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 17:16:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EQNerqAZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="hYIlU5K4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="w4dQ1bvk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5439206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e39Rq2hVVwwltJRQiajvNo9X7wxVwFDdbOKQhDZGXbs=; b=EQNerqAZO+vkF1hkt6vVBO0tn
	o8AZRJkl2uq5p7oB0AVN0Vh99VIM30Cr73reUn1TOWBZz0xgkcuAz6g0Eb+7105wZyph3X7sDKw3V
	/ejq2y5zq61m+1T3GLbu1TuYodxkVkGVHl8Q+FzWY5A9k9e0TZVxZ/u99QgqaptLcUfeYJthMBTgI
	+V7HVPmLnzzOQJ5pQP5GSwYdJVEG30xqBqkXuPshMWaQXvvKmNPQr9/bOJfiTjzZ/ap4zjkP38sRW
	EA4IRPu7uBIozeh47YZej1eaJSpyGYN5EfiRfUFUm15/cUdfjKPJU3LQhP/4AcnH6jkvi+V9X6j7V
	+VRhIAXQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1vcU-0005bm-6n; Wed, 12 Feb 2020 17:16:14 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1vcK-0005TW-FN; Wed, 12 Feb 2020 17:16:06 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 373D77B86;
 Wed, 12 Feb 2020 12:16:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 12 Feb 2020 12:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=VlwaHrYSMc5EXnk7OL7eHGgUQRx
 9+OHs9o+E4xgjGdg=; b=hYIlU5K4+ezqu7KluFhemjtph9JOs+x11ZR5fXOy0zW
 kq/xY2VBXMX3S4I+qE0fXsNQrIpAu1cOYcCm3t8I7qrLhalik1b9oKjJ6EpT3xov
 8/7iBexBt2i/aydlwFqSh7oiHChvKi7SmJgmv90dFD34oNSOn0rsoXCnBuMqM7yR
 Cvezfcu9kB8wMPSNrvROYswP/61c9xMg7YB6oy4//k+dJpbpOn6c/Hgur+bpWKUP
 YCBd8U0nJALJojMf3cmeM/FvSLXOVGQlT2fyX5sD+JkzDWq1T5RZFpkbkbKnZeOD
 kL6lvzEVR4hoGq+TKBaaj1KbGl92MREUNKjuh9PHDhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VlwaHr
 YSMc5EXnk7OL7eHGgUQRx9+OHs9o+E4xgjGdg=; b=w4dQ1bvkrRBqTnYkwbOESa
 5Q3Itg4wv4HIEiNLypSnDC9vw5/Or1wnm27ZHa0Jr07PMBZbC9m1j6uzxzOTKXSJ
 MCaUi6CraFraYKsy1+6UaL0U+TvGNbGP4Tow0w0sv0PgDTtOh11DnDH5SFwtDa6o
 cn5rIM8lBSJtiXlmSoA5cAMwO80n/B6bJot2/TZbCY1APr7hVCQArIRSoXO7+36D
 b6Y6ECkYlbluMSOSIO2Nt9q0fI3wjA0s5+jQp4bKwqf27YkSzX37011B/1rMr4gl
 A3/dzay78+4zK6xw0YFq+CKh9PfsPFowEwA9x1Y8rtFoOv6V4DqJOLV/FuRhf6fQ
 ==
X-ME-Sender: <xms:zTJEXk6EtNTrdAC_6kwRCIcAhu0CuZLe0RUaLqvKA621vAbYoSUG8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieehgddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zTJEXqNUOvm3UA2ubbpF_Mn1RE9LyA6nP91YSYaPQpIRo0jz9JXPAg>
 <xmx:zTJEXikuucGRdFkbOzYAUFF2EO1s2d_p6nErMSPNQqNkd383GH6-yQ>
 <xmx:zTJEXhR176hzeg3xaL_go2tR1R3dCGONt-5Kwg8QurmJNHuhng5LTw>
 <xmx:0DJEXlEm2yYxWz6W9MxkKZt8pA49S7ySE_nGRRDsAF5U_RUkpLBazg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5A7833060717;
 Wed, 12 Feb 2020 12:15:57 -0500 (EST)
Date: Wed, 12 Feb 2020 18:15:55 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 6/7] ARM: sunxi: Replace <linux/clk-provider.h> by
 <linux/of_clk.h>
Message-ID: <20200212171555.rhglnhhfxljd2ktb@gilmour.lan>
References: <20200212100830.446-1-geert+renesas@glider.be>
 <20200212100830.446-7-geert+renesas@glider.be>
 <158152739647.121156.16877229572128607400@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
In-Reply-To: <158152739647.121156.16877229572128607400@swboyd.mtv.corp.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_091604_862604_566A826B 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>, Chen-Yu Tsai <wens@csie.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4713452539469166930=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4713452539469166930==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ww2rdwwsu4sgynif"
Content-Disposition: inline


--ww2rdwwsu4sgynif
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2020 at 09:09:56AM -0800, Stephen Boyd wrote:
> Quoting Geert Uytterhoeven (2020-02-12 02:08:29)
> > The Allwinner platform code is not a clock provider, and just needs to
> > call of_clk_init().
> >
> > Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Applied, thanks!
Maxime

--ww2rdwwsu4sgynif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkQyywAKCRDj7w1vZxhR
xVAyAP44cXhjx/0CW1CFNAKxhdKU4gzpGWXvxPJibw12XvM6WQD/a/OTdlgu8Ofs
1nDzz3yzF/+ciyJSn/Q0Gv9vy5DD3Qs=
=bEj4
-----END PGP SIGNATURE-----

--ww2rdwwsu4sgynif--


--===============4713452539469166930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4713452539469166930==--

