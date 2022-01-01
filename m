Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1B4C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Jan 2022 17:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQd+LvjptqRbxFl1NfeVS9rDOQZI5bxUBEkybjAfpf0=; b=a6gr8rz8wtT7ox
	uytcvmVTSks4Pw59o2X620yHcmHiRW7C314lVxyjGwV2IldzeRgAr+001DEDKWW5rkEp/SBqnJHBN
	imLvdHkyeFvHl9HPxY1kmtA+rInZMBUsYdqtIDySSZOf4p6zTcMaLQC6D1b5SYhqOqB3ifd56dTBn
	08yX0Kk4OSm7dkehOYDNm+AVOzLMDt7peygYBYRYKz4IwJzNq2Q63ZiHgZyuiIJwPqiY8vkGXxKMX
	yWWAFGHjy1bW4PdEfBgnkCncWqUhWBSA3UahjcaMbCigI8v3AXEbvRHeTBd0RAYQo6KSKE47JD9Qx
	NZ5/cOGhiWPZ+sTDuioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3iNg-007GyV-IJ; Sat, 01 Jan 2022 17:41:24 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3iNe-007Gy5-56; Sat, 01 Jan 2022 17:41:23 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1n3iNV-0007Lq-3h; Sat, 01 Jan 2022 18:41:13 +0100
Date: Sat, 1 Jan 2022 17:41:07 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Michael Lee <igvtee@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v9 1/3] net: mdio: add helpers to extract clause 45 regad
 and devad fields
Message-ID: <YdCSM7DiJ+vvfmji@makrotopia.org>
References: <Ycr5Cna76eg2B0An@shell.armlinux.org.uk>
 <Yc9tk6IZ0ldqHx4Y@makrotopia.org> <YdCM/mbeT66asmj7@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YdCM/mbeT66asmj7@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220101_094122_217172_377E2468 
X-CRM114-Status: GOOD (  13.22  )
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

On Sat, Jan 01, 2022 at 06:18:54PM +0100, Andrew Lunn wrote:
> On Fri, Dec 31, 2021 at 08:52:35PM +0000, Russell King (Oracle) wrote:
> > Add a couple of helpers and definitions to extract the clause 45 regad
> > and devad fields from the regnum passed into MDIO drivers.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> This email has me confused. It seems to be coming directly from
> Russell, but is part of a patchset? Then there is a second 1/3 later
> in the patchset?

That happened by accident when using git-send-email and hence the
first time it was sent with Russell's From: in the RFC822 headers it
was (rightly) rejected.
I noticed that shortly after and resend the patch with my sender
address set as From: in the RFC822 headers and Russell's From: in the
mail body for only git, and not mailservers, to care about.

Sorry for that additional noise.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
