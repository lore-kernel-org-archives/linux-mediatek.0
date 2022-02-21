Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CF8C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 13:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/Zm/5Lg97zD391YksldC4HVI/MNxWu0rsidTh7lU7w=; b=FSgolaHA/jh6E2
	Z/L4l5a7/3vCg7np3aHvWJKWBUqj2mMhBGOwqnNDI1fbhF0gcj4o8I7vKR2NP/LH+ut/k8EiSVVty
	re5E/8XN01PzvdPGFqMPOSZzNLQSO8wEb3Bn2vL4sgKknWlBNLyLIsEDI1xiChgHhAY+1ElanbHkY
	JFzcH+eTa4TUQQDj4oJVOu4g30EAMEFiI02Eo7a52tIJhea3pTELdGPKoYNuW8noBolG2GBhrPmC3
	bzqpkIRB/C51IXs5tRP1BnBhLTD5hlZzzxvz1gObRw4TX54db4/nBsfr1IgqKI8WEmcO8Dy+75yzh
	S5U1kIhl8sr0EjfUKggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8jO-005uND-PM; Mon, 21 Feb 2022 13:27:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7wv-005grb-QI; Mon, 21 Feb 2022 12:37:56 +0000
X-UUID: b74fd27511bb4781af50d2e55cc21379-20220221
X-UUID: b74fd27511bb4781af50d2e55cc21379-20220221
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1061601648; Mon, 21 Feb 2022 05:37:47 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 04:37:45 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 21 Feb 2022 20:37:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 20:37:31 +0800
Message-ID: <8f8422a1b1d26e88268174eba179f0b92ccb48e2.camel@mediatek.com>
Subject: Re: [PATCH v2 05/23] arm64: dts: mt8192: Add SCP node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Mon, 21 Feb 2022 20:37:31 +0800
In-Reply-To: <932bb7da-fc2e-4562-a0fc-308a7c19343e@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-6-allen-kh.cheng@mediatek.com>
 <932bb7da-fc2e-4562-a0fc-308a7c19343e@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_043753_940351_9EE7EAFF 
X-CRM114-Status: GOOD (  15.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2022-02-18 at 13:55 +0100, AngeloGioacchino Del Regno wrote:
> Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> > Add SCP node for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index f92d8d7afa5d..61aadd7bd397 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -706,6 +706,18 @@
> >   			status = "disabled";
> >   		};
> >   
> > +		scp: scp@10500000 {
> > +			compatible = "mediatek,mt8192-scp";
> > +			reg = <0 0x10500000 0 0x100000>,
> > +			    <0 0x10700000 0 0x8000>,
> > +			    <0 0x10720000 0 0xe0000>;
> 
> Please fix indentation:
> 			reg = <0 0x10500000 0 0x100000>,
> 			      <0 0x10700000 0 0x8000>,
> 			      <0 0x10720000 0 0xe0000>;
> 
> 

Hi Angelo,

Thanks for your reminding ,I will correct this in next version.

Thanks.
Allen

> 
> > +			reg-names = "sram", "l1tcm", "cfg";
> > +			interrupts = <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			clocks = <&infracfg CLK_INFRA_SCPSYS>;
> > +			clock-names = "main";
> > +			status = "disabled";
> > +		};
> > +
> >   		nor_flash: spi@11234000 {
> >   			compatible = "mediatek,mt8192-nor";
> >   			reg = <0 0x11234000 0 0xe0>;
> 
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
