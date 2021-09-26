Return-Path: <SRS0=WJkm=OQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5EBC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Sep 2021 08:32:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E82F60F93
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Sep 2021 08:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E82F60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6CudA80/blQtTdmInr4uQsShWgcDjIv/KTuqsMcDh4=; b=2fGPz9jwOtdVa5
	3yWLAxgedkR76h8uj1gLTpowGuHGebnZedxrJ6lAhKOlC/fRFsxQLP1oYuBqH1RyRfOduP8GgdYNu
	hqC9oSXV46Lf9PEABFKJSzXXks8XWiMo/NBiHERq592kWDx+rq2vx3KBXmobdeBjmRFD9lBikrKgD
	XOHRYi2ntjYWTsdQPdva0iZ8MbaYx4mMnIFwOeZzF3ENTtOLu50rW4CWlrlLWuFgB72iCxXWS0Yp9
	1WAtWMNsfxrTJmwAwsyYMkpvQBfgqHxrXxlZ1kuMdCd+1kBps5d0OzUXgbVeB2i0q3DeCvKKXTzzx
	pTTOeO+zb7hMcxvxPKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUPaW-000FG4-J9; Sun, 26 Sep 2021 08:32:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUPaS-000FFG-P0; Sun, 26 Sep 2021 08:32:42 +0000
X-UUID: 4bc45d3218aa42f1973fce3c003d80b4-20210926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Acv790oOGOjZXUxMhyPqWQCJIZJ6gwtwZjAYR4X2LnA=; 
 b=fhm1W9MBX1qwGCQqEAddW8uFXHm3GzuuPfwz/NCv49Sbm5jngJHW7rqfh1ao0rdhOKg83uLr9VxXIgA82S3Fahn8vCO4P3H337sITRwgs/qdsyiBAAzOe/DVe8M9ODy50N2AWaM0ClpiQ3ihFKjbAQKohQM2fY3ihQjIiw+Fu0g=;
X-UUID: 4bc45d3218aa42f1973fce3c003d80b4-20210926
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1781075037; Sun, 26 Sep 2021 01:32:37 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Sep 2021 01:27:48 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Sep 2021 16:27:46 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 26 Sep 2021 16:27:45 +0800
Message-ID: <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Irui Wang
 <irui.wang@mediatek.com>, linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Sun, 26 Sep 2021 16:27:48 +0800
In-Reply-To: <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
 <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
 <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210926_013240_824526_35CC5D89 
X-CRM114-Status: GOOD (  48.33  )
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

Hi Ezequiel,

Could you please help to give some feedback when you are free for iommu
limitation?

According to google's suggestion, it's better not to use v4l2 async
also.
If there are no further comments, I don't have other choice for this
architecture.

Thanks,
Yunfei Dong
On Tue, 2021-09-14 at 20:16 +0800, yunfei.dong@mediatek.com wrote:
> Hi Ezequiel,
> 
> On Fri, 2021-09-03 at 11:08 +0800, yunfei.dong@mediatek.com wrote:
> > Hi Ezequiel,
> > 
> > Thanks for your suggestion.
> > On Thu, 2021-09-02 at 13:30 -0300, Ezequiel Garcia wrote:
> > > On Wed, 1 Sept 2021 at 05:32, Yunfei Dong <
> > > yunfei.dong@mediatek.com
> > > > 
> > > 
> > > wrote:
> > > > 
> > > > This series adds support for multi hardware decode into mtk-
> > > > vcodec, 
> > > > by first
> > > > adding component framework to manage each hardware information:
> > > > interrupt,
> > > > clock, register bases and power. Secondly add core thread to
> > > > deal
> > > > with core
> > > > hardware message, at the same time, add msg queue for different
> > > > hardware
> > > > share messages. Lastly, the architecture of different specs are
> > > > not
> > > > the same,
> > > > using specs type to separate them.
> > > > 
> > > > This series has been tested with both MT8183 and MT8173.
> > > > Decoding
> > > > was working
> > > > for both chips.
> > > > 
> > > > Patches 1~3 rewrite get register bases and power on/off
> > > > interface.
> > > > 
> > > > Patch 4 add component framework to support multi hardware.
> > > > 
> > > > Patch 5 separate video encoder and decoder document
> > > > 
> > > > Patches 6-15 add interfaces to support core hardware.
> > > > ----
> > > > This patch dependents on : "media: mtk-vcodec: support for
> > > > MT8183
> > > > decoder"[1] and
> > > > "Mediatek MT8192 clock support"[2].
> > > > 
> > > > 1: Multi hardware decode is based on stateless decoder, MT8183
> > > > is
> > > > the first time
> > > > to add stateless decoder. Otherwise it will cause conflict.
> > > > This
> > > > patch will be
> > > > accepted in 5.15[1].
> > > > 
> > > > 2: The definition of decoder clocks are in mt8192-clk.h, this
> > > > patch
> > > > already in clk tree[2].
> > > > 
> > > > [1]
> > > > 
> 
> https://patchwork.linuxtv.org/project/linux-media/list/?series=5826
> > > > [2]
> > > > 
> 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=f35f1a23e0e12e3173e9e9dedbc150d139027189
> > > > ----
> > > > Changes compared with v5:
> > > > -Add decoder hardware block diagram for patch 13/15
> > > > 
> > > 
> > > 
> > > The discussion on v5 was still on-going, so sending this v6
> > > is not helpful. The context for v5's discussion is now harder to
> > > find.
> > > 
> > > Please avoid sending a new version without properly
> > > discussing all the feedback, and without reaching consensus.
> > > This is very important, please keep it in mind.
> > > 
> > 
> > Thanks for your remind, I will keep this patch until get the
> > solution.
> > 
> > > Specifically, the feedback on v5 was NAK, with the request to
> > > avoid
> > > using any async framework, and instead try to find a simpler
> > > solution.
> > > 
> > > For instance, you can model things with a bus-like pattern,
> > > which ties all the devices together, under a parent node.
> > > This pattern is common in the kernel, the parent
> > > node can use of_platform_populate or similar
> > > (git grep of_platform_populate, you will see plenty of examples).
> > > 
> > > You will still have to do some work to have the proper
> > > regs resources, but this is doable. Each child is a device,
> > > so it can have its own resources (clocks, interrupts, iommus).
> > > 
> > > You don't need any async framework.
> > > 
> 
> Thanks for your suggestion very much, and there are several actions
> need to check.
> 
> 1: The iommu register like this:
> ret = bus_set_iommu(&platform_bus_type,
> &mtk_iommu_ops); 
> It expect the consumer is a standard platform device.
> otherwise it
> could not enter to the iommu of_xlate.)
> 
> So if putting the iommus property in the child node, all the child
> device need to registered as platform device.
> 
> 2: For the interrupt in each child node, but the logical processing
> in
> parent part. Child and parent need to send message for each other. In
> order to control clk/power/irq for multi instance, need send message
> to
> child to separate different hardware; child also need send message to
> parent when get interrupt.
> 
> 3: About Chen-Yu's mail, do you have any advice?
> 
> Do you have any suggestion about these two scenarios?
> I'm very happy to get your reply.
> 
> Thanks
> Yunfei Dong
> 
> > >     vcodec_dec: vcodec_dec@16000000 {
> > >         compatible = "mediatek,mt8192-vcodec-dec";
> > >         reg = <something>;
> > >         mediatek,scp = <&scp>;
> > >         iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> > >         dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > > 
> > >         vcodec_lat@0x10000 {
> > >             compatible = "mediatek,mtk-vcodec-lat";
> > >             reg = <0x10000 0x800>;      /* VDEC_MISC */
> > >             interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> > >             // etc
> > >         };
> > > 
> > >         vcodec_core@0x25000 {
> > >            compatible = "mediatek,mtk-vcodec-core";
> > >            reg = <0x25000 0x1000>;      /* VDEC_CORE_MISC */
> > >            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> > >            // etc
> > >         };
> > >     };
> > > 
> > > Thanks,
> > > Ezequiel
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
