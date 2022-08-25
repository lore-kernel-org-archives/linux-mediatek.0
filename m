Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40DBC04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 11:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01Nmx2oJ4z1kTa8TMnh7NdI8MATbh8efPG1hyIJFvwI=; b=oEafJaoDZuHfYKfTylBdVJsLwO
	BDXpzULf87oai7LtTXcfpUh8nTlfv9eA7O4rVCcsXwEQlBR04NrvhJWxRTZvjIXXGeKettg+xbzD1
	9ziotWQ+JjNbjjsH+nXrtPoAUI2FZIOFE3/+Wjac0urXG+OQl2+f15Z/Qlp9v4OrYSYX25fVhTwWG
	pRGx1nqQybUh04X7ESBgVu3BGTJNA8TxyKehXiEpWOqvsGoc5BL6wgjtwIOF5kvugZ+wFDD6Yes2P
	OMQdplhIEnx22/SvHlugaUwIZ8Bb40k6WWDH2Cxp+pCGfYGYWPDI4KigdfzksqfPhduWk0qdJZkuJ
	dOmEzbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRB0M-00CYyp-He; Thu, 25 Aug 2022 11:26:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRB0K-00CYx8-1H; Thu, 25 Aug 2022 11:26:33 +0000
X-UUID: 20f1952144ec43a29baa8883c3c2a187-20220825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=01Nmx2oJ4z1kTa8TMnh7NdI8MATbh8efPG1hyIJFvwI=;
	b=FoPTuMNvW+7fYYjm31X5eymsW1xHriQY9KSU2TR6tKaH8xEGyslosSuPortgsfFJgaFjQ8GHOdbrrICfark5j9Mo2Gwdd8b9msiDsmK3Y3OyZeXAFmuY2rCbd2cXK/mUu7aZMzn+qX4aPL5lPto1cBjjzxAnDo1XF1JmDPl4cXw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:4cdaae2c-64df-4377-8da9-0f6b7f961a41,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:121f99cf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 20f1952144ec43a29baa8883c3c2a187-20220825
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 945449006; Thu, 25 Aug 2022 04:26:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 25 Aug 2022 19:06:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 25 Aug 2022 19:06:18 +0800
Message-ID: <781356a88b502661ec23b3869679d80cf682017d.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: arm: mediatek: mmsys: change compatible
 for MT8195
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
	<Jason-JH.Lin@mediatek.com>, Nancy Lin
 =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?= <Nancy.Lin@mediatek.com>, "CK
 Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?=" <ck.hu@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "hsinyi@google.com"
	<hsinyi@google.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 25 Aug 2022 19:06:18 +0800
In-Reply-To: <f7ec45b8-ccd7-4776-0524-269e3188883d@gmail.com>
References: <20220825055658.12429-1-rex-bc.chen@mediatek.com>
	 <3ff08ae9-a4b6-2b74-23cb-69ea1d7e1033@linaro.org>
	 <d5a00dc88bed1680caa8af895a1140324b9d079e.camel@mediatek.com>
	 <f7ec45b8-ccd7-4776-0524-269e3188883d@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_042632_124094_32DE41F3 
X-CRM114-Status: GOOD (  28.94  )
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

On Thu, 2022-08-25 at 18:55 +0800, Matthias Brugger wrote:
> 
> On 25/08/2022 08:59, Bo-Chen Chen wrote:
> > On Thu, 2022-08-25 at 14:11 +0800, Krzysztof Kozlowski wrote:
> > > On 25/08/2022 08:56, Bo-Chen Chen wrote:
> > > > From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> > > > 
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
> 
> drop clock driver example here.
> 

Hello Matthias,

Thanks for your review.
I am not sure what do you mean.
Could you explain more detailedly?

> > > 
> > > I don't see binding to different clock drivers and anyway that's
> > > not
> > > really an argument here. Please focus in description on hardware
> > > properties, IOW, are devices compatible or different. What is the
> > > incompatible difference between VDOSYS0 and 1?
> > > 
> > > Best regards,
> > > Krzysztof
> > 
> > Hello Krzysztof,
> > 
> > Thanks for yor review.
> > 
> >  From the functions perspective:
> > 
> > Hardware pipeline of VDOSYS0 has these components: COLOR, CCORR,
> > AAL,
> > GAMMA, DITHER.
> > They are related to PQ (Picture Quality) functions and they makes
> > VDOSYS0 supports PQ function while they are not including in
> > VDOSYS1.
> > 
> > Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> > component).
> > It makes VDOSYS1 supports the HDR function while it's not including
> > in
> > VDOSYS0.
> > 
> 
> Please include a description of this in the commit message.
> 

Yes, I have sent v2 and add these to commit meesage.

https://lore.kernel.org/all/20220825091448.14008-1-rex-bc.chen@mediatek.com/

BRs,
Bo-chen

> > About mediatek ETHDR, you can refer to this series:
> > 
> > 
https://lore.kernel.org/all/20220819061456.8042-2-nancy.lin@mediatek.com/
> > 
> > To summary:
> > Only VDOSYS0 can support PQ adjustment.
> > Only VDOSYS1 can support HDR adjustment.
> > 
> > Is this description ok for you?
> > If it is ok, I will put them into commit message in next version.
> > 
> > BRs,
> > Bo-Chen
> > 


