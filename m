Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF71CA0EC4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPMcKR4Oi745bR8iqUsDP5qg1uYaCMtbYLompUhICNQ=; b=DFpGRPcx7nYkX2WBm2ko2kXyKI
	B91yfrJ1rCVK76Fa1bykgIhxspw8W6YVmNpmbKPuVr77qv3iFbIQMpC7XlwDIkk4H9HoGnhDRf6Oc
	53+9K++6kXIPV4iqv6omxF1geNOZ+7EvlbLutvXMK8WT633lNXZKUYNtAIUs0MxakTjQUqFvf5mMo
	KpXUTLoKJdbYAXZGOm85Yf6K2ftjlOrad3sGpo3dh1QTxlqMxmY+W6JTmJfZBrkqUTBO4gKFrbx8K
	Eqo0EcXgbJkjZ8rmysdI8KUhsRNB4ESVzBFXSbVpVTeZ6dKDuJoaOWYLFgfWOHKIKpnuSvK9YTpJR
	eXZovtOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXVa-00000008p0v-3NQ1;
	Mon, 11 Aug 2025 18:44:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUuA-00000008IhJ-0kZs
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Aug 2025 15:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754927865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UPMcKR4Oi745bR8iqUsDP5qg1uYaCMtbYLompUhICNQ=;
	b=iN2EhbD90ie9CgoZVivdz9sre9b3D2VhxMFSPXr82443LS5XVYsBZBJS3GaenR1zqD3r3r
	vNVf5vXrUJvYkljprd2yRlwZ+anMLZaWze/RNW989bOQiHjwcqdO0PgG2YWDAGGMfA6ngH
	Kn7kWXLB0lDk8wsaPK/R1E2LkxSfqks=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-dX4d4vqpO6K0n0-X9qLHRA-1; Mon, 11 Aug 2025 11:57:44 -0400
X-MC-Unique: dX4d4vqpO6K0n0-X9qLHRA-1
X-Mimecast-MFC-AGG-ID: dX4d4vqpO6K0n0-X9qLHRA_1754927862
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7098e7cb2dcso81585206d6.1
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Aug 2025 08:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927862; x=1755532662;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPMcKR4Oi745bR8iqUsDP5qg1uYaCMtbYLompUhICNQ=;
        b=ApncdSeMtm870/Z2jE+yl66c3ayigsR5ZN0juKbin34NUZcO8E8zwNPyEa8PawBUCS
         MHX+YjNTmAeMXV6B2TjOTpldTxbGbHrN0nUDdfxMG9FuSjMyHc+8P2Gk1vYo4+uPkp8s
         YjAKfWIUWGbq+pNuuZYNdVvNs+Mt9VhxV4fInVfDYWTn//X/qGCTwFpxpi2iovBfdWIW
         3IauW5qhB9FG3yCSxzs2i7+unn25Szo1rCGj5weouGPvJtSKhfdDo/vk8jV1GleWXZtE
         X4h7I1cyk88aufNqAEHuq1QOoYWriZchkwuepsT0ULIrzGlPlXlCWK3nDuKKeAXaAVGr
         pM1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/vLvkl6eePL/WKr1w9UjfMC6RilO/1BmVRLVXcq9kiXmRfUd1+gDjU5XvgWPYEEXoth4DbxWh5q95NFfr0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAixVL6FaZpvzNh8+/kerjteFIlOuW/nJhumfT4YZEjFuxwRmG
	j61DnIbxRbuCAicOuQiOeyIDw2ZwVhmtD1lXR1muKvuY2pYbfkvymMiWwII7RGFbfgEuipOLsjF
	klFGCVPTRTQfsTE8dJbKN0X45Llpso3+18Nfcfv3j0JtZSrsJyL5BUkBItNWrg2jz/4iQ0LGWZA
	==
X-Gm-Gg: ASbGncviHpeqoNYkVS0aDTzVmERGTREKxHZ10CLy3mBv+AoWmn+9BRPva6KrQRS59HG
	UJWMjk+ErYAykK0elxdPn6zbXUzvmA5v9GVuxdsjuN/1Scp1tnd/vsP3bvCirnc+zIPigCT9gAQ
	HU2FY0T5n996tpQUwdc9AiulwbakyzzYx5MFNyEHroz7oCgmcmnBryMfg+/K4vsqljWF1tJCidq
	MTllkfbwP76cbLWHb4HNtLwpMdH8kCy7AF2dGlMVqaFyApZH7CddxxUzZCRKgZ7W6HVqG7DAtsJ
	TSgpiKGDB83mbf6+KMwcsqmUObTdit5uVlmPySlmpTEzLxtRvQYKJonjdpnrQE0=
X-Received: by 2002:ad4:5fce:0:b0:707:612d:3adb with SMTP id 6a1803df08f44-709d69b2c0emr1135116d6.18.1754927862212;
        Mon, 11 Aug 2025 08:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE83iNLxuXWBRGJIeIFUZHblancM50VRXiEQcjWFBbyuLTm1IZWPJbr6gZfh6Uj5SzS3+J40w==
X-Received: by 2002:ad4:5fce:0:b0:707:612d:3adb with SMTP id 6a1803df08f44-709d69b2c0emr1133886d6.18.1754927861515;
        Mon, 11 Aug 2025 08:57:41 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5b4esm155566456d6.69.2025.08.11.08.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:57:40 -0700 (PDT)
Date: Mon, 11 Aug 2025 11:57:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 048/114] clk: sophgo: sg2042-clkgen: convert from
 round_rate() to determine_rate()
Message-ID: <aJoS7twZC0WsIDY5@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
 <9379f132e52c972b2735cad768242cb784b0ed2b.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9379f132e52c972b2735cad768242cb784b0ed2b.camel@gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ChCtkr1fYex6ojsTRTRPr4Cj_gp4LPCxKGbyF_Ekzls_1754927862
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_085746_317054_56D88A33 
X-CRM114-Status: GOOD (  16.28  )
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

On Mon, Aug 11, 2025 at 05:45:57PM +0200, Alexander Sverdlin wrote:
> On Mon, 2025-08-11 at 11:18 -0400, Brian Masney via B4 Relay wrote:
> > @@ -192,15 +191,17 @@ static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
> >  			bestdiv = readl(divider->reg) >> divider->shift;
> >  			bestdiv &= clk_div_mask(divider->width);
> >  		}
> > -		ret_rate = DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
> > +		ret_rate = DIV_ROUND_UP_ULL((u64)*&req->best_parent_rate, bestdiv);
>                                                  ^^
> May "*&" be redundand?

Yes, I agree that needs dropped and something I missed when I cleaned
things up by hand. I verified that this is the only case in this series,
and all of the other series that I referenced on the cover letter, where
this occurred.

My Coccinelle semantic patch has a case when the parent rate is
dereferenced, and I'm not sure why that wasn't converted here since it
works elsewhere.

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

I'll wait a few weeks to send out a v2 to hopefully let big chunks of
this series get merged so that I don't have to send out 114 patches
again for a v2.

Brian


