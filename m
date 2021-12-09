Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE272C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Txqha1zQxBxYs/QGXKKi9mThqItgOyAoGY+HDbYIeq4=; b=Dzw2Uzl8gpOPmq
	Gb5svo55olZRrSmxlNkFFXK+T3CCZyB6itmP//TY2Kv2XbaT+RJ7RwANPogbTj+p/W4xawRUNXl96
	r61JY5Nqs38EZBES5zd3QMIfvyicrgxJ1rQ183EAMudCiD5jQnxLQ4JeLB1AQ8wIPejapjPm2deBT
	8K/9YKmj9TH2gG6ROGglvJye98Whj8FdAYKI3uLwUEI8Ob1r2fV2uwqJi57w7slcKKCp9Q6vtpWLY
	qjFZ6wrjnGjn4ngbmdZufMciR3EOaOFNYAzxj9RBLO15bazqZ7/5l0cJu6mWqYgHbGCLsZGIXEv0a
	WHnGXq0awsjqTg1+GETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvLDn-00GV4Z-VR; Thu, 09 Dec 2021 15:20:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvLDb-00GV1D-6B; Thu, 09 Dec 2021 15:20:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5B6D5CE261B;
 Thu,  9 Dec 2021 15:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DAF6C004DD;
 Thu,  9 Dec 2021 15:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639063219;
 bh=G3CzW9YqMDQ85hcLBMmtpdLygjuszqwcoSMdVLvx2XE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lEwdULs5lXfMxQLZ66fWp5tq+My2tvHGY7a2eXdk1sFJnHVfTSqtstDClOAuEasGE
 42E5sgO9u6V+jQ6tI0+MElCjL+appzKwnv34mP3gw3oC4f9c2vAlLUJGn9IYXluLsk
 HC+5PEQ0bfAYc6zkNQf22BA7q7HVURwGna6yeLNndRZ8sEazr8DOOAv8Hy1flCdW1W
 vzT6xCxxaRR81G5jOkQg7dy5s16K2Hy93eMaLy0hKyVrDrv2YiK97CRPmR/g9loFIx
 LET5f/uDOX8IOf8Z0hdq1FYIerjnKTrhVI7n24l38Pkyz6X3V7Cm7upBrfTq8m9P0n
 lqS7Ub5bliEUQ==
Date: Thu, 9 Dec 2021 07:20:18 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Vivien
 Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next 1/5] net: phylink: add legacy_pre_march2020
 indicator
Message-ID: <20211209072018.6f0413ed@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <YbIBT7/6b0evemPB@shell.armlinux.org.uk>
References: <DGaGmGgWrlVkW@shell.armlinux.org.uk>
 <E1mucmf-00EyCl-KA@rmk-PC.armlinux.org.uk>
 <YbIBT7/6b0evemPB@shell.armlinux.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_072023_468390_BFF56F57 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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

On Thu, 9 Dec 2021 13:14:55 +0000 Russell King (Oracle) wrote:
> This series was incorrectly threaded to its cover letter; the patches
> have now been re-sent with the correct message-ID for their cover
> letter. Sadly, this mistake was not obvious until I looked at patchwork
> to work out why they haven't been applied yet.

Hm, I think they were showing up fine in patchwork, I just didn't 
get to them, yet. I'll apply as soon as I'm done with the weekly PR.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
