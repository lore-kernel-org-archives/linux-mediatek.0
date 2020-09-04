Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17909C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 10:33:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDE1E206D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 10:33:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ErSuK0uA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZeksuOlP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDE1E206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p+Sq03VDiQ3SYxlmGufvbs9az9RKgmjHFeWH3AO72G0=; b=ErSuK0uA6P4yUDN6+EjTwgtKQ
	DUKrkYfFTT5RmTaZvE0PZBafcX2lJ/ujveYUX2+KlHQlRFo1zbLnZzlYDuRvwjwlDbsS5gj4e68DT
	xaU+YBF7uEdI29SglS8ugfxkya7pfmAKd5Jd1xgagB8kVoy+oaMlfeM2IlApwxHSMQCEvZrZQ/imJ
	LGCwAQ0YAd5SyIku6RTcqTg5WckPAKiaE1vucohTBoE+4RMBkN0PVSveV5X0Ku+gTFK5iBgVrL6mX
	UvxiCKI8j/FFJJ5SnRGrti9H1Rjy6a6zuF8MhDimLtLKlaziNge7aKBuL8R7JVYvRRXqC2CzSc4r6
	X8j+4d1kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE91v-00029I-Sz; Fri, 04 Sep 2020 10:33:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE91s-00028C-W0; Fri, 04 Sep 2020 10:33:14 +0000
X-UUID: 2505fc529300406885d338d580b2b927-20200904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=W6qNdgT4XBpxvM+qKDnHlTrV/BrFHcflzIbO8Gjk/jY=; 
 b=ZeksuOlPOeEUpmxSmdpbe++iYkz8tddd78CmwXEEXB4AbzDsNwbjuaJTO9BfkZOOW25ZugAahv6S20zFrQ02aHkArnYs++o0pjZhuUZthqyYwZI8a9VZc1/hsN7try4nihg7tqhG6uwERlpCkgOtDrujPMdlBxo4TgKxIDoENuc=;
X-UUID: 2505fc529300406885d338d580b2b927-20200904
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 54113772; Fri, 04 Sep 2020 02:28:48 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 03:28:46 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 18:28:41 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Sep 2020 18:28:42 +0800
Message-ID: <1599215324.29997.1.camel@mtkswgap22>
Subject: Re: [PATCH v5] iommu/mediatek: check 4GB mode by reading infracfg
From: Miles Chen <miles.chen@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>
Date: Fri, 4 Sep 2020 18:28:44 +0800
In-Reply-To: <20200904094233.GP6714@8bytes.org>
References: <20200831105639.2856-1-miles.chen@mediatek.com>
 <20200904094233.GP6714@8bytes.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8CBC2E51C5EDEC8111200CFC22B3DC832000455B5036BDE4B17C4427343DBDC82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_063313_367130_2ACCE07E 
X-CRM114-Status: GOOD (  17.17  )
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
Cc: Rob Herring <robh@kernel.org>, wsd_upstream@mediatek.com, David
 Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-09-04 at 11:42 +0200, Joerg Roedel wrote:
> On Mon, Aug 31, 2020 at 06:56:39PM +0800, Miles Chen wrote:
> > In previous discussion [1] and [2], we found that it is risky to
> > use max_pfn or totalram_pages to tell if 4GB mode is enabled.
> > 
> > Check 4GB mode by reading infracfg register, remove the usage
> > of the un-exported symbol max_pfn.
> > 
> > This is a step towards building mtk_iommu as a kernel module.
> > 
> > [1] https://lore.kernel.org/lkml/20200603161132.2441-1-miles.chen@mediatek.com/
> > [2] https://lore.kernel.org/lkml/20200604080120.2628-1-miles.chen@mediatek.com/
> > [3] https://lore.kernel.org/lkml/20200715205120.GA778876@bogus/
> > 
> > Cc: Mike Rapoport <rppt@linux.ibm.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Yong Wu <yong.wu@mediatek.com>
> > Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> 
> You forgot to add the tags here from v4, at least Matthias' Reviewed-by
> is missing. Please add the missing tags and resend.

Thanks for reminding. I'll add the tag and resend this patch ASAP.

Miles
> 
> 
> 	Joerg

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
