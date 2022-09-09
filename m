Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD5DECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjQQjpavdaiGV6ssFfDb45fc2ZxNSQvZXAy4aBg/lnM=; b=l6OTYzvmq/ivLP1f9YnOvHlo7N
	z+X26Xilnxwd0oAK+sGntOr59FkhX1DVJ5ZzVxmSGh9C4VJoBZhD1Ey5VCq24S1hnSrDIDvvLD5hx
	yz77WBm8pLi/MaDCa31AGoos+sYxLJZkPv52fwbkOHADfl13T8inTIgNclmwZdgligABGJE5TAl/8
	cjgedtZkTD+5mMM3Vi0bdg40ZqYILn6bCxvmN+OfRY1gp1KXbuXwZJJVREXSEqhk+3Rcn6HZlBdk7
	wmagd/gbVIEp4Uqw9ez9D0aDFgBfOSyKmDIs/s0FszWS63c0NhTQnZ+EAN1NVWfUJ8cdkhhKZtnEA
	WV67U9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYGk-00DmtT-Ct; Fri, 09 Sep 2022 07:17:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYGV-00DmDg-FD; Fri, 09 Sep 2022 07:17:29 +0000
X-UUID: 2c8addacaabf4e1fbf936ab35babf25e-20220909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=BjQQjpavdaiGV6ssFfDb45fc2ZxNSQvZXAy4aBg/lnM=;
	b=RWLY9QafCv1PWYLaN46FTaKReUnxXJC9Ti+BLdZ6gTfiHTom5N0bGkYJQQnDsOZQEHQ27ubY8yv+WtTPMF88KTH5r28d68wd/TDbPZVJKVwW/Q9sZVPwPJPyEMeNiOz2o65AgdY74LYp1P9pcWKSv73lVi+4Nw7bz1EyQGYkOsA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:66ad4a3c-d79c-4e9e-84a5-cebd2bfcd1f3,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:1a96dcf5-6e85-48d9-afd8-0504bbfe04cb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2c8addacaabf4e1fbf936ab35babf25e-20220909
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <elvis.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1923770890; Fri, 09 Sep 2022 00:17:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 9 Sep 2022 14:46:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 9 Sep 2022 14:46:44 +0800
Message-ID: <1f7ab756af6e27f5336e3caaefc3081f70bbc85b.camel@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: gce: add gce header file for mt8188
From: elvis.wang <elvis.wang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jassi Brar
	<jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 9 Sep 2022 14:46:44 +0800
In-Reply-To: <995fbb2b-2b34-d407-6bfd-4798de2251d7@linaro.org>
References: <20220729084319.6880-1-Elvis.Wang@mediatek.com>
	 <20220729084319.6880-3-Elvis.Wang@mediatek.com>
	 <995fbb2b-2b34-d407-6bfd-4798de2251d7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_001727_596686_2E939919 
X-CRM114-Status: GOOD (  25.80  )
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

Hello Krzysztof,

On Tue, 2022-08-02 at 10:08 +0200, Krzysztof Kozlowski wrote:
> On 29/07/2022 10:43, Elvis Wang wrote:
> > Add gce header file to define the gce subsys id, hardware event id
> > and
> > constant for mt8188.
> > 
> > Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>
> > ---
> >  include/dt-bindings/gce/mt8188-gce.h | 1079
> > ++++++++++++++++++++++++++
> >  1 file changed, 1079 insertions(+)
> >  create mode 100644 include/dt-bindings/gce/mt8188-gce.h
> > 
> > diff --git a/include/dt-bindings/gce/mt8188-gce.h b/include/dt-
> > bindings/gce/mt8188-gce.h
> > new file mode 100644
> > index 000000000000..b15e965fe671
> > --- /dev/null
> > +++ b/include/dt-bindings/gce/mt8188-gce.h
> 
> Use vendor in filename, so mediatek,mt8188-gce.h

yes, mediatek,mt8188-gce.h as filename would be better, will change in
next version.

> 
> > @@ -0,0 +1,1079 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> 
> Dual license.

ok, will use /* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */ in
next version. Also ask if it is possible to use BSD-3-CLause?

> 
> > +/*
> > + * Copyright (c) 2018 MediaTek Inc.
> > + *
> > + */
> > +#ifndef _DT_BINDINGS_GCE_MT8188_H
> > +#define _DT_BINDINGS_GCE_MT8188_H
> > +
> > +/* assign timeout 0 also means default */
> > +#define CMDQ_NO_TIMEOUT		0xffffffff
> > +#define CMDQ_TIMEOUT_DEFAULT	1000
> 
> How CMDQ_TIMEOUT_DEFAULT is part of bindings? How is it related to
> bindings?

Used before, but it is not used now and will be deleted in next
version.

> 
> > +
> > +/* GCE thread priority */
> > +#define CMDQ_THR_PRIO_LOWEST	0
> > +#define CMDQ_THR_PRIO_1		1
> > +#define CMDQ_THR_PRIO_2		2
> > +#define CMDQ_THR_PRIO_3		3
> > +#define CMDQ_THR_PRIO_4		4
> > +#define CMDQ_THR_PRIO_5		5
> > +#define CMDQ_THR_PRIO_6		6
> > +#define CMDQ_THR_PRIO_HIGHEST	7
> > +
> > +/* CPR count in 32bit register */
> > +#define GCE_CPR_COUNT		1312
> 
> No register values in the bindings.

Those thread priority will be referenced in the device node and
congfigured to the hw when trigger hw work.

> 
> 
> 
> > +
> > +/* GCE subsys table */
> > +#define SUBSYS_1400XXXX		0
> > +#define SUBSYS_1401XXXX		1
> > +#define SUBSYS_1402XXXX		2
> > +#define SUBSYS_1c00XXXX		3
> > +#define SUBSYS_1c01XXXX		4
> > +#define SUBSYS_1c02XXXX		5
> > +#define SUBSYS_1c10XXXX		6
> > +#define SUBSYS_1c11XXXX		7
> > +#define SUBSYS_1c12XXXX		8
> > +#define SUBSYS_14f0XXXX		9
> > +#define SUBSYS_14f1XXXX		10
> > +#define SUBSYS_14f2XXXX		11
> > +#define SUBSYS_1800XXXX		12
> > +#define SUBSYS_1801XXXX		13
> > +#define SUBSYS_1802XXXX		14
> > +#define SUBSYS_1803XXXX		15
> > +#define SUBSYS_1032XXXX		16
> > +#define SUBSYS_1033XXXX		17
> > +#define SUBSYS_1600XXXX		18
> > +#define SUBSYS_1601XXXX		19
> > +#define SUBSYS_14e0XXXX		20
> > +#define SUBSYS_1c20XXXX		21
> > +#define SUBSYS_1c30XXXX		22
> > +#define SUBSYS_1c40XXXX		23
> > +#define SUBSYS_1c50XXXX		24
> > +#define SUBSYS_1c60XXXX		25
> > +#define SUBSYS_NO_SUPPORT	99
> > +
> > +/* GCE General Purpose Register (GPR) support
> > + * Leave note for scenario usage here
> > + */
> > +/* GCE: write mask */
> > +#define GCE_GPR_R00		0x00
> > +#define GCE_GPR_R01		0x01
> 
> No. These are no bindings. Do not embed device programming model into
> bindings header. I'll stop review.

This GCE_GPR define is an attribute of hw, and different hw versions
may have different gpr number.

Thanks for your comments, please let me know if anything needs to be
corrected.

BRs
Elvis 

> 
> 
> Best regards,
> Krzysztof


