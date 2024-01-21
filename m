Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8293C47422
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jan 2024 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHOFZcuTxHKtAFe+5SXsdTjosX9ZtBXP8Ft5m35WZew=; b=dsHuwh7qc7OCJZJMmdfFe+pjba
	OzWH/h7tBwTKC4XDeWpaCLWh2t9LGgPlTHfFZOj3bs8AY5CwvUNNUGH2QiCCYMH4rZ1QcU4o9ZY6s
	HtlYrjmddmxRnFtKizkFh07nUMCn9bGJhLakee9szhNgGeQnBBUSgUH91Jd2D2EO3PUTEkqE+dMXD
	hhhc+8xZpLrOE48QOvqbx4EpfymfQabV0GRxLg/9e101SYUuNKwf8soEisXCkwLrv++F6Vd6RQflF
	MJyFMeIz0xpNRO5lQNtB11JNyii8dGcqrTC2LFYo8JwF0CQ3yf0xrSr7PiHCQoa9LW6nRCDL85shl
	k5jk57+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRaxZ-009kyG-2S;
	Sun, 21 Jan 2024 16:46:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRaxT-009kxd-2X;
	Sun, 21 Jan 2024 16:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BHOFZcuTxHKtAFe+5SXsdTjosX9ZtBXP8Ft5m35WZew=; b=rJIjmPmDd+Ls+Hr9hu4nE6G5vU
	P+4nn6S6zoEq1QaRKrNmnKbBQXlQey7L64fNlXwpar8zVrsIuvXfct4SNX8HYYHQAgtCRlWpTb3TX
	Xz83hyOOws5wjAE37qqzF+/NYHSoLWQkvgf181YS+chDM4AVLVSjvgD9j5zGdoDcluZw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rRaxL-005f5v-RN; Sun, 21 Jan 2024 17:45:59 +0100
Date: Sun, 21 Jan 2024 17:45:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	richardcochran@gmail.com, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 7/8] arm64: dts: qcom: ipq5018: enable ethernet support
Message-ID: <b8510b38-3669-4a04-9ca6-dbe937ecbec3@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556FA040B07F48AFE544680C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR01MB5556FA040B07F48AFE544680C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_084607_827173_1889632B 
X-CRM114-Status: GOOD (  13.56  )
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

On Sun, Jan 21, 2024 at 08:42:36PM +0800, Ziyang Huang wrote:
> Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 120 +++++++++++++++++++++++++-
>  1 file changed, 116 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index e502a3ecf4b7..b36e5c2136b7 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -94,6 +94,63 @@ soc: soc@0 {
>  		#size-cells = <1>;
>  		ranges = <0 0 0 0xffffffff>;
>  
> +		mdio0: mdio@88000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "qcom,ipq5018-mdio", "qcom,qca-mdio";
> +			reg = <0x88000 0x64>;
> +			resets = <&gcc GCC_GEPHY_MDC_SW_ARES>,
> +				 <&gcc GCC_GEPHY_DSP_HW_ARES>;

What do these two resets do? An MDIO bus controller is unlikely to
have a DSP in it. That is something a PHY is more likely to have. An
MDIO bus controller does have an MDC line, but why is it
GCC_GEPHY_MDC_SW_ARES not GCC_MDIO_MDC_SW_ARES? So this again makes me
think this is a PHY reset, so should be in the PHY node.

A device tree binding will help sort this out.


    Andrew

---
pw-bot: cr

