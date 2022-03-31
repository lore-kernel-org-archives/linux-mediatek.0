Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B313C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 18:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VzwfXLkx9GWiXImaBtkSQhcn2uQ4eBaOh+y57p6/yk=; b=Dv/O3cot+bbGVS
	gWB3t4KRtioSte+/pUlPka2YosTri9QIHu7PIf+/L44/3EFdM/6kad5lhdqcIAa6gTPdqwkvyQPod
	m8ER5TnBTG9zZinrbnWdrjL92cG5GQ/ZXZIWbIYO/1gu5ABXfs1HOE1dUMNNE0xTjxB4dBax/ApEZ
	keEgCMuMCnPIjuK668AGFETqLVLuUQqda+Lheo8xayHfJeGS8QaKanxFTxVYa42e3kXJttf56uBFL
	RnXXyGrxbKVwc64DMZ9/UTWwZcsN4ke+5Zlj9Uxfucm99uN2q2HV8Ohsks2CW47G/f+aoyG+VqHLD
	wyUNH5jGLZ+LCZ7d8hTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZz62-0038Rj-Dl; Thu, 31 Mar 2022 18:00:34 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZz5q-0038PE-BO; Thu, 31 Mar 2022 18:00:23 +0000
Received: by mail-oi1-f175.google.com with SMTP id z8so335514oix.3;
 Thu, 31 Mar 2022 11:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I3BwVGA5gvEgHgvpjpOrGZt3ZZ8DgU2AYuBU6ajRMYQ=;
 b=s9zcjE/mKBZAD+XuNFXDEau8bEPKgcZRSMv5iVqUc5846YuH2ax+lt/h/3aCpDo0Ns
 nR2SGrpmdJ4kD6+xpjib45+gRGDn4l8t8zpkWoxNzywFmpzUuKj04nysgTZfoWiW809m
 +QDgDXkKBb5Rmd6aM1EKctH0Jk7bhTgcypEFFOclqUKxf0mPrsvcuHTAXeAC6on0cKFr
 w98+KyXn51tIinsf/Z1r0uG9Wqra46cyQ49vcDWTrkwJWCWEUfXpT5IQXTawNyJmE1S6
 +2tsXDd9S1ddwfRfkWVOB/UtRwCyU3uwbTI/4ekBCGA/OtFYkStrG119b6AiXo0TlvV4
 nw0A==
X-Gm-Message-State: AOAM530Sf51tJzLUMlGVuwuoBLPNb/qkaoJD5eHwfu9sXkMr3bEqgtnE
 7Uq4rP4ds2jlLRvsCkcH1A==
X-Google-Smtp-Source: ABdhPJxsFMds5NLOAeqJP1PDVG65OgRHVIDdVYYrMbaAaF2R3OmrHV+UeMG2+Ea+FnB9nREtrySkmg==
X-Received: by 2002:a54:4714:0:b0:2ec:f566:8da5 with SMTP id
 k20-20020a544714000000b002ecf5668da5mr3005994oik.97.1648749619926; 
 Thu, 31 Mar 2022 11:00:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h12-20020a9d6a4c000000b005b9d727d4b9sm97792otn.14.2022.03.31.11.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 11:00:19 -0700 (PDT)
Received: (nullmailer pid 1222855 invoked by uid 1000);
 Thu, 31 Mar 2022 18:00:18 -0000
Date: Thu, 31 Mar 2022 13:00:18 -0500
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
Message-ID: <YkXsMoqjOHz4Rf6L@robh.at.kernel.org>
References: <20220317082230.23622-1-irui.wang@mediatek.com>
 <20220317082230.23622-4-irui.wang@mediatek.com>
 <Yj4s0zcHxz3U3wlc@robh.at.kernel.org>
 <ab2b24eeb51048227ad7b2ac659617a7da5b2e45.camel@mediatek.com>
 <YkG8ka1xY2k+HWi1@robh.at.kernel.org>
 <e41e909f85e3891edb6b66d7d5a810af103113c8.camel@mediatek.com>
 <YkMFGbgYq5DhLjt8@robh.at.kernel.org>
 <8e87e98a0b261dcdca9beb41bd1cd5030a4690ab.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e87e98a0b261dcdca9beb41bd1cd5030a4690ab.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_110022_433117_5A6CC38F 
X-CRM114-Status: GOOD (  42.15  )
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

On Wed, Mar 30, 2022 at 04:48:47PM +0800, Irui Wang wrote:
> Dear Rob,
> 
> A sample encoder hardware block diagram attached.
> On Tue, 2022-03-29 at 08:09 -0500, Rob Herring wrote:
> > On Tue, Mar 29, 2022 at 09:26:37AM +0800, Irui Wang wrote:
> > > Dear Rob,
> > > 
> > > Many thanks for your attention.
> > > 
> > > On Mon, 2022-03-28 at 08:48 -0500, Rob Herring wrote:
> > > > On Sat, Mar 26, 2022 at 10:00:55AM +0800, Irui Wang wrote:
> > > > > Dear Rob,
> > > > > 
> > > > > Thanks for your review and comments.
> > > > > 
> > > > > On Fri, 2022-03-25 at 15:57 -0500, Rob Herring wrote:
> > > > > > On Thu, Mar 17, 2022 at 04:22:23PM +0800, Irui Wang wrote:
> > > > > > > Adds encoder cores dt-bindings for mt8195.
> > 
> > [...]
> > 
> > > > > > > +      mediatek,core-id:
> > > > > > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > > +        description: |
> > > > > > > +          Current encoder core id.
> > > > > > 
> > > > > > What is this for and what does its value correspond to in the
> > > > > > h/w.
> > > > > > We 
> > > > > > generally don't do made up indices in DT.
> > > > > 
> > > > > It's for encoder core id, core@1a020000 must be core-0, 
> > > > > core@1b020000
> > > > > must be core-1, we add this property in each child node, so we
> > > > > can 
> > > > > get core-id in drivers. If it can't ref "uint32" types yaml,
> > > > > would 
> > > > > you mind giving some more suggestions ?
> > > > 
> > > > I still don't understand why it is needed. What is 'core-0'?
> > > > 
> > > > Is there some functional difference between the cores? If so,
> > > > describe 
> > > > that difference.
> > > > 
> > > > Rob
> > > 
> > > They are two different pieces of hardware, it's our encoder
> > > hardware
> > > design. There are two encoder hardware cores inside MT8195, named
> > > core0
> > > and core1(we can rename it, but core id should be declared),
> > > for core0, its module base address is 0x1A02_0000, uses IOMMU
> > > "vdo0_iommu" and power domain "POWER_DOMAIN_VENC",
> > > for core1, its module base address is 0x1B02_0000, uses IOMMU
> > > "vpp_iommu" and power domain "POWER_DOMAIN_VENC_CORE1".
> > > So the two encoder cores have their own base, IRQ, clock, power,
> > > etc.
> > > Each core can encode independently, moreover, they can work
> > > together
> > > for higher performance. 
> > > We will describe more details in YAML about it if it's OK for you.
> > 
> > All the resources you list are in the child nodes, so you don't need
> > 0 
> > and 1 numbering for those. 
> > 
> > Looking at the driver patches, the only thing I see distinguishing 
> > core numbers is this:
> > 
> > "frame#0 uses core#0, frame#1 uses core#1, frame#2 uses core#0...,
> > 
> > Lock the device and enable the clock by used core, for sequence
> > header encoding, it always uses core#0."
> > 
> > Is this a requirement in the h/w or just what the driver picked?
> > IOW, 
> > could frame#0 use core#1?
> No, it's a requirement in the h/w, driver trigger core start encoding
> is in order.
> About the encoder hardware block diagram, please check below:
> --------------------------------------------------------------
> Input Buffer: 0     1     2     3     4     5     6
>               |     |     |     |     |     |     |
>               v     |     v     |     v     |     v
>           +-------+ | +-------+ | +-------+ | +-------+
>           | core0 | | | core0 | | | core0 | | | core0 |
>           +-------+ | +-------+ | +-------+ | +-------+
>               |     |     |     |     |     |     |
>               |     v     |     v     |     v     |
>               | +-------+ | +-------+ | +-------+ |
>               | | core1 | | | core1 | | | core1 | |
>               | +-------+ | +-------+ | +-------+ |
>               |     |     |     |     |     |     |
>               v     v     v     v     v     v     v    <parent>
> --------------------------------------------------------------
>                         core || index                  <child>
>                              \/
>        +-----------------------------------------------+
>        |                  core0/core1                  |
>        |          enable/disable power/clk/irq         |
>        +-----------------------------------------------+
> --------------------------------------------------------------
> As above , there are parent and child devices, child mean each venc
> core, the child device controls the information of each core
> independent which inlcude power/clk/irq.
> When start encoding, input buffer 0 will be encoded by core0, and input
> buffer 1 can be encoded by core1 even if buffer 0 has not been encoded
> done yet, after buffer 0 encoded done, buffer 2 will be encoded by
> core0, and buffer 1 encoded done by core1. These two encoder cores will
> encode each input in this overlapping manner.
> 
> We need manage each child device in parent device by core-id property.
> And we also need record current encoding input buffer, encode done
> output buffers and which one core is in used through core-id, because
> the two cores are encoding at the same time under one parent driver.

Okay, please summarize the h/w requirement in the property description.

You might put the above diagram in the top description too.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
