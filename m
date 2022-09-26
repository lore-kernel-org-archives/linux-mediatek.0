Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1FBC32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HG7JKsJhsSJaNaqDyDkeXw8m0Z/XItGCKaefUS4sQlI=; b=QGx6mAGmY7ZnFt28uR3whV5L7i
	DweOqIXSZ34RdHwmYZYi5xzsozm8wQL/t0A198E/UcBtUh3BAsyONTu+6QbcOnVNfIR+OpqMk7tZ2
	tZdX6MGb8GRH/GQsHIaJ5YAXwTgBFbeAeJWLk4NdeFNf+Tfd0Kq9MrwDFzXHk/bK1d24Ut6x1K5Eo
	BdFWK70rsar12vJWUiKcDIukGQuHPxY088eEgV/dAy4Ps35ngleD8z7DxaZK8jsUzL+wrQNFLN0VS
	4HVYAAyvfh2HZ3X1lhHuj+fJYA9i91LX+zfWIKXoWDPZN1KG8BRe/E8bod4YaX8TN50ZB9dEjs+C3
	zE8osGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocnSN-004u1e-7i; Mon, 26 Sep 2022 12:43:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocnRy-004tj2-Ir; Mon, 26 Sep 2022 12:43:08 +0000
X-UUID: ebbec30cb2e7465380c754dbf1d85f96-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=HG7JKsJhsSJaNaqDyDkeXw8m0Z/XItGCKaefUS4sQlI=;
	b=lBJcytc5aYQqSxbF3tXHEjzHYdPmoyKd5HIxGQo1IQaBu6matEjNl3sfiCugzefN5kjioa8gk4whExeNos0wwmYsDkYjQT18iEfxhZ/0zqh9hPoZZuD/ZtDtAePGLHnco0CY7UpR2f/hJRrL+eSVr2LjI/9CjWzITlgHwOVTU3Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b557cf1b-cc1b-4385-98e1-3694ba6a6ade,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:1f0f0d07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ebbec30cb2e7465380c754dbf1d85f96-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <liangxu.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 205672998; Mon, 26 Sep 2022 05:42:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Sep 2022 20:12:20 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 26 Sep 2022 20:12:19 +0800
Message-ID: <023b0a09a65042e6fee6b668d3df506f7d8178fd.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: Add compatible for
 MediaTek MT8188
From: liangxu.xu <liangxu.xu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<liangxu.xu@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 26 Sep 2022 20:12:20 +0800
In-Reply-To: <8cc90559-6e83-1b6d-2718-d26ceace6362@linaro.org>
References: <20220923014227.6566-1-liangxu.xu@mediatek.com>
	 <33e9babb-0492-2f41-d055-45ed32d55906@linaro.org>
	 <ff6020d05962e202e917644b06eaa2cff7b2bb99.camel@mediatek.com>
	 <8cc90559-6e83-1b6d-2718-d26ceace6362@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_054306_639107_018D9885 
X-CRM114-Status: GOOD (  20.09  )
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

On Mon, 2022-09-26 at 08:26 +0200, Krzysztof Kozlowski wrote:
> On 26/09/2022 04:53, liangxu.xu wrote:
> > On Fri, 2022-09-23 at 13:16 +0200, Krzysztof Kozlowski wrote:
> > > On 23/09/2022 03:42, liangxu.xu@mediatek.com wrote:
> > > > From: liangxu xu <liangxu.xu@mediatek.com>
> > > > 
> > > > Add dt-binding documentation of dpi for MediaTek MT8188 SoC.
> > > > 
> > > > Signed-off-by: liangxu xu <liangxu.xu@mediatek.com>
> > > 
> > > Where is the DTS? Where are driver changes?
> > > 
> > > Best regards,
> > > Krzysztof
> > > 
> > 
> > Hi Krzysztof:
> > 
> > If you want to see the synchronous changes of dts and binding
> > files,
> > then I will attach this binding file changes when sending dts
> > later.
> 
> Keep discussions public. You submit a lot of unused compatibles. I
> want
> users to come with them.
> 
> > 
> > The driver change of mt8188 reuses that of mt8195. The driver link
> > is
> > as follows:
> > 
> > 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/mediatek/mtk_dpi.c?id=48f4230642ee32a97ddf4be492838ce96089f040__;!!CTRNKA9wMg0ARbw!1Rd4E1huTfB_u1FjLXMIKlqMciGL24xsYInu1vg1z9c026cL0PiITklArLfwrMsi3x4$
> >  
> 
> Driver does not support that compa
> > 
> > Best Regards,
> > LiangXu
> > 
> 
> Best regards,
> Krzysztof


Hi Krzysztof:

Can I modify it to the following form:
properties:
  compatible:
    oneOf:
      - enum:
        - mediatek,mt2701-dpi
        - mediatek,mt7623-dpi
        - mediatek,mt8173-dpi
        - mediatek,mt8183-dpi
        - mediatek,mt8186-dpi
        - mediatek,mt8192-dpi
        - mediatek,mt8195-dp-intf
      - items:
          - enum:
              - mediatek,mt8188-dp-intf
          - const: mediatek,mt8195-dp-intf

This means that mt8188 reuses mt8195, so there is no need to add
compatible to the driver.

Best Regards,
LiangXu
> 


