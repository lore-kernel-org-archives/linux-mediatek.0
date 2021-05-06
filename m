Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33184C43461
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 12:54:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80300610F7
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 12:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80300610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GGP5yNI4DnykSNGgbh3mbezyzZiCf7quc6P6X8ryQgQ=; b=AjZcH0znOJGs3yVk2zb+rjcb4
	ljVkCulHgIsXVv+VqEEIPOCKftQuGbygA2gfcWt5dIFvtiTmtcLIH5Rxbv1vXuFfBmJ+OdecCqWwO
	uDmJHPVa9mr7AT3kREnjklpp7BkelePjV7x7kYLeRfr4hZ4XjAyTjupz0wAjRdxmx5fprY59V50r9
	XU6A1GhS1uCu2mR04RcG/wFGi8UDFP1nQnb4kZxV7I/S9Ikvbog/cUAI/TXps3JZFD5+mM5np2ooW
	lh4pPqZmg09BtjOLX8xP6e4ZgcsZsWqI4ruGByhh7C6te5r21wHN56Qqjmq5uolHrp83OyJkar9GN
	d5WByEgVw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ledWH-004GU9-I8; Thu, 06 May 2021 12:54:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ledWE-004GTp-Mg
 for linux-mediatek@desiato.infradead.org; Thu, 06 May 2021 12:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=u++h3xqD22QpblRd36WXArhv2zfQ3l9s+WBc2UfSt7g=; b=TGJzRwgANde2nJv7CY51CLWTCG
 6RATbd0lxbVtgmB4Uu77QFGmnSTcu8wRfgMPAJq5boV6JAgVkcsPSSiRAEK0kbRlyJCL8f/JGV79O
 CUc3PzqNbc4f9H9Jpryy8kUm73+bnehR5L5tuZ9b5yQnaFnUPMoSyG24XvVy+nXbkekXani+RYNpU
 eMHdfSf6blxdUxQdQLUfxkMaDsxjTafCea/hYMvIvF/FuL6HpS6XIy3ueWnc+RVLgpTx4+1hMPpUm
 ILHNXPJZuEXAFfFZXGCawV9JENuH/AoZDy1IgfnAtU7ckXWToKT+dokMjnyc7EjypYtIkR5YW+22u
 jXLgDGVA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ledWB-0062QA-R0
 for linux-mediatek@lists.infradead.org; Thu, 06 May 2021 12:54:17 +0000
X-UUID: 74d7de9c34224f4b9090752f88f3f86f-20210506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=u++h3xqD22QpblRd36WXArhv2zfQ3l9s+WBc2UfSt7g=; 
 b=MV3NvYP2frJPRbpqE5J/Gqln5O/ylDZd6JEvYCY0/4C/gevK1puJ37yWeFxAT4xBy4dGg0VKkiyZlHyIKfG0LDeamzGEiNpmHiI/QFiHz/xeTgGxGfTtQyt+Km8kRRpThMcq5b3wHGpzoN+A5WqWQUwKWLyVq8wBeKsnWEnMH4k=;
X-UUID: 74d7de9c34224f4b9090752f88f3f86f-20210506
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 550839523; Thu, 06 May 2021 05:54:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 05:54:01 -0700
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 May 2021 20:53:59 +0800
Message-ID: <f3f5167f60b7897b952f5fff7bcaef976c3c6531.camel@mediatek.com>
Subject: Re: Re: Re: Re: [PATCH net-next 0/4] MT7530 interrupt support
From: Landen Chao <landen.chao@mediatek.com>
To: DENG Qingfang <dqfext@gmail.com>
CC: Andrew Lunn <andrew@lunn.ch>, Frank Wunderlich <frank-w@public-files.de>, 
 David Miller <davem@davemloft.net>, "Florian Fainelli"
 <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Jakub
 Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>, Sean Wang
 <sean.wang@mediatek.com>, "Vivien Didelot" <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sergio Paracuellos
 <sergio.paracuellos@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, <linux-staging@lists.linux.dev>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Weijie Gao
 <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 =?ISO-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>, Thomas Gleixner
 <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Date: Thu, 6 May 2021 20:54:00 +0800
In-Reply-To: <CALW65ja5mRPoNM2EZsONMh8Kda5OgQg79R=Xp71CaQcp4cprnQ@mail.gmail.com>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429.170815.956010543291313915.davem@davemloft.net>
 <20210430023839.246447-1-dqfext@gmail.com> <YIv28APpOP9tnuO+@lunn.ch>
 <trinity-843c99ce-952a-434e-95e4-4ece3ba6b9bd-1619786236765@3c-app-gmx-bap03>
 <YIv7w8Wy81fmU5A+@lunn.ch>
 <trinity-611ff023-c337-4148-a215-98fd5604eac2-1619787382934@3c-app-gmx-bap03>
 <YIwCliT5NZT713WD@lunn.ch>
 <trinity-c45bbeec-5b7c-43a2-8e86-7cb22ad61558-1619794787680@3c-app-gmx-bap03>
 <YIwxpYD1jnFMPQz+@lunn.ch>
 <fc962daf8b7babc22b043b2b0878a206780b55f3.camel@mediatek.com>
 <CALW65ja5mRPoNM2EZsONMh8Kda5OgQg79R=Xp71CaQcp4cprnQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_055415_899963_10C5E923 
X-CRM114-Status: GOOD (  12.31  )
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

On Wed, 2021-05-05 at 17:43 +0800, DENG Qingfang wrote:
> On Wed, May 5, 2021 at 5:31 PM Landen Chao <landen.chao@mediatek.com>
> wrote:
> > How about using mediatek-ge.ko. 'ge' is the abbreviation of gigabit
> > Ethernet. Most mediatek products use the same gigabit Ethernet phy.
> 
> Well, MT7620's PHY is FE..
MT7620's FE PHY HW is different from MT753x's GE PHY. Vendor registers
of these two PHY are totally different.
However, MT7620 internal switch MAC is quite the same as MT753x's MAC
except for VLAN table and other minor changes. The MAC part can be
reused. 

> 
> > 
> > Landen
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
