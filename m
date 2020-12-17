Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F83C4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 02:26:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D3E323719
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 02:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D3E323719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xnZcp2kmXvn2m2PGRSPTKEimuQZ7iRLUI81zBvYXX9M=; b=vZgp+4KaqsQ2wumnzen+Lc2W2
	hQ1BVmayXBNZW7roqF2+OLFhgZsMDofCpp+WqGSz1H6HXAGwTMIrch4tAOTDWzrinvl2dnOtsyUGw
	n8hCCKW/24YockGQo1KCIjmF7+ovcGi1BpY9TPbcnL7s30B0lQsHZkXWsveGOkIpL0ht7jzeBg3Vd
	o48cso+v9QTyIIyn29ajPg8Y6BKxXg7dHPndKgqDsHbXmA1vcC6hqirxRcpcrWXu8J2jBbRY7KLRy
	fJ0BqHdgnt/a+AowC/V7HGP0+toJTyg3QLICBpWHvoiRoGczS85FsFlYp34iM7Ar1mTrp35EXElFl
	F8stAAUxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpizr-0002Ik-IY; Thu, 17 Dec 2020 02:26:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpizk-0002Fz-J3; Thu, 17 Dec 2020 02:26:21 +0000
X-UUID: dffdffeae5ce4f798f061366905595e0-20201216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rtpUbaZh/cAA+R5BRc6dTbvK+CjOyeTaJisNHX8GorM=; 
 b=M+7JG5RX2/VYnAMDWx472+5+2R3SDuSluClsjhpGaFaZfMt+KDqtPx/Fcdoihp99ptRyk2ve4hjPI+m1Eklg5MxjoHYrwvaTr0kDx6+NBs8Bfl9F4IzmIdOm5yPOUKN2bmRWe5D8Oz43YMUDnzYAfT/VZSMHX63zS+Ao5D5Jf8c=;
X-UUID: dffdffeae5ce4f798f061366905595e0-20201216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 991179594; Wed, 16 Dec 2020 18:26:12 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 18:26:10 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Dec 2020 10:26:07 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Dec 2020 10:26:06 +0800
Message-ID: <1608171967.26323.211.camel@mhfsdcap03>
Subject: Re: [PATCH v3 4/7] iommu: Switch gather->end to unsigned long long
From: Yong Wu <yong.wu@mediatek.com>
To: David Laight <David.Laight@ACULAB.COM>
Date: Thu, 17 Dec 2020 10:26:07 +0800
In-Reply-To: <6b4a1d37a90f4663adf6b4adb9f80e2b@AcuMS.aculab.com>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
 <20201216103607.23050-5-yong.wu@mediatek.com>
 <6b4a1d37a90f4663adf6b4adb9f80e2b@AcuMS.aculab.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B9C6A281BF70BD4B15A9A916FF428EA37530DAF05AB6D1085009CD88534769EA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_212620_807250_482CDE5E 
X-CRM114-Status: GOOD (  22.33  )
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
Cc: "youlin.pei@mediatek.com" <youlin.pei@mediatek.com>,
 "anan.sun@mediatek.com" <anan.sun@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 "srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>,
 "chao.hao@mediatek.com" <chao.hao@mediatek.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tfiga@google.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "kernel-team@android.com" <kernel-team@android.com>,
 Greg Kroah-Hartman <gregkh@google.com>, Robin
 Murphy <robin.murphy@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi David,

On Wed, 2020-12-16 at 11:03 +0000, David Laight wrote:
> From: Yong Wu
> > Sent: 16 December 2020 10:36
> > 
> > Currently gather->end is "unsigned long" which may be overflow in
> > arch32 in the corner case: 0xfff00000 + 0x100000(iova + size).
> > Although it doesn't affect the size(end - start), it affects the checking
> > "gather->end < end"
> > 
> > Fixes: a7d20dc19d9e ("iommu: Introduce struct iommu_iotlb_gather for batching TLB flushes")
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  include/linux/iommu.h | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > index 794d4085edd3..6e907a95d981 100644
> > --- a/include/linux/iommu.h
> > +++ b/include/linux/iommu.h
> > @@ -178,7 +178,7 @@ enum iommu_dev_features {
> >   */
> >  struct iommu_iotlb_gather {
> >  	unsigned long		start;
> > -	unsigned long		end;
> > +	unsigned long long	end;
> >  	size_t			pgsize;
> >  };
> 
> Doesn't that add two pad words on many 32bit systems?
> You probably ought to re-order the structure to keep the fields
> on their natural boundaries.
> 
> I'm not sure what is being mapped here, but could it make sense
> to just avoid using the highest addresses?
> Then you never hit the problem.

Thanks for your review. following Robin's suggesting, I will use "iova +
size - 1", then avoid this.

> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
