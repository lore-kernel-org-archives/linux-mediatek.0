Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75AEC07E9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 06:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgJsGLtFWAgDS95OH6OayatCLuFurS4PvDrsgBpFDyo=; b=mzvlgSRlspXd3LIDzgCp5hzw5i
	LALRgnk48e7GR9IZ5gscYOhq6b2Hs08Hy5vVQnlssfbSPxvFLTrk7Tmo9tari9PThXQGGwYSv0h10
	eadr6hkqnOii00dQp0ziMyvA76lq1u86GC7M1tOXY5rQKo3mgrgdeWhleTxd+tR8D6PatxAU++Zww
	ABG7iEJVpOTeSGFquVjhhxaNcLTwUPWyfaoYxV+eicHTOoXK/GNAtxc5/jjGXSD9YGS5PKi//D/La
	OmGm/OGoSm/RRperxfPGqt5zb2DNqG8JnfSKWhWFjyJVDQqfkk2omgFxIIZXakA7W5LLTuqwBhobm
	kfc/8OZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od48c-008a7R-Ck; Tue, 27 Sep 2022 06:32:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od48R-008a02-C5; Tue, 27 Sep 2022 06:32:04 +0000
X-UUID: 9971bb9357de4935bd22f55dc48b26b9-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=zgJsGLtFWAgDS95OH6OayatCLuFurS4PvDrsgBpFDyo=;
	b=PCALu0EhbfPasL9wQeIN0zA8YlX/jYLqz7hjvYMTYTskrkJ0i/l4tLAnlM5Hg2onGl1YzEXgLrmFWyKjISOLzuaQ93ZMiDS01fsH0t1NiuzERp2WnwNP9Lgs0514sRF5g0cVxq5vrLA6qb+oo7cwsNdpuOmTo3uNGY+Dmfx400w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:04b01880-7b5e-4407-b07a-17b576f2d3ff,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:3b1232a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9971bb9357de4935bd22f55dc48b26b9-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <liangxu.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2045589916; Mon, 26 Sep 2022 23:31:54 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 14:31:25 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 27 Sep 2022 14:31:25 +0800
Message-ID: <5da3dfcfe7c36b4288d95e7416fb5930a83f1d8e.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: Add compatible for
 MediaTek MT8188
From: liangxu.xu <liangxu.xu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<xinlei.lee@mediatek.com>
Date: Tue, 27 Sep 2022 14:31:26 +0800
In-Reply-To: <fea0d8b3-f9e2-d081-e0c0-d81c9ca405d2@linaro.org>
References: <20220923014227.6566-1-liangxu.xu@mediatek.com>
	 <33e9babb-0492-2f41-d055-45ed32d55906@linaro.org>
	 <ff6020d05962e202e917644b06eaa2cff7b2bb99.camel@mediatek.com>
	 <8cc90559-6e83-1b6d-2718-d26ceace6362@linaro.org>
	 <023b0a09a65042e6fee6b668d3df506f7d8178fd.camel@mediatek.com>
	 <fea0d8b3-f9e2-d081-e0c0-d81c9ca405d2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_233203_446197_CE3064BA 
X-CRM114-Status: GOOD (  16.79  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2022-09-26 at 14:53 +0200, Krzysztof Kozlowski wrote:
> On 26/09/2022 14:12, liangxu.xu wrote:
> > 
> > Can I modify it to the following form:
> > properties:
> >   compatible:
> >     oneOf:
> >       - enum:
> >         - mediatek,mt2701-dpi
> >         - mediatek,mt7623-dpi
> >         - mediatek,mt8173-dpi
> >         - mediatek,mt8183-dpi
> >         - mediatek,mt8186-dpi
> >         - mediatek,mt8192-dpi
> >         - mediatek,mt8195-dp-intf
> >       - items:
> >           - enum:
> >               - mediatek,mt8188-dp-intf
> >           - const: mediatek,mt8195-dp-intf
> > 
> > This means that mt8188 reuses mt8195, so there is no need to add
> > compatible to the driver.
> 
> I am now confused. You send some bindings which do not match DTS and
> driver?
> 
> This has to stop... please post the bindings with the user - DTS and
> optionally driver.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof:

I'm very sorry that my patch made you confused, please ignore this
patch. I will wait for the patch of mt8188 dts to be ready and send it
together. In the later mt8188 dts, I will reuse the compatible of
mt8195.

Best Regards,
LiangXu



