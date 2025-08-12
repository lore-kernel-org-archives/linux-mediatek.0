Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC547C87FCB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q//s+/zCNBEzjNslOllCQGV4nFuLBeOueQxvALXBZS0=; b=zM65VM7eYvDMeS4gAPbddoemZs
	oK4YiyBWp7RFpePyzh56B0z3L3/foNVb5PKNy1blhLkfZ7AO4nk47WojDQckJsX5rCbnx2LpMOIvm
	6KjEgLB7wCafJwaMHIgLO+sPcIa4fiF8CPAPzTT/N5ZeM5sOSKSRWNLGs8MvMOzsckH50GTOPsOSa
	09IgrLRVZ38taw/paDj9+imbJ1S1++6KXcKwNVIzQD5Opf8wzXH5/lKXaNhhGRsTbfRpTRrGIv07g
	qko5h5tSivYi7MlFSZqTpC81UGWWVLOaViYLanvTTTSBGjPH3Bf6RKJI3doFcPqfuwmGCiS0Li2dG
	qoNRa89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulssx-0000000BbXE-2g3C;
	Tue, 12 Aug 2025 17:34:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulpS1-0000000Az0C-0ONO
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Aug 2025 13:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755006844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q//s+/zCNBEzjNslOllCQGV4nFuLBeOueQxvALXBZS0=;
	b=aaszSW2+MdZ6asE6thuPpoqkAO2VXGd+Br99klikm9lUtMmtstrBRuTShTts3VnCMfYsmj
	Z9lI4EgZJkg4uuUEozvkrr0b4EvUvPc2iR1pJvwyBW8h7bYdZlU80FX0dUGfsIqqp4j+Sx
	a+8wpCxSed5l5g8qWuRXJfI0JoKhwJ8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-qTsizl7zOYqjbN6Xn0LCpw-1; Tue, 12 Aug 2025 09:54:02 -0400
X-MC-Unique: qTsizl7zOYqjbN6Xn0LCpw-1
X-Mimecast-MFC-AGG-ID: qTsizl7zOYqjbN6Xn0LCpw_1755006842
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0a3557d05so117958691cf.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Aug 2025 06:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755006842; x=1755611642;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q//s+/zCNBEzjNslOllCQGV4nFuLBeOueQxvALXBZS0=;
        b=rWkHaX/Pa3Rd7Hq2dlRDvIwQTySHZf19F5pUolIqWKS19asecElUNBLr2qDAPRLnYV
         cFnW1eqLoJB9MM6WzaHv4fWqpZ1WGcMpsQIbVJOBJKD/SUD3zruObAAyK+tIQko6FZyU
         +BBayUSji/bnHQrNGC8psx3r1EIekKrrmHWjdSJmcmgVMbw92CjmKsiWkwg8ZmFGLVS+
         rzz3ARnBa4AZ86LF0+f+NRupetOzwEPA6fdQm34YNxjd170/OkD7HFsHQLJuXGIVWPyZ
         2jv3n0sBuSz5lRtfSyEHbPqD1U8tLVFQT67PnSbdJS3FR/fjg98bMtLLqEaOC2nOwOEy
         xmVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe6sEGQh2Hx58IO8llsZnevmmvlq3F+HVuSZ7dAxj9ZWtyDIw38aTsuXIKGQNNsF5UUn97sGBCuEAtWNINPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyIBsJ0jLPu9bKqZhj0FQGRo3d5eoXMbpLlnbbIOBgDGkR9qrr
	QFKlSDP/KmF4ha0OV/qgrb2tcjH8wMEmTk8d1hSIRShJO4oK+z2r6OYjyFDp8pOUtDLrvFrXXO7
	42nljzJTxBGoLWysM6m+bVAAFGjiu2dG8SRFsYVhagnn+NkPxjzaZzNEKhSFYjUMkICMOwljNTA
	==
X-Gm-Gg: ASbGncsSdflhPMoyL/U2dkC5SiDXn71/er7cDBA0D6foBzAHFij1njI49QccSX4d0SC
	bviJoj/clM9rYEYlLKk8En/CwB7zoA0AmBnhkj98d2reEkSyE/bbcaQeCVpD2U5tQQGXT+efkrD
	OqhFOF/UEhDsbezBnWZqLtqaS1YV5FXaqx4sUFunvcn507y6IQ6UtMN16Zi/IR0m3VhEnF5So4T
	aet9LXt95jgdbShCa/EvXCDwRtc834Ts72qYD5aN3Yn91KPaLjaNNP5vp7keYO8yxEfK8+1y4Oy
	SSCXih6PdeRrvy065VhIEXNowtrKBSiuFBgp6PqS87fJ+IVxMs9WrRpFGLkUORI=
X-Received: by 2002:a05:622a:30c:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4b0aed36723mr265510471cf.38.1755006841711;
        Tue, 12 Aug 2025 06:54:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL0wdDdlaxY3Jk0TgFfLYMOMEPwCaVnL7cxWLBN3HaRHoOlakRNGI4PvbhwBJNSUpcz9s5eQ==
X-Received: by 2002:a05:622a:30c:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4b0aed36723mr265508911cf.38.1755006840909;
        Tue, 12 Aug 2025 06:54:00 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0aa1efe78sm75493211cf.8.2025.08.12.06.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 06:54:00 -0700 (PDT)
Date: Tue, 12 Aug 2025 09:53:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Icenowy Zheng <uwu@icenowy.me>
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
Subject: Re: [PATCH 000/114] clk: convert drivers from deprecated
 round_rate() to determine_rate()
Message-ID: <aJtHcs8_671G33Ez@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <a151ed7c1caac83e872cf6075c215fa55bd21f82.camel@icenowy.me>
MIME-Version: 1.0
In-Reply-To: <a151ed7c1caac83e872cf6075c215fa55bd21f82.camel@icenowy.me>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LDH0dwKWOUd9TOP2nfmr12QXG_UsdwWlsYVpMNYVSs8_1755006842
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_065405_203833_4111BAC5 
X-CRM114-Status: GOOD (  16.66  )
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

On Tue, Aug 12, 2025 at 09:39:45PM +0800, Icenowy Zheng wrote:
> I was doing a patch to add divider setting support to clk-th1520-ap
> driver and sent patch now, should I remove round_rate from the next
> revision and just keep determine_rate? Is it safe to do this even if
> this patchset is not merged?

Yes, you only need to implement the determine_rate() clk op. Please
remove any references to the round_rate() clk op from your driver. If
you implement both, then only the determine_rate() clk op is actually
used by the clk core.

> In addition, will the clk_round_rate() API exported to other subsystems
> be affected?

No, that will stay as is, and with the same name. The underlying
implementation in the clk core uses the determine_rate() clk op.

Brian


