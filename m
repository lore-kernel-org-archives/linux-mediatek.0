Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5BEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 13:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ve7zU2aJirVi0M1qE1u4eAqRJjjb3aWa5dxZJkc387U=; b=ntXa//gMwTJzv7
	Qlz+ZdaIa0J3MDY0tUTC+WmB0X19SkngnlMLeOnfAoIk4lK/rw9rSBAZZtCA3DRvLUBvRch1pt0Sz
	eNGKG0LTdX5/V2nG2Msx8LxECx6FdA70QjE4keIzorEBfS0xkWRhQ5nN7VLezOWH93yIHp/fIMeZ1
	AwR6HfBhMznHbcxSiNlALOMvzDbT/9HM4G09+1UByNE50HVvLH0AlKdQrxbG2JyceHxUysm1zfV/F
	ITGxW1Dqym+txkhiDmret1VxyH37YxVQ0A9kwo3wYM2CxD+Gnt0rz2bQP+saUMjxzO47kcTDADJjs
	nGLzgltwzQexvDUbCJBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8vX-005yUA-KG; Mon, 21 Feb 2022 13:40:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM8Sg-005ojd-F8; Mon, 21 Feb 2022 13:10:44 +0000
X-UUID: a2e47522b35c4dae95038e6d0a8cc731-20220221
X-UUID: a2e47522b35c4dae95038e6d0a8cc731-20220221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 846233884; Mon, 21 Feb 2022 06:10:37 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 05:00:35 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 21:00:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 21:00:33 +0800
Message-ID: <8bfd46477e482e0979f30f9a68005a464ce2739e.camel@mediatek.com>
Subject: Re: [PATCH v2 06/23] arm64: dts: mt8192: Add usb-phy node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Mon, 21 Feb 2022 21:00:33 +0800
In-Reply-To: <7ce0bf47-b0c9-b6e6-92f3-b7a11b3adfd5@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-7-allen-kh.cheng@mediatek.com>
 <7ce0bf47-b0c9-b6e6-92f3-b7a11b3adfd5@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_051042_614288_A3F700A2 
X-CRM114-Status: GOOD (  16.31  )
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
> > Add xhci node for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 25
> > ++++++++++++++++++++++++
> >   1 file changed, 25 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 61aadd7bd397..ce18d692175f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -875,6 +875,31 @@
> >   			#clock-cells = <1>;
> >   		};
> >   
> > +		u3phy0: usb-phy@11e40000 {
> > +			compatible = "mediatek,mt8192-tphy",
> > +				     "mediatek,generic-tphy-v2";
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			ranges;
> 
> This can be better:
> 			#address-cells = <1>;
> 
> 			#size-cells = <1>;
> 			ranges = <0 0 0x11e40000 0x1000>
> 
> 

Hi Angelo,

Thanks for your surgestion, this's good for me,

I will update in next version.

Best regards,
Allen


> > +			status = "okay";
> > +
> > +			u2port0: usb-phy@11e40000 {
> 
> 			u2port0: usb-phy@0 {
> 
> > +				reg = <0 0x11e40000 0 0x700>;
> 
> 				reg = <0x0 0x700>;
> 
> > +				clocks = <&clk26m>;
> > +				clock-names = "ref";
> > +				#phy-cells = <1>;
> > +				status = "okay";
> > +			};
> > +
> > +			u3port0: usb-phy@11e40700 {
> > +				reg = <0 0x11e40700 0 0x900>;
> 
> 			u3port0: usb-phy@700 {
> 				reg = <0x700 0x900>;
> 
> > +				clocks = <&clk26m>;
> > +				clock-names = "ref";
> > +				#phy-cells = <1>;
> > +				status = "okay";
> > +			};
> > +		};
> > +
> >   		i2c0: i2c@11f00000 {
> >   			compatible = "mediatek,mt8192-i2c";
> >   			reg = <0 0x11f00000 0 0x1000>,
> 
> Thanks,
> Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
