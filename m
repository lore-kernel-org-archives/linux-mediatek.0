Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF82C3DA61
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 10:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHwNPPdK86fqhNLiOvLIWgtJokuWt8JtPNTnW+22jxE=; b=ppiI2LJgxaah10b8xsXbzRrOat
	vwiMxUsI+69HA7AQhZe0j9qFr64RZA6jubIOfv2QJrUpQJVe3pL1fewOA9HLC4Bub8pplWH+ST+I9
	ZWXgzqSXylQQoDH1jFy3ZGJXN7721m9O9w0lWq5PKG/bbyZu8p7fsP2PVunWIbe2P8IV0qXYvmEiR
	99sKyd1O5yGZmspPjiSqG52PqIABhI/6CYzeoHWEqbHEdVIrLYzo9cIlieNz0FRB04J28B4A5sJNt
	1Zi6etFIxaGVcQzgGpxbryp3/nBISbs+Z2iT5TqJ0stCKug5bbbtaLEhP/ZEgqRi2pineo9kj9VWz
	7ApaMvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYk0U-0000000Ehrh-3mdL;
	Tue, 30 Jul 2024 10:23:03 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYjzs-0000000EhkS-3h4f;
	Tue, 30 Jul 2024 10:22:35 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sYjzi-000000000f5-09Ad;
	Tue, 30 Jul 2024 10:22:14 +0000
Date: Tue, 30 Jul 2024 11:22:06 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2] net: ethernet: mtk_eth_soc: drop clocks unused by
 Ethernet driver
Message-ID: <Zqi-zr32ZXl0AyzR@makrotopia.org>
References: <5f7fc409ecae7794e4f09d90437db1dd9e4e7132.1722207277.git.daniel@makrotopia.org>
 <20240729190634.33c50e2a@kernel.org>
 <738f69e6-1e8d-4acc-adfa-9592505723fe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <738f69e6-1e8d-4acc-adfa-9592505723fe@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_032224_941892_9EFE8564 
X-CRM114-Status: GOOD (  16.32  )
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

On Tue, Jul 30, 2024 at 10:53:19AM +0200, Paolo Abeni wrote:
> On 7/30/24 04:06, Jakub Kicinski wrote:
> > On Mon, 29 Jul 2024 00:00:23 +0100 Daniel Golle wrote:
> > > Clocks for SerDes and PHY are going to be handled by standalone drivers
> > > for each of those hardware components. Drop them from the Ethernet driver.
> > > 
> > > The clocks which are being removed for this patch are responsible for
> > > the for the SerDes PCS and PHYs used for the 2nd and 3rd MAC which are
> > > anyway not yet supported. Hence backwards compatibility is not an issue.
> > 
> > What user visible issue is it fixing, then?
> 
> Indeed this looks like more a cleanup than a fix. @Daniel why net-next
> without fixes tag is not a suitable target here?

There is no user visible issue. I didn't know that this would be the
condition for going into 'net'. I will resend the patch to net-next.

