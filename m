Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A6EC00140
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Aug 2022 02:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OntFzXj1xSgvDZvwcKkfdgqz97HtZ/3Zdgy1A7t6ydk=; b=2Z5/rkZYijh+9zADcUr7zff+qL
	qq1iEhNgXqq543IRhrvtvFxzRksygsPJa/DylP1WA6GRYjjBFfqQy7618fo9HB0ebHO0aHh3Evx85
	so8waIDBvKb9hTJfl0c3JSHM7h2P5RSNgJ1dCHjtM6HgHzWTo1OuTlxAg6PPGE2rKWy579kg3APt5
	IWA8qSYNRwtRiaOerb7/jvM75tAiBcedfCplmoFsEzkQLBE8P2VVO1KX2E3Vj4RhOklpku3cIu568
	rLcE9JWWYNAhiJBkxe87xbjFewplQzD1rpUry7f1ZLV8Rq8xyL9s+jfymAKwkELGOwJBAerluJbUL
	Vo7ZVRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ3jV-001UP9-Uz; Wed, 03 Aug 2022 02:03:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ3jL-001UJu-2o; Wed, 03 Aug 2022 02:03:28 +0000
X-UUID: b7545eb53e084bdda8b4905c5231b69b-20220802
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:cea81f54-b3ef-4da7-9654-873e3148ee02,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:1b940fd1-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b7545eb53e084bdda8b4905c5231b69b-20220802
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1326267139; Tue, 02 Aug 2022 19:03:14 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 3 Aug 2022 09:42:36 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 3 Aug 2022 09:42:35 +0800
Message-ID: <04d6266bee04e55d8701c3714f680af65d221411.camel@mediatek.com>
Subject: Re: [V12,1/7] dt-bindings: mediatek: Add mediatek, mt8195-jpgenc
 compatible
From: kyrie.wu <kyrie.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Irui
 Wang <irui.wang@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, "Rob Herring" <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih
	<tzungbi@chromium.org>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
	"=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Wed, 3 Aug 2022 09:42:34 +0800
In-Reply-To: <44dde534-769c-c456-c869-4e29213b3d56@collabora.com>
References: <20220729062630.5592-1-irui.wang@mediatek.com>
	 <20220729062630.5592-2-irui.wang@mediatek.com>
	 <44dde534-769c-c456-c869-4e29213b3d56@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_190327_173247_8255F213 
X-CRM114-Status: GOOD (  19.68  )
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

On Fri, 2022-07-29 at 10:34 +0200, AngeloGioacchino Del Regno wrote:
> Il 29/07/22 08:26, Irui Wang ha scritto:
> > From: kyrie wu <kyrie.wu@mediatek.com>
> > 
> > Add mediatek,mt8195-jpgenc compatible to binding document.
> > 
> > Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> > Signed-off-by: irui wang <irui.wang@mediatek.com>
> > ---
> >   .../media/mediatek,mt8195-jpegenc.yaml        | 139
> > ++++++++++++++++++
> >   1 file changed, 139 insertions(+)
> >   create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegenc.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegenc.yaml
> > b/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegenc.yaml
> > new file mode 100644
> > index 000000000000..d9133e6a92f8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegenc.yaml
> > @@ -0,0 +1,139 @@
> 
> ..snip..
> 
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/memory/mt8195-memory-port.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/mt8195-clk.h>
> > +    #include <dt-bindings/power/mt8195-power.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        jpgenc_master {
> 
> What about using ranges here? The binding would look way cleaner,
> like:
> 
>          jpeg-encoder@1a030000 {
>                 .... properties ....
>                 ranges = <0x30000   0 0x1a030000 0x10000>, /* P.S.:
> Not tested! */
>                          <0x1030000 0 0x1b030000 0x10000>;
> 
>                 encoder-core@30000 {
>                          compatible = "mediatek,mt8195-jpgenc-hw";
>                          reg = <0 0x30000 0 0x10000>;
>                          .... properties ....
>                 };
> 
>                 encoder-core@1030000 {
>                          compatible = "mediatek,mt8195-jpgenc-hw";
>                          reg = <0 0x1030000 0 0x10000>;
>                          .... properties ....
>                 };
>          };
> 
> P.S.: Added Krzysztof to the loop.
> 
> Krzysztof, can you please give an opinion on that?
> 
> Thanks,
> Angelo

Hello Angelo,

Thanks for your kindly suggestion, I will fix this item in 
the next version.

Regards,
Kyrie.
> 
> > +                compatible = "mediatek,mt8195-jpgenc";
> > +                power-domains = <&spm
> > MT8195_POWER_DOMAIN_VENC_CORE1>;
> > +                iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
> > +                <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
> > +                <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
> > +                <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
> > +                #address-cells = <2>;
> > +                #size-cells = <2>;
> > +
> > +                jpgenc@1a030000 {
> > +                        compatible = "mediatek,mt8195-jpgenc-hw";
> > +                        reg = <0 0x1a030000 0 0x10000>;
> > +                        iommus = <&iommu_vdo
> > M4U_PORT_L19_JPGENC_Y_RDMA>,
> > +                        <&iommu_vdo M4U_PORT_L19_JPGENC_C_RDMA>,
> > +                        <&iommu_vdo M4U_PORT_L19_JPGENC_Q_TABLE>,
> > +                        <&iommu_vdo M4U_PORT_L19_JPGENC_BSDMA>;
> > +                        interrupts = <GIC_SPI 342
> > IRQ_TYPE_LEVEL_HIGH 0>;
> > +                        clocks = <&vencsys CLK_VENC_JPGENC>;
> > +                        clock-names = "jpgenc";
> > +                        power-domains = <&spm
> > MT8195_POWER_DOMAIN_VENC>;
> > +                };
> > +
> > +                jpgenc@1b030000 {
> > +                        compatible = "mediatek,mt8195-jpgenc-hw";
> > +                        reg = <0 0x1b030000 0 0x10000>;
> > +                        iommus = <&iommu_vpp
> > M4U_PORT_L20_JPGENC_Y_RDMA>,
> > +                        <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
> > +                        <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
> > +                        <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
> > +                        interrupts = <GIC_SPI 347
> > IRQ_TYPE_LEVEL_HIGH 0>;
> > +                        clocks = <&vencsys_core1
> > CLK_VENC_CORE1_JPGENC>;
> > +                        clock-names = "jpgenc";
> > +                        power-domains = <&spm
> > MT8195_POWER_DOMAIN_VENC_CORE1>;
> > +                };
> > +        };
> > +    };
> 
> 


