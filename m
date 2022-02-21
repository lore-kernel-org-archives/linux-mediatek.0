Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDC3C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 13:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tVHsCuACmh5Bgx6EDxJcUp/CeVOCBxS9my5E9RyC84=; b=GkaKPSVxZIMv5L
	vVmt+o2+uV2LcvEzL5XOdwZS6RqA6YVEO81aG/hmHl2D1aCg+HWTPhrikVDC6u7B7Uw9A+4QQ2G6F
	LSTSnWxWWO+jjT+EuMVrqCSLVeiNL+CrvrsEb9SHjiJuTzIKtO/9R9nBwTYaY9erV1ovpw98lH6hD
	uR8SkR3Hnx5QcqOFzILsuD5Rg48ZZ6OI1tk64kcdSfwXwmlPp+kxNZ1Yb9K6IlTXIE7ZHKJ0lOBFi
	xFz0IsnRelFvIVD86+00MeezZZO50hTVWq0Ok4kooSUgFuZmCVAyLdt1lQpDOJgqAoEOP/couY7x1
	vVrVL1+HdK/f6/SvYatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8lC-005uvB-Tc; Mon, 21 Feb 2022 13:29:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM821-005iHY-SG; Mon, 21 Feb 2022 12:43:11 +0000
X-UUID: 9cff4caf9f5141e9b0297c4104b9f1ca-20220221
X-UUID: 9cff4caf9f5141e9b0297c4104b9f1ca-20220221
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1466655408; Mon, 21 Feb 2022 05:43:08 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 04:43:06 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 21 Feb 2022 20:43:05 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 20:43:04 +0800
Message-ID: <0b964d340774bd697b8ab656712a4bda6fd59438.camel@mediatek.com>
Subject: Re: [PATCH v2 14/23] arm64: dts: mt8192: Add mipi_tx node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Mon, 21 Feb 2022 20:43:05 +0800
In-Reply-To: <7ca84242-6abc-7598-89c2-c44e63026b03@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-15-allen-kh.cheng@mediatek.com>
 <7ca84242-6abc-7598-89c2-c44e63026b03@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_044309_976720_2FE77DBB 
X-CRM114-Status: GOOD (  18.05  )
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
> > Add mipi_tx node for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index cfc2db501108..f5e5af949f19 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -1114,6 +1114,16 @@
> >   			};
> >   		};
> >   
> > +		mipi_tx0: mipi-dphy@11e50000 {
> > +			compatible = "mediatek,mt8183-mipi-tx";
> > +			reg = <0 0x11e50000 0 0x1000>;
> > +			clocks = <&apmixedsys CLK_APMIXED_MIPID26M>;
> > +			clock-names = "ref_clk";
> > +			#clock-cells = <0>;
> > +			#phy-cells = <0>;
> > +			clock-output-names = "mipi_tx0_pll";
> 
> Please, disable this node by default, as this is something that may
> be
> enabled for some machine, but disabled for the other.
> 
> 			status = "disabled";
> 

Hi Angelo,

Thank you for your suggestion.

I will add disabled status for mipi_tx node.


Best regards,
Allen

> > +		};
> > +
> >   		i2c0: i2c@11f00000 {
> >   			compatible = "mediatek,mt8192-i2c";
> >   			reg = <0 0x11f00000 0 0x1000>,
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
