Return-Path: <SRS0=zHGV=MD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61DAC07E9B
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jul 2021 08:35:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A2826124C
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jul 2021 08:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A2826124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+elnDZnhw8paHK0hlbc2nj7iRNE4fZoQwdaAJZ8tcA=; b=Uvfg49NsUJUvyc
	Ku//Pr+/Ib+H4fjr7G9DpnLUDBamKUB94Kr5xR0P105dom4eBAXVJzqAJO7PWPSpFDjB02px+1YbL
	x1SNtC5NOAalZ36m2D2D4E83UAumvH+sk0zolO/RSl7dAHXIyRIdbauvbY85m8KciaiZTPcQs5q53
	bPCKC0SMbqLEtYvU6I4UB1OjJioFP89521kCvLpBa1j4F9XITFJAH7D7J6V3WDdgiXhrcVpHiy07f
	pRD9yexSaZTz6fbyXoiXu4maapEyqkPv+GErA6Z+TCqnk2c4wr4qX72d5MMgh2Yx9KGu5KxFe25i0
	s1Hr0a7NRWKO+o03SfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2UvR-004izz-1v; Sun, 11 Jul 2021 08:34:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2UvN-004iyp-7E; Sun, 11 Jul 2021 08:34:54 +0000
X-UUID: 454c48bf94c34bbaa423a2713527fd65-20210711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=q0F3BMX9DhrivUfCw8fXy37GhI3a19wIIbjYly0hYiw=; 
 b=BFc3Z1+WkZUSuRj7r2D0vceekqVFDOPW6OQtLw8SUPJc6wAPt+WYWwbm4RsLNaK1UbqGXWoo3rUuS7Adjx3EN5VViSl7zGvWEwmG+090Z++JCFu4vWw/KQ3T+zDw+XlgOJt7pLafZn6hdCqd1Q0yckX37Ab0tcksKUpMbf58W/A=;
X-UUID: 454c48bf94c34bbaa423a2713527fd65-20210711
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 805055183; Sun, 11 Jul 2021 01:34:48 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Jul 2021 01:24:45 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 11 Jul 2021 16:24:42 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 11 Jul 2021 16:24:41 +0800
Message-ID: <1625991881.22309.9.camel@mhfsdcap03>
Subject: Re: [PATCH 1/9] dt-bindings: memory: mediatek: Add mt8195 smi binding
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>,
 <anan.sun@mediatek.com>, <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, 
 <anthony.huang@mediatek.com>
Date: Sun, 11 Jul 2021 16:24:41 +0800
In-Reply-To: <6e512d15-3acc-2097-1fd1-e021552fdc8d@canonical.com>
References: <20210616114346.18812-1-yong.wu@mediatek.com>
 <20210616114346.18812-2-yong.wu@mediatek.com>
 <6e512d15-3acc-2097-1fd1-e021552fdc8d@canonical.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 20D1DC0E5D2AB0B038420097B719AD1457E17388391A66EBA32555C39061F2FD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_013453_313631_F74F3C12 
X-CRM114-Status: GOOD (  21.36  )
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

On Thu, 2021-07-08 at 11:26 +0200, Krzysztof Kozlowski wrote:
> On 16/06/2021 13:43, Yong Wu wrote:
> > This patch adds mt8195 smi supporting in the bindings.
> > 
> > In mt8195, there are two smi-common HW, one is for vdo(video output),
> > the other is for vpp(video processing pipe). They connects with different
> > smi-larbs, then some setting(bus_sel) is different. Differentiate them
> > with the compatible string.
> > 
> > Something like this:
> > 
> >     IOMMU(VDO)          IOMMU(VPP)
> >        |                   |
> >   SMI_COMMON_VDO      SMI_COMMON_VPP
> >   ---------------     ----------------
> >   |      |   ...      |      |     ...
> > larb0 larb2  ...    larb1 larb3    ...
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  .../bindings/memory-controllers/mediatek,smi-common.yaml    | 6 +++++-
> >  .../bindings/memory-controllers/mediatek,smi-larb.yaml      | 3 +++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> > 
> 
> I cannot find it on devicetree list, it seems you did not Cc it. Please
> use scripts/get_maintainer.pl.

My fault. I will add in the next version.

> 
> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
