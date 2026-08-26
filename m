Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F12C61DBD
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2026 16:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9aTlTrAcUgjj4hArEoKoTq6w3fM8/pT6nYXJB7j/pgw=; b=N93r25QXU0Py+j0psjQApMgvBL
	lUsIBOzMRpdVQ5tbZsdiQS5EEX1sYc35ScTVxM16NbNfKWjvujK3kL02li2MoCajOVm3vtTXsfNq4
	wy1T2mGJRS1UIB5dK5Q5mDVm8d2prOm46kWipquW70DMv/VXdEx6KsgQDrBXx8OFm15Z/oAHgSzNC
	26kaXJaKmOUtDhsFO+ZY9LjTxpugoYKNJSZp0VVOkvcU8gs6mYgHdg4a71bJB0glytNEfF7WaTKiR
	Sq3FCk0x8AkRt4O8FRVEIz5BuMZUyYRwMSMIoyHX7afmUzGu8ARWksYktj0Dh+UH/ZbpSPR5mqGUN
	QwsekkgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzGpx-00000002mDH-0syw;
	Wed, 26 Aug 2026 16:50:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzGpu-00000002mCT-2Vol;
	Wed, 26 Aug 2026 16:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9aTlTrAcUgjj4hArEoKoTq6w3fM8/pT6nYXJB7j/pgw=; b=E04OWKcAdDOgNDJui/H80dCuBh
	YhIoevjc504XTOm2Vuj2a+wFt8AJ13fsca/VQ9N4Q23f14ScvB9noVZrb8A4nq3pKTXmKWo1CrhbJ
	SV4tF7XcHM9v3lbkJ6IkecOfjn+gnscIDKHa8aHSkqNFw8SyvkladDBdF+jGUba32blc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wzGpT-001Xv5-Fy; Wed, 26 Aug 2026 18:50:23 +0200
Date: Wed, 26 Aug 2026 18:50:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: ansuelsmth@gmail.com, netdev@vger.kernel.org, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, daniel@makrotopia.org,
	dqfext@gmail.com, SkyLake.Huang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: phy: mediatek: support EcoNet EN751221
 gbit SoC PHY
Message-ID: <25195db9-c15e-449d-b792-8f5a7c0aa371@lunn.ch>
References: <20260825193456.1823985-1-cjd@cjdns.fr>
 <20260825193456.1823985-4-cjd@cjdns.fr>
 <d7d86078-8a29-4e7f-a62e-91f6b266bea1@lunn.ch>
 <a75b6b15-f86b-4cb2-934c-87583b5bb02c@cjdns.fr>
 <4d594c62-2ceb-43c1-a3d2-731b80493787@lunn.ch>
 <cd7e6b13-a712-43ce-aae6-f45da2f77ba9@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd7e6b13-a712-43ce-aae6-f45da2f77ba9@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_095050_638722_D9BE876A 
X-CRM114-Status: GOOD (  11.89  )
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

> I tested my board removing the EEE disable and the MASTER line, and it seems
> to work. I can't get any CRC errors flooding the link, and MII_STAT1000
> reads LPA_1000LOCALRXOK | LPA_1000REMRXOK | LPA_1000FULL which suggests to
> me that it's able to operate happily in slave mode.
> 
> 
> So unless you or someone else thinks it's inadvisable, I'm inclined to just
> enable these things and then wait to see if anybody finds a board that has
> problems.

Master/slave should sort itself out, maybe taking a little longer if
there is an initial conflict. Where it can go wrong is when the random
number generator in the PHY always returns 42. Put the same PHY on the
other end and the election always fails.

EEE issues can be more subtle, it depends on what the link partner is.

But yes, we can start without these. But please mention this in the
commit message, just to give a hint to anybody who ends up trying to
debug in these areas.

      Andrew

