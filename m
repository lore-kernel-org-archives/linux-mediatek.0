Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D5CC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 07:54:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F430222EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 07:54:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ectPXLRi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FXW5f8pG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F430222EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7iYkP88fqmRngUPlOtPwNF0gZrGruVW6l4ChJrAKaG8=; b=ectPXLRi5Qm+XQUsMCceq+ImB
	1tq/VJeYzGich3f+uLFxAHPHPt8ukjObRB85tH7uJ4aQvBkvvhf/wDEjCLK+KkT1daJLXANbY22a4
	yhs6S01KmCkwTxfBj2ouaC2CDP3rt/+/WhvaRLDidOgT6t/ZCY5s+W0rvNg0kd1IlEhLQvYkCIVJc
	hs1ALEXUzwhKq/ShHV/gdaVhgm37g5UqA1SuNJrfnACFVwLaHL0tte1Dsvyda2bSpEgO8NVlxbWvI
	tfj35ML2ipFxO06+T9DKOmT3RNkVxWB9rM+gK0nCNUUtW8gRPdTsZfhXzZ/hEo6iCml+JXawoh4h4
	dL+dH53tQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWxKf-0002LE-T5; Mon, 26 Oct 2020 07:54:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWxKc-0002KW-8p; Mon, 26 Oct 2020 07:54:20 +0000
X-UUID: 9e8f0400d18a464eb9bfdf349d15197a-20201025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lojLUg9fFbo8jOsfPb9idJA9/aY654a36SbR0fCGZpQ=; 
 b=FXW5f8pGDDlqGl/OVd1XO2KoNC4wG2GzGQtDOhRESU092WwJ24EbVZ3o3hJ18JzHFotdMdLKKW3hjF9FaIAsiIMlMH9qm9dHN0C4duXxiS4nZTlM+Arpx/qBHIv9LwiT6CSGj++ANfioOA83EVYMosle0ER8wFhq5tifenm5EVU=;
X-UUID: 9e8f0400d18a464eb9bfdf349d15197a-20201025
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 171248323; Sun, 25 Oct 2020 23:54:13 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Oct 2020 00:45:44 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 26 Oct 2020 15:45:35 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Oct 2020 15:45:34 +0800
Message-ID: <1603698334.26323.88.camel@mhfsdcap03>
Subject: Re: [PATCH v3 11/24] iommu/io-pgtable-arm-v7s: Quad lvl1 pgtable
 for MediaTek
From: Yong Wu <yong.wu@mediatek.com>
To: Will Deacon <will@kernel.org>
Date: Mon, 26 Oct 2020 15:45:34 +0800
In-Reply-To: <20201023112148.GB20933@willie-the-truck>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-12-yong.wu@mediatek.com>
 <20201023112148.GB20933@willie-the-truck>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7D5007B554F3125CBCD9B8D492C92003C020E35494172D92BAFD6D3255A98BE82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_035418_454591_01696BAF 
X-CRM114-Status: GOOD (  20.99  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, Nicolas
 Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-23 at 12:21 +0100, Will Deacon wrote:
> On Wed, Sep 30, 2020 at 03:06:34PM +0800, Yong Wu wrote:
> > The standard input iova bits is 32. MediaTek quad the lvl1 pagetable
> > (4 * lvl1). No change for lvl2 pagetable. Then the iova bits can reach
> > 34bit.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/io-pgtable-arm-v7s.c | 13 ++++++++++---
> >  drivers/iommu/mtk_iommu.c          |  2 +-
> >  2 files changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> > index 8362fdf76657..306bae2755ed 100644
> > --- a/drivers/iommu/io-pgtable-arm-v7s.c
> > +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> > @@ -50,10 +50,17 @@
> >   */
> >  #define ARM_V7S_ADDR_BITS		32
> 
> If we rename this to _ARM_V7S_ADDR_BITS can we then have ARM_V7S_ADDR_BITS
> take a cfg parameter and move the arm_v7s_is_mtk_enabled() check in there?
> Same for _ARM_V7S_LVL_BITS.
> 
> That would avoid scattering arm_v7s_is_mtk_enabled() into all the users.

I added "cfg" for _ARM_V7S_LVL_BITS in Robin's mail. is that ok?

Regarding ARM_V7S_ADDR_BITS, I'd like to keep it as is(Don't add cfg),
this macro only is used in ARM_V7S_LVL_SHIFT and checking the value of
ias/oas.

a) ARM_V7S_LVL_SHIFT always expect ARM_V7S_ADDR_BITS is 32.

b) our ias/oas is different(ias is 34 while oas is 35). If we define a
new macro, we need two about this, like:
#define ARM_V7S_IADDR_BITS(cfg)	(!arm_v7s_is_mtk_enabled(cfg) ? 32 : 34)
#define ARM_V7S_OADDR_BITS(cfg)	(!arm_v7s_is_mtk_enabled(cfg) ? 32 : 35)
and the two will only are used in the checking of ias/oas.

thus it looks unnecessary?

> 
> Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
