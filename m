Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA81C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 03:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JByRym/1GqqvN4uXdn5Kf3eVFkOqy59/i5iWz6RBwJA=; b=1jR5gJxpV7dAFw
	R0kklLyewLLi4waosLKJR5lPslo8co/yaaQj89wABlTXj8w/QSm4/7tiAdDqoqeJufezyrNWEbtdR
	ITtMYTLwbnAJiSqprGEktlcwlozRl6E8cTWULort5IuxQ0ia3mATbqA+rjT78uPPJgZSXe6H5tzz8
	jV0GbMdOGPMjSxDBzhwXPz+ft5T/vbGM7/K+IXBMzqt8rZ9L5a8wcNIWmgGonR5kqkcrgH07Hg/Yq
	/pfy4BucMW8LNI/76I5x68O59wWnDR3/f83cfdv+B5vP5WShBNu0IraSvnyqJiC56j6csiv/IddxU
	qHZWqQC50JeYsSCTiwrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWrPY-00CgjA-FM; Wed, 23 Mar 2022 03:11:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWrPV-00Cgii-AF; Wed, 23 Mar 2022 03:11:47 +0000
X-UUID: ff5ded48b3904b82b69e9d6c895fd571-20220322
X-UUID: ff5ded48b3904b82b69e9d6c895fd571-20220322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 648256989; Tue, 22 Mar 2022 20:11:32 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 20:10:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 11:10:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Mar 2022 11:10:20 +0800
Message-ID: <4fa9707f09cfe6a07ddaa999dde0003fbe46d9b9.camel@mediatek.com>
Subject: Re: [PATCH v14 4/6] dt-bindings: soc: mediatek: add gce-client-reg
 for MUTEX
From: moudy.ho <moudy.ho@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Jernej
 Skrabec" <jernej.skrabec@siol.net>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Alexandre Courbot <acourbot@chromium.org>,
 <tfiga@chromium.org>, <drinkcat@chromium.org>, <pihsun@chromium.org>,
 <hsinyi@google.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Maoguang Meng
 <maoguang.meng@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, <menghui.lin@mediatek.com>,
 <sj.huang@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 23 Mar 2022 11:10:20 +0800
In-Reply-To: <Yjj8eoXmsYRRvb1I@robh.at.kernel.org>
References: <20220317143926.15835-1-moudy.ho@mediatek.com>
 <20220317143926.15835-5-moudy.ho@mediatek.com>
 <Yjj8eoXmsYRRvb1I@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_201145_370550_19CD252B 
X-CRM114-Status: GOOD (  23.27  )
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

On Mon, 2022-03-21 at 17:30 -0500, Rob Herring wrote:
> On Thu, Mar 17, 2022 at 10:39:24PM +0800, Moudy Ho wrote:
> > In order to allow modules with latency requirements such as MDP3
> > to set registers through CMDQ, add the relevant GCE property.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > ---
> >  .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml  | 8
> > ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yam
> > l
> > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yam
> > l
> > index f825af49f820..a4892979480c 100644
> > ---
> > a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yam
> > l
> > @@ -60,6 +60,14 @@ properties:
> >        include/dt-bindings/gce/<chip>-gce.h of each chips.
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >  
> > +  mediatek,gce-client-reg:
> > +    description: The register of client driver can be configured
> > by gce with
> > +      4 arguments defined in this property, such as phandle of
> > gce, subsys id,
> > +      register offset and size. Each GCE subsys id is mapping to a
> > client
> > +      defined in the header include/dt-bindings/gce/<chip>-gce.h.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    maxItems: 1
> 
> items:
>   items:
>     - description: phandle of GCE
>     - description: GCE subsys id
>     - description: register offset
>     - description: register size
> 
Hi Rob,

Thanks for the review, I will follow the suggestions to make
corresponding corrections in the next version. Also, I'm sorry that I
left out the information about the dependent series that may cause YAML
checking fail.
ref: 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=621899

Thanks,
Moudy
> > +
> >  required:
> >    - compatible
> >    - reg
> > -- 
> > 2.18.0
> > 
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
