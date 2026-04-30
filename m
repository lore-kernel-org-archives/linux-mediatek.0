Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1C0FF887E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2026 00:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2ry0U935a8I3q3XfQjQUSSNMEI0AxgGrv07wg6nKVY=; b=FKvEcYoNgrxvZPtjVL2blZelh8
	TMKsLgBOb36IIxkN31xJoT5ZlJIaBEmhGOfMaLaQtuv9tlsdvRD2st0a7NP2/4WXnXioLFEPr+brn
	1DbNKcM0c5BYdcn2XCMoOkjYon+HpkuRUxLLD1WkT5tk5okto2hB2dLSCndPV1qyt69kZlSee75mR
	mCTFY1URLMhlTlkipB+lN6jrdxTEnTXlQphAQT6SSjUL4su68Sr1LqUmYAQlOwATxnrrJ2h+c0f2G
	vRn/qSvOT39A6AZdwpsTEXZoVYz5qOIHqiUkwntXyI6X+Z8FD2bNb5lDUf0uHt/Prvcu8ec8Mpez3
	eyah5WEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIF1j-00000004KgI-0TV4;
	Thu, 30 Apr 2026 00:13:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIF1g-00000004Kfc-30pL;
	Thu, 30 Apr 2026 00:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=J2ry0U935a8I3q3XfQjQUSSNMEI0AxgGrv07wg6nKVY=; b=KJWUAyPAQWZB0kky33B6zNGF0S
	k37urVAle+ZHmV+kFU9r768+7cpcdanW2GHOptBCiw5++7XNvs5iwYeRjB0CiUk47ZZDYlVSkhAK1
	ED4HFLTpgI1/4ymFQmnirTXu5YTTxq7AgDmoHuA2Y5wPrXOj1XwcLFuAI9blhprja54k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wIF1L-000bDY-T5; Thu, 30 Apr 2026 02:12:47 +0200
Date: Thu, 30 Apr 2026 02:12:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jakub Kicinski <kuba@kernel.org>, chester.a.unal@arinc9.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
	ansuelsmth@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v4] net: dsa: mt7530: fix .get_stats64 sleeping in
 atomic context
Message-ID: <52d69a5d-a951-4a65-a947-7aaf41bc3daf@lunn.ch>
References: <16efd278e4f17776ccfbf8491e5be71a4689c137.1777385305.git.daniel@makrotopia.org>
 <20260429234612.2240476-2-kuba@kernel.org>
 <afKaVQ27GUQiWZTb@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afKaVQ27GUQiWZTb@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_171308_775522_7A6EFB04 
X-CRM114-Status: UNSURE (   7.85  )
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

> > The priv->bus pointer is initialized during probe. However,
> > INIT_DELAYED_WORK() is only called in mt753x_setup(), which might never
> > execute if the DSA tree remains incomplete.

The opposite of .setup() is .teardown(). So if the delayed work is
setup is setup() it should be cancelled in .teardown, to keeps things
symmetric.

	Andrew

