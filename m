Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB18C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 12:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqkpAYT3rAkqVZNUIxuxHBDiL+Ms4/o5+/lpxMDxUGQ=; b=fLEyKhXTGkFlT78d2O17bfSk4z
	+HRonq+r8684nk1YKnhiZBQpGO5fAMYOzkUpFMHbMF9EpCCE1VsdQMzMh7s2PWWtcqXybtxRRgkD0
	5PlCi4R8p2EVxGW9XWwIqLHrBzutnKgugtnRQvsPx1UWVt9Se0V5d1i31cMiMY/8FDt5jlSd6t8Gx
	TuWDkCc/pGE4Zumo+RXVAt3U251Pp+1PBNijrDy6KwIMJk8o0Rnyb+45aLZ9O1fx39F/WHI4h88H4
	bzyi9RcLwG5tDxZhCdH2l8+LZ3rcC6dDRmnuIrD6yYYQj6d2H4tBDPfkjgr5zbyok/VOgpEpy8WGC
	TT+iMOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAt0j-001hzl-11; Mon, 11 Jul 2022 12:59:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsmA-001Yke-52; Mon, 11 Jul 2022 12:44:36 +0000
X-UUID: 8ca3c1e531ba458cbbb95dce144756de-20220711
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:8a006f84-ef71-4a10-89b4-6ae8091a94f7,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:942d1b87-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 8ca3c1e531ba458cbbb95dce144756de-20220711
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 998245186; Mon, 11 Jul 2022 05:44:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 11 Jul 2022 20:03:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 11 Jul 2022 20:03:46 +0800
Message-ID: <459bb032c68be7c5be682d90462becfbb17ccda8.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: mmc: Add compatible for MediaTek MT8188
From: Johnson Wang <johnson.wang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<ulf.hansson@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 11 Jul 2022 20:03:46 +0800
In-Reply-To: <c8f8f5f4-173e-797d-e060-e5eaac7ca822@linaro.org>
References: <20220707054710.1396-1-johnson.wang@mediatek.com>
	 <41e17a56-5cb0-8e90-c7ae-a7a56de986d0@linaro.org>
	 <3216ec92952c7d722feaeb76986e0a6a54340646.camel@mediatek.com>
	 <c8f8f5f4-173e-797d-e060-e5eaac7ca822@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_054434_245505_E97E99C2 
X-CRM114-Status: GOOD (  24.83  )
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

On Mon, 2022-07-11 at 13:02 +0200, Krzysztof Kozlowski wrote:
> On 07/07/2022 09:30, Johnson Wang wrote:
> > On Thu, 2022-07-07 at 08:46 +0200, Krzysztof Kozlowski wrote:
> > > On 07/07/2022 07:47, Johnson Wang wrote:
> > > > This commit adds dt-binding documentation of mmc for MediaTek
> > > > MT8188 SoC
> > > > platform.
> > > > 
> > > > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > > b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > > index 2a2e9fa8c188..3fbf33ad4f7c 100644
> > > > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > > @@ -32,6 +32,9 @@ properties:
> > > >        - items:
> > > >            - const: mediatek,mt8186-mmc
> > > >            - const: mediatek,mt8183-mmc
> > > > +      - items:
> > > > +          - const: mediatek,mt8188-mmc
> > > 
> > > You duplicate quite a lot. Use enum.
> > > 
> > > Best regards,
> > > Krzysztof
> > 
> > Hi Krzysztof,
> > 
> > Thanks for you suggestion.
> > 
> > I will use 'enum' to place this compatible strings.
> > 
> > Just like this:
> > - items:
> >     - enum:
> >         - mediatek,mt8186-mmc
> >         - mediatek,mt8188-mmc
> >         - mediatek,mt8192-mmc
> >         - mediatek,mt8195-mmc
> >     - const: mediatek,mt8183-mmc
> > 
> > Moreover, it seems that missing an "items:" between oneOf and enum
> > in
> > the compatible property.
> > Is my understanding wrong?
> 
> I did not propose to remove items, so where are they missing? Not
> sure
> what you are asking about...
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Sorry for the confusion.
That was my misunderstanding. Please ignore it...

BRs,
Johnson Wang


