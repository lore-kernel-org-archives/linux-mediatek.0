Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2C1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 13:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVi19Ews8tq4sdJb4FsUpY2X3LFuVsoa+91IsreMPc0=; b=deDOKpSJ6r4qXX
	+Q5iNa5lb82eIuKfWjCrAFm/iLCnE5gMzzxzLruLHwlwyUPKmuZbzWyTGStL4JavaACXXTM0SCtEQ
	Zo6bzaYEHwA4HsL7P9rnwq5og+qHibMZhDK5DTX3hD2ISnR19wgWn/eQU7VcyWSCRXFqJFyUHstia
	Ljo9bn0MWMGnRpml5qSq/eJfvvIOvVNmHNk7yyopig1Z7HcPREdPNrRY9emnViigCJnuzU51wLKw0
	AnCLP5ci/68OEw9Gwts3qNI7tVzL0pSv6KP06HF9PeC9Lrea2lkvXdukMWR0BbJNemjEXFvD486NC
	MQjGcN1xpNufRAgW5uDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZBbp-00CILu-0S; Tue, 29 Mar 2022 13:10:05 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZBbZ-00CII0-Ih; Tue, 29 Mar 2022 13:09:53 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 k18-20020a9d7012000000b005cdb11186f2so11461039otj.9; 
 Tue, 29 Mar 2022 06:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pgmVS6Ri5wIx578wOnaD17/Gk0HO8xT8dcbeURwXcvM=;
 b=O9JYOC3lYMVhhOzJnjB+lxV+4hyt0GnJQWtDt+dqcdpmEAC706AzWZDaJKQ7z2Tpeq
 oTvpDSfcEjYCwkt4k+9ZYQAXIRQPaPcsDCegG9CEodjhhxJxvq2u8IM11fUsEHoY2Xqq
 m07Sqi4Hh18npXabHRE/GG+lOwZ3mAr1urmOY5aXdjtCJGlodKR/IVA6ebFH10leKUAh
 Nt8kMU9K+0ci/BluSLtxkdCFH4BQipABowyceCQUGslFkKCs/g6GEMVAv9NaRsSYUES3
 wiATbdKqW2kswudxAU8MGuNfjcGFFhS9IfhDPolemLbCi7poSr9q0xpc32sSBK0GQatH
 rC1g==
X-Gm-Message-State: AOAM530+nNjuyW232EFG9AOtDCtEoNiDVwrGnFyZ4p0mD1kXsU4fHG7l
 SXYU/sIhOb1/ELc9sZ0vDw==
X-Google-Smtp-Source: ABdhPJxz1vLRb+ULvjznOE3SueYbicXZjpLRanPIOSO+cxvPbO6krkNLY2qTn6KPl8CwI3JDJM2gsQ==
X-Received: by 2002:a9d:5614:0:b0:5b2:5fe3:8f1c with SMTP id
 e20-20020a9d5614000000b005b25fe38f1cmr1052711oti.229.1648559387820; 
 Tue, 29 Mar 2022 06:09:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 li20-20020a056871421400b000deaa91898fsm6115814oab.40.2022.03.29.06.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 06:09:46 -0700 (PDT)
Received: (nullmailer pid 482676 invoked by uid 1000);
 Tue, 29 Mar 2022 13:09:45 -0000
Date: Tue, 29 Mar 2022 08:09:45 -0500
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
Message-ID: <YkMFGbgYq5DhLjt8@robh.at.kernel.org>
References: <20220317082230.23622-1-irui.wang@mediatek.com>
 <20220317082230.23622-4-irui.wang@mediatek.com>
 <Yj4s0zcHxz3U3wlc@robh.at.kernel.org>
 <ab2b24eeb51048227ad7b2ac659617a7da5b2e45.camel@mediatek.com>
 <YkG8ka1xY2k+HWi1@robh.at.kernel.org>
 <e41e909f85e3891edb6b66d7d5a810af103113c8.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e41e909f85e3891edb6b66d7d5a810af103113c8.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_060949_659897_9FCD31D8 
X-CRM114-Status: GOOD (  30.14  )
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

On Tue, Mar 29, 2022 at 09:26:37AM +0800, Irui Wang wrote:
> Dear Rob,
> 
> Many thanks for your attention.
> 
> On Mon, 2022-03-28 at 08:48 -0500, Rob Herring wrote:
> > On Sat, Mar 26, 2022 at 10:00:55AM +0800, Irui Wang wrote:
> > > Dear Rob,
> > > 
> > > Thanks for your review and comments.
> > > 
> > > On Fri, 2022-03-25 at 15:57 -0500, Rob Herring wrote:
> > > > On Thu, Mar 17, 2022 at 04:22:23PM +0800, Irui Wang wrote:
> > > > > Adds encoder cores dt-bindings for mt8195.

[...]

> > > > > +      mediatek,core-id:
> > > > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +        description: |
> > > > > +          Current encoder core id.
> > > > 
> > > > What is this for and what does its value correspond to in the
> > > > h/w.
> > > > We 
> > > > generally don't do made up indices in DT.
> > > 
> > > It's for encoder core id, core@1a020000 must be core-0, 
> > > core@1b020000
> > > must be core-1, we add this property in each child node, so we can 
> > > get core-id in drivers. If it can't ref "uint32" types yaml, would 
> > > you mind giving some more suggestions ?
> > 
> > I still don't understand why it is needed. What is 'core-0'?
> > 
> > Is there some functional difference between the cores? If so,
> > describe 
> > that difference.
> > 
> > Rob
> 
> They are two different pieces of hardware, it's our encoder hardware
> design. There are two encoder hardware cores inside MT8195, named core0
> and core1(we can rename it, but core id should be declared),
> for core0, its module base address is 0x1A02_0000, uses IOMMU
> "vdo0_iommu" and power domain "POWER_DOMAIN_VENC",
> for core1, its module base address is 0x1B02_0000, uses IOMMU
> "vpp_iommu" and power domain "POWER_DOMAIN_VENC_CORE1".
> So the two encoder cores have their own base, IRQ, clock, power, etc.
> Each core can encode independently, moreover, they can work together
> for higher performance. 
> We will describe more details in YAML about it if it's OK for you.

All the resources you list are in the child nodes, so you don't need 0 
and 1 numbering for those. 

Looking at the driver patches, the only thing I see distinguishing 
core numbers is this:

"frame#0 uses core#0, frame#1 uses core#1, frame#2 uses core#0...,

Lock the device and enable the clock by used core, for sequence
header encoding, it always uses core#0."

Is this a requirement in the h/w or just what the driver picked? IOW, 
could frame#0 use core#1?

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
