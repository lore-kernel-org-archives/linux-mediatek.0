Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1F7C7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 00:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcLipFI9l2dcvpk4UR/OvX7URY66r8z0RDWBBZZI3BE=; b=1OKXC1GZkpIYmbbvTYpA6WU8tU
	oK7kQAG4qHR8IxviJC+m0lCGVO3hFNZTVt+opvSxB4976UrtctvLoqYFxp5t6ub+whWH6SrFZmI8d
	r5ioDu5tLW8IYQ758hbNsf1Gy+qZLh/njU8+bZiyRtuxzrAsRg4FVx1QLBApWdyZZd2FUlInxcynX
	XR34Fkhpmg+cdnuakFVkal/W167bkWqUPiKuIHK0WyC2SdrVXDjh1glk4ht7dEEp4G0UawcGXp9Ce
	JyVtUmedvSHexqjuQWZbktYReFS0+oJO9y0aA1GLNG43id0r5f1qG5341g7ZQJyRbC7y336S6xUTY
	+LKtDiiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwuAS-007KmV-1S;
	Thu, 11 May 2023 00:28:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwuAP-007Kle-2Q;
	Thu, 11 May 2023 00:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tcLipFI9l2dcvpk4UR/OvX7URY66r8z0RDWBBZZI3BE=; b=0N0j6XxO3sdBOByU603/1de0hj
	/3hAgqsZZ3F3RPMO2svK5cPiOmcQq6mrUZFp5d+0oCVrYwV4e67vqCE1jGYcreFAwDDXxQzjpUdt5
	OMv0rgJ8WMDZLY335P/kWuyBEKmtL9xTba9nuR4dP4wYYgp2DQiqXxi8VQbXS/cw8vvk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pwuAJ-00CUqP-8i; Thu, 11 May 2023 02:28:15 +0200
Date: Thu, 11 May 2023 02:28:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next 0/8] Improvements for RealTek 2.5G Ethernet PHYs
Message-ID: <55c11fd9-54cf-4460-a10c-52ff62b46a4c@lunn.ch>
References: <cover.1683756691.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683756691.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_172821_815050_F0943088 
X-CRM114-Status: GOOD (  10.89  )
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

On Thu, May 11, 2023 at 12:53:22AM +0200, Daniel Golle wrote:
> Improve support for RealTek 2.5G Ethernet PHYs (RTL822x series).
> The PHYs can operate with Clause-22 and Clause-45 MDIO.
> 
> When using Clause-45 it is desireable to avoid rate-adapter mode and
> rather have the MAC interface mode follow the PHY speed. The PHYs
> support 2500Base-X for 2500M, and Cisco SGMII for 1000M/100M/10M.

I don't see what clause-45 has to do with this. The driver knows that
both C22 and C45 addresses spaces exists in the hardware. It can do
reads/writes on both. If the bus master does not support C45, C45 over
C22 will be performed by the core.

    Andrew

