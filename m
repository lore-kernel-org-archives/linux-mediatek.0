Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AAEC6FA89
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wki+1jLIoRTZsjo8Z3mQ/p/MgSXkw7RsuI+0KmLXyS8=; b=hdtnocHtSB/tNxdhZX7EXK9vkp
	EUyYYS85MlvxH96oOAnnHr44xv9yuBLit7GoSXylLODGtYK+cl0cassrCOvtRfuf/zppzkqEX7dsF
	sdihDw8VRAXwHpu87Jlxlo4Q0zz9hns/+sjP3znr1qT743hWMCH4MOtpWEogCMbPBpU7m794L87CP
	Ee3ReFQ+PkJiZOL4NTQqd3r/iosu6atxOaVX3kaDdZXeD1wwUyrj0/TRShrEnXLJDQFzfK2xPRWNE
	k5jd5fRniyIebHqIcgUjBZYNJl1lGGncziIYuRco2WijNj14UDAc0LG3Kk6vw8KOx6R+tkys4wl9K
	ge6OOd0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYV4Q-004rDa-Ux; Wed, 14 Sep 2022 16:17:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYV4C-004qrM-KK; Wed, 14 Sep 2022 16:16:50 +0000
X-UUID: f3cc18d2bfb945459b7c22451fb002d7-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Wki+1jLIoRTZsjo8Z3mQ/p/MgSXkw7RsuI+0KmLXyS8=;
	b=jd2D1wIo1C38e3AEneUOIPKKFI8bxFPfR+O977nm0fPEtI4nl/V7AVKz/J2fBb4JuGD9blIIdxBSLpySjc5nocUL2yH7H/IfKn1naEbUSPg3yxpf0Nh+i5h3jDXWE4t+35GJLXc79dQudKXz17dOegpsl2Em4PChr8CnHFxCuKI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:78b814fc-bd0e-4a1a-83d0-79a074268281,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:7b0767f6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f3cc18d2bfb945459b7c22451fb002d7-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1877994082; Wed, 14 Sep 2022 09:10:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 23:09:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 23:09:57 +0800
Message-ID: <08a2ca0cd6392dcf9dea98eed50516ed19cc1504.camel@mediatek.com>
Subject: Re: [PATCH v2] dt-bindings: arm: mediatek: mmsys: change compatible
 for MT8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: Nancy Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?=
	<Nancy.Lin@mediatek.com>, CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?=
	<ck.hu@mediatek.com>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "hsinyi@google.com"
	<hsinyi@google.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 14 Sep 2022 23:09:56 +0800
In-Reply-To: <463b0b0a-c1ec-0f89-45cf-50a7587db69b@gmail.com>
References: <20220825091448.14008-1-rex-bc.chen@mediatek.com>
	 <3ed3d73a-1671-708e-7c42-498cca6aaf1d@gmail.com>
	 <8f3dba943170361211d9bb4c8bf1be12bbfdec20.camel@mediatek.com>
	 <adcbb2b7-cddd-4546-bdf2-66d056a40c1d@linaro.org>
	 <916bd99bcc4fa77eae5734b22365ce73acd90d58.camel@mediatek.com>
	 <efedfd3d-9779-514b-0481-f0b669d2e326@gmail.com>
	 <463b0b0a-c1ec-0f89-45cf-50a7587db69b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_091648_842451_4C6C455C 
X-CRM114-Status: GOOD (  58.16  )
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


On Wed, 2022-09-14 at 16:32 +0200, Matthias Brugger wrote:
> 
> On 26/08/2022 17:39, Matthias Brugger wrote:
> > 
> > 
> > On 26/08/2022 09:13, Bo-Chen Chen wrote:
> > > On Fri, 2022-08-26 at 15:00 +0800, Krzysztof Kozlowski wrote:
> > > > On 26/08/2022 05:07, Bo-Chen Chen wrote:
> > > > > On Thu, 2022-08-25 at 22:57 +0800, Matthias Brugger wrote:
> > > > > > 
> > > > > > On 25/08/2022 11:14, Bo-Chen Chen wrote:
> > > > > > > From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> > > > > > > 
> > > > > > > For previous MediaTek SoCs, such as MT8173, there are 2
> > > > > > > display
> > > > > > > HW
> > > > > > > pipelines binding to 1 mmsys with the same power domain,
> > > > > > > the
> > > > > > > same
> > > > > > > clock driver and the same mediatek-drm driver.
> > > > > > > 
> > > > > > > For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW
> > > > > > > pipelines
> > > > > > > binding
> > > > > > > to
> > > > > > > 2 different power domains, different clock drivers and
> > > > > > > different
> > > > > > > mediatek-drm drivers.
> > > > > > > 
> > > > > > > Moreover, Hardware pipeline of VDOSYS0 has these
> > > > > > > components:
> > > > > > > COLOR,
> > > > > > > CCORR, AAL, GAMMA, DITHER. They are related to the PQ
> > > > > > > (Picture
> > > > > > > Quality)
> > > > > > > and they makes VDOSYS0 supports PQ function while they
> > > > > > > are not
> > > > > > > including in VDOSYS1.
> > > > > > > 
> > > > > > > Hardware pipeline of VDOSYS1 has the component ETHDR (HDR
> > > > > > > related
> > > > > > > component). It makes VDOSYS1 supports the HDR function
> > > > > > > while
> > > > > > > it's
> > > > > > > not
> > > > > > > including in VDOSYS0.
> > > > > > > 
> > > > > > > To summarize0:
> > > > > > > Only VDOSYS0 can support PQ adjustment.
> > > > > > > Only VDOSYS1 can support HDR adjustment.
> > > > > > > 
> > > > > > > Therefore, we need to separate these two different mmsys
> > > > > > > hardwares
> > > > > > > to
> > > > > > > 2 different compatibles for MT8195.
> > > > > > > 
> > > > > > > Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys:
> > > > > > > add
> > > > > > > mt8195
> > > > > > > SoC binding")
> > > > > > > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > > > > > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > > > > > ---
> > > > > > > Changes for v2:
> > > > > > > 1. Add hardware difference for VDOSYS0 and VDOSYS1 in
> > > > > > > commit
> > > > > > > message.
> > > > > > > ---
> > > > > > > .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> > > > > > > > 
> > > > > > > 
> > > > > > > 3 ++-
> > > > > > >    1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > > 
> > > > > > > diff --git
> > > > > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek
> > > > > > > ,mmsys
> > > > > > > .yam
> > > > > > > l
> > > > > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek
> > > > > > > ,mmsys
> > > > > > > .yam
> > > > > > > l
> > > > > > > index 6ad023eec193..bfbdd30d2092 100644
> > > > > > > ---
> > > > > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek
> > > > > > > ,mmsys
> > > > > > > .yam
> > > > > > > l
> > > > > > > +++
> > > > > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek
> > > > > > > ,mmsys
> > > > > > > .yam
> > > > > > > l
> > > > > > > @@ -31,7 +31,8 @@ properties:
> > > > > > >                  - mediatek,mt8183-mmsys
> > > > > > >                  - mediatek,mt8186-mmsys
> > > > > > >                  - mediatek,mt8192-mmsys
> > > > > > > -              - mediatek,mt8195-mmsys
> > > > > > > +              - mediatek,mt8195-vdosys0
> > > > > > 
> > > > > > Thanks for you patch. As I mentioned on v1, I propose to
> > > > > > set
> > > > > > mediatek,mt8195-mmsys as fallback for mediatek,mt8195-
> > > > > > vdosys0 to
> > > > > > not
> > > > > > break
> > > > > > backwards compatibility.
> > > > > > 
> > > > > > Apart from that, the binding change will need some changes
> > > > > > to
> > > > > > support
> > > > > > the new
> > > > > > binding. Please provide these together with this patch.
> > > > > > 
> > > > > > Regards,
> > > > > > Matthias
> > > > > > 
> > > > > 
> > > > > Hello Matthias,
> > > > > 
> > > > > Thanks for your comments.
> > > > > The purpose of this patch is to confirm we can separate
> > > > > mt8195
> > > > > mmsys
> > > > > into two compatibles. I think this modification is accepted.
> > > > 
> > > > No, it is not accepted following Matthias comments. You
> > > > received my
> > > > ack
> > > > based on assumption that ABI break is perfectly ok for platform
> > > > maintainer, as he has decisive voice. If anyone is not happy
> > > > with a
> > > > ABI
> > > > break, then his concerns must be addressed.
> > > > 
> > > > So let it be specific:
> > > > NAK.
> > > > 
> > > > > 
> > > > > After this, I think Jason-JH will push another series with
> > > > > this
> > > > > binding
> > > > > patch.
> > > > 
> > > > I don't know what do you mean here - another series on top of
> > > > wrong
> > > > patch?
> > > > 
> > > 
> > > Hello Krzysztof,
> > > 
> > > For this mt8195 mmsys binding separation, we still need to modify
> > > driver for this. The reason I send this patch is to confirm we
> > > can do
> > > this binding modification and I also think we can not pick this
> > > patch
> > > here.
> > > 
> > > We will push another series and it contains modification of
> > > binding and
> > > drivers. (The series will push by Jason-JH Lin)
> > > 
> > 
> > Sounds good. So lets wait for Jason-JH Lin to send this series and
> > we can go on 
> > with the review.
> > 
> 
> Just to be sure, this has not happened yet, correct?
> 
> Regards,
> Matthias

Yes, sorry for the late reply to you.
I'll start to send this series at 9/19.

Regards,
Jason-JH.Lin

> 
> > Thanks!
> > Matthias
> > 
> > > Maybe I should use "RFC" for this series, and I think it's more
> > > correct.
> > > 
> > > BRs,
> > > Bo-Chen
> > > 
> > > > > In Jason-JH's series, we will modify mmsys driver based on
> > > > > this.
> > > > > And I think we don't need to keep "mediatek,mt8195-mmsys" if
> > > > > we
> > > > > also
> > > > > modify mmsys drivers in the same series.
> > > > 
> > > > This does not fux ABI break and broken bisectability.
> > > > 
> > > > > 
> > > > > Is it ok that postpones to pick this patch until we finish
> > > > > review
> > > > > follow-up series?
> > > > > 
> > > > 
> > > > No. You got a clear review to fix.
> > > > 
> > > > Best regards,
> > > > Krzysztof
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


