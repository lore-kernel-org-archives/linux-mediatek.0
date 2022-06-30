Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467AEC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 09:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06nOTUd3+pPSot6MZ3caaqOLo+OhUPhvuZ8S1145MV4=; b=NL56brQIoamRHmN+dXhfgLIGq1
	WAyWzuXecw+35I15nuowhInf8xpeInCjLYasBqIztjIRs+jtULUMELAWjqxrwTP9nDWWRkFiiMwD/
	vkiM/YH+nz1TmU1UJfSSxaAt9vn7H8aquI24k73SB6UY+ibts+E2eqTqbehx/TjNbHYPRuaG0dpyR
	k+IWrLM11K9KefUfRbwL8EbxyzXTLWmzmNRL1W3PyPI6FQf/OqA6ilbOsZwH9Wv6/WEM9+fR6Yg8B
	6Hl4J+qe8F9azvWN8z0cbAGhonIsakxurVaRfqJdnAc1J+FonlbfYgDNADSlJeZlWe/bBogFnsfJ4
	3FpiP5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6qgh-00GJw6-SQ; Thu, 30 Jun 2022 09:42:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6qgd-00GJsy-Bw; Thu, 30 Jun 2022 09:42:12 +0000
X-UUID: 877d0a9ec6de4e7fb5eca4cb26a9a18a-20220630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:78c5f6b6-2872-4d09-bb4d-33a7099b5a43,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:84020e63-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 877d0a9ec6de4e7fb5eca4cb26a9a18a-20220630
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 74678352; Thu, 30 Jun 2022 02:42:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 30 Jun 2022 17:41:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jun 2022 17:41:31 +0800
Message-ID: <99342f13190cb4ea103c4227e6672eb5cad63b82.camel@mediatek.com>
Subject: Re: [PATCH 3/5] arm64: dts: mt8192: Add display nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@canonical.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Chen-Yu Tsai" <wenst@chromium.org>
Date: Thu, 30 Jun 2022 17:41:31 +0800
In-Reply-To: <20220629232429.c5oysjgy6gflqhct@notapiano>
References: <20220629121358.19458-1-allen-kh.cheng@mediatek.com>
	 <20220629121358.19458-4-allen-kh.cheng@mediatek.com>
	 <20220629232429.c5oysjgy6gflqhct@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_024211_466466_1F0C1152 
X-CRM114-Status: GOOD (  22.51  )
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

Hi Nícolas, 

On Wed, 2022-06-29 at 19:24 -0400, Nícolas F. R. A. Prado wrote:
> On Wed, Jun 29, 2022 at 08:13:56PM +0800, Allen-KH Cheng wrote:
> > Add display nodes and gce info for mt8192 SoC.
> > 
> > GCE (Global Command Engine) properties to the display nodes in
> > order to
> > enable the usage of the CMDQ (Command Queue), which is required for
> > operating the display.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 136
> > +++++++++++++++++++++++
> >  1 file changed, 136 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index a07edc82d403..26d01544b4ea 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> 
> [..]
> >  
> > +		mutex: mutex@14001000 {
> > +			compatible = "mediatek,mt8192-disp-mutex";
> > +			reg = <0 0x14001000 0 0x1000>;
> > +			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			clocks = <&mmsys CLK_MM_DISP_MUTEX0>;
> > +			mediatek,gce-events =
> > <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_0>,
> > +					      <CMDQ_EVENT_DISP_STREAM_D
> > ONE_ENG_EVENT_1>;
> 
> This node is missing power-domains.
> 
> > +		};
> > 
> 
> [..]
> > +		rdma0: rdma@14007000 {
> > +			compatible = "mediatek,mt8192-disp-rdma";
> 
> dtbs_check is complaining that there isn't a "mediatek,mt8183-disp-
> rdma"
> fallback compatible here. But given that the rdma driver matches
> directly to the
> mt8192 compatible, I think the node here is fine, and the binding is
> the one
> that should be updated.
> 

I have checked the binding and driver again.

I prefer use "mediatek,mt8186-disp-rdma" as fallback and remove mt8192
compatible and data in mtk_disp_rdma.c because they are the same with
mt8183.

Do you think it is okay?

Thanks,
Allen


> > +			reg = <0 0x14007000 0 0x1000>;
> > +			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
> > +			iommus = <&iommu0 M4U_PORT_L0_DISP_RDMA0>;
> > +			mediatek,larb = <&larb0>;
> 
> mediatek,larb is no longer used, so drop it.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Thanks,
> Nícolas


