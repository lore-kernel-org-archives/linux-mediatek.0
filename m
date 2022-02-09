Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC84AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEI6J4ADqMIBQzHvxncCe7yOZV2cOyzqBHyGhzmilTQ=; b=Pq4epm2ThJTFfH
	y/sFk/NVLhaV2im+tA8vnfu0xaFp2hz39jOfqlYVmqeEGiK0+6YJuFJB7LDPmV7z+L8aIifFgmB38
	70uFlVptqf9uzaTPyA6XJUgUOA+LCx6oqVLGWwsAYSBy5Sm3N6Tcz4EOXlHwtAUQZ7pnQ/Tdekgyy
	Ml0nfzf0ErPDrvfgVwB6rWix+MCJ+9jy9WQH/a0O/8NCfOnqHCuByuvf6mjthPbr7fytqUT6LZgo6
	NQ8hs+LuwXUNyzskLMqRGz2jGvbG+5+jEXgpsPTAXpwoYUGFDIZk2d6Avac6QZ62BUgz4l8ytOdXy
	UY59K1xnILqJ+ZFY6Wfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHr0a-000z0I-14; Wed, 09 Feb 2022 17:44:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHr0U-000yzk-3V; Wed, 09 Feb 2022 17:43:58 +0000
X-UUID: 9c74337c37924a86b988e3072f0cbbd7-20220209
X-UUID: 9c74337c37924a86b988e3072f0cbbd7-20220209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1517816110; Wed, 09 Feb 2022 10:43:49 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Feb 2022 09:33:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 10 Feb 2022 01:33:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Feb 2022 01:33:34 +0800
Message-ID: <48d2d967a625c65308bff7bad03ae49779986549.camel@mediatek.com>
Subject: Re: [PATCH RFC net-next 0/7] net: dsa: mt7530: updates for phylink
 changes
From: Landen Chao <landen.chao@mediatek.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, DENG Qingfang
 <dqfext@gmail.com>, Sean Wang <Sean.Wang@mediatek.com>
CC: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>
Date: Thu, 10 Feb 2022 01:33:34 +0800
In-Reply-To: <YgO8WMjc77BsOLtD@shell.armlinux.org.uk>
References: <YfwRN2ObqFbrw/fF@shell.armlinux.org.uk>
 <YgO8WMjc77BsOLtD@shell.armlinux.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_094354_179386_E37A3F3A 
X-CRM114-Status: GOOD (  22.20  )
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

On Wed, 2022-02-09 at 21:06 +0800, Russell King (Oracle) wrote:
> On Thu, Feb 03, 2022 at 05:30:31PM +0000, Russell King (Oracle)
> wrote:
> > Hi,
> > 
> > This series is a partial conversion of the mt7530 DSA driver to the
> > modern phylink infrastructure. This driver has some exceptional
> > cases
> > which prevent - at the moment - its full conversion (particularly
> > with
> > the Autoneg bit) to using phylink_generic_validate().
> > 
> > What stands in the way is this if() condition in
> > mt753x_phylink_validate():
> > 
> > 	if (state->interface != PHY_INTERFACE_MODE_TRGMII ||
> > 	    !phy_interface_mode_is_8023z(state->interface)) {
> > 
> > reduces to being always true. I highlight this here for the
> > attention
> > of the driver maintainers.
Hi Russel,

The above behaviour is really a bug. "&&" should be used to prevent
setting MAC_10, MAC_100 and Antoneg capability in particular interface
mode in original code. However, these capability depend on the link
partner of the MAC, such as Ethernet phy. It's okay to keep setting
them.

Thanks for this series.

> 
> I'm intending to submit this series later today, preserving the above
> behaviour, as I like to keep drivers bug-for-bug compatible, with the
> assumption that they've been tested as working, even if the code
> looks
> wrong. However, it would be good if this point could be addressed.
> Thanks.
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
