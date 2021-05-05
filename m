Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6321AC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 09:41:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86791613EB
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 09:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86791613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qCw3yytsPMmV8XhJs2c9t2HAmqDcLGA0W6pPtqXQyWo=; b=f3B37VPtv5cNyrOa5UPz6eqKd
	VoTwFetkWnIDVadrQek4PD/KlyTYtNX/8rFv8PPrW/TA623lt9u6XLd8Y67rE8vQbj8TOjIiB3K7M
	cJ7i9Iyemkh4Ovf/t/l6tdMC9hRWg7fXQUJu3hCpPWiICPv8NICk+X3G8hT+UeBkdpwPcQ2AjU8HK
	tkK15py7pUWzLMRQzcsYiSUxAvqIaiDeiJDFbxpKIDnzF3xvUEJ1G9mq0+TAX8L/gXnnUWN0feQ6J
	VACR/G2pjjce7C8gWR68D729Em6c8WY3Tkqyp/kET8zjW51ON47tTG2yj94ZHOQ5uzZDuEwfCzMKn
	jCvSOh4OQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leE1y-000kcx-2y; Wed, 05 May 2021 09:41:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leE1Q-000kLp-P7
 for linux-mediatek@desiato.infradead.org; Wed, 05 May 2021 09:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=wGIu9D0K3g9b5WCqbKTXiSpOw9BUQsnxsil9kutRcfg=; b=XutpaqbYbt1gGdJ7WRmaYrtW13
 dv4BDPxukdoFw3FqmK5d15S3mxpAndCSaywK2KlpQYPuWkJP+OEDiNiQwIfjFPWm0p1OH85tIN6xE
 O7/T272dj7jk09NUr8Z1fUDT9Uyq035c1qw4ZtiHD62kC9kFdqxpIsbHBiAY/IOAX5z9vhi/C4FCW
 6yeir9g83kTFOXk6wEF5Sfw7BtVXK22sqSva23f+Bxo5kwEdcsR3TXOt0K4i0UgZ9RBpzQKlm3r5E
 s52P9moZQXe3lx11Y2BiE8jscIKQLw6n5sAT1n0v6n/W+RZOUFtt9dzPUcqzzbH/aVO9/4BEb/veC
 QS55U68g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leE1O-004cWQ-Ac
 for linux-mediatek@lists.infradead.org; Wed, 05 May 2021 09:40:47 +0000
X-UUID: 9a9c8b2e15d247838f766585f09d47ed-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wGIu9D0K3g9b5WCqbKTXiSpOw9BUQsnxsil9kutRcfg=; 
 b=X9nDReORDPz35r0ccML3pdh8YdbJ+qSLYPjvgG2nLM2OpyOgokoqyxhqsm8mZhHeoHqgwOJkjNjDMVQgiDR8RFQHdsRVGZYtVwbeQKDmmtAlwIKfhG9bvI5HPLyO4mzIrEUhERJOz0FYLaz779c4/O4jk1OYtALNdirtUC+ZuRw=;
X-UUID: 9a9c8b2e15d247838f766585f09d47ed-20210505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 695725680; Wed, 05 May 2021 02:40:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 02:31:43 -0700
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 5 May 2021 17:31:42 +0800
Message-ID: <fc962daf8b7babc22b043b2b0878a206780b55f3.camel@mediatek.com>
Subject: Re: Re: Re: Re: [PATCH net-next 0/4] MT7530 interrupt support
From: Landen Chao <landen.chao@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Frank Wunderlich <frank-w@public-files.de>
CC: DENG Qingfang <dqfext@gmail.com>, David Miller <davem@davemloft.net>,
 <f.fainelli@gmail.com>, <hkallweit1@gmail.com>, <kuba@kernel.org>,
 <matthias.bgg@gmail.com>, <linux@armlinux.org.uk>, <sean.wang@mediatek.com>,
 <vivien.didelot@gmail.com>, <olteanv@gmail.com>, <robh+dt@kernel.org>,
 <linus.walleij@linaro.org>, <gregkh@linuxfoundation.org>,
 <sergio.paracuellos@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-staging@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
 <weijie.gao@mediatek.com>, <gch981213@gmail.com>, <opensource@vdorst.com>,
 <tglx@linutronix.de>, <maz@kernel.org>
Date: Wed, 5 May 2021 17:31:43 +0800
In-Reply-To: <YIwxpYD1jnFMPQz+@lunn.ch>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429.170815.956010543291313915.davem@davemloft.net>
 <20210430023839.246447-1-dqfext@gmail.com> <YIv28APpOP9tnuO+@lunn.ch>
 <trinity-843c99ce-952a-434e-95e4-4ece3ba6b9bd-1619786236765@3c-app-gmx-bap03>
 <YIv7w8Wy81fmU5A+@lunn.ch>
 <trinity-611ff023-c337-4148-a215-98fd5604eac2-1619787382934@3c-app-gmx-bap03>
 <YIwCliT5NZT713WD@lunn.ch>
 <trinity-c45bbeec-5b7c-43a2-8e86-7cb22ad61558-1619794787680@3c-app-gmx-bap03>
 <YIwxpYD1jnFMPQz+@lunn.ch>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_024046_380769_04010C4D 
X-CRM114-Status: GOOD (  21.46  )
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

On Fri, 2021-04-30 at 18:34 +0200, Andrew Lunn wrote:
> > mhm, maybe the naming should differ if generic phy and net-phy are
> > that different. i guess there is no way to merge the net phys to
> > the
> > generic phys (due to linking to the net device drivers) to have
> > only
> > 1 phy section, right?
> 
> phys and generic PHYs are very different things, completely different
> API etc. They cannot be merged.
> 
> > but if phy- prefix is used by generic phys, maybe eth- or net- can
> > be used here (maybe with "phy" added)
> > 
> > something like
> > 
> > eth-phy-mt753x.ko
How about using mediatek-ge.ko. 'ge' is the abbreviation of gigabit
Ethernet. Most mediatek products use the same gigabit Ethernet phy.

Landen
> > 
> > else i have no idea now...my patch renaming the musb-module seems
> > not
> > to be accepted due to possible breakage
> 
> The usb module has been around for a long time, so it cannot be
> changed. The phy driver is new, not in a released kernel. So we can
> still rename it without causing problems.
> 
> I still want to understand the naming here. If you look at most
> Ethernet switches with integrated PHYs, the PHYs have their own
> naming
> scheme, separate from the switch, because they are independent IP. So
> i would prefer this driver by named after the PHY name, not the
> switch
> name. That might solve the naming conflict, mt123x for the PHY,
> mt7530
> for the switch driver.
> 
> 	Andrew
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
