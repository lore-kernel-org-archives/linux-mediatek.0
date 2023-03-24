Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A09C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozq+vH75mAjNkKi3jfaobvjryF3L2Ni1S1Tn6tmagvQ=; b=S81SA+Ra1EkcnRCQFuWwndteYk
	g2n3EGW9On3D7683LJf1hAayEmnFEelmL97ijN1FtpBkPDc9HYKxil6HQDfJahh/9nFc7lUUuQIY8
	zMsHmvvA5QWEkwLEP+bhSk+t9EgcBUbyKcbwY0/i8nVXlq14SDDXb2tupPNAsP8fTxhlnjlJdsPis
	lt7l/H4flTcY9Nw8p7L2wKp9OMOW831UwGh54HnLEW/xtQQN4c18rHS3uD0/15IQw8jgM1ISKni26
	MALrLTNR9nxbAEjCirBv1+Cme/Kf4/iYVWZb0vRoWGb96TRdU83MHVV8q6NVsrhTuDALMdhUsH9My
	qEzGrHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfiUo-004eA8-2w;
	Fri, 24 Mar 2023 14:34:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfiUl-004e8n-0R;
	Fri, 24 Mar 2023 14:34:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1E5162B30;
	Fri, 24 Mar 2023 14:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F55BC4339B;
	Fri, 24 Mar 2023 14:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679668455;
	bh=ozq+vH75mAjNkKi3jfaobvjryF3L2Ni1S1Tn6tmagvQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZnhWOCjRHBVl6jMFyTdz2uJBPpSM2kij2cHeCYfnvMal7mOe3nevgli12nKSVyo1+
	 rZlC/eiRp+q6eYz1wuvLbURRo4cOa1ihg2sXmqlhxeiwE/5uyDJZb5KiFkbR81W5wr
	 Mihu8blBLIIPZzPzXG+mtcNvBqAxymxPA4pqExAf5yA8RL9wTslmj93FUvsxYqap4Q
	 U4sDe3114VPd8xkzxxSl3wiRrlADe7/VvdzGpRwnCFQhUCrAMQiONqvicHZNOAzuqU
	 qvkUUlLWORUAOjqfuxV3S76W62ttb0Hz0+kSU2MB9UaOHxxmARqzQALHu2NEdEOapF
	 9LgGCEDTVE4Ew==
Received: by mail-pj1-f54.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso1774580pjb.2;
        Fri, 24 Mar 2023 07:34:15 -0700 (PDT)
X-Gm-Message-State: AAQBX9cCaCh33idEPY16hIzR8BY0iUcYDw2kMosNwt9hCUvAs5nVKILs
	XvSROnNIj6BO6615rXOMMzSuk9pN5SYtY8qdFw==
X-Google-Smtp-Source: AKy350Y57cQ3/TzcctMtJeBkZVGy3RaGVnEiqyzqBxcgVPo3gFc72P+HHXJ3tIgI+qnw4mjDX3xPaiNQsV4yB10ee/Y=
X-Received: by 2002:a81:b149:0:b0:543:9065:b225 with SMTP id
 p70-20020a81b149000000b005439065b225mr1122523ywh.5.1679668433642; Fri, 24 Mar
 2023 07:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org> <CACRpkdYq4jE7Qn1w8iPeGz7vxj_CeZ+H48B0TVYmeF4Tt=kHgA@mail.gmail.com>
In-Reply-To: <CACRpkdYq4jE7Qn1w8iPeGz7vxj_CeZ+H48B0TVYmeF4Tt=kHgA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 24 Mar 2023 09:33:42 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL+nF_WwZ-EDpUSD2yrxPLZWxaeb=WpTtPnnbpgcXT7qA@mail.gmail.com>
Message-ID: <CAL_JsqL+nF_WwZ-EDpUSD2yrxPLZWxaeb=WpTtPnnbpgcXT7qA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
	Damien Le Moal <damien.lemoal@wdc.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
	Wells Lu <wellslutw@gmail.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, patches@opensource.cirrus.com, 
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_073419_270140_323A97C7 
X-CRM114-Status: GOOD (  13.71  )
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

On Thu, Mar 23, 2023 at 3:40=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Sat, Mar 18, 2023 at 12:36=E2=80=AFAM Rob Herring <robh@kernel.org> wr=
ote:
>
> > Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> > checking for this can be enabled in yamllint.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Should I queue this patch by the way, or do you need it to go into some
> DT-related tree?

Stands on its own. You can take it.

Rob

