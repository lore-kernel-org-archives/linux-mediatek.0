Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2105C61DF4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 03:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xptzas81N17YCuuLxBooSV9D0A5Kbw2K/uN1U+PXfjw=; b=lFDGzAltrqa130bV0VYlgD881y
	Rc1GbJLC+s1GPMJ+EI8QYJ0fN1Q+RrYipLPYyjAKaYEJwUcCt5PWbeCRupP+EvvdoL/8hKqphaAh6
	A341gWvRWWdDKA4UK9Ys3qFsLfYGhskzr/SzckZOPlBrhAD0xMoTFujn5/lEfo/Jx4dhRZbuzmYxP
	AN12LaTTOLueVVpnJ5/4L8iAy9bS18rlLaMMnm8x/eVR0KUNd+FDttsqG5kR2L26btwko8aDp/a33
	4UpwWSMEQniKJSnsQ+zeTJYzqvKS9ZOWLucGLBA22CD50IAGHCQ0vycJC57B497oF6LlxrBg0XKiy
	I00Yn2Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5zyc-003d6l-0h;
	Thu, 23 Nov 2023 03:02:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5zyY-003d5g-31;
	Thu, 23 Nov 2023 03:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Xptzas81N17YCuuLxBooSV9D0A5Kbw2K/uN1U+PXfjw=; b=rUhUJQzTP+xMnrOSIku0+NXS9e
	Vwx/yg9ArH/c7A/Hi97odu9Rty203sOPxQXXqHB8k+uJkoz6Jn6LRa5jL/aFAHtZpFI2e2AtHZ2Cb
	+WS/q/1vBCfgD+sp4sQuD362kTCVDKhoe31BMaeB8SMr1rrcM6TlTkqzK85s7wAbgJ4Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r5zyH-000w18-Cr; Thu, 23 Nov 2023 04:01:41 +0100
Date: Thu, 23 Nov 2023 04:01:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 11/14] dt-bindings: net: add QCA807x PHY
 defines
Message-ID: <e2e74e27-eb55-408e-8d0d-7fb15ebd13f9@lunn.ch>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-12-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120135041.15259-12-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_190159_013856_0B3F97FA 
X-CRM114-Status: GOOD (  17.74  )
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

On Mon, Nov 20, 2023 at 02:50:38PM +0100, Christian Marangi wrote:
> From: Robert Marko <robert.marko@sartura.hr>
> 
> Add DT bindings defined for Qualcomm QCA807x PHY series related to
> calibration and DAC settings.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  include/dt-bindings/net/qcom-qca807x.h | 45 ++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 include/dt-bindings/net/qcom-qca807x.h
> 
> diff --git a/include/dt-bindings/net/qcom-qca807x.h b/include/dt-bindings/net/qcom-qca807x.h
> new file mode 100644
> index 000000000000..42c45c7d5210
> --- /dev/null
> +++ b/include/dt-bindings/net/qcom-qca807x.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Device Tree constants for the Qualcomm QCA807X PHYs
> + */
> +
> +#ifndef _DT_BINDINGS_QCOM_QCA807X_H
> +#define _DT_BINDINGS_QCOM_QCA807X_H
> +
> +#define PSGMII_QSGMII_TX_DRIVER_140MV	0
> +#define PSGMII_QSGMII_TX_DRIVER_160MV	1
> +#define PSGMII_QSGMII_TX_DRIVER_180MV	2
> +#define PSGMII_QSGMII_TX_DRIVER_200MV	3
> +#define PSGMII_QSGMII_TX_DRIVER_220MV	4
> +#define PSGMII_QSGMII_TX_DRIVER_240MV	5
> +#define PSGMII_QSGMII_TX_DRIVER_260MV	6
> +#define PSGMII_QSGMII_TX_DRIVER_280MV	7
> +#define PSGMII_QSGMII_TX_DRIVER_300MV	8
> +#define PSGMII_QSGMII_TX_DRIVER_320MV	9
> +#define PSGMII_QSGMII_TX_DRIVER_400MV	10
> +#define PSGMII_QSGMII_TX_DRIVER_500MV	11
> +/* Default value */
> +#define PSGMII_QSGMII_TX_DRIVER_600MV	12

Its not clear what these are used for. I think these are actually
package properties, so having the correctly documented in the binding
would help a lot understand why we need package properties.

Actually using #define like this is probably wrong. You should just
have a u32 tx_driver_mv property, and list [140, 160, 180, 200,
... 600] as valid values. The driver should then convert to whatever
value it should write into the register.

      Andrew

