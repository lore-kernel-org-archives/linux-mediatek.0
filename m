Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704E0C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 08:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXEyPaTCrLxGpSY/5IgutvS9DnC8wiZbTJnfp0Z5oLk=; b=Qx/4JPgpbALT3bR41nd0wg1ezU
	MFwZuu8f+VgCkiLKCFwCc34CIu5nQ7bO1djA8077RGFqzQc/KOWF+nMnQTGVxfc/gBtFSLDz1H5tP
	FCmr0FliSJNmqQnuVK7fr3OjgqIKn9fS2IMN/zIWu6bvNhCZnb5eNX3YkQNO1FX43jGJzl4WbwTL+
	GSu08GWVOjQmyrsMDhiEHznE6gMEg50JrEC64rj59X/yWmAHm6aYX0ZsmG0+JuYSWXHXcJCJ6ZXNU
	+5kGODS0JuJdx30APfOLrJddtIZ82Jt2AEXbNIY+KrGsZHQjaham5narZ+caLoVLb9hZqQYSPftVF
	W3DOPwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol4aK-00GdCP-U0; Wed, 19 Oct 2022 08:37:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol4aD-00Gd4D-Rb; Wed, 19 Oct 2022 08:37:51 +0000
X-UUID: 59a8ba7683bc4d7c9e7bdf0e329eac14-20221019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=VXEyPaTCrLxGpSY/5IgutvS9DnC8wiZbTJnfp0Z5oLk=;
	b=H3jy3jdr9uCQ3VXN6SO1gA7LGwtCgbwgbU8Yavzn38a20dHoJ3p5t02rCBt55+NzqVvrYRN0qjh55+TOMoEBOaWMCHp/6cABbzFe42C+jhD0LsX8xmOX16IHnfsjx6Q17k5Dgy6DFJ6MJgbzHWZnlRoIMdu6l93sZw2CU9K+I94=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:748bb564-65f8-4761-a22f-f71712bda4e2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:d57e47a3-73e4-48dd-a911-57b5d5484f14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 59a8ba7683bc4d7c9e7bdf0e329eac14-20221019
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1883620134; Wed, 19 Oct 2022 01:37:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 19 Oct 2022 16:37:02 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 19 Oct 2022 16:37:02 +0800
Message-ID: <8c04c2f898ecc1466c3f14eace30762956c83885.camel@mediatek.com>
Subject: Re: [PATCH] arm64: dts: mt8195: Add Ethernet controller
From: Biao Huang <biao.huang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<macpaul.lin@mediatek.com>
Date: Wed, 19 Oct 2022 16:37:02 +0800
In-Reply-To: <37fff2b8-a798-dea3-c010-714a2bac695f@linaro.org>
References: <20221017095834.7675-1-biao.huang@mediatek.com>
	 <d6bda69e-d331-3e64-2100-d41e84c3fab7@linaro.org>
	 <b5d18b4b631cb19d435f37ccacd296a2282c2a1a.camel@mediatek.com>
	 <37fff2b8-a798-dea3-c010-714a2bac695f@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_013749_943896_664649FB 
X-CRM114-Status: GOOD (  35.03  )
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

Dear Krzysztof,
	Thanks for your comments~

On Tue, 2022-10-18 at 08:51 -0400, Krzysztof Kozlowski wrote:
> On 18/10/2022 02:37, Biao Huang wrote:
> > Dear Krzysztof,
> > 	Thanks for your comments!
> > 
> > On Mon, 2022-10-17 at 22:01 -0400, Krzysztof Kozlowski wrote:
> > > On 17/10/2022 05:58, Biao Huang wrote:
> > > > Add Ethernet controller node for mt8195.
> > > > 
> > > > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > > > ---
> > > >  arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 88
> > > > ++++++++++++++++++++
> > > >  arch/arm64/boot/dts/mediatek/mt8195.dtsi     | 87
> > > > +++++++++++++++++++
> > > >  2 files changed, 175 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > > > b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > > > index 4fbd99eb496a..02e04f82a4ae 100644
> > > > --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > > > +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > > > @@ -258,6 +258,72 @@ &mt6359_vsram_others_ldo_reg {
> > > >  };
> > > >  
> > > >  &pio {
> > > > +	eth_default: eth_default {
> > > 
> > > No underscores in node names. Please also be sure your patch does
> > > not
> > > bring new warnings with `dtbs_check` (lack of suffix above could
> > > mean
> > > it
> > > brings...)
> > 
> > OK, I'll fix the underscores issue in next send.
> > As to "lack of suffix" issue, do you mean I should write it like:
> > 	eth-default: eth-default@0 {
> 
> I don't know whether you should have here suffix or not - please
> check
> your bindings. Several pinctrl bindings require suffixes (or
> prefixes),
> thus I asked.
> 
> BTW, In the label you must use underscore.
OK, I'll check the pinctrl-mt8195.yaml, and modify the eth related
node.
> 
> > 		...
> > 	}
> > If yes, other nodes in current file don't have such suffix.
> > e.g.
> > 	gpio_keys_pins: gpio-keys-pins
> > 
> > Should I keep unified style with other nodes?
> 
> Check what bindings are requiring.
OK.
> 
> > > 
> > > > +		txd_pins {
> 
> (...)
> 
> > > > +
> > > > +		eth: ethernet@11021000 {
> > > > +			compatible = "mediatek,mt8195-gmac",
> > > > "snps,dwmac-5.10a";
> > > > +			reg = <0 0x11021000 0 0x4000>;
> > > > +			interrupts = <GIC_SPI 716
> > > > IRQ_TYPE_LEVEL_HIGH
> > > > 0>;
> > > > +			interrupt-names = "macirq";
> > > > +			mac-address = [00 55 7b b5 7d f7];
> > > 
> > > How is this property of a SoC? Are you saying now that all MT8195
> > > SoCs
> > > have the same MAC address?
> > 
> > The mac-address here is taken as a default mac address in eth
> > driver
> > rather than a randome one.
> > Actually, there will be a tool to customize eth mac address (e.g
> > through "ifconfig eth0 hw ether xx:xx:xx:xx:xx:xx"), so every
> > MT8195 SoCs will get their specified mac address in real product.
> 
> So this means this is not one MAC address for all SoCs, so this does
> not
> belong to DTSI. Actually it doesn't belong to DTS either. Look how
> others are doing...
OK, will remove it in next send.
> 
> 
> Best regards,
> Krzysztof
> 


