Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78880C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 14:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJ+fOQIrGekCJ5lRl+5S5lDZVX+lntQr7QmtEhxcmmw=; b=RgYKWOYY55Xkidzmj7u6DbNdu4
	/BzpWIl3I1X8F3U5pJQxJkYKYFMkkqbIN+6LLO8sL4tTjGBx+7UQjbseL7f9p35NAUZeFYpvnbdIz
	4CKuzwE8qySRiG/93vUKqAi76W2nwTQX6UT7+86qlgkMjKu5fFbA2Ek9gONqd9lnKiOsWWV5ya07c
	k0W5dRFkRGlhGmdYj3Jh10zjiGxgepBZsB+T3H+Qzta2MyT7NoaTAcA5XBM6qWj3FQMp9Xet2Gd1h
	QtSXrPa6oPSAB/PgBpaq7uIp/tCKfAViUq9nvTIFT3v6CLhO95deW05Cnk9gI5lQI7HYr1aMiwcvh
	n6VerFmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGRB-00Ba82-AQ; Tue, 12 Jul 2022 14:00:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGQz-00Ba3Q-Bo; Tue, 12 Jul 2022 14:00:19 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 13E0B66016F8;
	Tue, 12 Jul 2022 15:00:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657634415;
	bh=mbcA91S5p6wcOQpchlxMqQs99CbpqYRQB8T7w4Nci6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJoOAEjRo3DgflaYetEXXTahyQ9YbJxeMhcsLOru17+VQSWm9crnflya6zAuO169F
	 PNDsaEQuwqqiFB1VNtKUVJcj0YtMGihuCBjJI4vA9cMWj4XT94jEaQWzqUB3IiUidy
	 SIWEei97AJus7Ya3q2UC3HRAuFhK7iAImVhCf+C3+m9SHKJbiXTKuM5NvrXIc1bcTN
	 3jLhUWa6zb7yjqru4RzRLzkt1aWIhr3fE1cA/c5rjSpsF0tgwT/0cQYJFLL8m00bow
	 woUWTYKMRB/Ad+/KIX962tsD1G5jnbxDqG1VGF+E6g64HOPDRv4pLMimjAJlfdDAXT
	 VWZ/kAd0IUP2Q==
Date: Tue, 12 Jul 2022 10:00:10 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
	kernel@collabora.com, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Ikjoon Jang <ikjn@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Ran Jianping <ran.jianping@zte.com.cn>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: Don't check HW status for mt8192/5's
 imp_iic_wrap clocks
Message-ID: <20220712140010.nfxo42td3zzy3iqp@notapiano>
References: <20220711205733.203963-1-nfraprado@collabora.com>
 <CAGXv+5Enkz20o8BLXmnCUBmB930sH+20U=XvTWA82neaiqqc2A@mail.gmail.com>
 <473aa749-fcfe-bd38-0d83-95375aeef8a3@collabora.com>
 <CAGXv+5E+HVi2kxkRrwhWhq2XgbmfCxj+ZywPT4orBXTxtJ7X1Q@mail.gmail.com>
 <9102680e-2c4c-6c62-0255-5f3f669dd16c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9102680e-2c4c-6c62-0255-5f3f669dd16c@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_070017_649491_006FED47 
X-CRM114-Status: GOOD (  30.23  )
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

On Tue, Jul 12, 2022 at 12:57:47PM +0200, AngeloGioacchino Del Regno wrote:
> Il 12/07/22 12:56, Chen-Yu Tsai ha scritto:
> > On Tue, Jul 12, 2022 at 6:55 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > > 
> > > Il 12/07/22 12:44, Chen-Yu Tsai ha scritto:
> > > > Hi,
> > > > 
> > > > On Tue, Jul 12, 2022 at 4:57 AM Nícolas F. R. A. Prado
> > > > <nfraprado@collabora.com> wrote:
> > > > > 
> > > > > The imp_iic_wrap clocks on mt8192/mt8195 require that the i2c_sel parent
> > > > > clock be enabled before their hardware status can be checked. Since this
> > > > > wasn't taken into account, reading from the clk_summary debugfs file
> > > > > would cause the system to completely freeze.
> > > > > 
> > > > > Assuming that this clock is managed only by the kernel, and not by any
> > > > > firmware, simply drop the is_enabled() optional callback and instead
> > > > > rely on the enable count for the imp_iic_wrap clocks.
> > > > 
> > > > That's the wrong way to go about it.
> > > > 
> > > > The I2C clocks already have the CLK_OPS_PARENT_ENABLE flag set. So the
> > > > issue is that somewhere in the clk core, a piece of code is not honoring
> > > > that flag.
> > > > 
> > > > And it seems that's in more than one place.
> > > > 
> > > 
> > > Uhm, you're right. I gave my Tested-by, but not a Reviewed-by because I
> > > wasn't really convinced about this solution being the best.
> > > 
> > > Now that I think of it, the solution may be as simple as:
> > > 
> > > clk.c
> > > 
> > > static bool clk_core_is_enabled(struct clk_core *core)
> > > {
> > >          bool ret = false;
> > > 
> > >          /*
> > >           * If this clock needs parent enabled, but its parent is
> > >           * off, we directly return false for two reasons:
> > >           * 1. This clock being enabled would be impossible
> > >           * 2. The platform may crash for unclocked access while
> > >           *    reading the status of this clock (where a .is_enabled
> > >           *    callback is provided).
> > >           */
> > >          if (core->flags & CLK_OPS_PARENT_ENABLE &&
> > >              !clk_core_is_enabled(core->parent))
> > >                  return false;
> > > 
> > >          ... etc etc etc ...
> > > }
> > > 
> > > Nícolas, did you try this approach?

From reading the core clock code, it's mentioned that CLK_OPS_PARENT_ENABLE is
used "during gate/ungate, set rate and re-parent", there's no mention of
"checking the gate state", so I assumed this operation was intentionally not
handled by this flag. That's why I went for this solution.

But from the discussion sounds like the flag should indeed be caring about the
is_enabled() operation as well, so let's go with Chen-Yu's patch.

Thanks,
Nícolas

> > 
> > I have a patch ready, but I got distracted by other stuff today.
> > 
> 
> Let's just wait for your patch then, seems like being the most sensible option.
> 
> Cheers!

