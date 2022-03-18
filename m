Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF0FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 12:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBBDaOGCcA88rJq+uIQmv3tI+FwYo/sVi1oqqwtXp4Y=; b=5DxM75z4K1qs9V
	UuUiHD2ocrHlSFZwOOfrWtNdps6fP4xUqV8sPGvwrCq/K6qNjxk3n/5B/s/3kWKhZ9dtuFmZyd3Da
	RGnstdcM2Pmc/uyNf0rwc9GyMewTaKf2MfJziaWcNYl0capxwOPnd2lmYj2DiXTmaCJmc65SzhHrS
	fsuiVewQ2HMnNM39vgVyct2MKyZeDer9qDod/9MKRyAs5mndyIf9lsRmNbx0sVevKKjM3pfWktxjd
	r/BJ0gb2p629ES4GPdgIFWieXZv8Jl2ynK9HsWyEVCylI6BbOHDGkB1TSNQbP46421YMFXctWsOBZ
	Lrsdv49lbMjGKQmnbV2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVBmd-001aaX-NC; Fri, 18 Mar 2022 12:32:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVBmZ-001aZS-MT; Fri, 18 Mar 2022 12:32:42 +0000
X-UUID: 07cdc904925d4eeea7cc19a40aa0fdae-20220318
X-UUID: 07cdc904925d4eeea7cc19a40aa0fdae-20220318
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 460829865; Fri, 18 Mar 2022 05:32:36 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 05:22:34 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 18 Mar 2022 20:22:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 20:22:20 +0800
Message-ID: <d9e15033a4f42e8ecd7ea69089b7b43955abd16c.camel@mediatek.com>
Subject: Re: [PATCH v3 16/21] arm64: dts: mt8192: Add vcodec lat and core nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>
Date: Fri, 18 Mar 2022 20:22:20 +0800
In-Reply-To: <c47d6a99-e59e-97cf-a803-af2b307ed1d1@collabora.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
 <20220304130809.12924-17-allen-kh.cheng@mediatek.com>
 <c47d6a99-e59e-97cf-a803-af2b307ed1d1@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_053239_768430_978E0610 
X-CRM114-Status: GOOD (  15.27  )
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

Hi Angelo,

On Tue, 2022-03-15 at 15:39 +0100, AngeloGioacchino Del Regno wrote:
> Il 04/03/22 14:08, Allen-KH Cheng ha scritto:
> > Add vcodec lat and core nodes for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 58
> > ++++++++++++++++++++++++
> >   1 file changed, 58 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index ac69033737bb..5fd1fed354d0 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -1285,6 +1285,64 @@
> >   			power-domains = <&spm
> > MT8192_POWER_DOMAIN_ISP2>;
> >   		};
> >   
> > +		vcodec_dec: vcodec-dec@16000000 {
> > +			compatible = "mediatek,mt8192-vcodec-dec";
> > +			reg = <0 0x16000000 0 0x1000>;	/* VDEC_SYS
> > */
> > +			mediatek,scp = <&scp>;
> > +			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> 
> Hello Allen-KH,
> 
> please, use ranges whenever possible. Example:
> 
> 			ranges = <0 0 0 0x16000000 0 0x26000>;
> 
> 			vcodec-lat@1000 {
> 				reg = <0 0x1000 0 0x800>;
> 				.......
> 
> 			};
> 
> 			vcodec-core@25000 {
> 				reg = <0 0x25000 0 0x1000>;
> 				.......
> 			};
> 

NO problem, I will update this.

Thanks,
Allen

> Thanks,
> Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
