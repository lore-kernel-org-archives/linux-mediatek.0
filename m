Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FFBC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 02:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DM3PybCLadbxZupVYx14So4tAuvRNgdFGi2HQYbctac=; b=N4BWLkX5dXZVPF
	7slha+jtJQ9i6RsrBDo8VTD2V+C6kQhkSoXI1Te4BR8u6fNfIfYOVlHY8nLeS2tSCIUcTL9SMULni
	Eqxqheq5FRPA/kiwLUIWjVY+LGS63Wx9JH6a1r3SK7I8flKbfOv3hEJ7w3x+6uiKVcefyE0f83eRR
	rgUVvsCmDmK+ls3f1NLEx1s4AKwueUba6+RtJjJOPXIlpjCokMulCu8dDDXO8w74CbHs4Uo7opIR5
	cfXicvzyF/bITT//juvt1t8ROWbUozvRmIyakyoZFoyTXRa/UmkZINL5sUv9E7rdz6hquB9LgClyA
	2ZHHtZP0nGqoRibfyPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njXqV-00H6t6-2d; Wed, 27 Apr 2022 02:56:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njXqI-00H6pv-P4; Wed, 27 Apr 2022 02:55:52 +0000
X-UUID: a4926965e9b948b3b9546b3408a5b1bb-20220426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WbUaqyZVohwj0p0j2+cIXi5+goB3F4ePHaxdtLB6rW0=; 
 b=c5Wf3oSvbL3KO0EZwEfIeMxdbGc5/MVbfQVPTqmD/yLQfMhWYITi0IDGvUabfi2J5+AG6vs6mAleUcNa+zjVi/KiV6O9yepT/9UlOyzrftivDzG+rx5ZYhVykraohcQkd6hrNGuoDKUN3ZAMgcL7a2HJjuumsunKzLKzTQYSeYc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:3a0a9d3a-aed1-4c3c-9d99-eb895bdb1e7d, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:ac1f9bc6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a4926965e9b948b3b9546b3408a5b1bb-20220426
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1241407741; Tue, 26 Apr 2022 19:55:41 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 19:55:39 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 10:55:36 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 10:55:35 +0800
Message-ID: <693edb35a45abe66e7eae378af6e778eebe01171.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: media: mtk-vcodec: Adds encoder power
 domain property
From: Irui Wang <irui.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, Maoguang Meng <maoguang.meng@mediatek.com>, 
 Longfei Wang <longfei.wang@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 27 Apr 2022 10:55:35 +0800
In-Reply-To: <YmhX89nQjkwt5qb3@robh.at.kernel.org>
References: <20220420073440.31649-1-irui.wang@mediatek.com>
 <YmhX89nQjkwt5qb3@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_195550_867331_22F03187 
X-CRM114-Status: GOOD (  19.99  )
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

Dear Rob,

Thanks for reviewing.

On Tue, 2022-04-26 at 15:37 -0500, Rob Herring wrote:
> On Wed, Apr 20, 2022 at 03:34:39PM +0800, Irui Wang wrote:
> > Adds encoder power domain property
> 
> Why? You can't add new, required properties as that breaks
> compatibility 
> with existing DTs.
We will use the "power-domains" property in new DTs, and we will get a
"make dtbs_check" warning if we don't add the "power-domains" in yaml,
so we add it, but should not be a "required property", we will send a
new version for it.

And another series patch will fix the "dtbs_check"(mediatek,larb) you
mentioned before:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=633993

Thanks
Best Regards

> 
> > 
> > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > ---
> >  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml | 7
> > +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > encoder.yaml
> > b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > encoder.yaml
> > index deb5b657a2d5..3c069c965992 100644
> > --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > encoder.yaml
> > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > encoder.yaml
> > @@ -41,6 +41,9 @@ properties:
> >  
> >    assigned-clock-parents: true
> >  
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    iommus:
> >      minItems: 1
> >      maxItems: 32
> > @@ -72,6 +75,7 @@ required:
> >    - iommus
> >    - assigned-clocks
> >    - assigned-clock-parents
> > +  - power-domains
> >  
> >  allOf:
> >    - if:
> > @@ -132,6 +136,7 @@ examples:
> >      #include <dt-bindings/clock/mt8173-clk.h>
> >      #include <dt-bindings/memory/mt8173-larb-port.h>
> >      #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/mt8173-power.h>
> >  
> >      vcodec_enc_avc: vcodec@18002000 {
> >        compatible = "mediatek,mt8173-vcodec-enc";
> > @@ -153,6 +158,7 @@ examples:
> >        clock-names = "venc_sel";
> >        assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> >        assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
> > +      power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC>;
> >      };
> >  
> >      vcodec_enc_vp8: vcodec@19002000 {
> > @@ -173,4 +179,5 @@ examples:
> >        clock-names = "venc_lt_sel";
> >        assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> >        assigned-clock-parents = <&topckgen
> > CLK_TOP_VCODECPLL_370P5>;
> > +      power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC_LT>;
> >      };
> > -- 
> > 2.18.0
> > 
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
