Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB14DC47DAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 17:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSKAYF9IlX95zipvf0YSfJnTfG2ghF6yU76cWzKEMrU=; b=qiTS/Ef6tiB1zAPlPL14mO8fUZ
	DMXrwg3hS7BbieL3I5uubeO1XWneoS7LAXPjEAwSLDt62dN8TYsQJukUuI6qNZy11uNZzps5vK1JC
	IQLf4QvVFurKYB8TjRfzFKDbzNNu0GTB8duIlQ5qFu7eWUIFXrOj0buUdMGajiiI2lthieTNOsNRt
	njJikWFKDVb2dkGq/BEtU4B2le2tPZDnGW24cZiaf9aDs6Wjv83T/i08IRx8DLKAU0I6OzukdB+4U
	krnrTg5TxgRSBqY7zsna3FFiR3GZOk8yJRR3a6xcQOpdfjPiAcFTut7yJYxQpuZB1kd6BauNYLUo0
	UlzE+wag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRy4w-00DDpZ-2W;
	Mon, 22 Jan 2024 17:27:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRy4t-00DDnD-0k;
	Mon, 22 Jan 2024 17:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=wSKAYF9IlX95zipvf0YSfJnTfG2ghF6yU76cWzKEMrU=; b=OP
	XwlR+s3tYyiMnAuHZeUMC0NgdVyHMwJHz+EXNQn0HiJN/iPHPx/LTEnFdlIEHlQEEhHmbH/QSGyjD
	tbEbEdubSV1aYnmlgzjHQIluTIxYdODhohY1AzSEmnb0pEmfnuFRXgWkEsohIDXFxPseJuRFhqvsh
	QbgyhLla6bf+eBA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rRy4e-005kPU-JS; Mon, 22 Jan 2024 18:27:04 +0100
Date: Mon, 22 Jan 2024 18:27:04 +0100
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
Message-ID: <5d36f465-a9fc-434d-a777-bc9833f7d6ba@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556FA040B07F48AFE544680C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <b8510b38-3669-4a04-9ca6-dbe937ecbec3@lunn.ch>
 <TYZPR01MB5556603EA4C5D7BAF9C27C6AC9752@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYZPR01MB5556603EA4C5D7BAF9C27C6AC9752@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_092719_269669_4F1E8C7C 
X-CRM114-Status: GOOD (  26.11  )
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

On Mon, Jan 22, 2024 at 11:52:30PM +0800, Ziyang Huang wrote:
> 在 2024/1/22 0:45, Andrew Lunn 写道:
> > On Sun, Jan 21, 2024 at 08:42:36PM +0800, Ziyang Huang wrote:
> > > Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/ipq5018.dtsi | 120 +++++++++++++++++++++++++-
> > >   1 file changed, 116 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> > > index e502a3ecf4b7..b36e5c2136b7 100644
> > > --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> > > @@ -94,6 +94,63 @@ soc: soc@0 {
> > >   		#size-cells = <1>;
> > >   		ranges = <0 0 0 0xffffffff>;
> > > +		mdio0: mdio@88000 {
> > > +			#address-cells = <1>;
> > > +			#size-cells = <0>;
> > > +			compatible = "qcom,ipq5018-mdio", "qcom,qca-mdio";
> > > +			reg = <0x88000 0x64>;
> > > +			resets = <&gcc GCC_GEPHY_MDC_SW_ARES>,
> > > +				 <&gcc GCC_GEPHY_DSP_HW_ARES>;
> > 
> > What do these two resets do? An MDIO bus controller is unlikely to
> > have a DSP in it. That is something a PHY is more likely to have. An
> > MDIO bus controller does have an MDC line, but why is it
> > GCC_GEPHY_MDC_SW_ARES not GCC_MDIO_MDC_SW_ARES? So this again makes me
> > think this is a PHY reset, so should be in the PHY node.
> > 
> 
> IPQ5018 has two mdio bus. mdio0 is an internal bus which only connects to
> internal PHY while mdio1 is outgoing and can be used to connect PHY or
> switch.
> 
> So I thought GCC_GEPHY_MDC_SW_ARES is for mdio0 and GCC_MDIO_MDC_SW_ARES is
> for mdio1.
> 
> GCC_GEPHY_DSP_HW_ARES is seem like PHY reset. But if we don't deassert it,
> the phy node can't be scaned. So I add it here like what reset-gpios do - to
> reset PHY or switch.
> 
> > A device tree binding will help sort this out.
> 
> Base on the functions I explained, I can't write the accurate names and
> number of resets here.

Without a device tree binding, your patch will not be accepted. At
minimum, you need to describe your understanding of the hardware, what
you think the resets do.

Since this is an internal PHY, you know exactly what it is. So you can
use ID values in the compatible so the driver loads. The driver can
then deal with clocks and resets. With complex setups like this,
scanning is not always possible.

     Andrew

