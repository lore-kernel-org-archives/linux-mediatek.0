Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4421FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 07:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKKl0wmLGjhDo+fPZ8JCqCF2AkM8UA7KT8Nu1j7rq6U=; b=XireA0JHUx2M0q
	OakD6OjTLVg80yMzYBHrKk+tAQWaRtAp0ygcK5E0AkV7Kv0EjigzTSlq2GBQII8QelbGhtPfevHC7
	iAgRWiI3rL8ddis1duQZQk9tuAAjprEc448BFyTjaLnIWg7D73hP4yPzOiY8Ifv+FHiLtaqyxaQwx
	Q03UO94Rf2uJjOTSNLY3osWfVKe1GyQmrXHLsAM0jUEa//nSg8QIAqPJx4eUFkYV7/aKOt1j+aB/F
	cXSNyDsbW4pUDg2U1NW5Yu86gCBgSp84r57GkzuSE8BBKNMUAKg5JnwYbKFlSIKU9Vyl1gTezVqfU
	nLMRTFApzkMFSyPz40mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbzmz-004M6M-Rd; Wed, 06 Apr 2022 07:09:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbzmv-004M4v-TX; Wed, 06 Apr 2022 07:09:11 +0000
X-UUID: 51195e7dcb2844d18068571855c0516e-20220406
X-UUID: 51195e7dcb2844d18068571855c0516e-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 502122170; Wed, 06 Apr 2022 00:09:07 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 00:09:06 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 6 Apr 2022 15:08:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 15:08:58 +0800
Message-ID: <ae8ba0030d42d078580233f1710c592992e7d778.camel@mediatek.com>
Subject: Re: [PATCH v2,1/2] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <xinlei.lee@mediatek.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Wed, 6 Apr 2022 15:08:58 +0800
In-Reply-To: <4940e2e4ecb5f9f6857dc960ea5dbe43c551df77.camel@mediatek.com>
References: <1648727917-3099-1-git-send-email-xinlei.lee@mediatek.com>
 <1648727917-3099-2-git-send-email-xinlei.lee@mediatek.com>
 <e0d5a344c8ec1f92357bd9d5b8782dded862c549.camel@mediatek.com>
 <4940e2e4ecb5f9f6857dc960ea5dbe43c551df77.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_000909_980792_D4F03E3C 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2022-04-06 at 14:38 +0800, CK Hu wrote:
> Hi,
> 
> On Fri, 2022-04-01 at 09:38 +0800, Rex-BC Chen wrote:
> > On Thu, 2022-03-31 at 19:58 +0800, xinlei.lee@mediatek.com wrote:
> > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > Add dt-binding documentation of dpi for MediaTek MT8186 SoC.
> > > 
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > ---
> > >  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml      
> > >  |
> > > 1
> > > +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .y
> > > am
> > > l
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .y
> > > am
> > > l
> > > index dd2896a40ff0..a73044c50b5f 100644
> > > ---
> > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .y
> > > am
> > > l
> > > +++
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .y
> > > am
> > > l
> > > @@ -22,6 +22,7 @@ properties:
> > >        - mediatek,mt7623-dpi
> > >        - mediatek,mt8173-dpi
> > >        - mediatek,mt8183-dpi
> > > +      - mediatek,mt8186-dpi
> > >        - mediatek,mt8192-dpi
> > >  
> > >    reg:
> > 
> > Hello Xinlei,
> > 
> > From the dts we use, the dpi node needs other properties for
> > MT8186.
> > Please send another patch and add these properties to binding.
> > 
> > assigned-clocks = <&topckgen CLK_TOP_DPI>;
> > assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;
> 
> According to [1], the assigned-clocks is initial value. Without this
> initial value, I think driver would set this clock again, wouldn't
> it?
> 
> [1] 
> 
https://www.kernel.org/doc/Documentation/devicetree/bindings/clock/clock-bindings.txt
> 
> Regards,
> CK
> 

Hello CK,

OK, Thanks for your explanation.


Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

BRs,
Rex
> > 
> > Thanks
> > 
> > BRs,
> > Rex
> > 
> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > 
> 
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!wtF15QZZTCzWfRpxNLjZ1VQQ54i40D8STuOo0h18dtz3es-ksLfYQGTEFlb7lg$
> >  
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
