Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96381C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 21:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROtGRkMMJOo3heCE4FsyrocsN+9A/zey1CK7Y1FvCtw=; b=s53GFUEp9K72n1WFJJk96WpF4d
	axE40CUhIYekcC5e9wcXrazk1mMQWyJUEgGZoLKfLnk9CJ9vlmn5chdnINorx79MB2yhhv2M/l7yi
	LxCXhah//BziEcf8PSGH1cCUHs0O1t+vLv1DyDNHwhvTLau5ADK24XYMbV046F7UjDH9uXht1ouk2
	QwOGOCfEU4CLM1A+ZkwOoTevksx6GfBe084XHpeyPqfR1q0FmwU2/HCpEkQuSmVSE5VCLlnkHT6X/
	Kp5inTZk4dbKNYpmDPf9rnwRCvyezpezcDQZPHd2uAMxjJOsgmCGhQI365wBKh3q7K9lZ5sYDRH1j
	lQqdwfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peN5E-00AXns-23;
	Mon, 20 Mar 2023 21:30:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peM1l-00APXF-3A;
	Mon, 20 Mar 2023 20:22:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 90397B80D40;
	Mon, 20 Mar 2023 20:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8F9C433A1;
	Mon, 20 Mar 2023 20:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679343763;
	bh=DsQcH8xwycCkHIQ8QfvnCvZGiwQiVzM3IGKlFw3c6vs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MLccj/RLSM98dlukhUc7AVMvtM6TNxo4TMAo84qD8ka/wn6JB3LqwSYY268Q6UPud
	 +g0BO14nCIrhwzk4PcKUeCeF6199gB6YzzwXV5rmCXuf/AJy81c59aH3HTDhAF8pF3
	 WUix2uGxBJ6EzDuFwdgKXGjiuj47JalNztMo0M4AM93Rbu6rXPtUH9eXGEnhunwEHA
	 IhDq1pWhPAHpV3JgWq3Xd1Jf6xM4w95kkogu8Xw40M/55Q+BC8DUVor3oPXiUV25o8
	 iYPno+at84ZG0UU6qHS8baVlXB2wwj9uQBZFEeXtv7pXyrptYa1Ust701v7xy3Kjwp
	 DCzpI9K6lpzTg==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5416b0ab0ecso244605487b3.6;
        Mon, 20 Mar 2023 13:22:43 -0700 (PDT)
X-Gm-Message-State: AO0yUKU0/onXV7fJQw7lcZAkeIwCH3iUoSJd/RwmCAN+I5W0blqzhl6b
	sXDYKfZFvA3k6BxURZQsMB/TjJti9PDX4mxs6g==
X-Google-Smtp-Source: AK7set9FJ+m1VwanpiAMfxA818L7HV/dPyhWg6DYQSadevXyKErLiGfJvZlidEnREDYwVbhCFXXRZvTZAhJh0VfOM4I=
X-Received: by 2002:a1f:28c4:0:b0:436:2fa4:e25d with SMTP id
 o187-20020a1f28c4000000b004362fa4e25dmr363729vko.3.1679343741554; Mon, 20 Mar
 2023 13:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233605.3967621-1-robh@kernel.org>
In-Reply-To: <20230317233605.3967621-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 20 Mar 2023 15:22:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK+Q5HS=0PqnA60gV43O7ymxhPH-WHKFJKpQMYe5KfEfg@mail.gmail.com>
Message-ID: <CAL_JsqK+Q5HS=0PqnA60gV43O7ymxhPH-WHKFJKpQMYe5KfEfg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: Drop unneeded quotes
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, 
	Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>, 
	Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Wolfgang Grandegger <wg@grandegger.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Michal Simek <michal.simek@xilinx.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Tobias Waldekranz <tobias@waldekranz.com>, Lars Povlsen <lars.povlsen@microchip.com>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, linux-can@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_132246_355190_0546E332 
X-CRM114-Status: GOOD (  13.80  )
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

On Fri, Mar 17, 2023 at 6:36=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/net/actions,owl-emac.yaml  |  2 +-
>  .../bindings/net/allwinner,sun4i-a10-emac.yaml     |  2 +-
>  .../bindings/net/allwinner,sun4i-a10-mdio.yaml     |  2 +-
>  .../devicetree/bindings/net/altr,tse.yaml          |  2 +-
>  .../bindings/net/aspeed,ast2600-mdio.yaml          |  2 +-
>  .../devicetree/bindings/net/brcm,amac.yaml         |  2 +-
>  .../devicetree/bindings/net/brcm,systemport.yaml   |  2 +-
>  .../bindings/net/broadcom-bluetooth.yaml           |  2 +-
>  .../devicetree/bindings/net/can/xilinx,can.yaml    |  6 +++---
>  .../devicetree/bindings/net/dsa/brcm,sf2.yaml      |  2 +-
>  .../devicetree/bindings/net/dsa/qca8k.yaml         |  2 +-
>  .../devicetree/bindings/net/engleder,tsnep.yaml    |  2 +-
>  .../devicetree/bindings/net/ethernet-phy.yaml      |  2 +-
>  .../bindings/net/fsl,qoriq-mc-dpmac.yaml           |  2 +-
>  .../bindings/net/intel,ixp4xx-ethernet.yaml        |  8 ++++----
>  .../devicetree/bindings/net/intel,ixp4xx-hss.yaml  | 14 +++++++-------
>  .../devicetree/bindings/net/marvell,mvusb.yaml     |  2 +-
>  .../devicetree/bindings/net/mdio-gpio.yaml         |  2 +-
>  .../devicetree/bindings/net/mediatek,net.yaml      |  2 +-
>  .../bindings/net/mediatek,star-emac.yaml           |  2 +-
>  .../bindings/net/microchip,lan966x-switch.yaml     |  2 +-
>  .../bindings/net/microchip,sparx5-switch.yaml      |  4 ++--
>  .../devicetree/bindings/net/mscc,miim.yaml         |  2 +-
>  .../devicetree/bindings/net/nfc/marvell,nci.yaml   |  2 +-
>  .../devicetree/bindings/net/nfc/nxp,pn532.yaml     |  2 +-
>  .../bindings/net/pse-pd/podl-pse-regulator.yaml    |  2 +-
>  .../devicetree/bindings/net/qcom,ipq4019-mdio.yaml |  2 +-
>  .../devicetree/bindings/net/qcom,ipq8064-mdio.yaml |  2 +-
>  .../devicetree/bindings/net/rockchip,emac.yaml     |  2 +-
>  .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +-
>  .../devicetree/bindings/net/stm32-dwmac.yaml       |  4 ++--
>  .../devicetree/bindings/net/ti,cpsw-switch.yaml    | 10 +++++-----
>  .../devicetree/bindings/net/ti,davinci-mdio.yaml   |  2 +-
>  .../devicetree/bindings/net/ti,dp83822.yaml        |  2 +-
>  .../devicetree/bindings/net/ti,dp83867.yaml        |  2 +-
>  .../devicetree/bindings/net/ti,dp83869.yaml        |  2 +-
>  36 files changed, 53 insertions(+), 53 deletions(-)

Sending a v2 as there are a few more cases with $id and $schema quoted.

Rob

