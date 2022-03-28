Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB068C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 13:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61tlb90QgnpErxHLoDSXLKET8NvId3v+lmkiCyXH9i4=; b=e+xbTPEgA2t68L
	ZhrXp6BqP4PmM5lkokmm8vfNUedUkqCBl21l+GadDF+qfgE/e7O1j0bwJ5dbTj7DFTGRl1BQmM0mP
	G0AbrmCGIfjE3qGTda9qji8s+SED4396Wp6qhCcO8ai2FEQTiCbC7wvsWAu63uwRf5iN3BI/eUGUd
	tnTJ+VHMDP3BY2R5fQGwAZ1wrpwBap7iGdcza1R/88N1sGPslbW7NpaJah5LVhhKqRUnOHfhBPJ7z
	Q5TVhFGCWEvCxWxTmKln+byzBVpka5qE0V/yRQER5zpeiM8fq/adaws5otVECmEft2DHe2UVMgw4o
	n0sRJPh6Wf0Fmmy0VTgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYpqV-008wq4-Hs; Mon, 28 Mar 2022 13:55:47 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYpj3-008tnU-Oc; Mon, 28 Mar 2022 13:48:11 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 k25-20020a056830151900b005b25d8588dbso10697840otp.4; 
 Mon, 28 Mar 2022 06:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q+/z8pUUWBfLzzFWh3TN26NfhrvM6nyqxbuLLyu+aLM=;
 b=6mFPaR90nmuko7UPvGs4xjrDs1ljynQ6JKo/7+K/pHRRvtsBGMChJdqfSg1WczQWHv
 xYe0KVfwcQ9AQpi+cBq7kUNAu97ByrhUhqETXD5pMvXepLYtGJ0CvNdZGYvOUG/FPDEn
 XDwhZ9JKgRP74EIwKkVpTKPtq20my/SzCtTrDkx7k3drKYwiv/BNZw30v6jLZC4yMrAN
 m7DgPd+6GcodLvBIq1txmZk9n2bM0DLkXS9yL3IFk4Khgt8PFHCdLY6B5X0Hb285ykp4
 Y7Mp3sQ/b79LURZ5lr1vecXCoDbz9bt++IKRfQVqBd3T7+No7qPVeWNPb8qBYDYLsdkZ
 UiDw==
X-Gm-Message-State: AOAM533BXinyhCcXTU+3W0vnx59bCTsFtRwe9X/zNrnvyK9c9HhZwWsW
 QPzYX/L8lTT8Xsce04nDQQ==
X-Google-Smtp-Source: ABdhPJzFImlqCXW1K8qUgADwrPbF+W8G33anvBPZNSZSnbvRxRupoA5RTvOjiP0UzvVLR7VCWkaWhg==
X-Received: by 2002:a9d:454c:0:b0:5b2:3757:9fc6 with SMTP id
 p12-20020a9d454c000000b005b237579fc6mr10004371oti.314.1648475283257; 
 Mon, 28 Mar 2022 06:48:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u14-20020a4ad0ce000000b0032174de7c2csm6804223oor.8.2022.03.28.06.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 06:48:02 -0700 (PDT)
Received: (nullmailer pid 2248085 invoked by uid 1000);
 Mon, 28 Mar 2022 13:48:01 -0000
Date: Mon, 28 Mar 2022 08:48:01 -0500
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 angelogioacchino.delregno@collabora.com, Yong Wu <yong.wu@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3, 03/10] dt-bindings: media: mtk-vcodec: Adds encoder
 cores dt-bindings for mt8195
Message-ID: <YkG8ka1xY2k+HWi1@robh.at.kernel.org>
References: <20220317082230.23622-1-irui.wang@mediatek.com>
 <20220317082230.23622-4-irui.wang@mediatek.com>
 <Yj4s0zcHxz3U3wlc@robh.at.kernel.org>
 <ab2b24eeb51048227ad7b2ac659617a7da5b2e45.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab2b24eeb51048227ad7b2ac659617a7da5b2e45.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_064805_898176_C5911EF4 
X-CRM114-Status: GOOD (  33.87  )
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

On Sat, Mar 26, 2022 at 10:00:55AM +0800, Irui Wang wrote:
> Dear Rob,
> 
> Thanks for your review and comments.
> 
> On Fri, 2022-03-25 at 15:57 -0500, Rob Herring wrote:
> > On Thu, Mar 17, 2022 at 04:22:23PM +0800, Irui Wang wrote:
> > > Adds encoder cores dt-bindings for mt8195.
> > 
> > Why?
> mt8195 has two h264 encoder cores and we want to enable both of them.
> the original encoder bindings file is for single core which may can not
> handle it, so we new a core dt-bindings. We will think about it again
> about this dt-bindings.
> > 
> > > 
> > > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > > ---
> > >  .../media/mediatek,vcodec-encoder-core.yaml   | 181
> > > ++++++++++++++++++
> > >  .../media/mediatek,vcodec-encoder.yaml        |   1 -
> > >  2 files changed, 181 insertions(+), 1 deletion(-)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-
> > > core.yaml
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-
> > > core.yaml
> > > b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-
> > > core.yaml
> > > new file mode 100644
> > > index 000000000000..fcfb48900c76
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > > encoder-core.yaml
> > > @@ -0,0 +1,181 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +
> > > +%YAML 1.2
> > > +---
> > > +$id: "
> > > http://devicetree.org/schemas/media/mediatek,vcodec-encoder-core.yaml#
> > > "
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Mediatek Video Encoder Accelerator With Multi Core
> > > +
> > > +maintainers:
> > > +  - Irui Wang <irui.wang@mediatek.com>
> > > +
> > > +description: |
> > > +  Mediatek Video Encode is the video encode hardware present in
> > > Mediatek
> > > +  SoCs which supports high resolution encoding functionalities.
> > > Required
> > > +  parent and child device node.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - mediatek,mt8195-vcodec-enc
> > > +
> > > +  mediatek,scp:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: |
> > > +      The node of system control processor (SCP), using
> > > +      the remoteproc & rpmsg framework.
> > > +
> > > +  mediatek,venc-multi-core:
> > > +    type: boolean
> > > +    description: |
> > > +      Indicates whether the encoder has multiple cores or not.
> > 
> > Isn't this implied by how many child nodes you have?
> It implies that we have child nodes, distinguish with single core,  

Just check if you have a child node or not.


> > > +  iommus:
> > > +    minItems: 1
> > > +    maxItems: 32
> > 
> > You really have up to 32 IOMMUs?
> Currently, totally 27 IOMMUs and used 9 of them.
> > 
> > > +    description: |
> > > +      List of the hardware port in respective IOMMU block for
> > > current Socs.
> > > +      Refer to bindings/iommu/mediatek,iommu.yaml.
> > > +
> > > +  dma-ranges:
> > > +    maxItems: 1
> > > +    description: |
> > > +      Describes the physical address space of IOMMU maps to
> > > memory.
> > > +
> > > +  "#address-cells":
> > > +    const: 2
> > > +
> > > +  "#size-cells":
> > > +    const: 2
> > > +
> > > +  ranges: true
> > > +
> > > +# Required child node:
> > > +patternProperties:
> > > +  "^venc-core@[0-9a-f]+$":
> > > +    type: object
> > > +    description: |
> > > +      The video encoder core device node which should be added as
> > > subnodes to
> > > +      the main venc node.
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        items:
> > > +         - const: mediatek,mtk-venc-core
> > > +
> > > +      reg:
> > > +        maxItems: 1
> > > +
> > > +      mediatek,core-id:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +        description: |
> > > +          Current encoder core id.
> > 
> > What is this for and what does its value correspond to in the h/w.
> > We 
> > generally don't do made up indices in DT.
> It's for encoder core id, core@1a020000 must be core-0, core@1b020000
> must be core-1, we add this property in each child node, so we can 
> get core-id in drivers. If it can't ref "uint32" types yaml, would 
> you mind giving some more suggestions ?

I still don't understand why it is needed. What is 'core-0'?

Is there some functional difference between the cores? If so, describe 
that difference.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
