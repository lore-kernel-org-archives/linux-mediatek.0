Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EFFC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 02:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVCCaSBsWWhBL63ff5fTgy/DvnuF5+u8d9f8xTYRV4M=; b=3RsvJfq3bsGyGn
	Tsmht+Z6bKRGd6mA4zb83OhH6omNe/qCde+iuJjPv0mTQ42Sw/J+MM3FstKaY1KTzEZtPAIJ+NgIy
	tVbvPAnf0sUsC0xVIFp86NdhU0N25d7aOWNON9vXckIaJspx8Ca1jZvIN0OyL+VVa1LtEhjPfAB2Q
	Kbvc8yGW5pXFjcM8n5VXY5R9VVZwi3YDhdzxAZSE/B55sRXU38rBBK6uaqRhv7Cmwxc2myVgeot55
	CpDsvk1ruOeiBn7pIQ/CATP1pyvXF53tiTSEOyDgiMcwHMnJe01M0vjsyQVDXpjqjB7RL1tfEwUPR
	MkGXLZbsHaMRE+QVG/iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV1xe-0009p6-6D; Fri, 18 Mar 2022 02:03:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV1xT-0009nW-0W; Fri, 18 Mar 2022 02:03:16 +0000
X-UUID: 1b1b3a15b8b14ba1a74585947c862e15-20220317
X-UUID: 1b1b3a15b8b14ba1a74585947c862e15-20220317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2009058534; Thu, 17 Mar 2022 19:03:08 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 19:02:19 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 18 Mar 2022 10:02:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 10:02:16 +0800
Message-ID: <300c80f9c6217ce1b1ecee7f76043002dde530a3.camel@mediatek.com>
Subject: Re: [PATCH v12 2/3] dts: arm64: mt8183: add Mediatek MDP3 nodes
From: moudy.ho <moudy.ho@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>, <tfiga@chromium.org>,
 <drinkcat@chromium.org>, <pihsun@chromium.org>, <hsinyi@google.com>,
 "Maoguang Meng" <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <randy.wu@mediatek.com>,
 <jason-jh.lin@mediatek.com>, <roy-cw.yeh@mediatek.com>,
 <river.cheng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 18 Mar 2022 10:02:16 +0800
In-Reply-To: <7e898858-510a-dae6-2ef4-1cb8b1a42b21@collabora.com>
References: <20220317145605.25782-1-moudy.ho@mediatek.com>
 <20220317145605.25782-3-moudy.ho@mediatek.com>
 <7e898858-510a-dae6-2ef4-1cb8b1a42b21@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_190315_069275_54569E59 
X-CRM114-Status: GOOD (  20.56  )
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

On Thu, 2022-03-17 at 16:26 +0100, AngeloGioacchino Del Regno wrote:
> Il 17/03/22 15:56, Moudy Ho ha scritto:
> > Add device nodes for Media Data Path 3 (MDP3) modules.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 108
> > ++++++++++++++++++++++-
> >   1 file changed, 107 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index fc6ac2a46324..eaa6dac7768b 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -1389,6 +1389,79 @@
> >   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0 0x1000>;
> >   		};
> >   
> > +		mdp3_rdma0: mdp3_rdma0@14001000 {
> 
> Hello Moudy,
> 
> I know, this is already at v12 and I'm truly sorry for noticing this
> only now,
> but that's a bit critical to solve: you can't use underscores in node
> names (but
> you can do it in phandles).
> 
> Example:
> 
> mdp3_rdma0: mdp3_rdma0@14001000 <-- THIS IS WRONG
> 
> mdp3_rdma0: mdp3-rdma0@14001000 <--- THIS IS OK
> 
> of course, that's the same also for mdp3-rsz0@..... and the others.
> 
> Please fix this both here and in the yaml bindings in patch 1/3!
> 
> Sorry again,
> Angelo
> 

Hi Angelo,

Thanks for your help in checking and corresting the errors i haven't
found, I'll fix the relevant dts and bindings in the next version.

Thanks,
Moudy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
