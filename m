Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CFCC07E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 06:58:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1BA661380
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 06:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1BA661380
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+mpiVfBNdY++gQpza4tMTr0Hu7nhgxwpu839Ma1rzQ=; b=tbB1BVIh5XxRG5
	9n6fgDsPcs5bnGubsRhLasbdRg5tXVlHQdw/ODIwlVh8kNdOnwq8h3w+x1mAUqMMQ8yKYTzDQxY/z
	4e+jhvJwFb3YmT74F/DT5ogelzco3S1aJR6dSn1nxqzejjPtr2cEMOiP8MkMmEwufWigHHq8jrk5i
	/WlDsiQXms3DD6mfpEv0BxZL5oF7M4bN+ZDTvUpbTgWG/MTigt66VmdjDSYSqZ3j65lRuOgMGLvly
	DuxLAaGkzZq1c+J0/PtassN+bSRqq0yPbgNlwxStaFoYderrme0NVpSFARsSs7PAEqTN95WiQZRPY
	TLGDTFrTwIiN53AlXf/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m26vt-003AFd-HN; Sat, 10 Jul 2021 06:57:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m26vn-003AEN-NR; Sat, 10 Jul 2021 06:57:46 +0000
X-UUID: 0316b01276744c4d8f0857f668e891d7-20210709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/dnEywQKWp9ACv8jd0Vo3hWOCwY6N3tJYDUL0CaU7c0=; 
 b=FsFJF1AgjpdcfHBUd7u5xdauJlDTq6ZLoztwJ/CjGlhWv3kTV7wBOHWg+Bvq94nwXfMjmIphSImpGBUg05HM3TxkGl70T/4Iw7fRqfbLPigc/TF+DVekWRa5+fnCVeWsFJotkfneFMzV4Dk2om4aEYhZAvO4XbsdWE9L29CfCPQ=;
X-UUID: 0316b01276744c4d8f0857f668e891d7-20210709
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1842721720; Fri, 09 Jul 2021 23:57:37 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Jul 2021 23:57:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 14:57:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Jul 2021 14:57:22 +0800
Message-ID: <b5dcf4cbe60cbd5503b228d8e1e6165a71df17d0.camel@mediatek.com>
Subject: Re: [PATCH v1 01/17] dt-bindings: mediatek: add definition for
 mt8195 display
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Sat, 10 Jul 2021 14:57:22 +0800
In-Reply-To: <1625632383.7824.2.camel@mtksdaap41>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-2-jason-jh.lin@mediatek.com>
 <1625632383.7824.2.camel@mtksdaap41>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_235745_214302_FDAF4C75 
X-CRM114-Status: GOOD (  24.24  )
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

Hi CK,

OK, I'll resend this at the next version.

Regard,
Jason-JH.Lin


On Wed, 2021-07-07 at 12:33 +0800, CK Hu wrote:
> Hi, Jason:
> 
> 
> On Wed, 2021-07-07 at 12:12 +0800, jason-jh.lin wrote:
> > Add definition for mt8195 display and add DSC module description.
> 
> Break this patch to two patch. One is mt8195 display, another one is
> DSC
> and describe more about what is DSC.
> 
> Regards,
> CK
> 
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  .../bindings/display/mediatek/mediatek,disp.txt     | 13
> > +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.
> > txt
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.
> > txt
> > index fbb59c9ddda6..a5859e7883d5 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.
> > txt
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.
> > txt
> > @@ -37,6 +37,7 @@ Required properties (all function blocks):
> >  	"mediatek,<chip>-disp-aal"   		- adaptive ambient
> > light controller
> >  	"mediatek,<chip>-disp-gamma" 		- gamma correction
> >  	"mediatek,<chip>-disp-merge" 		- merge streams
> > from two RDMA sources
> > +	"mediatek,<chip>-disp-dsc"		- compressing /
> > decompressing image display streams
> >  	"mediatek,<chip>-disp-postmask" 	- control round corner for
> > display frame
> >  	"mediatek,<chip>-disp-split" 		- split stream to
> > two encoders
> >  	"mediatek,<chip>-disp-ufoe"  		- data compression
> > engine
> > @@ -44,7 +45,7 @@ Required properties (all function blocks):
> >  	"mediatek,<chip>-dpi"        		- DPI controller,
> > see mediatek,dpi.txt
> >  	"mediatek,<chip>-disp-mutex" 		- display mutex
> >  	"mediatek,<chip>-disp-od"    		- overdrive
> > -  the supported chips are mt2701, mt7623, mt2712, mt8167, mt8173,
> > mt8183 and mt8192.
> > +  the supported chips are mt2701, mt7623, mt2712, mt8167, mt8173,
> > mt8183, mt8192 and mt8195.
> >  - reg: Physical base address and length of the function block
> > register space
> >  - interrupts: The interrupt signal from the function block
> > (required, except for
> >    merge and split function blocks).
> > @@ -60,7 +61,7 @@ Required properties (DMA function blocks):
> >  	"mediatek,<chip>-disp-ovl"
> >  	"mediatek,<chip>-disp-rdma"
> >  	"mediatek,<chip>-disp-wdma"
> > -  the supported chips are mt2701, mt8167 and mt8173.
> > +  the supported chips are mt2701, mt8167, mt8173 and mt8195.
> >  - larb: Should contain a phandle pointing to the local arbiter
> > device as defined
> >    in Documentation/devicetree/bindings/memory-
> > controllers/mediatek,smi-larb.yaml
> >  - iommus: Should point to the respective IOMMU block with master
> > port as
> > @@ -195,6 +196,14 @@ ufoe@1401a000 {
> >  	clocks = <&mmsys CLK_MM_DISP_UFOE>;
> >  };
> >  
> > +dsc0@1c009000 {
> > +	compatible = "mediatek,mt8195-disp-dsc";
> > +	reg = <0 0x1c009000 0 0x1000>;
> > +	interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH>;
> > +	power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> > +	clocks = <&mmsys CLK_VDO0_DSC_WRAP0>;
> > +};
> > +
> >  dsi0: dsi@1401b000 {
> >  	/* See mediatek,dsi.txt for details */
> >  };
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
