Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A468C0219D
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2025 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9KCq207AYFiKquz58kkroM53MgkDG0PAHpKTjgiJoU=; b=LpvD0z3ZMPdMbwGcuqOuoJAm5F
	TM8o0/X8HvdMM2UnrFjNn4o+epGIVYzXshGcyNW/GZvqClOh8EKirpUSOHbUPzVFB6klAWwg83H95
	A1idzLhC68vlAHtQqCT5/aFSoza1zSDBTsTZ3GMiQB7i02tmDwmGaPqxW40urjPimj/+L3DsZwCzn
	/zpKwFN6whSyiAYQ0igCqtKCOPos+ZZ0MjK4/4hf0OG/SOElkTMOV9xYVFHLaiGTdyXAKB77TY4nl
	i5W3V9NAexfYY/LZQrw9RM0OkjyHJ2xrZfq5OT6WtkBL+C320Afcn+hY/BZMF/bXGlImMjX9VADJb
	S7dpu8fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibUJ-0000000Bckd-2Bqi;
	Thu, 13 Feb 2025 15:50:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibFE-0000000BYmT-36zh;
	Thu, 13 Feb 2025 15:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=P9KCq207AYFiKquz58kkroM53MgkDG0PAHpKTjgiJoU=; b=htRqOzQHvtSCd7OSdJjBfJQwM+
	kU1/R0KuL0nmL6BhJ6EOWiRmsFxRZ8Ptt13b8iomO4q7VywBTYXh1goom0LH5I9UZLuBTCOb4gtFd
	NyC2+5mreJmgWNVU+YsR5uX/SRIrKj3bm2pD19BHnjVw1YykjnOhLtML/wAq5i+GUANM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tibEv-00DmDc-Mc; Thu, 13 Feb 2025 16:34:57 +0100
Date: Thu, 13 Feb 2025 16:34:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH net-next 1/3] net: phy: mediatek: Add token ring access
 helper functions in mtk-phy-lib
Message-ID: <81234e04-f37c-4b10-81e6-d8508c9fb487@lunn.ch>
References: <20250116012159.3816135-1-SkyLake.Huang@mediatek.com>
 <20250116012159.3816135-2-SkyLake.Huang@mediatek.com>
 <5546788b-606e-489b-bb1a-2a965e8b2874@lunn.ch>
 <385ba7224bbcc5ad9549b1dfb60ace63e80f2691.camel@mediatek.com>
 <64b70b2d-b9b6-4925-b3f6-f570ddb70e95@lunn.ch>
 <Z633GUUhyxinwWiP@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z633GUUhyxinwWiP@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_073516_788035_C8CB9812 
X-CRM114-Status: GOOD (  10.07  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> > > Those registers with Mrvl* prefix were originally designed for
> > > connection with certain Marvell devices. It's our DSP parameters.
> > 
> > Will this code work with real Marvell devices? Is this PHY actually
> > licensed from Marvell?
> 
> >From what I understood the tuning of those parameters is required
> to connect to a Marvell PHY link partner on the other end.

If so, the naming is bad. I assume you need the same settings for
Microchip, Atheros, Broadcom, etc. These settings just tune the
hardware to be standards conforming?

	Andrew


