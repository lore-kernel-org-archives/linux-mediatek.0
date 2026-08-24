Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DC8C5DF94
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 13:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5uoZNVB2XRKnrTBdvCmJrG8M4XSoSEJo8KaXU4b4e8=; b=AU8ANJCXDyA1NFKKgzsPNV//qs
	oXf98ftNBv+ObMahd9dgEbgxVR4TQnq9k2tc2MC7XB4I6lNFmSjWK/X/9meIwj2kwdX6QBUYqEoXR
	QpXX9LgLY493H+EiZJaPQKf0NwVNIWO9id4a4dZKzZuipbFNRXW2w9Kss867g5N5HuMT3pgz6rZuc
	K5SNJ2yTvJTne101Z93ZFiqMUcW+e0ZTDTg4M7bfTJp+oG/0Dc12fPqj2EU/BbGTOQQQgwsRYd1Vx
	L8iHEVFe4QNg0YtmRrqOy0L5ATKbgdoHbHCDvwB7yjrvEhRX/F2MzlreP2XLkYlqlhcWgMf2ct9wq
	83CHVFKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUXl-0000000GgOa-0WaV;
	Mon, 24 Aug 2026 13:16:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUXg-0000000GgNB-1ZpM
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 13:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787577405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a5uoZNVB2XRKnrTBdvCmJrG8M4XSoSEJo8KaXU4b4e8=;
	b=Yt2qQfWIpvra9OdM7gDDW3etGkeqEgtGb6YiRhLqOsf27nRSbUrfF6mJUa9/Jm+7hF0CA/
	Mx8vJ2x8NHR5UEZyHU7Vb93UVBj1V7Vc044wIY3ZzE4iU3tOMCgUkrmIkMJmcq9QXh6KEn
	2GLT1s9ZGLJB0PuCtZAiwbj0g++2RoA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-ThD969rSOSi14fZt3WGQRQ-1; Mon, 24 Aug 2026 09:16:43 -0400
X-MC-Unique: ThD969rSOSi14fZt3WGQRQ-1
X-Mimecast-MFC-AGG-ID: ThD969rSOSi14fZt3WGQRQ_1787577403
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836cfd56077so51610957b3.1
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 06:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787577403; x=1788182203;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5uoZNVB2XRKnrTBdvCmJrG8M4XSoSEJo8KaXU4b4e8=;
        b=AIvJ6Tsyjmdr8BGsKc8F1pOQEyLsI3X6yV6ci0q/oP+VdHJWJ3D0UoEuCx/4UNTJaJ
         2iOKC1O6Trwh77ErgtfBi68owkcHzkMfWeLc4xRmW0GnpxGTwdmJ1S6+jjRYxYdhmlxP
         9MCK4q5F6x97NT7jXlWzxpX2tB63TmRIPbuMr+W47RP385Ai59x+BQL3OXZCAEK2k4hw
         Xr8NejQE045iaoaXrc4uDbIKd5K3Key+xZveuzk2GkvmSLPQWeqk4RZT7LHMOz9vOmni
         aBgAq/0HPV9FulBUyWrNAvMo2Kp0iNxr1UsyDS0ZmukfjmvJx5hebis040kNix1lv0Lp
         LRjw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2UiyB8ftUi3mWXtKWTvYqd3p3CUj4PlNbU8bA+4S729Ws9SrIYnu5dzxjmWLYIUiEydMGRHM6H094cXPwPg==@lists.infradead.org
X-Gm-Message-State: AFuF++nQPmBxyT982+uyuebDO+/4T+UYRnGIwFo7NNYQyoPzm8/IqGQg
	nnffRkjLM8tkwwN21lJRBjb2OzfATawS4eOo1gaLP4eBSxaPNRF8D9bkrbjzk81QJ9aujlc5K0r
	ZPuzpCUVcLaMWgbX2JHn/tsaX3DJAXVI5ItxPMCbX8cjPmGkkO5hrwwaZpqN0kQ8j2rlQXV/vgQ
	==
X-Gm-Gg: AR+sD101u+8tKmtN6ONRjZAGOqdsF20fGpV+kl4F2NHPFGu/3RDm+jJzGBZJAAAjds+
	AnatAIurU8uzyhDIV/hZnF3bwHfZ5jrBqZObf2/CKLHMaHOP2YGqMwS4rOfi8QwJ5igyo8SNaz/
	e2fD8k6Bq5pAeOshG4r5CaZ63yhUXs60MHbY54OpgC6HLN5NFdW2mr+EjA1DYtV0lQlmjPKUlj/
	uubTWDdVs+8KZmZxDJhlhj/OKaZ6MYJfgOP/6VaylVBejKrF5S2NIU//IodMWuI9p3p9qTxD6Mv
	9cgp4GX92hI8N8Ql2QGWkf9qdMUmOnKixsPvqHQT9sDqc0IIlEDYWygoBTOeEZPiqwCeIYVkpky
	HwgbCHNr5/h2qQZYCi+LMpJztMo29DsTAMIg=
X-Received: by 2002:a05:690c:e0c1:10b0:81e:a4cf:131b with SMTP id 00721157ae682-849f4a7cc91mr76172907b3.22.1787577403099;
        Mon, 24 Aug 2026 06:16:43 -0700 (PDT)
X-Received: by 2002:a05:690c:e0c1:10b0:81e:a4cf:131b with SMTP id 00721157ae682-849f4a7cc91mr76172227b3.22.1787577402495;
        Mon, 24 Aug 2026 06:16:42 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84ca5d254adsm33243617b3.16.2026.08.24.06.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:16:41 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:16:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 29/45] clk: samsung: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxEMm6FGf_onEBf@redhat.com>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <87b3e83137e1a987f3c69d214706e93ef3898cab.1787239813.git.geert+renesas@glider.be>
 <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
MIME-Version: 1.0
In-Reply-To: <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mJTpdU06vXlYfmzZM6S2kVRV9lIKXBtXljjTc7PIQsQ_1787577403
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_061650_180833_4353927A 
X-CRM114-Status: GOOD (  20.85  )
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

Hi Krzysztof,

On Fri, Aug 21, 2026 at 01:04:01PM +0200, Krzysztof Kozlowski wrote:
> On 21/08/2026 10:53, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> > 
> > Make sure all members are fully initialized, to avoid such bugs, and to
> > prevent future breakage when converting drivers to a different method
> > for specifying the parents.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Compile-tested only.
> > ---
> >  drivers/clk/samsung/clk-cpu.c | 2 +-
> >  drivers/clk/samsung/clk-pll.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Let me know if I should take it via Samsung SoC clock tree. I assume by
> default this will go directly via clock tree.

Please take it through your Samsung tree to avoid merge conflicts if
there are other changes to these files during this development cycle.

Brian


