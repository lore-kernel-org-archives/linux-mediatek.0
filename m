Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2C2C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 09:11:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC54F61186
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 09:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC54F61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LjzbWVUvxwlifRQa4aCPe/za980wJqvYEgAqWLRBM0s=; b=DuZsdone7qXjCRQE2buFPIYU8
	nq/rGXDVer4Ayj7UfsA8oAJBI+x53E4+qVMNynw7+z3wIyed83D2TVzb1CfyR+IMT2IKfek+qpSkh
	qFbg7W45izWJFsI0F/HQSjvVEM4z5AcavffHGdA+9XvCmSEqAZi4rvlOl0c4plR9DP52pGO5QyUTa
	miBfRaTRsCio47wOUXYl6MKBAkBB54yxqxV9ZMecBzP68AgJ6Luf1IXfKdOY02Z2R8tb2SLVGb/Dy
	ANCh+0djuh9oGpNez9J+GD9IpVsF38KsgUm9et34XHAiwVoXFLSiwlpACu0Z5uy5J9sR+4fTpYOiN
	yNeq1jb5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgktW-002OrO-Nx; Wed, 12 May 2021 09:11:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgktU-002Or1-SG; Wed, 12 May 2021 09:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=kkcuKIV5ndAGmSfjS3smRDxke85pNHw8+qJVgpM2ruc=; b=3vz3BLSWzeYyM+WY914UHboHyM
 5Ph7DwBJVcoDym/8h1oIKcsLETtl/35cwUCtrRVvsr99JQg+icGtcpR5e2wwNZgPery2gv3xhRNou
 SOqHVxNSjtevCP9lz5vhNeNgBgczpPUQVW1y1p7rfhfTZMC4mnU7WZsPB7d7lbLVBYHHVN/HyI79O
 ctreIuKDAXvHIrCo04xdJ+LiYYBh9LiqQ+kq99iRmkcvdK9cSva0MdEZlQyZzEgoZWge58dEEGJRm
 PY0qa+Osf5L2KMub+SMgfX8C0zc8zhRpEKNMVfCHvlAqZBlFcC0HHQhCw/xw8yzye2jCT3+2mT1dK
 tcjIOhiw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgktR-00AEy2-TM; Wed, 12 May 2021 09:11:03 +0000
X-UUID: 98d91f0201e645318a2bf26bf38d179a-20210512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kkcuKIV5ndAGmSfjS3smRDxke85pNHw8+qJVgpM2ruc=; 
 b=a1KR/JDZsZSt0fHy1tbD7vf+kYj6ZRE9gAg82Ff7Lb0/VmaHKx/PdkkslAGNLjwGAFgA7sXkRJwRZTF0gyKz4orS5BVkgsjiChqWO3tmlf2ZwJAiDW7WpS8IpZqJF6N7jr8cdTkWbSkeZYqHaChq/SKWS/l3g+zM54bwroR9rpQ=;
X-UUID: 98d91f0201e645318a2bf26bf38d179a-20210512
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1709636995; Wed, 12 May 2021 02:10:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 May 2021 02:00:55 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 12 May 2021 17:00:54 +0800
Received: from [10.15.20.246] (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 May 2021 17:00:52 +0800
Message-ID: <1620809292.29442.7.camel@mbjsdccf07>
Subject: Re: Aw: [PATCH][v2] rtnetlink: add rtnl_lock debug log
From: Rocco.Yue <rocco.yue@mediatek.com>
To: Frank Wunderlich <frank-w@public-files.de>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, <peterz@infradead.org>, Tetsuo Handa
 <penguin-kernel@I-love.SAKURA.ne.jp>, Peter Enderborg
 <peter.enderborg@sony.com>, Thomas Gleixner <tglx@linutronix.de>, "Anshuman
 Khandual" <anshuman.khandual@arm.com>, Vitor Massaru Iha <vitor@massaru.org>, 
 Sedat Dilek <sedat.dilek@gmail.com>, Wei Yang <richard.weiyang@gmail.com>,
 Cong Wang <cong.wang@bytedance.com>, Di Zhu <zhudi21@huawei.com>, "Stephen
 Hemminger" <stephen@networkplumber.org>, Francis Laniel
 <laniel_francis@privacyrequired.com>, Roopa Prabhu
 <roopa@cumulusnetworks.com>, Andrii Nakryiko <andrii@kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upsream@mediatek.com>
Date: Wed, 12 May 2021 16:48:12 +0800
In-Reply-To: <trinity-da507ec7-f0ec-4d64-b7fe-1c9d13dbead8-1620759241263@3c-app-gmx-bs62>
References: <20210508085738.6296-1-rocco.yue@mediatek.com>
 <trinity-da507ec7-f0ec-4d64-b7fe-1c9d13dbead8-1620759241263@3c-app-gmx-bs62>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_021101_974348_8C2625E0 
X-CRM114-Status: GOOD (  14.08  )
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

On Tue, 2021-05-11 at 20:54 +0200, Frank Wunderlich wrote:
> > Gesendet: Samstag, 08. Mai 2021 um 10:57 Uhr
> > Von: "Rocco Yue" <rocco.yue@mediatek.com>
> > Betreff: [PATCH][v2] rtnetlink: add rtnl_lock debug log
> 
> > <6>[   40.191481][    C6] rtnetlink: -- rtnl_print_btrace start --
> > <6>[   40.191494][    C6] rtnetlink: RfxSender_4[2206][R] hold rtnl_lock
> > more than 2 sec, start time: 38181400013
> it would be good to have same time-format (seconds.nanosec)
> 
> > <6>[   42.181879][ T2206] rtnetlink: rtnl_lock is held by [2206] from
> > [38181400013] to [42181875177]
> same as above
> 

Thanks for your review.

I have also thought about whether it needs to be modified here, and the
intuitive reading here will be a little troubled. It is ok for me to
modify :-)

> > +static void rtnl_relase_btrace(void)
> should this be release_btrace?
> 

will fix.

Best Regards
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
