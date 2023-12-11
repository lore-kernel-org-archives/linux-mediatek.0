Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F35EC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 17:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ML8RrE2HFwUrs8x/tL3sr/x8LhNvb43nYlNidI0ZHw=; b=My5V2EpNFa4Kgy
	kJ3ne6QTxsR5ekdmQiYxCNWS2WzDFhpeYGeMmXpvy/8JcK/Scf5SqPwY9EJ72K6PTLO+h+5wUrZS7
	EEyZ+y1MJfdKy6qHeGn67j6UY7PBqvjFU7N4ZmOIRnXIR0/Z7LOW4KnQ3Riv/VaOt2G4R+JXlQ1au
	oHOHmMLnUeU1dnW+vJBOnUHjrKSjyFk6yS1lMkvc32CIaLVUgjCdnDB41jzNjFKLTxCD6v3Ug7gmS
	vFzjVn4kS9kUzvaFWR6hv9qTS7LcASSFQoB47S2Z0aOM4Iavwl4mQNQSWH1rMTd3y+3jDezRv/4JV
	EbnYuChU/XKs6Y4m8H8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkDF-006OAb-0w;
	Mon, 11 Dec 2023 17:37:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkDB-006O6r-1N;
	Mon, 11 Dec 2023 17:36:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D43D6B80F9B;
	Mon, 11 Dec 2023 17:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342BDC433C7;
	Mon, 11 Dec 2023 17:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702316215;
	bh=jnf9dg13SzBYTXr+GBpBiKbCKE+W4egIWCJCCgVUAwg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=loMjJRWMoMUGhMgm+YrnxZIpLCV3bDvtka0s23uKcX4z16ASC0s+UuYVJHGeBIYIB
	 N27ZdO+4F8Lawqz9kb2Luwv9DyGq9QaTgPhpxI9eRVt5CsaJ/8hXk/1FrinkdTkG2l
	 6DkZXddgjOC/nFXYY5q29djDfkZBGH+J+BAfsiySfpReSSCj43HJsZ98xx7K7bowh9
	 XTlgW15lmK6opKpi3nU9cVIARat90LwpmncgYWKqsZuE8dv7mkglGhaEryRg2Soeal
	 I1BlECQqH9HuKD3JA8HOwUOv2Bv48o7Cu4IgQR9V5VwfHj28+3s95m0s9ceGCoV8ju
	 oWcQ6PJw8bn4w==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50be3611794so5575608e87.0;
        Mon, 11 Dec 2023 09:36:55 -0800 (PST)
X-Gm-Message-State: AOJu0Yy20Oc0P26nP16eu9t+nu7S9CN2wTnamGwfzjFsauGN8TuuHEiv
	RKkKG2SVI3KEIaJ1tKVwgp9NmO10dKP5UGQBdQ==
X-Google-Smtp-Source: AGHT+IHTBVeYuUBoGJIP6ycY2EOkZoObSSDfVZqLhoI3Lxe7oVt2ihkbRec/l/L5HGnrywwvadEcHP4hGnXcj/srfPU=
X-Received: by 2002:a05:6512:68a:b0:50d:15be:f07e with SMTP id
 t10-20020a056512068a00b0050d15bef07emr2866329lfe.74.1702316213414; Mon, 11
 Dec 2023 09:36:53 -0800 (PST)
MIME-Version: 1.0
References: <097e82b0d66570763d64be1715517d8b032fcf95.1702158423.git.daniel@makrotopia.org>
 <879b5bbcb165aa3f059a41218142b27e5f64597f.1702158423.git.daniel@makrotopia.org>
In-Reply-To: <879b5bbcb165aa3f059a41218142b27e5f64597f.1702158423.git.daniel@makrotopia.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 11 Dec 2023 11:36:41 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJVY3-UneaoUNt6aGa2kU_3EVAwxJfY_mYZPyp=L=Bjtw@mail.gmail.com>
Message-ID: <CAL_JsqJVY3-UneaoUNt6aGa2kU_3EVAwxJfY_mYZPyp=L=Bjtw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] clk: mediatek: add drivers for MT7988 SoC
To: Daniel Golle <daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_093657_749969_3065186A 
X-CRM114-Status: GOOD (  22.91  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wenst@chromium.org>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, Sabrina Dubroca <sd@queasysnail.net>, Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Garmin.Chang" <Garmin.Chang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>, Markus Schneider-Pargmann <msp@baylibre.com>, Jianhui Zhao <zhaojh329@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Dec 9, 2023 at 3:56=E2=80=AFPM Daniel Golle <daniel@makrotopia.org>=
 wrote:
>
> From: Sam Shih <sam.shih@mediatek.com>
>
> Add APMIXED, ETH, INFRACFG and TOPCKGEN clock drivers which are
> typical MediaTek designs.
>
> Also add driver for XFIPLL clock generating the 156.25MHz clock for
> the XFI SerDes. It needs an undocumented software workaround and has
> an unknown internal design.
>
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v4:
>  * make use of existing GATE_MTK_FLAGS macro
>  * reformat to max. 100 columns
>  * cosmetics
>
> v3: use git --from ...
> v2: no changes
>
>
>  drivers/clk/mediatek/Kconfig               |   9 +
>  drivers/clk/mediatek/Makefile              |   5 +
>  drivers/clk/mediatek/clk-mt7988-apmixed.c  | 102 +++++++
>  drivers/clk/mediatek/clk-mt7988-eth.c      | 133 +++++++++
>  drivers/clk/mediatek/clk-mt7988-infracfg.c | 274 +++++++++++++++++
>  drivers/clk/mediatek/clk-mt7988-topckgen.c | 325 +++++++++++++++++++++
>  drivers/clk/mediatek/clk-mt7988-xfipll.c   |  78 +++++
>  7 files changed, 926 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt7988-apmixed.c
>  create mode 100644 drivers/clk/mediatek/clk-mt7988-eth.c
>  create mode 100644 drivers/clk/mediatek/clk-mt7988-infracfg.c
>  create mode 100644 drivers/clk/mediatek/clk-mt7988-topckgen.c
>  create mode 100644 drivers/clk/mediatek/clk-mt7988-xfipll.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 48b42d11111cd..70a005e7e1b18 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -423,6 +423,15 @@ config COMMON_CLK_MT7986_ETHSYS
>           This driver adds support for clocks for Ethernet and SGMII
>           required on MediaTek MT7986 SoC.
>
> +config COMMON_CLK_MT7988
> +       tristate "Clock driver for MediaTek MT7988"
> +       depends on ARCH_MEDIATEK || COMPILE_TEST
> +       select COMMON_CLK_MEDIATEK
> +       default ARCH_MEDIATEK
> +       help
> +         This driver supports MediaTek MT7988 basic clocks and clocks
> +         required for various periperals found on this SoC.
> +
>  config COMMON_CLK_MT8135
>         tristate "Clock driver for MediaTek MT8135"
>         depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefil=
e
> index dbeaa5b41177d..eeccfa039896f 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -62,6 +62,11 @@ obj-$(CONFIG_COMMON_CLK_MT7986) +=3D clk-mt7986-apmixe=
d.o
>  obj-$(CONFIG_COMMON_CLK_MT7986) +=3D clk-mt7986-topckgen.o
>  obj-$(CONFIG_COMMON_CLK_MT7986) +=3D clk-mt7986-infracfg.o
>  obj-$(CONFIG_COMMON_CLK_MT7986_ETHSYS) +=3D clk-mt7986-eth.o
> +obj-$(CONFIG_COMMON_CLK_MT7988) +=3D clk-mt7988-apmixed.o
> +obj-$(CONFIG_COMMON_CLK_MT7988) +=3D clk-mt7988-topckgen.o
> +obj-$(CONFIG_COMMON_CLK_MT7988) +=3D clk-mt7988-infracfg.o
> +obj-$(CONFIG_COMMON_CLK_MT7988) +=3D clk-mt7988-eth.o
> +obj-$(CONFIG_COMMON_CLK_MT7988) +=3D clk-mt7988-xfipll.o
>  obj-$(CONFIG_COMMON_CLK_MT8135) +=3D clk-mt8135-apmixedsys.o clk-mt8135.=
o
>  obj-$(CONFIG_COMMON_CLK_MT8167) +=3D clk-mt8167-apmixedsys.o clk-mt8167.=
o
>  obj-$(CONFIG_COMMON_CLK_MT8167_AUDSYS) +=3D clk-mt8167-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/medi=
atek/clk-mt7988-apmixed.c
> new file mode 100644
> index 0000000000000..02eb6354b01a8
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + * Author: Sam Shih <sam.shih@mediatek.com>
> + * Author: Xiufeng Li <Xiufeng.Li@mediatek.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>

> +#include <linux/of_address.h>
> +#include <linux/of_device.h>

You probably don't need these 2 headers and the implicit includes
of_device.h makes are dropped now in linux-next. Please check what you
actually need and make them explicit.

Rob

