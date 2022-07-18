Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC33FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 08:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8doZ6cwX4VEJEmIa1dRNJ6XQbB28DhA0b3yvN8HXEGI=; b=gozHXsIXA4Q7WDRwNsOXWjlZd+
	XgzfX7ayr4gdKXbfSWxIO5Jo9nHAz7LN9bvSq/pGFe4e3RHsRu9JPgFm6Y4FKoxTmPsgu/gDnBZWp
	2nvUSaogxAkaSIK+QTlOIb6TaMh+o11lW5jbzYT0MrvDmeXICIDV4dRpzKOlBlAfGwoBsLg1IxrYf
	psno5U98LaIm4OV7jPVc4gOUWlDQKPHsMSatL1BNThQMWsf2z5+8ZW62V/Ck+BHao233+ToDn+XS8
	rjaF66zgolGKTL+gKb1MZnTwPvGjfJ4k6A9wfshs8PLo+CnVzpakcdIM9dyG31I+mafID5blbT6A6
	CZSfrPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDMDc-00Bm3u-C5; Mon, 18 Jul 2022 08:35:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDMDZ-00Bm0b-JF; Mon, 18 Jul 2022 08:35:06 +0000
X-UUID: 11d2da97f3f54926b2ab8bebfae4b09e-20220718
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:2685a731-8d5e-49db-8dbd-7bb8ed285b45,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:22559464-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 11d2da97f3f54926b2ab8bebfae4b09e-20220718
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jing-ting.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2100109563; Mon, 18 Jul 2022 01:34:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 18 Jul 2022 15:44:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Jul 2022 15:44:21 +0800
Message-ID: <d8f0bc5e2fb6ed259f9334c83279b4c011283c41.camel@mediatek.com>
Subject: Re: [Bug] race condition at rebind_subsystems()
From: Jing-Ting Wu <jing-ting.wu@mediatek.com>
To: Tejun Heo <tj@kernel.org>, Michal =?ISO-8859-1?Q?Koutn=FD?=
	<mkoutny@suse.com>
CC: Johannes Weiner <hannes@cmpxchg.org>, Zefan Li <lizefan.x@bytedance.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, <cgroups@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Shakeel Butt <shakeelb@google.com>,
	<wsd_upstream@mediatek.com>, <lixiong.liu@mediatek.com>,
	<wenju.xu@mediatek.com>, <jonathan.jmchen@mediatek.com>
Date: Mon, 18 Jul 2022 15:44:21 +0800
In-Reply-To: <YtGaP+e35DZYSQf0@slm.duckdns.org>
References: <1978e209e71905d89651e61abd07285912d412a1.camel@mediatek.com>
	 <20220715115938.GA8646@blackbody.suse.cz>
	 <YtGaP+e35DZYSQf0@slm.duckdns.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_013505_653683_A5F3B639 
X-CRM114-Status: GOOD (  18.73  )
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

On Fri, 2022-07-15 at 06:47 -1000, Tejun Heo wrote:
> (resending, I messed up the message header, sorry)
> 
> Hello,
> 
> On Fri, Jul 15, 2022 at 01:59:38PM +0200, Michal Koutný wrote:
> > The css->rstat_css_node should not be modified if there are
> > possible RCU
> > readers elsewhere.
> > One way to fix this would be to insert synchronize_rcu() after
> > list_del_rcu() and before list_add_rcu().
> > (A further alternative (I've heard about) would be to utilize
> > 'nulls'
> > RCU lists [1] to make the move between lists detectable.)
> > 
> > But as I'm looking at it from distance, it may be simpler and
> > sufficient
> > to just take cgroup_rstat_lock around the list migration (the
> > nesting
> > under cgroup_mutex that's held with rebind_subsystems() is fine).
> 
> synchronize_rcu() prolly is the better fit here given how that
> list_node's
> usage, but yeah, great find.
> 
> Thanks.
> 

Hi Michal and Tejun,


Thanks for your suggestion.
Accroding your description, is the following patch corrent?

--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -1813,6 +1813,7 @@
 
 		if (ss->css_rstat_flush) {
 			list_del_rcu(&css->rstat_css_node);
+			synchronize_rcu();
 			list_add_rcu(&css->rstat_css_node,
 				     &dcgrp->rstat_css_list);
 		}


If the patch is correct, we will add this patch to our stability test.
And we will continue to observe whether the problem is solved.
Thank you.




Best regards,
Jing-Ting Wu


