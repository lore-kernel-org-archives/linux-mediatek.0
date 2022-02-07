Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A923C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 06:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8S9Zrhx5ocfiY53Jj4O4N5n37tx9T0tWFFV+sM/lm8=; b=u/oNWikIaDxLp+
	mp1QPtGrsjqk7Bo2fbcdqh2pTgueXqoofUuX5YljjCeOnCjKV6HRcYikSTeuZD3TbnuzL1eIB4h+/
	p/f+cwHgt2kjUJDSle/IrHUvWt2LJVEWBPKBPEqCkZxCQSCQS5gkZQwd8mDQxWcYr73toU65Wqyo/
	AGMoObUdb2hb7+umxCfzDKIQkHzXfLYs5BudhCqBFjiIu8FpRoKbWsUcyyVeXSDNsrblwvG7wWSBM
	119MEbX+nBG4GThW7XksqgOVN4kxotj1W0kk07HLLfhWVfReZ6qGEBq9aZ2k2B7ST/peYYyRgEZe6
	7nCnRkD1D7kIPK4RcKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGxRn-0097jw-T4; Mon, 07 Feb 2022 06:24:23 +0000
Received: from mailgw01.mediatek.com ([66.171.122.165])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGxRl-0097jM-75; Mon, 07 Feb 2022 06:24:22 +0000
X-UUID: 9b8f6d82e9984958b2901b7743aa6de9-20220206
X-UUID: 9b8f6d82e9984958b2901b7743aa6de9-20220206
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1472643731; Sun, 06 Feb 2022 23:24:15 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Feb 2022 22:24:13 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Feb 2022 14:24:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Feb 2022 14:24:11 +0800
Message-ID: <4490a88150f5aa108e1d6ff8ce55264c3b1734c2.camel@mediatek.com>
Subject: Re: [PATCH v22 1/7] dt-bindings: soc: mediatek: add mtk svs
 dt-bindings
From: Roger Lu <roger.lu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>, "HenryC
 Chen" <HenryC.Chen@mediatek.com>, Nishanth Menon <nm@ti.com>, Charles Yang
 <Charles.Yang@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Fan Chen
 <fan.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Nicolas
 Boichat <drinkcat@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, "Mark Rutland"
 <mark.rutland@arm.com>, Angus Lin <Angus.Lin@mediatek.com>
Date: Mon, 7 Feb 2022 14:24:11 +0800
In-Reply-To: <YfnFBirxSnCqRDem@robh.at.kernel.org>
References: <20220127033956.24585-1-roger.lu@mediatek.com>
 <20220127033956.24585-2-roger.lu@mediatek.com>
 <YfnFBirxSnCqRDem@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_222421_299701_39193DE0 
X-CRM114-Status: GOOD (  15.75  )
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

Hi Rob,

On Tue, 2022-02-01 at 17:40 -0600, Rob Herring wrote:
> On Thu, 27 Jan 2022 11:39:50 +0800, Roger Lu wrote:
> > Document the binding for enabling mtk svs on MediaTek SoC.
> > 
> > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > ---
> >  .../bindings/soc/mediatek/mtk-svs.yaml        | 83 +++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-
> > svs.yaml
> > 
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

Oh, this patch has error detected and shown in [1]. Therefore, I fix it and
state the change at [2]. Thanks for the explanation and time to review the
patch.

[1] 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220107095200.4389-2-roger.lu@mediatek.com/
[2] 
https://patchwork.kernel.org/project/linux-mediatek/cover/20220127033956.24585-1-roger.lu@mediatek.com/
- Remove unnecessary "maxItems" from nvmem-cells in mtk-svs.yaml.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
