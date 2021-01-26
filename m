Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA38C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 02:33:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE2FE22EBD
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 02:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE2FE22EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rKoITctY7JAyozufr8RYY3r4/BrIQBW/rJtUaGmsSG0=; b=trSd13O567cdBthBy5LPFfTjO
	b967SHjBvy5YYhGAYfKOfayYK1twSj6jbgmlMu1edt7wRf18oQGNnNPDaJfOYCbNyt2IrxDTqcW2X
	AZkZyHMM5d4fX2k4f75OMI/UNq53U7+erOaoCMcSzWmZV+Ub1CWrO8QMlTBIWvC137a0sjJqOYDlT
	Rg9QIx+wd/XvILEwRYoKQZ62+IYvB5cWXJfEXltBbI2vvII5FbWJx3LbAGfy22IYByPFrKwP/k9q6
	XXRUmH1yki7BSH7L4/8CCNgApOv6+S0bXoPA/xc31wQoX1KZPVfJ2gkiIay6Jgo2mayzoeMbBc8xJ
	Ccwxb8Otg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4EAn-0005FK-Gp; Tue, 26 Jan 2021 02:33:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4EAi-0005EW-I0; Tue, 26 Jan 2021 02:33:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2368522E03;
 Tue, 26 Jan 2021 02:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611628415;
 bh=CXSDmasxYWoFE33utykb2dQIYbJuGpoyGl2Cl9gp4Uo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZAUeJ0v1ugUS/fH6cXmUKDukqYBofneog+ZPN2jI2C+TiCICvl40Si+V61jGJLgaT
 kKh40TW8UP6Mfy7Gtx3yXSJUR04OYenEKkOe7Wicl7MzB9ONv8d9vKHjLd3eDjO3/E
 OISnHJX5nb70f8SQtLYqCYuSDQe7hLO/Ki5rM8qU7tfgNKDNbZ9E2R76AVnE+33IbC
 OrodICqTBXi5iKAW7I0e9Nrgy9Uxi0BMsnCxLz9PvTjEegYAESopf3PXIWacws0RkC
 zveeBIak+CSkQzBE39JcpNeMBflKnrujy8QnlI9h/q6Uy6E52NVPrNpqPHi5SD+/o+
 KNxjzDKgJCYLg==
Date: Mon, 25 Jan 2021 18:33:34 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH net-next v2] net: ethernet: mediatek: support setting MTU
Message-ID: <20210125183334.7ad8ca00@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <YA7BERdgmzKcAYus@lunn.ch>
References: <20210125042046.5599-1-dqfext@gmail.com> <YA7BERdgmzKcAYus@lunn.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_213336_679943_D90E6A05 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 =?UTF-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 25 Jan 2021 14:01:05 +0100 Andrew Lunn wrote:
> On Mon, Jan 25, 2021 at 12:20:46PM +0800, DENG Qingfang wrote:
> > MT762x HW, except for MT7628, supports frame length up to 2048
> > (maximum length on GDM), so allow setting MTU up to 2030.
> > 
> > Also set the default frame length to the hardware default 1518.
> > 
> > Signed-off-by: DENG Qingfang <dqfext@gmail.com>  
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
