Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D01C77B61
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q02vEpE9IanvR7N3TS+xOq3YegyHFecQ5XDPoym/Loc=; b=vTiotOoR5mmnAbdGe5FoZmIwRj
	TIGMQTGK6vxPFfnjKJHQv669s1XSBTBRcD84fC53Tj8r4xSPbsenG4CeNF51f3qhIUryN7XYYlAeK
	DBub274nC/Ah/8lN3B/myZr37QB3vRURpRwfSeu7zVifWj+vyojr6WfDEuqdHaxWSC+yJMX0Pe5sB
	651GiuqE4BlraDYxnhBgL9cB/B8vthE1sJKhuovZwDHZHZnTbhTA//k/OiWC4wonx5Azlcb1ynhEl
	55eSQrgKTJZQaSlHIBL1g+fk2QwzcdEqAySRjLDVgkMShnBQEmj6LFZ5FaxPCw6JqJ0Hvo7fKi3yL
	arzKqNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYdf-0015lK-0E;
	Wed, 29 Mar 2023 16:27:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYdc-0015kR-2j;
	Wed, 29 Mar 2023 16:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Q02vEpE9IanvR7N3TS+xOq3YegyHFecQ5XDPoym/Loc=; b=h74855VIrQBAeKyzlHsW0m3wu+
	lIlU++Cr+xfUPWGhQS98kmqJcM+1otMPnRpKcb0OCcSAT3J81JA9Bnf2np1cYcbt7ddXTDWroEirj
	VgQRYyMLuwzWE5X1fT5Gj1KfUiLogO6ZFIk5pLjFCYGfBNYBfxOokdaSRIf11NSuxipo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phYdb-008mUE-3Y; Wed, 29 Mar 2023 18:27:03 +0200
Date: Wed, 29 Mar 2023 18:27:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
Subject: Re: [RFC PATCH net-next v3 05/15] net: dsa: mt7530: introduce mutex
 helpers
Message-ID: <468587cd-c667-445a-b518-fc2db83ba527@lunn.ch>
References: <cover.1680105013.git.daniel@makrotopia.org>
 <118badcdd9741d21e3d367e10c34a2d66ae04f59.1680105013.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <118badcdd9741d21e3d367e10c34a2d66ae04f59.1680105013.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_092704_879293_505FFBB1 
X-CRM114-Status: UNSURE (   9.66  )
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

On Wed, Mar 29, 2023 at 04:58:22PM +0100, Daniel Golle wrote:
> As the MDIO bus lock only needs to be involved if actually operating
> on an MDIO-connected switch we will need to skip locking for built-in
> switches which are accessed via MMIO.
> Create helper functions which simplify that upcoming change.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

