Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E82EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 09:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXDC9WpA4ysUzjC3WWt4hmQ/L42rrtlgNTBeqNMbKBE=; b=n3zGut/Myr1etZ
	JwQXpY3xgO+m3hI2NUSI8C+YOVXFUD8wNurhvfrUSIfXlEl9q7cc3kQV4izRzGPFCVXVtIjwaZdBO
	MJ/ZjK0j4HHrHas/30cANCMAL4KBALxag+pAq2vj5itNaup/ug05TppNlUIh56WvNIX8CmdghLc+T
	uLLZdgTWAQuN4PAt/O9tN2NehIfkWQZdHsI8rYtXgqkBi89h9XCHC3mLVKEYNLvPeGd//ApoZbOJ0
	0DksWPtxEysF3Cr08aUC8XataJoVRfh9zNsxqHR4wkCHcXzfI1XZYqZ3qjl3EkxsY6+TeB0q6MqeS
	WnROPqMkz2T+eFi+2iew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncOkA-00Aztb-SY; Thu, 07 Apr 2022 09:47:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncOLv-00Aohp-ID; Thu, 07 Apr 2022 09:22:57 +0000
X-UUID: 91217a6353d74205a800549aa1cc2611-20220407
X-UUID: 91217a6353d74205a800549aa1cc2611-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 95877515; Thu, 07 Apr 2022 02:22:45 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 02:12:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 17:12:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 17:12:41 +0800
Message-ID: <580959b0877d84923ac6298d56d904d4132dab86.camel@mediatek.com>
Subject: Re: [PATCH 1/1] arm64: dts: mt8192: Add mmc device nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>
Date: Thu, 7 Apr 2022 17:12:41 +0800
In-Reply-To: <329bed03-770d-106c-29b4-eb1d6037bf65@collabora.com>
References: <20220401053052.2160-1-allen-kh.cheng@mediatek.com>
 <20220401053052.2160-2-allen-kh.cheng@mediatek.com>
 <329bed03-770d-106c-29b4-eb1d6037bf65@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_022255_682832_B0B359D6 
X-CRM114-Status: GOOD (  17.46  )
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

Hi Angelo,
On Mon, 2022-04-04 at 14:36 +0200, AngeloGioacchino Del Regno wrote:
> Il 01/04/22 07:30, Allen-KH Cheng ha scritto:
> > Add mmc nodes for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 33
> > ++++++++++++++++++++++++
> >   1 file changed, 33 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index a6da7b04b9d4..23eb92057cb9 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -989,6 +989,39 @@
> >   			compatible = "mediatek,mt8192-msdc";
> >   			reg = <0 0x11f60000 0 0x1000>;
> >   			#clock-cells = <1>;
> > +			status = "disabled";
> > +		};
> > +
> 
> Hello!
> Please explain the reason (in the commit message) why you're
> disabling the
> mediatek,mt8192-msdc node, which was enabled before this change.
> 
> Also, introducing the mtk-sd controller at the same address as the
> mt8192-msdc
> clock controller will produce a warning...
> 
> Thanks,
> Angelo

In mt8192.
mmc driver would directly  write/read register(11f60000) to control
clock configure.

Alos there is no other module using msdc: clock-controller.

I would remove the clock-controller entirely and explain in commit
description.

Thanks,
Allen



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
