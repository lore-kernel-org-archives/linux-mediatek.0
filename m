Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1133CC3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 21:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFlWZr/3GSv6UNa3e+pnVauRFHu2wIknT2EwJaX3G6U=; b=R2nPsCaRXD4lJ9FhSVpbLtvEHp
	8B7CWTxkzFiqS3hf0xRw3j5987Q4bYkp90UNdmUxCBJjbgotNAKK1DbEjr3u3TNV8H7dELYBsQVUZ
	KVfuqmer45ObzWPTS01SSpreX3fuxvqWk8O4M5lrhqCUyJDHZoxg6CPuus97YLydLIdodBrlt/MZl
	mfs0WhRd3X8lDstITH4AMAWX4n6zHa7zcL2e8XXAk/Eqjz2EVm1BUXJ7zWoo/4zIwXctKNzmyWTzT
	gHO6cD7EVhjG1JKkXOsAMQhkQeuFLAl8U9EkmDubYZyHlxcqRt4eWWvZ9lWn38tQSEtGtDNuveutH
	dwQ+TGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWNML-0000000Dbof-3m78;
	Tue, 23 Jul 2024 21:47:49 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWNLu-0000000DbfE-33dY;
	Tue, 23 Jul 2024 21:47:24 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sWNLh-000000004Ah-3eHt;
	Tue, 23 Jul 2024 21:47:09 +0000
Date: Tue, 23 Jul 2024 22:47:00 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: drop clocks unused by
 Ethernet driver
Message-ID: <ZqAk1NW4_E9SRjUO@makrotopia.org>
References: <38559102c729a811dc8a85f6c7cee07228cffd3e.1721739769.git.daniel@makrotopia.org>
 <125775a6-42f2-4294-9593-518ad6c852f7@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <125775a6-42f2-4294-9593-518ad6c852f7@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_144722_791241_823B1A59 
X-CRM114-Status: GOOD (  18.28  )
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

Hi Andrew,

On Tue, Jul 23, 2024 at 08:35:16PM +0200, Andrew Lunn wrote:
> On Tue, Jul 23, 2024 at 02:04:02PM +0100, Daniel Golle wrote:
> > Clocks for SerDes and PHY are going to be handled by standalone drivers
> > for each of those hardware components. Drop them from the Ethernet driver.
> 
> Please could you explain in more details how this does not break
> backwards compatibility. Should there also be a depends on, to ensure
> the new driver is loaded? Will old DT blobs still work?

At this stage the Ethernet driver only supports the first MAC which
is hard-wired to the built-in DSA switch.
The clocks which are being removed for this patch are responsible for
the for the SerDes PCS and PHYs used for the 2nd and 3rd MAC which
are anyway not yet supported.

Those clocks are basically a left-over from the implementation found in
MediaTek's SDK which does all that inside the Ethernet driver and using
lots of syscon regmaps to access the various parts of the SoC.

This has been deemed unsuitable for inclusion in upstream Linux[1] and I
was asked to implement standalone PHY, CLK and PCS drivers instead,
which is obviously more clean and also results in the device tree being
more understandable.

By now, a CLK driver and a PHY driver (PHY as in drivers/phy, not
drivers/net/phy) has landed in upstream Linux([2], [3]), I'm currently
finalizing the PCS drivers which are going to be in charge of handling
the clocks which are now going to be removed from the Ethernet driver.

tl;dr: The clocks were added by mistake and features of the SoC using
them are up to now unsupported by vanilla Linux.

[1]: https://patchwork.kernel.org/comment/25517462/

[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4b4719437d85f0173d344f2c76fa1a5b7f7d184b

[3]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ac4aa9dbc702329c447d968325b055af84ae1b59

