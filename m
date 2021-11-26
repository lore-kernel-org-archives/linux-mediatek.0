Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1265C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 08:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8+xpOrM/GURbnW+Bd++re5BPGaljwJPaBOoWSgVY6o=; b=0+iRne+bKBIqDu
	UhXxoRedG1n9F/DtxmWyFVgMWgDXxgvFre64XAJ3fOTbm8Pp4qkKuzVp6Luva/CjERA7SNLSmcXna
	/yP62ZovNeEtRRprA/9pLdqyn1A7T2ly53RiN81xGBl0oie77G1yG3QpI6LonUu1AoFcqo9dbyJKa
	YtHh9toRtuR9Ff22xNqza3bdqbkVi6N8BLHNIn8QrF1VCFTAXYTmza5uYzcPk4TmxcpKN0yiWgrAZ
	vEF1fKZTjtJYshkNGociBhszYA/XoY4l/aPkmxLgKeSsPAZ/8qMqlLpFXEAjaYpL+0nV02eqOxhRA
	Sb44vipa/7tAJ8co08Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqWsU-009d8k-OZ; Fri, 26 Nov 2021 08:46:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqWsC-009d4p-Af; Fri, 26 Nov 2021 08:46:25 +0000
X-UUID: ecc2e87727f6474999529b6aa1802fc6-20211126
X-UUID: ecc2e87727f6474999529b6aa1802fc6-20211126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1000093239; Fri, 26 Nov 2021 01:46:22 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Nov 2021 00:46:20 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Nov 2021 16:46:19 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 26 Nov 2021 16:46:19 +0800
Message-ID: <0e8aef6a448cdb068133bf4c29c67da2547063a7.camel@mediatek.com>
Subject: Re: [RFC 12/13] arm64: dts: mt8192: Add apu tinysys
From: Flora.Fu <flora.fu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>, Yong Wu
 <yong.wu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
Date: Fri, 26 Nov 2021 16:46:19 +0800
In-Reply-To: <314442f7-0c89-8696-05c9-871bfddf1821@collabora.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
 <20211023111409.30463-13-flora.fu@mediatek.com>
 <314442f7-0c89-8696-05c9-871bfddf1821@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_004624_415761_6979E894 
X-CRM114-Status: GOOD (  25.32  )
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

On Tue, 2021-10-26 at 17:18 +0200, AngeloGioacchino Del Regno wrote:
> Il 23/10/21 13:14, Flora Fu ha scritto:
> > Add node for APU tinysys.
> > 
> > Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 36
> > ++++++++++++++++++++++++
> >   1 file changed, 36 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index c505c6926839..8108084a3f6f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -925,6 +925,42 @@
> >   			#iommu-cells = <1>;
> >   		};
> >   
> > +		apusys_rv@19001000 {
> > +			compatible = "mediatek,mt8192-apusys-rv";
> > +			reg = <0 0x19000000 0 0x1000>,
> > +			      <0 0x19001000 0 0x1000>,
> > +			      <0 0x19002000 0 0x10>;
> > +			reg-names = "apu_mbox",
> > +				    "md32_sysctrl",
> > +				    "apu_wdt";
> > +			mediatek,apusys-power = <&apusys_power>;
> 
> As said on the IOMMU commit, I think that apusys-power can be passed
> as a
> power domain here as well... also keeping in mind that the apuspm
> power
> domain is being used in both the IOMMU and in apusys-power already,
> so you
> could even pass only the apusys-power pd here, because apuspm would
> be
> already being turned on by the former...
> 
> ...unless there's any possibility to have some functionality with
> apuspm up
> but apusys-power down? From how it looks right now, that's not a
> thing.
> 
OK, we will check it.

> > +			power-domains = <&apuspm 0>;
> > +			iommus = <&iommu_apu IOMMU_PORT_APU_DATA>;
> > +			interrupts = <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH
> > 0>,
> > +				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			interrupt-names = "apu_wdt",
> > +					  "mbox0_irq";
> > +			apu_ctrl {
> > +				compatible = "mediatek,apu-ctrl-rpmsg";
> > +				mtk,rpmsg-name = "apu-ctrl-rpmsg";
> 
> This is supposed to be "mediatek,rpmsg-name" instead... or it won't
> work.
> 
The latest kernel uses "mediatek,rpmsg-name" and I will update the
string in the next submission.

> > +			};
> > +
> > +			apu_pwr_tx {
> > +				compatible = "mediatek,apupwr-tx-
> > rpmsg";
> > +				mtk,rpmsg-name = "apupwr-tx-rpmsg";
> > +			};
> > +
> > +			apu_pwr_rx {
> > +				compatible = "mediatek,apupwr-rx-
> > rpmsg";
> > +				mtk,rpmsg-name = "apupwr-rx-rpmsg";
> > +			};
> > +
> > +			apu_mdw_rpmsg {
> > +				compatible = "mediatek,apu-mdw-rpmsg";
> > +				mtk,rpmsg-name = "apu-mdw-rpmsg";
> > +			};
> > +		};
> > +
> >   		apu_conn: apu_conn@19020000 {
> >   			compatible = "mediatek,mt8192-apu-conn",
> > "syscon";
> >   			reg = <0 0x19020000 0 0x1000>;
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
