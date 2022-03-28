Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B289CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 03:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HW5GDr5TpexxLDV/XRIWlIuKEfHioHu6ddxKcVClYcY=; b=RxotlFzmYCvazy
	q8TGgnpjrqA2oSU2wPvkDng0y3chN+w2YHK+xc9PwK7IDgzEKA+l7ETI2dL3T+vRuz3sdhtYxFMzB
	5tuZ2A4QBK6CHWjmwEW6/mxaL03Eis3JkQz/Rfg/ryJz/5K0sJ/9hwFSMBgzAfEbtbmGSuOhWSqWr
	1r1inScCIIjF8JEyI3WdCeoSsC2iXT5o+zloMMA6ajjfwnh9ePAHrYagSosfCMkv+TidvU7ayZB0B
	/TqWjyO8hSEwsg78OWgxaXhs3Ft3JlkZYwBMYEQqExWKw7mBZ9WVnoE3t2txwYtP73xTcb4w/BdHb
	dl6rXj0Hh71BFxkXIq/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYg4Y-007CYt-Py; Mon, 28 Mar 2022 03:29:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYg4U-007CY7-IO; Mon, 28 Mar 2022 03:29:37 +0000
X-UUID: 8a8f8c44bf4146f5a6c9dd358dffae7b-20220327
X-UUID: 8a8f8c44bf4146f5a6c9dd358dffae7b-20220327
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1979928392; Sun, 27 Mar 2022 20:29:28 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Mar 2022 20:29:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 11:29:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Mar 2022 11:29:24 +0800
Message-ID: <f52fbaec28ae53667ba101a05406b62e5970eec1.camel@mediatek.com>
Subject: Re: [PATCH v16 3/8] dt-bindings: arm: mediatek: mmsys: add mt8195
 SoC binding
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Mon, 28 Mar 2022 11:29:24 +0800
In-Reply-To: <1daa3b8dabb97017d0f92437a81b250f8375544c.camel@mediatek.com>
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
 <20220307032859.3275-4-jason-jh.lin@mediatek.com>
 <1daa3b8dabb97017d0f92437a81b250f8375544c.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_202934_649336_C7C8FCBD 
X-CRM114-Status: GOOD (  19.46  )
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
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 roy-cw.yeh@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi CK,

Thanks for the reviews.

On Fri, 2022-03-18 at 14:43 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Mon, 2022-03-07 at 11:28 +0800, jason-jh.lin wrote:
> > There are 2 mmsys, namely vdosys0 and vdosys1 in mt8195.
> > Each of them is bound to a display pipeline, so add their
> > definition in mtk-mmsys documentation with 2 compatibles.
> 
> Could one vdosys be union of vdosys0 and vdosys1? In MT8173, one
> mmsys
> support multiple pipeline. Describe more in commit message to support
> that two vdosys are necessary.
> 
> Regards,
> CK
> 

In the SoC before, such as mt8173, it has 2 pipelines binding to one
mmsys with the same clock driver and the same power domain.

In mt8195, 2 pipelines are binding to different mmsys, such as vdosys0
and vdosys1. Each mmsys uses different clock drivers and different
power domain.

Since each mmsys has its own clock, I have tried to differentiate
vppsys0, vppsys1, vdosys0, vdosys1 by the clock names.
Then I can use one mmsys compatible name for all of them.

I'll apply this method at the next version.
And also sync with Nancy(vdosys1) and Roy(vppsys0, vppsys1).

Regards,
Jason-JH.Lin

> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        |
> > 2
> > ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > index 6c2c3edcd443..c5ba515cb0d7 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > @@ -32,6 +32,8 @@ properties:
> >                - mediatek,mt8186-mmsys
> >                - mediatek,mt8192-mmsys
> >                - mediatek,mt8365-mmsys
> > +              - mediatek,mt8195-vdosys0
> > +              - mediatek,mt8195-vdosys1
> >            - const: syscon
> >        - items:
> >            - const: mediatek,mt7623-mmsys
> 
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
