Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD45FCD8C89
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jun 2026 18:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKo7HGAbgsIDL31kPHzl3tZYuwTp1av9mowY1XXGB9k=; b=s0MGJ4dc58LIcunLFeQ6Vm6SFJ
	endlZreGeC3XIAhpAe3gXRTdcHYNU5F1ns5Fw34AtLT5kRQeGVI23e9owHGcoLl6wDtdkmw3NDqu5
	xEo+Jug67cEVeD9rAkHN2nBcErrRN519BNt0/ddHBHaUWEGb24tIv6965MrdEapuZ/BElANSI4YpS
	BqAxVaEsuBQxXM7AQXV/xPX789xtNEIyVxH+RbbSzitgIWmuuSLUAz0killudXVv54kbzegVOoH22
	LVTo+0lfyv0GdQcPKaUm4nFYBAzK0tcqif8NaCpTFKVCrBzgUMw+8squmIRRRFpXveSx4R2zfHqv/
	/Tsxrtqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWIYF-00000002QHz-2M0q;
	Sun, 07 Jun 2026 18:48:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWIYD-00000002QHT-1qzb;
	Sun, 07 Jun 2026 18:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EKo7HGAbgsIDL31kPHzl3tZYuwTp1av9mowY1XXGB9k=; b=0CnGAI4MBR4qwHMnl6f2tC5l0x
	hczLYBiRcqVZ82WBlypFVktHKhKO8lZAwNrnpFaAvK8zKDm3yqpBrED+lvyyFDEW3KKSsnYlY+Q06
	rjO8v+kQ4dt0RVX6jV5JlL1tvnemkQTxZTIK16BN1hhdNszNJOOd8pNDSg35p1vUTnlk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wWIY3-006UzT-3N; Sun, 07 Jun 2026 20:48:39 +0200
Date: Sun, 7 Jun 2026 20:48:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next v2] net: airoha: add ethtool priv_flags support
 for LAN/WAN and GDM2 loopback
Message-ID: <e8f3d24a-985b-4bde-9f51-2d5ae3d25b01@lunn.ch>
References: <20260607-airoha-ethtool-priv_flags-v2-1-742c7aa1e182@kernel.org>
 <33c3a87d-ad97-4f6a-8f76-ebab80c496ac@lunn.ch>
 <aiWzaV1f1Fpc2rhJ@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiWzaV1f1Fpc2rhJ@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_114849_480746_E1929B86 
X-CRM114-Status: GOOD (  14.17  )
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

On Sun, Jun 07, 2026 at 08:07:37PM +0200, Lorenzo Bianconi wrote:
> > > When a GDM3/GDM4 port is set to WAN mode, enable GDM2 loopback to
> > > support hardware QoS. Conversely, when switching back to LAN mode,
> > > disable the GDM2 loopback and restore the default forwarding
> > > configuration.
> > 
> > Why not just use the presence of an off loadable qdisc as the
> > indicator to change mode?
> 
> Hi Andrew,
> 
> Interesting, can you please provide more details about you mean?

You say you need it to be in loopback mode in order to support
hardware QoS. You configure QoS by using a qdisc, and something like
mqprio, tcf etc. So when the user configures QoS, you can see if the
hardware supports the request QoS. If so, swap to loopback mode and
offload the QoS function to the hardware. If the hardware does not
support the requested QoS, leave it in software and keep with LAN
mode.

	Andrew

