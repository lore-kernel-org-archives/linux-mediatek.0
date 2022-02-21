Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CECC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 13:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kA0vR3HUlahbsiUfJja3imAKyrjFD7WlG+V1kpyPnM=; b=Cv1ki6/uidfe3V
	s9z6+WaeZpF6U9AvbzgBcC4grmBsRWPaNIorZpw572SNH8K0mcFbpjwxxcrKAXYUlapsbk651H+yv
	3i0kcVXCA5x9MSnR3DwJE6cwynVaxmyV/hsg0t2P+ND0ZbD3HcM/EbZKJTn9IV030yYZ4nmAqJxYG
	79XsFbzbKthN/28wchfaUOl9zhAyt3KtTgNbTbw5QBn/XzSZDwF4P/maHxBoJiOXdlQ1KpgYLR06U
	5zudq/yejmiYSEWIAwr4yj2VKs73WTd4qq41YRDAlxlBpeaYNIsvHYslaJYrk2Q2IzsaaapYireOy
	1xA+weVuQ1gZXm2Tilbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8rI-005wwv-Al; Mon, 21 Feb 2022 13:36:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM8CW-005kWB-BW; Mon, 21 Feb 2022 12:54:01 +0000
X-UUID: 47285a7305f54b8abbe321004370ba7a-20220221
X-UUID: 47285a7305f54b8abbe321004370ba7a-20220221
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 555499021; Mon, 21 Feb 2022 05:53:55 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 04:53:53 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 20:53:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 20:53:51 +0800
Message-ID: <59c1e31a788209ece28328e6ea352d14cd354590.camel@mediatek.com>
Subject: Re: [PATCH v2 12/23] arm64: dts: mt8192: Add efuse node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Mon, 21 Feb 2022 20:53:51 +0800
In-Reply-To: <719c23ae-a8b4-5f0d-6be2-483bb82dbce9@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-13-allen-kh.cheng@mediatek.com>
 <719c23ae-a8b4-5f0d-6be2-483bb82dbce9@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_045400_456636_9B6A1CFF 
X-CRM114-Status: GOOD (  15.25  )
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
> > Add efuse node for mt8192 SoC
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index f51fd0f6c356..094805db395b 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -939,6 +939,20 @@
> >   			status = "disabled";
> >   		};
> >   
> > +		efuse: efuse@11c10000 {
> > +			compatible = "mediatek,efuse";
> > +			reg = <0 0x11c10000 0 0x1000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +
> > +			lvts_e_data1: data1 {
> 
> 			lvts_e_data1: lvts_data1@1c0 {
> 				reg = <0x1c0 0x58>;
> 
> Please write hex with lower case characters.

Hi Angelo,

Sorry for my neglect and will correct this in next version

Many thanks,
Allen

> 
> > +				reg = <0x1C0 0x58>;
> > +			};
> > +			svs_calibration: calib@580 {
> > +				reg = <0x580 0x68>;
> > +			};
> > +		};
> > +
> >   		i2c3: i2c@11cb0000 {
> >   			compatible = "mediatek,mt8192-i2c";
> >   			reg = <0 0x11cb0000 0 0x1000>,
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
