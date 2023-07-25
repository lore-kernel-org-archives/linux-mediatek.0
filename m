Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68049EB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 19:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8rUIvq1gVE+Fxi9pWz2AZ4nHMEIR3VV6hI2iqiJJPA=; b=QGLrZBdEfaC/LRea/ro/gszatk
	KYtSxJ4/vobc9z0AMoB8J55hRW2ss0yQtZXxiLe1sN0ckfj9w85beCs75vOJliWcGOh8qhnF3FzRB
	kkyq1Vdq1ORy8/M3VFxL5z3p1JPY1Qu/6gXhmgIqGSYPUDOlQXDunPw78ml0+7neyO3C2AvqTONGl
	/pQkJ3NXIwy6ZmbO2F7VS3iKOeKru+9EO4feu2Z6woaR8ZHO64ZeA8vKCStCRkfc8s2WpTxQaLS/I
	T3fQWrmP+/yLpTyqxN1gwJbqt3GkEnoLrm/qlanHEgI6CQfqci2OAEdkGjGUTc/MG2UrvFFzMhoaw
	APhbtoYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOOC2-008O13-1G;
	Tue, 25 Jul 2023 19:59:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOOBy-008NzV-0U;
	Tue, 25 Jul 2023 19:59:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 57610618BF;
	Tue, 25 Jul 2023 19:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18A4C433CB;
	Tue, 25 Jul 2023 19:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690315168;
	bh=jVkGbzOh79AEXIeMVY1s/WgLpPOOReQVmsy9pu11HgA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DEhjBsvrOOkcqhVPMF0ywdTWs8Z08Oh+MPV+DI+LuayXmNg5RPsI+06xanIZr41yf
	 RulCXs3D/yfE4rW3H0mBUoYYTTekXk7UtuQu/6tPx6E6UGYoVUP//DcKZnKvYdCY7m
	 LDadwlsN3uiJtuz+P/1vbQiCRFS8xJEgzz56R89YkZUyoeWUBmxW/L2f1uTVJKWxhx
	 MVlyTrNJ7H+fq//crmAaDyeNM5a++sk5fr1a2lcBtBfETk2FHDfcwxa9aH2EpzoAPn
	 zp5i4YLu+nwwjALW0PlPIJnHz+Xa+AmKS5YFoc6mujZXB0gvA8UxLyWev/HbE7XmpG
	 j6X5adm3rh5Kg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso9391262e87.0;
        Tue, 25 Jul 2023 12:59:28 -0700 (PDT)
X-Gm-Message-State: ABy/qLaWu0ctTmafC2hZwFyO/ogdtQOQACr/7rD8KG6kHJm1mWheyCJZ
	wnQG/ZavhO6uRH04Dou/L7SacOi6uZ7CXS1KcA==
X-Google-Smtp-Source: APBJJlFwGjXaJCJydGIeGV4iVYCIq6ysqPH1CxKSwb/h2lZDdMtrrV65McGRvNB57SLo+rUN/j76IhUhQXfq96gAGDg=
X-Received: by 2002:a2e:8786:0:b0:2b6:dd26:c02a with SMTP id
 n6-20020a2e8786000000b002b6dd26c02amr8693672lji.14.1690315146580; Tue, 25 Jul
 2023 12:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230724212222.809909-1-robh@kernel.org> <ZMAD25Yp6gCNq+wH@corigine.com>
In-Reply-To: <ZMAD25Yp6gCNq+wH@corigine.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Jul 2023 13:58:54 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+UYF79tUWvHh=5AfrERJPvFRaV4vh1mnbYn_nNjOQTcw@mail.gmail.com>
Message-ID: <CAL_Jsq+UYF79tUWvHh=5AfrERJPvFRaV4vh1mnbYn_nNjOQTcw@mail.gmail.com>
Subject: Re: [PATCH v2] net: Explicitly include correct DT includes
To: Simon Horman <simon.horman@corigine.com>
Cc: Andreas Larsson <andreas@gaisler.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
	Keyur Chudgar <keyur@os.amperecomputing.com>, Chris Snook <chris.snook@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Madalin Bucur <madalin.bucur@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Anderson <sean.anderson@seco.com>, 
	Pantelis Antoniou <pantelis.antoniou@gmail.com>, Li Yang <leoyang.li@nxp.com>, 
	Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, 
	Douglas Miller <dougmill@linux.ibm.com>, Marcin Wojtas <mw@semihalf.com>, 
	Russell King <linux@armlinux.org.uk>, Taras Chorny i <taras.chornyi@plvision.eu>, 
	Mirko Lindner <mlindner@marvell.com>, Stephen Hemminger <stephen@networkplumber.org>, 
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Timur Tabi <timur@kernel.org>, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, Steve Glendinning <steve.glendinning@shawell.net>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Vinod Koul <vkoul@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Kevin Brace <kevinbrace@bracecomputerlab.com>, 
	Francois Romieu <romieu@fr.zoreil.com>, Michal Simek <michal.simek@amd.com>, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Alexander Aring <alex.aring@gmail.com>, 
	Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alex Elder <elder@kernel.org>, A ndrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Alex Elder <elder@linaro.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org, 
	linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-wpan@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_125934_276009_11FD9140 
X-CRM114-Status: GOOD (  15.17  )
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

On Tue, Jul 25, 2023 at 11:18=E2=80=AFAM Simon Horman <simon.horman@corigin=
e.com> wrote:
>
> On Mon, Jul 24, 2023 at 03:22:16PM -0600, Rob Herring wrote:
>
> ...
>
> >  90 files changed, 88 insertions(+), 92 deletions(-)
>
> Hi Rob,
>
> I suppose that it's reasonable to take this patch through netdev.
> But it does have a pretty wide surface, and netdev moves a lot.
>
> As it stands the patch doesn't apply due to a conflict
> in dwmac-qcom-ethqos.c

It did yesterday... Anyways, looks like 0-day decided to find something els=
e.

Rob

