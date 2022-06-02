Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3B7C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 09:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYNOnDzkD6He7W30kKOvmOhCo1y6gzjY1C+AEKQOzKA=; b=izEdaWW6KJY1ai
	IupXnpi48qdzhwqlCQr1rgwXq3J7FyvXcYawiHb16tls31U4HcrwsWIoeZGI2evrK4X51C85vDlyV
	PXC0kOX0QojvEGC92fTGdufFVFzuOicCAJ1UhrJomwENiSJbV/LBks3A0IVSLZr5m5ITLtjmBkrJ8
	KRsfzJVfY1hAGDq/7/GXwsGlch39azrb7Zgy7nb6Tj9U5gc9YR+aiZLQoQ1gmeWOf6gHw901SBBtE
	sXkltZIVAXlWcjAqiG3ExUUpRpksGqHwoQhGml/DeqWKHPPI2zIrBd1AqaoFfTqdzi+T8mad751wz
	seniUCHImc1dYn1YwV1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwh6G-002RzE-6V; Thu, 02 Jun 2022 09:26:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwh6D-002RwN-QF; Thu, 02 Jun 2022 09:26:39 +0000
X-UUID: ca29e1b80a534b5f8ff3e577b15fb3f4-20220602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=U8DVecv09R4ta4hdrjDmZNy/9f/lkc9eTqS0wkrxv0I=;
	b=TmYhbr4mXNFwAUHD/PTeyy1sIfA1s/05DV+gvyRuY7tmLWBn0j0qmXn32PPM1CQWqTs1E3sPvPCuccBX7xHNgo/BD5jMTjuBcCNeBDuPzhskTVEuvePK+isz3k7f8SV41QU0lz/Wrr0iB8pB4y0pSwHN1ks00aTuoWfa+nJvv0M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:f95db576-82ab-45fc-bea2-4632030b8043,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:4c63ad6e-b02c-4af4-b838-5c14aaa063c7,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: ca29e1b80a534b5f8ff3e577b15fb3f4-20220602
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1934581031; Thu, 02 Jun 2022 02:26:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jun 2022 02:26:23 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 2 Jun 2022 17:26:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Jun 2022 17:26:20 +0800
Message-ID: <cf1fa83c5b6e76fe11768d9efc2374a9c45d4ba5.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: iommu: mediatek: add binding
 documentation for MT8365 SoC
From: Yong Wu <yong.wu@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>, Fabien Parent
	<fparent@baylibre.com>
CC: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <iommu@lists.linux-foundation.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Bear
 Wang" <bear.wang@mediatek.com>, Macross Chen <macross.chen@mediatek.com>,
	Kidd-KW Chen <Kidd-KW.Chen@mediatek.com>, Andy Hsieh
	<Andy.Hsieh@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>
Date: Thu, 2 Jun 2022 17:26:19 +0800
In-Reply-To: <6b6c4cfc-6f20-0eda-4a0d-31d993341ae8@mediatek.com>
References: <20220530180328.845692-1-fparent@baylibre.com>
	 <8ac7a6766c635412b408cb5295ddb3da37541140.camel@mediatek.com>
	 <59cedd50-4141-e589-11ae-b8d1a017eb46@mediatek.com>
	 <6b6c4cfc-6f20-0eda-4a0d-31d993341ae8@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_022637_896404_E4F3988B 
X-CRM114-Status: GOOD (  23.37  )
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

On Thu, 2022-06-02 at 16:42 +0800, Macpaul Lin wrote:
> On 6/2/22 4:27 PM, Macpaul Lin wrote:
> > On 6/2/22 2:18 PM, Yong Wu wrote:
> > > On Mon, 2022-05-30 at 20:03 +0200, Fabien Parent wrote:
> > > > Add IOMMU binding documentation for the MT8365 SoC.
> > > > 
> > > > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > > > ---
> > > >   .../bindings/iommu/mediatek,iommu.yaml        |  2 +
> > > >   include/dt-bindings/memory/mt8365-larb-port.h | 96
> > > > +++++++++++++++++++
> > > >   2 files changed, 98 insertions(+)
> > > >   create mode 100644 include/dt-bindings/memory/mt8365-larb-
> > > > port.h
> > > 
> > > [snip...]
> > > 
> > > > +#ifndef _DT_BINDINGS_MEMORY_MT8365_LARB_PORT_H_
> > > > +#define _DT_BINDINGS_MEMORY_MT8365_LARB_PORT_H_
> > > > +
> > > > +#include <dt-bindings/memory/mtk-memory-port.h>
> > > > +
> > > > +#define M4U_LARB0_ID            0
> > > > +#define M4U_LARB1_ID            1
> > > > +#define M4U_LARB2_ID            2
> > > > +#define M4U_LARB3_ID            3
> > > > +#define M4U_LARB4_ID            4
> > > > +#define M4U_LARB5_ID            5
> > > > +#define M4U_LARB6_ID            6
> > > > +#define M4U_LARB7_ID            7
> > > 
> > > Remove these. they are no used, right?
> > 
> > AIOT and customers are using the modules and their related IOMMU
> > modules.
> > DISP0, VENC, VDEC, ISP (CAMSYS), and APU (as far as I know, which
> > should 
> > be VP6?) were all supported.
> 
> Dear Yong,
> How about to replace the following definitions?
> 
> For example, replace
> #define M4U_PORT_DISP_OVL0		MTK_M4U_ID(0, 0)
> to
> #define M4U_PORT_DISP_OVL0              MTK_M4U_ID(M4U_LARB0_ID , 0)

Yes. It is ok.

> 
> > > 
> > > > +
> > > > +/* larb0 */
> > > > +#define M4U_PORT_DISP_OVL0        MTK_M4U_ID(0, 0)
> > > > +#define M4U_PORT_DISP_OVL0_2L    MTK_M4U_ID(0, 1)
> > > 
> > > [...]
> > > 
> > > > 
> > > > +/* larb4 */
> > > > +#define M4U_PORT_APU_READ        MTK_M4U_ID(0, 0)
> > > > +#define M4U_PORT_APU_WRITE        MTK_M4U_ID(0, 1)
> > > 
> > > Please remove these two APU definitions. currently these are not
> > > supported.
> > 
> > Kidd, please help to check if APU use these definitions with Yong.
> > However, I think these are all available to the customers.
> > 
> > Thanks
> > Macpaul Lin
> 
> Thanks
> Macpaul Lin
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
