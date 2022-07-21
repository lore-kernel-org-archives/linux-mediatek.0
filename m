Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D5FCCA479
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 06:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3nZatUbupfsq0uZH4AbyP7ygI6QhRZi82Eo5sbMDQ0=; b=Vy4QSdmoUeUs/JLQupXTFQtydr
	GBkSi7dZO//ONX1Wc2ECLwnonwRy3xcuMkGRfLegvULqgS66zBmK6ja9seaSvhETX/Jl5h5zQPTaI
	5UPEtrM2CpWMy5k/uMlg2zkDkslhCHFpfAXz6pqH177GFo+1q2LY3ar1oaMo/+hfJiOv+VsEAHy9k
	IsrhZEqkH1LCKDH8g2EC9hbRe/kuHJl79glUoxEPAQuqFP8B4DiVsMQtu/6hHRwpZUttqXTJvWulU
	/0m5mKZlZ1H6fs6SSdx/PSXdjycgV0qzLB38aUev76E1J8HQhIqEb7/NnghikIYGU0dsq68II8ehM
	Yn1LGpyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEQ78-001Kwp-KW; Thu, 21 Jul 2022 06:56:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEQ76-001Ko2-Hf; Thu, 21 Jul 2022 06:56:49 +0000
X-UUID: db0f178ffd0849ecbd6ac0686d0f0ca8-20220720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:92fd9593-30f6-4618-b661-e37f179ec980,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:6eb412d8-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: db0f178ffd0849ecbd6ac0686d0f0ca8-20220720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jing-ting.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2136204008; Wed, 20 Jul 2022 23:56:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 21 Jul 2022 14:46:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jul 2022 14:46:03 +0800
Message-ID: <98d738ec5d7d32441f6e62278fff32201fd948de.camel@mediatek.com>
Subject: Re: [Bug] race condition at rebind_subsystems()
From: Jing-Ting Wu <jing-ting.wu@mediatek.com>
To: Michal =?ISO-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
CC: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, "Zefan
 Li" <lizefan.x@bytedance.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<cgroups@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Shakeel Butt <shakeelb@google.com>, <wsd_upstream@mediatek.com>,
	<lixiong.liu@mediatek.com>, <wenju.xu@mediatek.com>,
	<jonathan.jmchen@mediatek.com>
Date: Thu, 21 Jul 2022 14:46:03 +0800
In-Reply-To: <20220719133512.GD897@blackbody.suse.cz>
References: <1978e209e71905d89651e61abd07285912d412a1.camel@mediatek.com>
	 <20220715115938.GA8646@blackbody.suse.cz>
	 <YtGaP+e35DZYSQf0@slm.duckdns.org>
	 <d8f0bc5e2fb6ed259f9334c83279b4c011283c41.camel@mediatek.com>
	 <20220719133512.GD897@blackbody.suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_235648_604420_46F094AF 
X-CRM114-Status: GOOD (  15.35  )
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

On Tue, 2022-07-19 at 15:35 +0200, Michal Koutný wrote:
> On Mon, Jul 18, 2022 at 03:44:21PM +0800, Jing-Ting Wu <
> jing-ting.wu@mediatek.com> wrote:
> > Accroding your description, is the following patch corrent?
> 
> Yes, this is what I meant (i.e. grace period before invalidating the
> removed rstat_css_node).
> 
> > If the patch is correct, we will add this patch to our stability
> > test.
> > And we will continue to observe whether the problem is solved.
> 
> It'd be great to have such confirmation.

Thanks for confirm the patch.
We already add patch to our stability test.
We will reply mail if we have any update.

> 
> Thanks,
> Michal



Best regards,
Jing-Ting Wu


