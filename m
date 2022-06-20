Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1800DC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 12:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qroj4Id8GVOKhVMt+r3hBnmHfK8Rw4akyJO3CTxeBg=; b=ujfN0WrrvSIKsFHJYRI33BwjnX
	9LBNEOgxUePJaU6mX6cpBrlBe5hydpcAWIFG6ZFGIS+dGtpXNe8D5TEgHo5rAPxpqHqZZtDjXV6w5
	f4IKvQqUfd1GuAzG1MtxECClgqb0qGHriP+V/YShCYadkd1CXPLe1BuElQA0p89BMN4ZftSaL3fGZ
	ccCctUDPpyTBiocAjCzsJW9XTzyLysHsf4oO6Fo/XgFL7pUgu6KUqIzEAe2xTpaKgvxIwKyGSfP37
	1NUBXX054rbiM4pnqopjBjJNnkxxeHFqIN3Exxver4X+U7X4W6xDeA34omcfrp5xaTKlqOdC6Iy/x
	Q2Y3nnQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Gam-000STX-NY; Mon, 20 Jun 2022 12:33:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Gah-000SRQ-ST; Mon, 20 Jun 2022 12:33:18 +0000
X-UUID: 7f0bc213e8ac40c59c4b909a86e2bb47-20220620
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:2f302186-0d73-4d8c-a90a-b54eb6cec0f6,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:b14ad71,CLOUDID:b47303ea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 7f0bc213e8ac40c59c4b909a86e2bb47-20220620
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 994640385; Mon, 20 Jun 2022 05:33:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jun 2022 05:33:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 20 Jun 2022 20:33:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 20 Jun 2022 20:33:07 +0800
Message-ID: <d5a74aca024dd38030bb5edd38084d81b65e27fa.camel@mediatek.com>
Subject: Re: [PATCH v12 01/14] dt-bindings: mediatek,dpi: Add DP_INTF
 compatible
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Maxime Ripard <maxime@cerno.tech>
CC: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <airlied@linux.ie>, <devicetree@vger.kernel.org>,
	<granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<msp@baylibre.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <wenst@chromium.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<angelogioacchino.delregno@collabora.com>
Date: Mon, 20 Jun 2022 20:33:07 +0800
In-Reply-To: <20220620122500.yfc5vhbuluodoo3d@houat>
References: <20220620121028.29234-1-rex-bc.chen@mediatek.com>
	 <20220620121028.29234-2-rex-bc.chen@mediatek.com>
	 <20220620122500.yfc5vhbuluodoo3d@houat>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_053316_008134_51A302F5 
X-CRM114-Status: GOOD (  27.28  )
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

On Mon, 2022-06-20 at 14:25 +0200, Maxime Ripard wrote:
> On Mon, Jun 20, 2022 at 08:10:15PM +0800, Bo-Chen Chen wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > DP_INTF is similar to DPI but does not have the exact same feature
> > set
> > or register layouts.
> > 
> > DP_INTF is the sink of the display pipeline that is connected to
> > the
> > DisplayPort controller and encoder unit. It takes the same clocks
> > as
> > DPI.
> > 
> > In this patch, we also do these string replacement:
> > - s/mediatek/MediaTek/ in title.
> > - s/Mediatek/MediaTek/ in description.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > [Bo-Chen: Modify reviewers' comments.]
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-
> > ----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > aml
> > index 77ee1b923991..d72f74632038 100644
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
> > +title: MediaTek DPI and DP_INTF Controller
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
> > +  The MediaTek DPI and DP_INTF function blocks are a sink of the
> > display
> > +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422
> > pixel data on a
> > +  parallel output bus.
> >  
> >  properties:
> >    compatible:
> > @@ -24,6 +24,7 @@ properties:
> >        - mediatek,mt8183-dpi
> >        - mediatek,mt8186-dpi
> >        - mediatek,mt8192-dpi
> > +      - mediatek,mt8195-dp_intf
> 
> Underscores are frowned upon in the compatibles. See Section 2.3.1 of
> the device tree spec:
> 
> > The compatible string should consist only of lowercase letters,
> > digits
> > and dashes, and should start with a letter. A single comma is
> > typically only used following a vendor prefix. Underscores should
> > not
> > be used.
> 
> Maxime

Hello Maxime,

Thanks for review.
I will modify this compatible as "mediatek,mt8195-dp-intf"

BRs,
Bo-Chen


