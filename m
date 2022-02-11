Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D48C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 03:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L7W+wVFdSZ4SHtPCr+087jR4h55x8w+YZANCcHvVh4E=; b=sScaCtKKHkDQfH
	sxWdNzOs040fRzhYKqE1TIGyDz8UXKHwWX7tISz9qFCtJ1Zb/kGgZEYAgTzcW3Yer6XfzyZOFnQ6A
	/Na5tWZk3HQ0QJVmlIgu1zBY6m7MUVjepIK8B/NAMZ92xjauzmdsKZsRStSJlprAsRGNskQiDt1t8
	gJ5EurI7iC7XAURWlgjUhMnQW1ZIYuEE5fN8M0y7t8OKtBco3//omFr50nA11Bu8v+PU65YHmdeOc
	pPLv/+vDFvF7sgs8epstO8394A0v8M5oPyk4bVZrrREik6spFabkLJ03ciVeAzZpMZRNw9vvaqldw
	56Qvpnj26tEJNvk9xxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIN0c-005gbs-R1; Fri, 11 Feb 2022 03:54:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIMx3-005efh-4h; Fri, 11 Feb 2022 03:50:31 +0000
X-UUID: 20b1e8420dd44b328e44bd856b2f365b-20220210
X-UUID: 20b1e8420dd44b328e44bd856b2f365b-20220210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dawei.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1703090562; Thu, 10 Feb 2022 20:50:26 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 19:50:24 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 11 Feb 2022 11:50:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Feb 2022 11:50:17 +0800
Message-ID: <199f0e547431d103dc22f8037a72f72dcd0ccf54.camel@mediatek.com>
Subject: Re: [V11,PATCH 16/19] arm64: dts: mt8183: add dvfsrc related nodes
From: Dawei Chien <dawei.chien@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
CC: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, <devicetree@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 Fan Chen <fan.chen@mediatek.com>, Arvin Wang <arvin.wang@mediatek.com>, James
 Liao <jamesjj.liao@mediatek.com>, Henry Chen <henryc.chen@mediatek.com>
Date: Fri, 11 Feb 2022 11:50:17 +0800
In-Reply-To: <e08c8a92-a4c6-61a0-4fe7-6d8e2d83163b@collabora.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
 <20210812085846.2628-17-dawei.chien@mediatek.com>
 <e08c8a92-a4c6-61a0-4fe7-6d8e2d83163b@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_195029_210839_3E9934C2 
X-CRM114-Status: GOOD (  16.78  )
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

On Thu, 2022-02-03 at 16:16 +0100, AngeloGioacchino Del Regno wrote:
> Il 12/08/21 10:58, Dawei Chien ha scritto:
> > From: Henry Chen <henryc.chen@mediatek.com>
> > 
> > Add DDR EMI provider dictating dram interconnect bus performance
> > found on
> > MT8192-based platforms
> > 
> > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> 
> This patch definitely has to be squashed with patch 07/19.
> 
> Same for patch 17 and 19.
> 
> Also, sign-off.
> 

I would squash patch 07/16, 08/17, 09/18 on next version, thank you.

> > ---
> >   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index 7ad4cf646579..86f85c34c88a 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -7,6 +7,7 @@
> >   
> >   #include <dt-bindings/clock/mt8183-clk.h>
> >   #include <dt-bindings/gce/mt8183-gce.h>
> > +#include <dt-bindings/interconnect/mtk,mt8183-emi.h>
> >   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >   #include <dt-bindings/interrupt-controller/irq.h>
> >   #include <dt-bindings/memory/mt8183-larb-port.h>
> > @@ -586,6 +587,7 @@
> >   		ddr_emi: dvfsrc@10012000 {
> >   			compatible = "mediatek,mt8183-dvfsrc";
> >   			reg = <0 0x10012000 0 0x1000>;
> > +			#interconnect-cells = <1>;
> >   		};
> >   
> >   		pwrap: pwrap@1000d000 {


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
