Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C406C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2aRMk8iDK+Er8W5LBsDzdR1eptbsWBWRxydc9kFjJxs=; b=C6JKCooY7GfIyn
	e8PBMuCNrC9OsvfPMss0GzdxozbXhBODJ2/vM+dQHvemwEkv4dtv785nCFTOdIZun7iImM/oUUAV4
	8VIIow8wHIzd4bQraSuFpoCg4pALX1pnoV/bVwLy+YDpgoK8gOEQS931ciKkF3gwLzx6O46V6ltZI
	wvVCw3luXh3RIBvrQLo5UlMszJNiAmzVm9GbWSgPy6yHEbCypH8STZwv4/A5/BcnWGR7Qy9jxVsHn
	j9OyPK8MuAdwlTv68Q4hjwTWyEp3Fhu9yxhQ++BQQp3UiEX8ujd/NbTcOqDMVqJxI6fNr8+rPokjO
	I5k2/BbtHZMKcW0NxBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtoD-001ulP-BH; Tue, 15 Feb 2022 09:07:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtnw-001udt-B2; Tue, 15 Feb 2022 09:07:27 +0000
X-UUID: d4e28daa93d64a9e80cb53e86a685385-20220215
X-UUID: d4e28daa93d64a9e80cb53e86a685385-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 176608607; Tue, 15 Feb 2022 02:07:19 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 01:07:17 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 17:07:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 17:07:16 +0800
Message-ID: <f7de15857fe110dcd9e3a6fc342bf253fd201f7b.camel@mediatek.com>
Subject: Re: [v2,2/6] dt-bindings: display: mediatek: update supported SoC
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <airlied@linux.ie>,
 <jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <yongqiang.niu@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fparent@baylibre.com>,
 <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 15 Feb 2022 17:07:16 +0800
In-Reply-To: <0de5fc29ed65eb5c6e9f227ec5e77cd4312718f4.camel@mediatek.com>
References: <20220215075953.3310-1-rex-bc.chen@mediatek.com>
 <20220215075953.3310-3-rex-bc.chen@mediatek.com>
 <0de5fc29ed65eb5c6e9f227ec5e77cd4312718f4.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_010724_394565_FCF8C9F8 
X-CRM114-Status: GOOD (  17.48  )
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

On Tue, 2022-02-15 at 16:48 +0800, CK Hu wrote:
> Hi, Rex:
> 
> On Tue, 2022-02-15 at 15:59 +0800, Rex-BC Chen wrote:
> > Add decriptions about supported SoC: MT8186.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,disp.txt      |
> > 2
> > +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.
> > tx
> > t
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.
> > tx
> > t
> > index 78044c340e20..f22b3d90d45a 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.
> > tx
> > t
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.
> > tx
> > t
> > @@ -44,7 +44,7 @@ Required properties (all function blocks):
> >  	"mediatek,<chip>-dpi"        		- DPI controller,
> > see
> > mediatek,dpi.txt
> >  	"mediatek,<chip>-disp-mutex" 		- display mutex
> >  	"mediatek,<chip>-disp-od"    		- overdrive
> > -  the supported chips are mt2701, mt7623, mt2712, mt8167, mt8173,
> > mt8183 and mt8192.
> > +  the supported chips are mt2701, mt7623, mt2712, mt8167, mt8173,
> > mt8183, mt8186 and mt8192.
> 
> I've applied [1], so please depend on [1] to send this patch.
> 
> [1] 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-drm-next&id=4ed545e7d10049b5492afc184e61a67e478a2cfd
> 
> Regards,
> CK
> 
Hello CK,

Thanks for your review.
I will modify display binding based on [1] for next version.

BRs,
Rex-BC Chen
> >  - reg: Physical base address and length of the function block
> > register space
> >  - interrupts: The interrupt signal from the function block
> > (required, except for
> >    merge and split function blocks).
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
