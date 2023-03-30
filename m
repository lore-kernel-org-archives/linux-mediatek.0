Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83D5C7619A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 21:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8pPf6J4tcqHifYVxGDDQBEBvwaXYKDumOp+Otq+uLw=; b=LtIPyGGNY98Imoh9j0i5AjCc6P
	IjJBYlmnCH40OTvwikAqHWxkO9YeeteDN3bhYIKGwF0yaO/kJooory8PdajtOE9THvLxOoPvFSMhC
	2MOJSErQoWm8zfRSg9QKdMXx4/WZsjUb/DSWtlBruoXGmzNvREhphMl1b/O38PhB7r0kTGRntkgS/
	oUG0KC2ZNMZkNuqJb817nH/Qz2xLVIpYY457OrLC4iJLTpEO1n04IW44fqXfJBf4jpZCOC5EH6E+n
	H27gkavo4OXNZxkhVqitTvzfFBwHIjulA9sBtH1ecdqs7VwT3ds98zKunn+otpmk9g//itASdktTK
	Z3iuizqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phzPH-0054bx-2s;
	Thu, 30 Mar 2023 21:02:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phzPG-0054bJ-0a;
	Thu, 30 Mar 2023 21:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=L8pPf6J4tcqHifYVxGDDQBEBvwaXYKDumOp+Otq+uLw=; b=tuojdmO2XR49ZlOXbRMF61nol7
	GlITRH8Vyv/YfccITNiEMsPPG8uE9m082XwBdAD6ubUfgFsjX1DHlelJ4nryca5ELA0ndOPXwuW0E
	hrtfiAZlfC2AU0vy08xiZ6ibSQmaq+7yCJEGjirQ43o1XffyCrxAYsPsvvPbkf8lu0m0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phzPE-008vyS-JR; Thu, 30 Mar 2023 23:02:00 +0200
Date: Thu, 30 Mar 2023 23:02:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?QXLEsW7DpyDDnG5hbA==?= <arinc.unal@arinc9.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Shih <Sam.Shih@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next 04/15] net: dsa: mt7530: use regmap to access
 switch register space
Message-ID: <0847f6b8-564e-4b7c-936f-e418aac22368@lunn.ch>
References: <cover.1680180959.git.daniel@makrotopia.org>
 <1763ab54a479458c4bb84342f32d4a2e379f1d26.1680180959.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1763ab54a479458c4bb84342f32d4a2e379f1d26.1680180959.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_140202_219787_7FA5806E 
X-CRM114-Status: UNSURE (   7.64  )
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

On Thu, Mar 30, 2023 at 04:20:57PM +0100, Daniel Golle wrote:
> Use regmap API to access the switch register space.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

