Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F003C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 02:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hExQiucOlOyWoOwXC+UxYt8vwnS/T6Fgm0IJ4vQEEFY=; b=xFz5+kkEysYKXt
	SP5xsv2T122y4U8GMy7biJvLAWTR0u0mpo/nr93yNKwwf33w9SjL7NVqDGnG9NcNMyJe6VRs6cdrY
	ZUAzUb7rUPrDOevNWL0oO+Xx7OtxAmApGMHM2SUZ8GLlWY5OOz7ShaECCSMbylE1rl5c82Xow/L/4
	a1RuhsGzClUDq3UKJ1gRFsAh5vS11nOH6gocmQKB9ivMfkY0wFZ7QR9Ruwa59zQ8nY0jSGw6crlnE
	x3kQhMWUBVTOCM7fz5juYSa0LMdpNU3rWz9TAAflslTXVzSIRW90zdvR7III1tp+PErVJomzbPXLf
	xUo3+7pyMxulwW+Q0wxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyPEQ-004BED-U4; Tue, 07 Jun 2022 02:46:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyPEF-004BBv-HJ; Tue, 07 Jun 2022 02:46:01 +0000
X-UUID: 59ff0b7e869a4b3cba80315e7ecbf4b9-20220606
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:a4c90192-dd5d-48ff-b09a-0cf875277f31,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:2a19b09,CLOUDID:0ae6667e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 59ff0b7e869a4b3cba80315e7ecbf4b9-20220606
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 584109429; Mon, 06 Jun 2022 19:45:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jun 2022 19:35:53 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 7 Jun 2022 10:35:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jun 2022 10:35:51 +0800
Message-ID: <8af6cf20a2f1f99b04568f739058c55465f3f53a.camel@mediatek.com>
Subject: Re: [PATCH v10 01/21] dt-bindings: mediatek,dpi: Add DPINTF
 compatible
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Maxime Ripard <maxime@cerno.tech>, Guillaume Ranquet
	<granquet@baylibre.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
	<daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, "Vinod
 Koul" <vkoul@kernel.org>, Helge Deller <deller@gmx.de>, CK Hu
	<ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-fbdev@vger.kernel.org>
Date: Tue, 7 Jun 2022 10:35:51 +0800
In-Reply-To: <20220525124928.wtfzpxr6lm7bdc6k@houat>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-2-granquet@baylibre.com>
	 <20220525124928.wtfzpxr6lm7bdc6k@houat>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_194559_609343_D99CBDA8 
X-CRM114-Status: GOOD (  25.69  )
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

On Wed, 2022-05-25 at 14:49 +0200, Maxime Ripard wrote:
> Hi,
> 
> On Mon, May 23, 2022 at 12:47:34PM +0200, Guillaume Ranquet wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > DPINTF is similar to DPI but does not have the exact same feature
> > set
> > or register layouts.
> > 
> > DPINTF is the sink of the display pipeline that is connected to the
> > DisplayPort controller and encoder unit. It takes the same clocks
> > as
> > DPI.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >  .../bindings/display/mediatek/mediatek,dpi.yaml     | 13 ++++++++-
> > ----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > aml
> > index dd2896a40ff0..6d9f6c11806e 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > aml
> > @@ -4,16 +4,16 @@
> >  $id: 
> > http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: mediatek DPI Controller Device Tree Bindings
> > +title: mediatek DPI/DPINTF Controller
> >  
> >  maintainers:
> >    - CK Hu <ck.hu@mediatek.com>
> >    - Jitao shi <jitao.shi@mediatek.com>
> >  
> >  description: |
> > -  The Mediatek DPI function block is a sink of the display
> > subsystem and
> > -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
> > parallel
> > -  output bus.
> > +  The Mediatek DPI and DPINTF function blocks are a sink of the
> > display
> > +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422
> > pixel data on a
> > +  parallel output bus.
> >  
> >  properties:
> >    compatible:
> > @@ -23,6 +23,7 @@ properties:
> >        - mediatek,mt8173-dpi
> >        - mediatek,mt8183-dpi
> >        - mediatek,mt8192-dpi
> > +      - mediatek,mt8195-dpintf
> 
> Weren't you supposed to change it to have a separator between dp and
> intf?
> 
> If it's no longer in your plans, the second patch should have
> s/dp_intf/dpintf/
> 
> Maxime

Hello Maxime,

Thank for your review.
I will do this in next version.

BRs,
Bo-Chen

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
