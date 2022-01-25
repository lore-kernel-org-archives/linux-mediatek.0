Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09546C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 08:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v3xvAQSQ1Uo/f4UvvnZut/no+oWQqOxTpjd1rHlVCCE=; b=tBN0Y+9TZA0hlt
	lQDTqbukC+BXtwG+d5J2gKx+AkLCiYDEuc1jVwoazMkbquSlbxxTYaPdP2hiFvo7JNUxotNRxh1UX
	n8I57QDnLA0xSRisSOeFXvdVQJH1MVZjyjha+fSnlp5DeKKh5ylrJ8snWefU2UahLr5q3M+n30alB
	HXPIL2TLiHaCkrlChSdc1uZYD0LAl3K9wwGz7mckTCx30cswiUdc3zZkuTAubpgCNzSCckn0ve+pJ
	/o8GioNJ/1UoirY7jhnW/MjdXuRR7c0Y/E3JHVW3h2XP2zJBM2TRfsSRB4X2xSOSPIbVuXRiJA2uG
	1XYfSpO1vFe0U8VzzqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCH3q-006qLu-D8; Tue, 25 Jan 2022 08:20:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCH3m-006qLG-4V; Tue, 25 Jan 2022 08:20:17 +0000
X-UUID: a1ddce5abf064aa988004858ff8b55ae-20220125
X-UUID: a1ddce5abf064aa988004858ff8b55ae-20220125
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1477085788; Tue, 25 Jan 2022 01:20:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 00:20:07 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 25 Jan 2022 16:20:05 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 16:20:05 +0800
Message-ID: <356f512b549f90b329775e249fd48eb2954ade02.camel@mediatek.com>
Subject: Re: [PATCH v11 2/3] dts: arm64: mt8183: add Mediatek MDP3 nodes
From: moudy ho <moudy.ho@mediatek.com>
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
 <drinkcat@chromium.org>, <pihsun@chromium.org>, <hsinyi@google.com>, Maoguang
 Meng <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <randy.wu@mediatek.com>,
 <jason-jh.lin@mediatek.com>, <roy-cw.yeh@mediatek.com>,
 <river.cheng@mediatek.com>, <srv_heupstream@mediatek.com>
Date: Tue, 25 Jan 2022 16:20:05 +0800
In-Reply-To: <d61ec481-8059-a897-504a-0125f88fad61@collabora.com>
References: <20220105093758.6850-1-moudy.ho@mediatek.com>
 <20220105093758.6850-3-moudy.ho@mediatek.com>
 <d61ec481-8059-a897-504a-0125f88fad61@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_002014_218354_49D65941 
X-CRM114-Status: GOOD (  17.54  )
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

On Fri, 2022-01-21 at 12:58 +0100, AngeloGioacchino Del Regno wrote:
> Il 05/01/22 10:37, Moudy Ho ha scritto:
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
> > index ba4584faca5a..b872ef1ff6b3 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -1325,6 +1325,79 @@
> >   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0 0x1000>;
> >   		};
> >   
> > +		mdp3_rdma0: mdp3_rdma0@14001000 {
> > +			compatible = "mediatek,mt8183-mdp3",
> > +				     "mediatek,mt8183-mdp3-rdma0";
> > +			mediatek,scp = <&scp>;
> > +			mediatek,mdp3-comps = "mediatek,mt8183-mdp3-
> > dl1",
> > +					      "mediatek,mt8183-mdp3-
> > dl2",
> > +					      "mediatek,mt8183-mdp3-
> > path1",
> > +					      "mediatek,mt8183-mdp3-
> > path2",
> > +					      "mediatek,mt8183-mdp3-
> > imgi",
> > +					      "mediatek,mt8183-mdp3-
> > exto";
> > +			reg = <0 0x14001000 0 0x1000>,
> > +			      <0 0x14000000 0 0x1000>,
> > +			      <0 0x14005000 0 0x1000>,
> > +			      <0 0x14006000 0 0x1000>,
> > +			      <0 0x15020000 0 0x1000>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX
> > 0x1000 0x1000>,
> > +						  <&gce SUBSYS_1400XXXX
> > 0 0x1000>,
> > +						  <&gce SUBSYS_1400XXXX
> > 0x5000 0x1000>,
> > +						  <&gce SUBSYS_1400XXXX
> > 0x6000 0x1000>,
> > +						  <&gce SUBSYS_1502XXXX
> > 0 0x1000>;
> > +			power-domains = <&spm
> > MT8183_POWER_DOMAIN_DISP>;
> > +			clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> > +				 <&mmsys CLK_MM_MDP_RSZ1>,
> > +				 <&mmsys CLK_MM_MDP_DL_TXCK>,
> > +				 <&mmsys CLK_MM_MDP_DL_RX>,
> > +				 <&mmsys CLK_MM_IPU_DL_TXCK>,
> > +				 <&mmsys CLK_MM_IPU_DL_RX>;
> > +			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
> > +			mediatek,mmsys = <&mmsys>;
> > +			mediatek,mm-mutex = <&mutex>;
> > +			mediatek,mailbox-gce = <&gce>;
> > +			mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
> > +				 <&gce 21 CMDQ_THR_PRIO_LOWEST>,
> > +				 <&gce 22 CMDQ_THR_PRIO_LOWEST>,
> > +				 <&gce 23 CMDQ_THR_PRIO_LOWEST>;
> 
> Hello Moudy,
> the mboxes for gce 21, 22, 23 are missing the third cell. Please fix.
> 
> Regards,
> Angelo

Hi Angelo,
Thanks for the reminder, but I'm a bit confused, the previous
version(v10) mentioned that the current upstream mbox has only 2
cells.
So I should follow this rule to remove the extra 0 in the first item as
follows:
 +			mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST>,
 +				 <&gce 21 CMDQ_THR_PRIO_LOWEST>,
 +				 <&gce 22 CMDQ_THR_PRIO_LOWEST>,
 +				 <&gce 23 CMDQ_THR_PRIO_LOWEST>;

Thanks,
Moudy Ho
> 
> > +			gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
> > +				     <&gce 0x14010000 SUBSYS_1401XXXX>,
> > +				     <&gce 0x14020000 SUBSYS_1402XXXX>,
> > +				     <&gce 0x15020000 SUBSYS_1502XXXX>;
> > +		};
> > +
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
