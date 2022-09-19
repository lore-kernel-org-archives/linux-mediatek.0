Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0389ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 01:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3/mQJDAI8RaGvwS50/sSfM3dEzv5HFd1WDBKbk/QrE=; b=RVSAw4x++U7kymk6/iSOsrbXz+
	lJDpyXYq/5ENdkwBFToU7EzUh8P6VhxMD3ibmA+A6J3S36Esyr9dJB3JaL3xPGZLkRfMpmV1xT/bW
	a8Oyj9cGPeBf0ptWM+iqWdrexNHZXzs0keVj150GtReB28q1tRNSUSSqKqg+jluWrhV8hI70sYCSY
	SEQYYEiK6iZPo2Qaj9KZoShgX4h0OIpkFRSjmPDB+8gsP6iFiHaUL4uFFtUYJnSlcwmx5PEyBgJ76
	0tBXdsDt3KinNYxiuveADjeTDxCM0PJTp260KEivodhhJvRgYRfyEXeiMn2YhMJJ1M4/32otdO3Z5
	F4ZQ6k3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oa5ia-005XjC-Ud; Mon, 19 Sep 2022 01:37:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oa5iM-005XVw-4z; Mon, 19 Sep 2022 01:36:52 +0000
X-UUID: 67b840aea16f4816889c096df3ed0140-20220918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=s3/mQJDAI8RaGvwS50/sSfM3dEzv5HFd1WDBKbk/QrE=;
	b=RbZFb2KOPK+WwjuvFG4JxLna+rt5kZNqAuQcbOeDV+6sE0EWr9wdNH8mZjoOpT1Q/6iSSK56onFlz0QMx0SsWTLr4w3iDjpIUWApLmDOBgO7VjsEnNFjQxhjcEAWAC17vJrvSnsNv+iSo/tJsz3PLLcJ5k9uNCRNVK24C0zjoC0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:6224d69f-9b3d-4c10-946a-4909db913011,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:2b79105e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 67b840aea16f4816889c096df3ed0140-20220918
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 887692119; Sun, 18 Sep 2022 18:36:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 19 Sep 2022 09:26:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 19 Sep 2022 09:26:35 +0800
Message-ID: <871b6996647bdc71723569a56e7f238f325fa9c7.camel@mediatek.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: arm: mediatek: mmsys: change
 compatible for MT8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo
 Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 19 Sep 2022 09:26:35 +0800
In-Reply-To: <17cacc6f-173f-ad6c-9056-1b17635c984d@linaro.org>
References: <20220915161817.10307-1-jason-jh.lin@mediatek.com>
	 <20220915161817.10307-2-jason-jh.lin@mediatek.com>
	 <e6921ed7-a14c-aadb-abd4-1e7ee0a63be9@gmail.com>
	 <f30bd382eb8923256d6f39342ec7832774c0f547.camel@mediatek.com>
	 <17cacc6f-173f-ad6c-9056-1b17635c984d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_183650_490008_1258C7CA 
X-CRM114-Status: GOOD (  36.21  )
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

Thanks for the reviews.

On Sun, 2022-09-18 at 10:31 +0100, Krzysztof Kozlowski wrote:
> On 16/09/2022 04:34, Jason-JH Lin wrote:
> > Hi Matthias,
> > 
> > Thanks for the review.
> > 
> > On Fri, 2022-09-16 at 00:05 +0200, Matthias Brugger wrote:
> > > 
> > > On 15/09/2022 18:18, Jason-JH.Lin wrote:
> > > > For previous MediaTek SoCs, such as MT8173, there are 2 display
> > > > HW
> > > > pipelines binding to 1 mmsys with the same power domain, the
> > > > same
> > > > clock driver and the same mediatek-drm driver.
> > > > 
> > > > For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines
> > > > binding
> > > > to
> > > > 2 different power domains, different clock drivers and
> > > > different
> > > > mediatek-drm drivers.
> > > > 
> > > > Moreover, Hardware pipeline of VDOSYS0 has these components:
> > > > COLOR,
> > > > CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture
> > > > Quality)
> > > > and they makes VDOSYS0 supports PQ function while they are not
> > > > including in VDOSYS1.
> > > > 
> > > > Hardware pipeline of VDOSYS1 has the component ETHDR (HDR
> > > > related
> > > > component). It makes VDOSYS1 supports the HDR function while
> > > > it's
> > > > not
> > > > including in VDOSYS0.
> > > > 
> > > > To summarize0:
> > > > Only VDOSYS0 can support PQ adjustment.
> > > > Only VDOSYS1 can support HDR adjustment.
> > > > 
> > > > Therefore, we need to separate these two different mmsys
> > > > hardwares
> > > > to
> > > > 2 different compatibles for MT8195.
> > > > 
> > > > Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add
> > > > mt8195
> > > > SoC binding")
> > > > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > > ---
> > > >  
> > > > .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml       
> > > >  |
> > > > 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > index 6ad023eec193..0e267428eaa6 100644
> > > > ---
> > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > +++
> > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > @@ -31,7 +31,7 @@ properties:
> > > >                 - mediatek,mt8183-mmsys
> > > >                 - mediatek,mt8186-mmsys
> > > >                 - mediatek,mt8192-mmsys
> > > > -              - mediatek,mt8195-mmsys
> > > > +              - mediatek,mt8195-vdosys0
> > > 
> > > Nack, we miss the fallback compatible, as I already said twice.
> > > 
> > > Regards,
> > > Matthias
> > 
> > I'm sorry this happened again.
> > I'll keep the compatible "mediatek,mt8195-mmsys" at next version.
> > 
> > The patch "dt-bindings: arm: mediatek: mmsys: remove the unused
> > compatible for mt8195" should be sent after accepting the vdosys1
> > series, right?
> 
> I don't think there will be no such patch...
> 
> You need to add a bindings change which will accept device nodes
> like:
> foo {
>   compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-mmsys";
> 
> }
> 
> Example-schema shows how to do it.

OK, I got the point!
I'll fix it at the next version.
Thank you very much!

Regards,
Jason-JH.Lin

> 
> Best regards,
> Krzysztof
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


