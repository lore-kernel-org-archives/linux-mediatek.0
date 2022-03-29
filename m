Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86739C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 07:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89JxAPkYbwva6chAbU4VscBYvGH55lCTxEcs2A8YIzw=; b=GbxUS0P2NYQM+E
	8gcD9SErKmF1m+N2LJFAvuuqL0I8E4eb6ZSa8GXvPY074/0GWxnQ4Tb6L31Q2qjdN9xwg+Gv89Was
	UtjCgpJD6RDe8BpoMyugxQGOwHd0ABdKxRESO5NFllbGwKS2lrujJKPTYLxnDOvt7BvZ6TFsXoYHS
	UfHG93cU734X+qV3CN8zFHw2ajiHc7uLQrxRr67iUyk1sBc84P+iox10wbr7TeqUfIEGsmgIYIoIY
	K08/PXnJF78sxSNqHo4SX1Zc18wbfymwmtjJTlet/cXanjmZhf0CkIOFRgDHHpVeNz2MvGDoVJTUl
	0kb13RhBYwER5ivrczHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ5sT-00BFvb-7K; Tue, 29 Mar 2022 07:02:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ5sQ-00BFuK-In; Tue, 29 Mar 2022 07:02:52 +0000
X-UUID: 90bcc4c7f5d74c108cfc161d234899c8-20220329
X-UUID: 90bcc4c7f5d74c108cfc161d234899c8-20220329
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 781391754; Tue, 29 Mar 2022 00:02:46 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 00:02:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 15:02:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Mar 2022 15:02:42 +0800
Message-ID: <ea9f853631242d0eee25bd10211560b1a38e46c9.camel@mediatek.com>
Subject: Re: [PATCH v4 21/22] arm64: dts: mt8192: Add gce info for display
 nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>
Date: Tue, 29 Mar 2022 15:02:42 +0800
In-Reply-To: <c62c29d1-e373-a0f2-482b-98c70cf22b4b@gmail.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-22-allen-kh.cheng@mediatek.com>
 <c62c29d1-e373-a0f2-482b-98c70cf22b4b@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_000250_661094_0EFCA76B 
X-CRM114-Status: GOOD (  19.66  )
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

Hi

On Mon, 2022-03-28 at 13:06 +0200, Matthias Brugger wrote:
> 
> On 18/03/2022 15:45, Allen-KH Cheng wrote:
> > Add gce info for display nodes
> > - It's required to get drivers' CMDQ support
> > 
> 
> What keeps us from adding that in the display nodes in patch 18/22 of
> this 
> series? When doing so, please mention in the commit message that we
> then need to 
> add the GCE to the mmsys node.
> 
> Regards,
> Matthias
> 

There is no particular reason for this patch.

I will squash this patch into 18/22([PATCH v4 18/22] arm64: dts:
mt8192: Add display nodes)


Thanks,
Allen

> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 08e0dd2483d1..f0f0f067c023 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -1203,6 +1203,9 @@
> >   		mmsys: syscon@14000000 {
> >   			compatible = "mediatek,mt8192-mmsys", "syscon";
> >   			reg = <0 0x14000000 0 0x1000>;
> > +			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST 1>,
> > +				 <&gce 1 CMDQ_THR_PRIO_HIGHEST 1>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0 0x1000>;
> >   			#clock-cells = <1>;
> >   			#reset-cells = <1>;
> >   		};
> > @@ -1212,6 +1215,8 @@
> >   			reg = <0 0x14001000 0 0x1000>;
> >   			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> >   			clocks = <&mmsys CLK_MM_DISP_MUTEX0>;
> > +			mediatek,gce-events =
> > <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_0>,
> > +					      <CMDQ_EVENT_DISP_STREAM_D
> > ONE_ENG_EVENT_1>;
> >   		};
> >   
> >   		smi_common: smi@14002000 {
> > @@ -1253,6 +1258,7 @@
> >   			iommus = <&iommu0 M4U_PORT_L0_OVL_RDMA0>,
> >   				 <&iommu0 M4U_PORT_L0_OVL_RDMA0_HDR>;
> >   			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0x5000 0x1000>;
> >   		};
> >   
> >   		ovl_2l0: ovl@14006000 {
> > @@ -1263,6 +1269,7 @@
> >   			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> >   			iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0>,
> >   				 <&iommu0
> > M4U_PORT_L1_OVL_2L_RDMA0_HDR>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0x6000 0x1000>;
> >   		};
> >   
> >   		rdma0: rdma@14007000 {
> > @@ -1274,6 +1281,7 @@
> >   			mediatek,larb = <&larb0>;
> >   			mediatek,rdma-fifo-size = <5120>;
> >   			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0x7000 0x1000>;
> >   		};
> >   
> >   		color0: color@14009000 {
> > @@ -1283,6 +1291,7 @@
> >   			interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> >   			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> >   			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0x9000 0x1000>;
> >   		};
> >   
> >   		ccorr0: ccorr@1400a000 {
> > @@ -1291,6 +1300,7 @@
> >   			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> >   			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> >   			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0xa000 0x1000>;
> >   		};
> >   
> >   		aal0: aal@1400b000 {
> > @@ -1300,6 +1310,7 @@
> >   			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> >   			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> >   			clocks = <&mmsys CLK_MM_DISP_AAL0>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0xb000 0x1000>;
> >   		};
> >   
> >   		gamma0: gamma@1400c000 {
> > @@ -1309,6 +1320,7 @@
> >   			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> >   			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> >   			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0xc000 0x1000>;
> >   		};
> >   
> >   		postmask0: postmask@1400d000 {
> > @@ -1318,6 +1330,7 @@
> >   			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> >   			clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
> >   			iommus = <&iommu0 M4U_PORT_L0_DISP_POSTMASK0>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0xd000 0x1000>;
> >   		};
> >   
> >   		dither0: dither@1400e000 {
> > @@ -1327,6 +1340,7 @@
> >   			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> >   			power-domains = <&spm
> > MT8192_POWER_DOMAIN_DISP>;
> >   			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0xe000 0x1000>;
> >   		};
> >   
> >   		dsi0: dsi@14010000 {
> > @@ -1351,6 +1365,7 @@
> >   			clocks = <&mmsys CLK_MM_DISP_OVL2_2L>;
> >   			iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2>,
> >   				 <&iommu0
> > M4U_PORT_L1_OVL_2L_RDMA2_HDR>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX
> > 0x4000 0x1000>;
> >   		};
> >   
> >   		rdma4: rdma@14015000 {
> > @@ -1361,6 +1376,7 @@
> >   			clocks = <&mmsys CLK_MM_DISP_RDMA4>;
> >   			iommus = <&iommu0 M4U_PORT_L1_DISP_RDMA4>;
> >   			mediatek,rdma-fifo-size = <2048>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX
> > 0x5000 0x1000>;
> >   		};
> >   
> >   		dpi0: dpi@14016000 {


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
