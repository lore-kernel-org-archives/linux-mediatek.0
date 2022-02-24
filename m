Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153E4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 01:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9qTbOjqaaATjQYbXkTORYPk1d6NoCCp2lGcswQZJXI=; b=gQxE7h36QOu2pl
	Y1FqheouYkN3h2LvfLiqxMj7pWYSo4W3YuvYKaMGt1nEYikQ7AxJugB5m5EExbNzuDZP2UCa/DV+Z
	UbYo4U9YqJHNX3RQcSE7hQCn7sHMPA0VZJAF1mv/DdpN52pq9NCqfbT72Me/WBmeVTOHLUOerudiX
	OLWX3nUTbOgBkORQDyNkT+30pvYks25jexNHrork04eVp1TkA1Yqg/IhQRq0ieAMBLFFktU3BZPv3
	N9l3aJF7H/dwCzWClH+Mqe4Q36p5p06mtnuCMV88F2oCGDfAH01Vd4teyrL2nDEjMwkBaj+JK6xY7
	E6RLpVDfj8zscP3r8sog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nN2d3-00GPjW-6F; Thu, 24 Feb 2022 01:09:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN2cp-00GPhx-LT; Thu, 24 Feb 2022 01:08:58 +0000
X-UUID: 4fb8141814b6498ba7bdbb9c9e640f16-20220223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Cl06cBfq/fAvDfNjCZO6TlIHod9PjIJlPxNLYq4nPgU=; 
 b=D7FSVCaGgziSX4ZETMWR3OhK3OmDxxR1bHTjqd9LPsqHIdrFbU879vv8G+vofsVQ6GwQ4qVE6Dcw11tS6QY2q7vzn9bHkO7VERALMr7iobPEq8AxIA3rQidQS2DlRt1EAoxqyfZuPfFPiEGG8JzU52bNsrErlKrIyVbO66D7nms=;
X-UUID: 4fb8141814b6498ba7bdbb9c9e640f16-20220223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 781944181; Wed, 23 Feb 2022 18:08:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 17:08:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 24 Feb 2022 09:08:47 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Feb 2022 09:08:46 +0800
Message-ID: <9f606a439ad588585f495ec9ce45ab974527e673.camel@mediatek.com>
Subject: Re: [1/2] dt-bindings: media: mtk-vcodec: Adds encoder dt-bindings
 for mt8186
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Thu, 24 Feb 2022 09:08:46 +0800
In-Reply-To: <af9e763d302ae08e1da42c1e91fa8b5519db5c9d.camel@mediatek.com>
References: <1645617086-18841-1-git-send-email-kyrie.wu@mediatek.com>
 <1645617086-18841-2-git-send-email-kyrie.wu@mediatek.com>
 <af9e763d302ae08e1da42c1e91fa8b5519db5c9d.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_170855_732175_F686981D 
X-CRM114-Status: GOOD (  15.89  )
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

On Wed, 2022-02-23 at 20:37 +0800, Rex-BC Chen wrote:
> Hello Kyrie,
> 
> Could you move the 8186 below 8183?
> I think it's better to match alphabetical order.
> 
> BRs,
> Rex

Dear Rex-BC,
Thanks for your suggestion. I will fix this issue.
> 
> On Wed, 2022-02-23 at 19:51 +0800, kyrie.wu wrote:
> > From: kyrie wu <kyrie.wu@mediatek.com>
> > 
> > Adds encoder dt-bindings for mt8186.
> > 
> > Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> > ---
> >  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml       | 
> > 1
> > +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > encoder.yaml
> > b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > encoder.yaml
> > index b72c1a50e89e..1fb9908b7454 100644
> > --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > encoder.yaml
> > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > encoder.yaml
> > @@ -22,6 +22,7 @@ properties:
> >        - mediatek,mt8183-vcodec-enc
> >        - mediatek,mt8192-vcodec-enc
> >        - mediatek,mt8195-vcodec-enc
> > +      - mediatek,mt8186-vcodec-enc
> >  
> >    reg:
> >      maxItems: 1
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
