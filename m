Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E18C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 06:31:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41BF0221FD
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 06:31:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fMxDJG9F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CR78ywp9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41BF0221FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8FkjXOJ+q2A1XPr0HMk8ADviJNoAOatdG8dK1Ccta98=; b=fMxDJG9Ft8wTtpuT4OF/5ls2q
	9ejqZWEsnS/ksA69hlwenF0DsZmafkvJYHTcgQG8WpFktx1QJAFF1VE/+YZNThwlRn4OB6FRhPvRw
	iwPPoVf5xJSSvP1X742cOO+x5yj9W/o8i49oYN7tHLfwn6AMl1oM8qE5lxRd1FJ4LXrxJDHehN9+R
	VqEts1QEoQQiUf8SgeE8m+aUpysZ18vOiI0cYWATNDYaPJJ5viVuBqscHK/CyUUoil78vOHXirIis
	zscjQzDi6MUjX7+PVuB1Rf8DUFsHN0Uym8raNpyM4cA0FW4bPuxnV3a/kHzR102ljCSMBOifOAobN
	MkFsa0Jkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiXI6-0000or-1d; Fri, 27 Nov 2020 06:31:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiXHt-0000jl-9R; Fri, 27 Nov 2020 06:31:22 +0000
X-UUID: 7ef059f413404174bc23660e9806f1bb-20201126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Pl6CYWtmmWtvWb3jpHddFmtYia5wUK/VPTpcYY0nQVw=; 
 b=CR78ywp974QqBjd2oroSLxbDdlDXOTnTEFVRGk3UIfnFJBdh7JcQpSoKZexqa3plwMZ/F7HchO/C5EOaC3EtCMKgacRp+dgp5ztwL/EHme0ES3OH2NPfCykSlKcfSu0xbFFzlMZ+DVXOM9F/BLXX9Gv+cFONv3sis3UAgQxt4Gg=;
X-UUID: 7ef059f413404174bc23660e9806f1bb-20201126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1688453297; Thu, 26 Nov 2020 22:31:13 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Nov 2020 22:21:21 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 27 Nov 2020 14:21:20 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Nov 2020 14:21:18 +0800
Message-ID: <1606458079.26323.191.camel@mhfsdcap03>
Subject: Re: [PATCH v4 09/24] iommu/io-pgtable-arm-v7s: Clear LVL_SHIFT/BITS
 macro instead of the formula
From: Yong Wu <yong.wu@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>
Date: Fri, 27 Nov 2020 14:21:19 +0800
In-Reply-To: <13599074-25d5-721f-ea7b-1ea6badfd14f@arm.com>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-10-yong.wu@mediatek.com>
 <13599074-25d5-721f-ea7b-1ea6badfd14f@arm.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9F8790CD8E57278BED548B9B20C81FEFDD4AF8C22E7A81094363F0EEEAC8B4D62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_013121_526754_75AE9411 
X-CRM114-Status: GOOD (  22.71  )
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
 Figa <tfiga@google.com>, kernel-team@android.com,
 Joerg Roedel <joro@8bytes.org>, Greg Kroah-Hartman <gregkh@google.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-11-26 at 16:03 +0000, Robin Murphy wrote:
> On 2020-11-11 12:38, Yong Wu wrote:
> > The current _ARM_V7S_LVL_BITS/ARM_V7S_LVL_SHIFT use a formula to calculate
> > the corresponding value for level1 and level2 to pretend the code sane.
> > Actually their level1 and level2 values are different from each other.
> > This patch only clear the two macro. No functional change.
> 
> Grammar nit: to "clear" the macro sounds like you're making it empty or 
> removing it entirely; I think you mean to say "clarify" here. English is 
> the worst language sometimes... :)

Thanks for the review. Feel free to tell me if some words is not fit:)

I will use "clarify" in the title.

> 
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> 
> > Suggested-by: Robin Murphy <robin.murphy@arm.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   drivers/iommu/io-pgtable-arm-v7s.c | 8 +++-----
> >   1 file changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> > index 4d0aa079470f..58cc201c10a3 100644
> > --- a/drivers/iommu/io-pgtable-arm-v7s.c
> > +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> > @@ -44,13 +44,11 @@
> >   
> >   /*
> >    * We have 32 bits total; 12 bits resolved at level 1, 8 bits at level 2,
> > - * and 12 bits in a page. With some carefully-chosen coefficients we can
> > - * hide the ugly inconsistencies behind these macros and at least let the
> > - * rest of the code pretend to be somewhat sane.
> > + * and 12 bits in a page.
> >    */
> >   #define ARM_V7S_ADDR_BITS		32
> > -#define _ARM_V7S_LVL_BITS(lvl)		(16 - (lvl) * 4)
> > -#define ARM_V7S_LVL_SHIFT(lvl)		(ARM_V7S_ADDR_BITS - (4 + 8 * (lvl)))
> > +#define _ARM_V7S_LVL_BITS(lvl)		((lvl) == 1 ? 12 : 8)
> > +#define ARM_V7S_LVL_SHIFT(lvl)		((lvl) == 1 ? 20 : 12)
> >   #define ARM_V7S_TABLE_SHIFT		10
> >   
> >   #define ARM_V7S_PTES_PER_LVL(lvl)	(1 << _ARM_V7S_LVL_BITS(lvl))
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
