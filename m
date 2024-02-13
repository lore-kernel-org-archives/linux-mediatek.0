Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDC8C4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 22:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rroNdU9BVPUWE5wDt+3REaeJt2znsw1CC54JRzmWpmY=; b=mZPesiXjV35GNVq9MFF6wUR3wd
	uksg+TTzVmzqLnhiyj++bZHm9tacnLlnQVF0N/lJomX07dJtInqg1jzBJI1x+KlGOgt+qzcnxpdBy
	U6j17Ck5kQEJLbYc5RGm/0d/FhhICqa3V61/dXpLkoZ3kIAVoHRkLRY1PeJiRQxM0L+QBtxHm4l1q
	KOwYbITRopB8tovldctdOtJr1s5sPreGJCG7num3L2fm2TUdRM841PpLVoBkhjU7g6sPyAgQ2iP2i
	QFdmn6IuzxhT9boFVeUVTO9WuOGNBewEoU6mNcmXWYSONkF6d7IYhBg4yTzk+YI6P/sFOZegXBRSv
	0DBiUE/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra1X9-0000000B7vX-0EEc;
	Tue, 13 Feb 2024 22:45:47 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra1X5-0000000B7tc-0871;
	Tue, 13 Feb 2024 22:45:44 +0000
Received: from heihei.fritz.box (ppp14-2-125-29.adl-apt-pir-bras32.tpg.internode.on.net [14.2.125.29])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9AC79201BD;
	Wed, 14 Feb 2024 06:45:20 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1707864333;
	bh=rroNdU9BVPUWE5wDt+3REaeJt2znsw1CC54JRzmWpmY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KHU+A3iT+rXyEDnXx+5mY8gdyPd9RWW+IqjkatculYf0WMU9pEWV3lRQCkTDA0EzI
	 xaQRdVv6ONl5bSVVt+LS/QHv9KXR0YT+wOKEzHEk6ENorzt6peBUrGxgmVVbj1w/iy
	 1HjnEw+ZCd2iWua115sYd63cgh4PNaf4kwKyTyoar7mOLyZhESbJxdxIq+yzZzyaNX
	 SW0fRRSQjx4ywPBzEZtsbYSOEQ+k4WVQplTD0W2lni1ygtrlTWCGNAeTjZ9xaf0EWM
	 Dto/KMIkfYa0O5HKCg8KnOdWszlCAKyfH/kkPoEvmSP1qCSUbu5pEXrDsZ9ADFy8aH
	 cV53xTq95Tecw==
Message-ID: <9a67cee101e7e15d5e70553e3929ee2fbd480c1f.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/6] arm: dts: Fix dtc interrupt_provider warnings
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, soc@kernel.org, Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine
 Tenart <atenart@kernel.org>, Joel Stanley <joel@jms.id.au>, Ray Jui
 <rjui@broadcom.com>,  Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew
 Lunn <andrew@lunn.ch>,  Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,  Jonathan
 =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Stefan
 Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,  =?ISO-8859-1?Q?Beno=EEt?=
 Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Chanho
 Min <chanho.min@lge.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Linus Walleij <linusw@kernel.org>, Imre Kaloz
 <kaloz@openwrt.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kbuild@vger.kernel.org
Date: Wed, 14 Feb 2024 09:15:14 +1030
In-Reply-To: <20240213-arm-dt-cleanups-v1-2-f2dee1292525@kernel.org>
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
	 <20240213-arm-dt-cleanups-v1-2-f2dee1292525@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_144543_321123_5A218747 
X-CRM114-Status: UNSURE (   8.19  )
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

On Tue, 2024-02-13 at 13:34 -0600, Rob Herring wrote:
> The dtc interrupt_provider warning is off by default. Fix all the warning=
s
> so it can be enabled.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm/boot/dts/amazon/alpine.dtsi                   |  1 -
>  arch/arm/boot/dts/aspeed/aspeed-g4.dtsi                | 14 ------------=
--
>  arch/arm/boot/dts/aspeed/aspeed-g5.dtsi                | 15 +-----------=
---
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi                | 18 ++----------=
------

I wrote a very similar patch just a day or so ago, so thanks :)

For the Aspeed portions:

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

