Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0638C3DA63
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 21:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcLa2jTpm4Is2gyMHHjkhy4HabJS4w3rCAg3RdWHqC8=; b=tSW20Kj2zWj41zfn4mNAfUZ4Cd
	uqL+vybQ+Ug1RNnnxCWoSzEJ0g8cpGRv93ZoODxP9u1i6KvxFNRHS+H+iUOiuoKLp1vzsR6XraotT
	eyFTvuf9tSIGi5d/KxVeDgsfPUbHmQ+CFdY8KeVq34NhWg6F1tJKd4Pd+P3KjiuFDs1TKVdqoEAiu
	AhkudnHR0WoSdl4SUxgLU6IHwzjTQXXvHRChMBJJI+V8vgHYa8VUsPnXmJaY1bum8OUsNWmorsjx+
	OQxW9Jurn7N/Z8qfqHy8M+2RNN5TPX/aHD/HTSEspbfxSLgiF9+Nkt2YSIWSANJObVbbQANsH5WkQ
	2cuq5lfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWNTQ-0000000DcmH-0eHD;
	Tue, 23 Jul 2024 21:55:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWNT1-0000000Dcgn-2e2s;
	Tue, 23 Jul 2024 21:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kcLa2jTpm4Is2gyMHHjkhy4HabJS4w3rCAg3RdWHqC8=; b=POdZ1Cd8AynOmoPH5N+GWyWNci
	gPzqvcTJsqgnevmZ2S4olw0F4SItGvc1HnW0MWrXSkuVBy8ved3J2XtgJli7CjNNjAgUrC1O+xAHP
	yzuINtNBgWw1iIP9ilaCkc+8JwmzGuDYLDghMstbf0Sv3VY3qWln/WtDLaTTHOgcv+o8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sWNSj-0035wz-64; Tue, 23 Jul 2024 23:54:25 +0200
Date: Tue, 23 Jul 2024 23:54:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
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
Message-ID: <af1d5373-6b88-488c-9b90-10c25cefd5d0@lunn.ch>
References: <38559102c729a811dc8a85f6c7cee07228cffd3e.1721739769.git.daniel@makrotopia.org>
 <125775a6-42f2-4294-9593-518ad6c852f7@lunn.ch>
 <ZqAk1NW4_E9SRjUO@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqAk1NW4_E9SRjUO@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_145443_689960_49C683ED 
X-CRM114-Status: GOOD (  19.34  )
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

On Tue, Jul 23, 2024 at 10:47:00PM +0100, Daniel Golle wrote:
> Hi Andrew,
> 
> On Tue, Jul 23, 2024 at 08:35:16PM +0200, Andrew Lunn wrote:
> > On Tue, Jul 23, 2024 at 02:04:02PM +0100, Daniel Golle wrote:
> > > Clocks for SerDes and PHY are going to be handled by standalone drivers
> > > for each of those hardware components. Drop them from the Ethernet driver.
> > 
> > Please could you explain in more details how this does not break
> > backwards compatibility. Should there also be a depends on, to ensure
> > the new driver is loaded? Will old DT blobs still work?
> 
> At this stage the Ethernet driver only supports the first MAC which
> is hard-wired to the built-in DSA switch.

> The clocks which are being removed for this patch are responsible for
> the for the SerDes PCS and PHYs used for the 2nd and 3rd MAC which
> are anyway not yet supported.

O.K. This last part, not yet supported, would of been good to have in
the commit message. It then makes it clear backwards compatibility is
not an issue, it never worked in the first place.

Thanks
	Andrew

