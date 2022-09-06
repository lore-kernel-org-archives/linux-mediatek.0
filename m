Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3A8ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 02:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLZfor8VBXyAk27TpjkWmLUUJBncHtHiCzkOPODLj50=; b=K6i2IeKzUSZOhJVREjfa4NK7zy
	bYC+zPAPALEthxhBiWjFJUIxeywMM0E7eYOxxWFzIqJsUu6noO08DS2WvlLPBMGPT8e4NRSDH28LP
	yyKYJV4xCzv+hzzkytSWa8W6Pq6EOf+4lBnL1Z/TOfMFScAnxfeA9pllvaLQemizAFnEd3Xj0s1k6
	9EYjiwfvl3mFzPjlzFOEp/j5Gt2KOXqjMGQiu+SB4yyT0kRNstnX4PXVOsJyHvSt0ZVoIfYZ/zTFW
	ZZp26PZ0z16Z98XtMwQg2M2o4WzORVKFRRgu2anExaBq1hRdRQzTtkWznGgqyAXeQRCkF0i7cNPZq
	qmm4Ty3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVOhu-002Ajx-8M; Tue, 06 Sep 2022 02:52:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVOhr-002AWK-BM; Tue, 06 Sep 2022 02:52:57 +0000
X-UUID: 7ebbc430c6cf4c489d24e9d2ce9e2857-20220905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=lLZfor8VBXyAk27TpjkWmLUUJBncHtHiCzkOPODLj50=;
	b=kzfporl388g0UA+79REkS7ycBXjJtxz71afRFgOx4spUcNqlqyv7c6QxyA4TK+1gIZSnnOL1j/wHQa9xxvpTUKHcpsHyUVQYVcyG3ySayozyJGysXkcOCIK8PN2IVJQvbxvFW3J3bLYl6Rk/vNguEwzLsyOnL9kEW+MQ5l41uiE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:e1f0db06-02e1-4ca6-b519-fd6d282a81a3,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:168ccbd0-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7ebbc430c6cf4c489d24e9d2ce9e2857-20220905
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nathan.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1788285254; Mon, 05 Sep 2022 19:52:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Sep 2022 10:32:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 6 Sep 2022 10:32:16 +0800
Message-ID: <e1b486ec70f7e58c8f204bb9b7377716c8acfcdd.camel@mediatek.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: mediatek: modify VDOSYS0 device
 tree Documentations for MT8188
From: Nathan Lu <nathan.lu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rex-BC
 Chen" <rex-bc.chen@mediatek.com>, Enric Balletbo i Serra
	<enric.balletbo@collabora.com>, Moudy Ho <moudy.ho@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<wsd_upstream@mediatek.com>, <lancelot.wu@mediatek.com>
Date: Tue, 6 Sep 2022 10:32:16 +0800
In-Reply-To: <05f99396-f6e9-a315-7264-c659e3ec507c@linaro.org>
References: <20220822033213.15769-1-nathan.lu@mediatek.com>
	 <20220822033213.15769-2-nathan.lu@mediatek.com>
	 <05f99396-f6e9-a315-7264-c659e3ec507c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_195255_866963_F2B71642 
X-CRM114-Status: GOOD (  12.94  )
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

Hi Krzysztof,

Thanks for your review, and appreciate for all comments and sugestions.
I misunderstanding enum and const usage.
I'll add another item for mt8188 at next version.

On Tue, 2022-08-23 at 15:51 +0300, Krzysztof Kozlowski wrote:
> On 22/08/2022 06:32, nathan.lu wrote:
> > From: Nathan Lu <nathan.lu@mediatek.com>
> > 
> > modify VDOSYS0 device tree Documentations for MT8188.
> 
> (...)
> 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > index 0882ae86e6c4..d0e6c0dd4dfb 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > @@ -30,6 +30,8 @@ properties:
> >        - items:
> >            - const: mediatek,mt8183-disp-rdma
> >        - items:
> > +          - enum:
> > +              - mediatek,mt8188-disp-rdma
> >            - const: mediatek,mt8195-disp-rdma
> 
> Why do you change existing bindings?
> 
> Best regards,
> Krzysztof


