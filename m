Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A70C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Jan 2022 17:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q03acCTLe0mijtCm1xawTYzBw43l++mLVO2DzahWQyE=; b=tmHxKTGRoZGYI6
	DcRYuRqoniZdKbAxvtnqiD2rjJ1K0bHULUAsVnRAO9maKupGO399+K1vAcSOKI3uHH8FbrSrEptjk
	z1hY+fEtwS1hw09GXZ5yMJQvkuUNRKP1HBemVUop+7ZVJvJj6Vv5VSg7FnWRIHrWT+LNOtm63YhXS
	9IP8ne6oMwp1clxjPhUlY30B1i+tYXqVkw7kXQpWpK1wsXrIIJXlMB2gTbvrvJuhPjPi0MH/vqF8a
	RGYDhccM8v11uSHarOO8GolO9ZL/C3tgZyTJ5npVQtSZcII6le15gwCoP6hZ/kdtt1HqBzI09o8J7
	BtkVpWonub04D7MEA3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3i3g-007F7z-2y; Sat, 01 Jan 2022 17:20:44 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3i3d-007F74-EH; Sat, 01 Jan 2022 17:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=nzZC+21A+9JGb98AGvNNwxugjcKYoFPrsOvnup449Qc=; b=bPdQrJFfaTxM9bn2AmvPQA5fMK
 Pte7rnrA+hEYhD1C20Ia4vpDn8rsXnker1jYTo49HNtRq0/fIPUH7bylBrv2D7IQbJfkB2om0DJDy
 EIXsNSYdp6x9WathgteWzYNTRE6WxeOSwwT9bPYb4JGeShXOt7aJfGX4xOgHl6XpUKd4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1n3i3a-000H6J-1F; Sat, 01 Jan 2022 18:20:38 +0100
Date: Sat, 1 Jan 2022 18:20:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
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
Message-ID: <YdCNZh5PsBwbfMtp@lunn.ch>
References: <Ycr5Cna76eg2B0An@shell.armlinux.org.uk>
 <Yc9uphz7RGb63kzM@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yc9uphz7RGb63kzM@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220101_092041_509158_7881B2F7 
X-CRM114-Status: UNSURE (   9.76  )
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

On Fri, Dec 31, 2021 at 08:57:43PM +0000, Daniel Golle wrote:
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> 
> Add a couple of helpers and definitions to extract the clause 45 regad
> and devad fields from the regnum passed into MDIO drivers.
> 
> Tested-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Hi Daniel

Since you are submitted this, your Signed-off-by: needs to be last.

      Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
