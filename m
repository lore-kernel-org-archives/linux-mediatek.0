Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D7AC001DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 18:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7EIIuZzsehMGN3s+UAQBvOzjEu52WA2JojWJigcSms=; b=D2A/BFl6SGhuUOhoMdiahA1P0z
	EyCvPDW2jJKF9RANcoOxK3PUAqk7F/h9Uo4bTSr2EsTwxfHuv+wNAi/PVSTmfZM44VfLRrTmiuU1z
	EqnmZnaLK5kPI+I76AxgUFg2dPlGut8mN0AtPTivJiIoexCZaakAUJnE0lxqJoD31gF+hsJu0efBF
	GCfJPuKcIoUtqNrxv6Qkji8LSiE0iI4Z3MX5cmtgig9s/C9XWF0YY29ceV8c93GRDzvD3vbi3J1hk
	vPBfJnvyUvwZNNlqpNH+lRTZKBvKBE4goaRRHZ6uRnog+ewwAfQzUJkBs36QaK5yfgkFX4Ie3iy4B
	OYfsc++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGHA-00Fa7C-0s;
	Sun, 13 Aug 2023 18:57:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGH6-00Fa6X-2j;
	Sun, 13 Aug 2023 18:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=W7EIIuZzsehMGN3s+UAQBvOzjEu52WA2JojWJigcSms=; b=Cal8smpornabFrJuyHgkGGOJE4
	xg/njPb8MnOs9kjEK5EWSUuF4AIA8ckEv6CaIT808qjZ51aSDnw/Hml0/31BHgPYIQZOlfW1T0eSr
	T+loO3q5MF4ckLFlNkWgHOAdpldZQJ2X1gpbseXtK4PkaCRzwV67HdJK84iV4ijs8DJQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qVGGr-003z6E-SR; Sun, 13 Aug 2023 20:57:01 +0200
Date: Sun, 13 Aug 2023 20:57:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2] net: phy: mediatek-ge-soc: support PHY LEDs
Message-ID: <8f20d427-91cc-4fbc-b263-dfc76df855f9@lunn.ch>
References: <32e534441225c62e3bf9384b797d9beda7475053.1691943605.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32e534441225c62e3bf9384b797d9beda7475053.1691943605.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_115716_964707_0E15D6D1 
X-CRM114-Status: UNSURE (   8.67  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Aug 13, 2023 at 05:24:55PM +0100, Daniel Golle wrote:
> Implement netdev trigger and primitive bliking offloading as well as
> simple set_brigthness function for both PHY LEDs of the in-SoC PHYs
> found in MT7981 and MT7988.
> 
> For MT7988, read boottrap register and apply LED polarities accordingly

Should this be bootstrap? With an S? boottrap appears quite often in
the code, so maybe the datasheet does say boottrap?

    Andrew

