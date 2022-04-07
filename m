Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800D0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 02:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vklO3wNUReNdlSNy6oPCcvcqyWVHx8Bhoe9ODZDw8P4=; b=d/deQYucPKWDVz
	l3fSJzkILhiFY522vxFRR8SfXO09H2EYFU0H8NFswZRhr1rwGVtr21S9eOHGnEaZbhLU8SeRmxERJ
	c5t0gc3l3C4CRkyY0gh4TpLHZcuWbE4zscMQUuQW/z8HuCrsTykim/0lPmp7TiRQyQ5ieKWrroc3J
	W3TeRo9kTyzLX9SlqTZmxw9Bh0UxSdyN3O4864POaK7OQIY9YEeKSdlnk7OINkyLahrd3z4IG4o37
	fwPSnbV/xcJNaBCmltjiJo7HWoPnu+VQnNZqJWJWGOpXe1iIUJnc+BaiZT129KU4QE5qDh3SfzQqU
	Cv/5cQxkGgvKcS7PuO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncHd3-008pui-Qq; Thu, 07 Apr 2022 02:12:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncHd0-008pu5-Q5; Thu, 07 Apr 2022 02:12:08 +0000
X-UUID: 96ec4dfb6674401b83765f0e9099c745-20220406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4FT0tfo5Iw7drRtqhVezZEU5GOQ3wM8341Q+gpZwHDc=; 
 b=GMyJYpqGIZDuuLa7WgmqsjYB5cA71Ta2QWZnZGZU9/v9TFson8KQ7NdsfhuGqC20MukzJeq6H6iWST0zp/NbnzCnfWLWKxJewFsye8/E2k+fGKYew8zKcbmG5ZsNaZvfkGC7WWnQjw5iaxvTGrCUC2ADytikv+FtNjyH7OmvX0A=;
X-UUID: 96ec4dfb6674401b83765f0e9099c745-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 914734320; Wed, 06 Apr 2022 19:12:01 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 19:11:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 7 Apr 2022 10:11:58 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 10:11:57 +0800
Message-ID: <8d4ec81b31de7acd5105623ea73b5d6e76f33e4f.camel@mediatek.com>
Subject: Re: [PATCH v2,1/2] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Rob Herring <robh@kernel.org>, Rex-BC Chen <rex-bc.chen@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Thu, 7 Apr 2022 10:12:25 +0800
In-Reply-To: <Yk2ugxQukjPmYbFL@robh.at.kernel.org>
References: <1648727917-3099-1-git-send-email-xinlei.lee@mediatek.com>
 <1648727917-3099-2-git-send-email-xinlei.lee@mediatek.com>
 <e0d5a344c8ec1f92357bd9d5b8782dded862c549.camel@mediatek.com>
 <Yk2ugxQukjPmYbFL@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_191206_896969_B94F2249 
X-CRM114-Status: GOOD (  18.67  )
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

On Wed, 2022-04-06 at 10:15 -0500, Rob Herring wrote:
> On Fri, Apr 01, 2022 at 09:38:20AM +0800, Rex-BC Chen wrote:
> > On Thu, 2022-03-31 at 19:58 +0800, xinlei.lee@mediatek.com wrote:
> > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > Add dt-binding documentation of dpi for MediaTek MT8186 SoC.
> > > 
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > ---
> > >  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml      
> > >  | 1
> > > +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .yam
> > > l
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .yam
> > > l
> > > index dd2896a40ff0..a73044c50b5f 100644
> > > ---
> > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .yam
> > > l
> > > +++
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .yam
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
> Those are always allowed on any node with 'clocks', so no need to
> add 
> them here.
> 
> Rob

Hi Rob:

Thank you for your review.
I understand your suggestion, and the next version will be sent soon.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
