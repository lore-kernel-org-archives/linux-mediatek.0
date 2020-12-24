Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F113C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 11:38:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56B6F221F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 11:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56B6F221F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vq0d0QtppJCGQC3Ul5p5d0+NMvSpg7IE3uH6rmtgOI4=; b=u8iI8x4eG1dD9PAzxILg1sJep
	mx1lbKn4xWAXOiYQOOIXZT9CflWYLC/aDTnjGjMHzuqQ50iaLu44ukswDpqVT/05EYCmHfHGFkCvU
	eAgjRxTrBKxbFOX+d4R4jyVtf24Hbpf2INPRMQ96nhp9izHzaKcguk4uk4c7PnJRCKyFEQgdEkgeL
	sLIbEU1PGnpPKgCGCJKC0CEm4NLgpn5lW1xIaCiRt2Pi/4WnnYBPy7mqkVJJT5KC4+wXaIZVi7zRt
	nT5vSFObnU2sAAwrD3qFtob7tZGJKgPAEfKX9OqPf1j2tjQJCzp0Kflt4SeS1szJ+X3aH/NqljfaF
	c8y1/dOZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksOwn-00081U-LL; Thu, 24 Dec 2020 11:38:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksOwm-00080k-3s; Thu, 24 Dec 2020 11:38:21 +0000
X-UUID: f10387b365c14a428f609c3869a93e2f-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=x+vmTzBVFEHCrm2Yqn8M1lXv0V4BMO6yO0ekQRSMMRw=; 
 b=LB8VV34NfFVtRSsk+u3AuDXMh74YXy4jA7YhsO8wMkdkOtMi+Jcthvu9mJ9vQm+S/3J/F6quBnp05iVMUlJnP5V0MEYqpi7gZQPhOI5eSWdSK029Kgo5PdKyUxS1CcH5yqOBXwWpFnZbnOk3E0ixq4PUsrpbV/WJomdUb69PCDw=;
X-UUID: f10387b365c14a428f609c3869a93e2f-20201224
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1433562267; Thu, 24 Dec 2020 03:26:58 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 03:26:55 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Dec 2020 19:26:51 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Dec 2020 19:26:51 +0800
Message-ID: <1608809212.26323.258.camel@mhfsdcap03>
Subject: Re: [PATCH v5 04/27] dt-bindings: memory: mediatek: Add domain
 definition
From: Yong Wu <yong.wu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 24 Dec 2020 19:26:52 +0800
In-Reply-To: <X+L8qpO+T7+U2s5r@chromium.org>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-5-yong.wu@mediatek.com>
 <X+L8qpO+T7+U2s5r@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8C474D3B2374B83E77D4A8D2415ADFF8FAC79803632363B2F7FCFDD373A9DCFD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_063820_308406_28910F84 
X-CRM114-Status: GOOD (  26.20  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com, Tomasz
 Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-23 at 17:15 +0900, Tomasz Figa wrote:
> Hi Yong,
> 
> On Wed, Dec 09, 2020 at 04:00:39PM +0800, Yong Wu wrote:
> > In the latest SoC, there are several HW IP require a sepecial iova
> > range, mainly CCU and VPU has this requirement. Take CCU as a example,
> > CCU require its iova locate in the range(0x4000_0000 ~ 0x43ff_ffff).
> 
> Is this really a domain? Does the address range come from the design of
> the IOMMU?

It is not a really a domain. The address range comes from CCU HW
requirement. That HW can only access this iova range. thus I create a
special iommu domain for it.

> 
> Best regards,
> Tomasz
> 
> > 
> > In this patch we add a domain definition for the special port. In the
> > example of CCU, If we preassign CCU port in domain1, then iommu driver
> > will prepare a independent iommu domain of the special iova range for it,
> > then the iova got from dma_alloc_attrs(ccu-dev) will locate in its special
> > range.
> > 
> > This is a preparing patch for multi-domain support.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >  include/dt-bindings/memory/mtk-smi-larb-port.h | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/dt-bindings/memory/mtk-smi-larb-port.h b/include/dt-bindings/memory/mtk-smi-larb-port.h
> > index 7d64103209af..2d4c973c174f 100644
> > --- a/include/dt-bindings/memory/mtk-smi-larb-port.h
> > +++ b/include/dt-bindings/memory/mtk-smi-larb-port.h
> > @@ -7,9 +7,16 @@
> >  #define __DT_BINDINGS_MEMORY_MTK_MEMORY_PORT_H_
> >  
> >  #define MTK_LARB_NR_MAX			32
> > +#define MTK_M4U_DOM_NR_MAX		8
> > +
> > +#define MTK_M4U_DOM_ID(domid, larb, port)	\
> > +	(((domid) & 0x7) << 16 | (((larb) & 0x1f) << 5) | ((port) & 0x1f))
> > +
> > +/* The default dom id is 0. */
> > +#define MTK_M4U_ID(larb, port)		MTK_M4U_DOM_ID(0, larb, port)
> >  
> > -#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
> >  #define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0x1f)
> >  #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
> > +#define MTK_M4U_TO_DOM(id)		(((id) >> 16) & 0x7)
> >  
> >  #endif
> > -- 
> > 2.18.0
> > 
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
