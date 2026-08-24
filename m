Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A03FC5DF94
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9JEBxETCpjKOyzPxUj8DiK5Y8iV5A7DhykNYlgKppA=; b=mAvw3YhdX6hSjrqtZPwqrKL9Q3
	7mMIU8O0Olc1I+SvQXGTM2m5nmY7XvwMw3ZInJzJS5qrlPLbsKCOL99pgUClPiXS6St39QTImqk6U
	5UAAVa6CwYwyPi8QQ1oeQpYnc4DRV41jMzcdd6Yvr1bI5f3x5xwLtl4OSKXcoV7WCl9pKFkGARtbR
	PHdtfegktaWQTrPkNTNrguagolrEnV5xcZUi7F89ltt14Sdsb6jS8+xnuU2tTriq9g0aITQcRDNrL
	v1NeWs090wk7nysbGXRAYsKesq9+l1jnTAChT2apgQmEduhwrNYksepmeE/6e6MogkEkd1ppSvRTJ
	MD1ExipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWNW-0000000GtEX-3mhS;
	Mon, 24 Aug 2026 15:14:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWNR-0000000GtDB-2GaM
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 15:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r9JEBxETCpjKOyzPxUj8DiK5Y8iV5A7DhykNYlgKppA=;
	b=RQ1ywwYhBSzgemMFnvk2LOPOKEsN8G3U041gYQ1gub52vQQf5JXQmWNISH87NWSdr9U59b
	5E96eDnCvOE61vPX7qcjGITu8btjfXfBDaYSloduwbM05tjtDJKEiQz3gJPU9ar9WEc5s6
	6R1b5qs/zj7KBGmuE7LcEWdx0lUo6B4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-VTpBvxTIMVyQKCUxW--jlg-1; Mon, 24 Aug 2026 11:14:18 -0400
X-MC-Unique: VTpBvxTIMVyQKCUxW--jlg-1
X-Mimecast-MFC-AGG-ID: VTpBvxTIMVyQKCUxW--jlg_1787584458
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so48710811cf.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 08:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584458; x=1788189258;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9JEBxETCpjKOyzPxUj8DiK5Y8iV5A7DhykNYlgKppA=;
        b=O2fqvnwM/eYRPKi+7Ng1KdRN5p+qRs1lNZCdn5Y8i2JmbZ0m1OTVW9Vi4cvSlD86bc
         mO6CmBBGiGKnh9HWZmUU/YRb8bEMgJ+mivMM1EwzoHrh437jCRgKkhofoykRnEV0YKvK
         qqyAq5M4xpZPEVz5r6r+I1vUJ6AdfA4rcaN6QoMwjh/QNs+jcQzhL/yxGh0vGB1E+Ddg
         CVl/phNNPbR+iaHJ4XGaR7PHFWjW7ljSQ1HvhYbfdQQeWTSuNmw8aIracIWiC5DO7Ule
         5EBqNkrpIjZZJK5ymrSfAZAZUXEBUOdpleD244PMcMUduC7EuPzTucnteixsi9Bjsets
         eP8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rod34zaN4Em1yf6eS8NTQZxYV9PaOyb0N/5FB7tCz6c2o9o6xdGbZs47AdlURqyZRZ+S+MPoWNJ986q+0iacg==@lists.infradead.org
X-Gm-Message-State: AFuF++m8m2gE3qWd1FXdAbtuDWP6sr17kT5SPaaSQ2DtY5aJTvidP7gC
	8K7EtIsv9djudZCqP+uZeDNeqt2/2Eqh91SiWASJwDhfznBDJyRbS33XGqEbueT5mVAY1DLH0cA
	p19/UCU2GjowT+R2Gp4tKT16EjpqF6Hr7hZtmEhxkv8zYSvxzqM8Pjzyl/1ydnG/sp/fFBoj13Q
	==
X-Gm-Gg: AR+sD11eRH/VwtyuxQjHN1KguKJKjds2AwLnvgOgNTd9Eos+7Ps7jGTIAqSItbZ5dWB
	UXSZUKTyQueP0/w/ubQKtiI8DKuVFP/sZQf+2cRomhGcaI2QLmH4KxE7Ej2NxCDSX0wNZhGWOLL
	gLX3kpn22Z//aflxvo3Ju40EmFLKBkyIC1QV27YiFu3K3fIAHZg+mft3VO+4gKkJSs62/Cs4M6c
	WKs1GNjfMcMzo+Hvs4zm9qROxk2YnEBOKZIOc5379DtDd9hwM7Sl122kxQpCRIKamaxBfqeumfv
	poUZZdJKGp5niSDre1GWuu7WnC5+qQLW8RHmR9GIGVB4io4mQvemkOhsZZ+gK3XhPAQkR9mnX/S
	yI/vm2TE25xq/0Sh7iZLRAuV54r0PAWU5d+w=
X-Received: by 2002:a05:6214:2a49:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-90c80942e22mr260846696d6.4.1787584457502;
        Mon, 24 Aug 2026 08:14:17 -0700 (PDT)
X-Received: by 2002:a05:6214:2a49:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-90c80942e22mr260845166d6.4.1787584456812;
        Mon, 24 Aug 2026 08:14:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a82554sm64013126d6.45.2026.08.24.08.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:14:15 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:14:11 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
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
	Krzysztof Kozlowski <krzk@kernel.org>,
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
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
Message-ID: <aoxfwycOmEzLzhEU@redhat.com>
References: <cover.1787239813.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <cover.1787239813.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hzPPMQPuINfkOiKteQEG8DBKDpQAOWRijCmCLBNPeQI_1787584458
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_081421_658373_5B5FF59F 
X-CRM114-Status: GOOD (  18.48  )
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

On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This series is the clock subpart of Part Two, which fixes remaining
> cases that are currently harmless.  These are still fragile, and may
> cause future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!
> 
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

Thanks for cleaning this all up! For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>


