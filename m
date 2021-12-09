Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDA3C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 15:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BtSnbrzXXiRHhAGJjSFR2oO8JT/nW6/SIt1U3QMjx8=; b=q2JJPalfbQrDfI
	BO2WkkJYZUsKtSKHL0oKUKCZ4iWv6aniUnNHzKJDW2TbPcI+8CHRvVhp37DObfkWiTKJTNf3NaAuv
	LMDijXuYtM6fmGaX7VwFuehIIzvr7Jiqf9/VQB5S68qu1v9fIS1q9Y+IvR22dqcw+duIF9JNZ2NlN
	fFz/JWSVeKdepDLDdpMWqnXTfjxVVmgxsKnEDAfLvBs28RPhKamgH+ZO40PB++W1np9LWHyRoCR6i
	FkShbyd95zn0qhdOqk3VaPV2BKm79sk3DqkN23FEIMPP80Z4qThqjZ70oV1PgHPykGrZYqDJpUhZO
	GBuAyqv9/6UiRdqUrfsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvLPc-00GYDk-51; Thu, 09 Dec 2021 15:32:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvLPO-00GY8f-B3; Thu, 09 Dec 2021 15:32:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 45DC8CE2693;
 Thu,  9 Dec 2021 15:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5DDC004DD;
 Thu,  9 Dec 2021 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639063950;
 bh=la12TSxubwsMjMW6B0h+IfDSevd6t2JnN5OS4hUx7zA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eFIKx8E4r2aTBbOj7eDD2Fk3I4FGm/eIITsojcrdFS0SsKOjT7kHFiFXbhwcUN/Wm
 /uAJLQDNwiESqDqcRSAhcEvzhcsjVEBkpMcLJYE388bch+jC75lNQYw6uuEr2mIxqK
 zzZsmT4u+FqspCV3ILuim/uCvAmcqX6LKlkjzkVP/aF1Bzcl1SftGlzuNg4X/kRP3C
 Y6oebIy2v6/tF4Bcif4iSKSBE9vNKxwMrPeji7DbtXMZlhvey5u+23nMAKWx17BqSI
 yWzMsrw2Ogw3J6a0R5e6dw9lePIsznXLy9IRKDTbCqrL0Pn+ehrNC7viaJNA6ei+cU
 8doWdAERD3YmA==
Date: Thu, 9 Dec 2021 07:32:28 -0800
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
Message-ID: <20211209073228.06171d9a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <YbIhOikjMwZ8aQlS@shell.armlinux.org.uk>
References: <DGaGmGgWrlVkW@shell.armlinux.org.uk>
 <E1mucmf-00EyCl-KA@rmk-PC.armlinux.org.uk>
 <YbIBT7/6b0evemPB@shell.armlinux.org.uk>
 <20211209072018.6f0413ed@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <YbIhOikjMwZ8aQlS@shell.armlinux.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_073234_594112_AD5BD322 
X-CRM114-Status: GOOD (  14.19  )
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

On Thu, 9 Dec 2021 15:31:06 +0000 Russell King (Oracle) wrote:
> On Thu, Dec 09, 2021 at 07:20:18AM -0800, Jakub Kicinski wrote:
> > On Thu, 9 Dec 2021 13:14:55 +0000 Russell King (Oracle) wrote:  
> > > This series was incorrectly threaded to its cover letter; the patches
> > > have now been re-sent with the correct message-ID for their cover
> > > letter. Sadly, this mistake was not obvious until I looked at patchwork
> > > to work out why they haven't been applied yet.  
> > 
> > Hm, I think they were showing up fine in patchwork, I just didn't 
> > get to them, yet. I'll apply as soon as I'm done with the weekly PR.  
> 
> Yes, they're in patchwork, but patchwork is saying "no cover letter" for
> them, which is what alerted me to the problem. E.g.
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/E1mucmu-00EyD4-Vy@rmk-PC.armlinux.org.uk/
> 
>               Context              Check              Description
> ...
>    netdev/cover_letter            warning Series does not have a cover letter

Oh, that, you're right.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
