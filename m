Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FCAC7619A
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Apr 2023 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZrZkQDilPn1vacJZvzA6Nj9qCFTdPg8cOLsQDyidsM=; b=ljJC3PDd56i+WScEilOg2nmAVG
	hlnXKs9lF+9Yo0p8UCn3eME87xA+dnepTn2yf6Ei0YDlreLGO08xv7eyg1o5T7fdQ8NAFtsgOHT7X
	jjH+VJ0fVnd/B+nwe9Cu/EUBsSgLER/JuJmY/NNSCuai5BfMSYlIOBm77A0blQdv4vj/wguAHdpwl
	6HShCnwEVIxL6RDEba895Ls8qlH857HybFEPLSWYFBaqhAfAYN+XH6t+bXLsr0Bb03pQ2CQorF/ya
	RxqBjVwV8PSuxjX1MAY1JaFXOvue005Cxw/TG1GQPT4+3TSj5GWGIo3H4i/2mVwGY8PZrU0n1MamE
	s1EKIquw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piytZ-00Ceal-2n;
	Sun, 02 Apr 2023 14:41:25 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piytV-00CeYq-0r;
	Sun, 02 Apr 2023 14:41:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id t4so21597356wra.7;
        Sun, 02 Apr 2023 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680446478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZrZkQDilPn1vacJZvzA6Nj9qCFTdPg8cOLsQDyidsM=;
        b=AWiAEpgmtq1ABmkIlHJMb3ekqLp/o5PBApXYHaUJd6fMBgINSst8BmJ/pgShbKKOeS
         k8wBFhY8/TOYGeGJnneNHpDQP3X0kyBdLdEufd36IBRxu5BjW+r4ms5yZy3oQpbROla+
         HuK0LSYtls5NDlBQiaKRY6pjE12QvLR0gdxZvzJPCpW0i1hfsep+nLFMs1KEs4LJMcoz
         MsllhAHbGZPXJN1p8RKV2TlnjCVbftkHvtY88q6n5HKQ0gQVYOf2Bwz+KuEPeA/ZRo7n
         AEdvOz6fpYyC8XMB9IgZpTx0TkjyMuthpPmYX+kcLN7IfSIMZNA86JgEs0+mJQRN69Nx
         1AzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680446478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZrZkQDilPn1vacJZvzA6Nj9qCFTdPg8cOLsQDyidsM=;
        b=z4kU24UlBjHMUzPaKZFxMXF+aFgfUIybJ89KJ8rDH4DEs7csYzOD4jR0CNGkRFOaoI
         qPA46NcMS5haySPjih0Mlnjy3q6ArgMN+tO4j9e3M1Iu6uE7QpSxGlPORVTJXi64AqZm
         G1lgZWRXhOtsizMs5arVTSSyPh21xo9UjjBkU+KvI31uWzowkPgI4oQMHeqLgaH1TlMQ
         lu4GSawyB5nazol2CzX2UxeTd+cppoewsF9ZHbqb3uWzAlnAHvOzwytyn78d2H/SeFJ0
         hgv1bNG82Ilizo6DFmlf32Eh6w8Gzj9LNSDCaK+i9qt9lTsRHaLyMjrr3aVdKTVoLNGH
         Y9Qg==
X-Gm-Message-State: AAQBX9dqrK5XtpySDLX0QFuL11yZ6htDlk6i/J3q1zTwAyFuy7l7mVFa
	NmM7Gvh+hjcVJcZ/WfWDSI0=
X-Google-Smtp-Source: AKy350blBuOVV+IjEZR9/y8oar0G5BwMskydAcUw+0jw7gSYoEmOmZAUU8e+M2Tp1dBCe1Rkl1g83g==
X-Received: by 2002:adf:f38e:0:b0:2dc:c9c0:85cc with SMTP id m14-20020adff38e000000b002dcc9c085ccmr26600215wro.59.1680446478145;
        Sun, 02 Apr 2023 07:41:18 -0700 (PDT)
Received: from jernej-laptop.localnet ([209.198.137.155])
        by smtp.gmail.com with ESMTPSA id q10-20020a056000136a00b002c6e8cb612fsm7363100wrz.92.2023.04.02.07.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 07:41:17 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org
Subject:  Re: [PATCH net-next 01/11] net: stmmac: Make stmmac_pltfr_remove() return
 void
Date: Sun, 02 Apr 2023 16:41:14 +0200
Message-ID: <2674462.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
References:  <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
 <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_074121_322352_85A18E28 
X-CRM114-Status: UNSURE (   9.11  )
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

Dne nedelja, 02. april 2023 ob 16:30:15 CEST je Uwe Kleine-K=F6nig napisal(=
a):
> The function returns zero unconditionally. Change it to return void inste=
ad
> which simplifies some callers as error handing becomes unnecessary.
>=20
> The function is also used for some drivers as remove callback. Switch the=
se
> to the .remove_new() callback. For some others no error can happen in the
> remove callback now, convert them to .remove_new(), too.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c  | 9 +++------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 9 +++------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c       | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c       | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 5 ++---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c       | 2 +-

=46or sunxi:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c    | 4 +---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 4 +---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h   | 2 +-
>  17 files changed, 22 insertions(+), 33 deletions(-)




