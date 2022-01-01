Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BE5C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Jan 2022 17:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlBXLX9NqVXB10r6vl++bsnbS7hDY/Pf03/beI0ppvw=; b=napa+WyTEjIPUK
	xnuQHE1hRSMPL0BDWDAzgRLduIw2LvmiY4yJxqPFokDadqbNVONwVRBBaW6J/AOR6upreUG8pATwN
	da8fq6EKv9fe1AaRqne8t1xo9FBi7ao1Zt5iUWsasv55/3+Kz2ctIzjXBR/UPdz55RUc0m/diCxhf
	FrFtBqQZ/eDWsWN6ykkZmOwwqqNA3Ak8aqiHVLWiAtJWR+esQG5wvFsGS394lELPJEXWvB9HVB3LA
	aS2Dlq4uyPhraVH35xrVmWIfpowjJ0YPD3UOwWdeh6HUIueDX4NRm8Dpffkyv+dijCrB8sH8n8PRH
	NbNpgig5OkPomgHUcJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3i27-007Eo3-Ay; Sat, 01 Jan 2022 17:19:07 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3i22-007Emg-IM; Sat, 01 Jan 2022 17:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Glzfb7MgntJxbNhtUxxxU3aIqwDb8w14BI96IUbcxeM=; b=zvXZRWQ358/bOf3v5c2rlUuPjb
 NGBpgZyjS9YV7Dh2gF7ZZPyhp607/H4QssBixqnRgqmS6NeA70z4LOeI8euZcNcJTcQkZMJgrfmTn
 LxtI95n8A+4EAiSDsVEqm6SBaIfCI7B/Xha+VSLJWUoogEHBjhtb0xe0is/E4R2kYx5o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1n3i1u-000H5Z-Cp; Sat, 01 Jan 2022 18:18:54 +0100
Date: Sat, 1 Jan 2022 18:18:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Michael Lee <igvtee@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v9 1/3] net: mdio: add helpers to extract clause 45 regad
 and devad fields
Message-ID: <YdCM/mbeT66asmj7@lunn.ch>
References: <Ycr5Cna76eg2B0An@shell.armlinux.org.uk>
 <Yc9tk6IZ0ldqHx4Y@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yc9tk6IZ0ldqHx4Y@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220101_091902_634316_03FA0381 
X-CRM114-Status: UNSURE (   8.72  )
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

On Fri, Dec 31, 2021 at 08:52:35PM +0000, Russell King (Oracle) wrote:
> Add a couple of helpers and definitions to extract the clause 45 regad
> and devad fields from the regnum passed into MDIO drivers.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

This email has me confused. It seems to be coming directly from
Russell, but is part of a patchset? Then there is a second 1/3 later
in the patchset?

	 Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
