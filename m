Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB83CFF8875
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2026 00:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icHsd1TlftPaJ6j5j1qmW4lXPQP4Ynfc2dJNOWPkDRc=; b=WFZnvHtEajha0kbkalimx3SXka
	QuJGGV4NDQioRvEu9Q3ZAT+fzGd73UJwCwCLSnrxVy3qV1pyHxtXfnKEhVc/hglq9+sTOI/1+KvdG
	Ztw6oTYoYtsJzsc1VtGp572JHM7Cn/gI2Zqmmc13d0Hl/2+U4TE39dVUWp9rF+GZSk9k6qIPhrCfW
	cU1iwhCV+IwxFMid4HahFLxgAGeJSog1+xi0AUnj9A/9oZw2LvnMkmhrAVKkfkMCpf4c45/zfJKL8
	+IGXENNp7W9emwVWV3NKAx6oHILBFAakjIdWD3BroIxaXsptaz3i6hvAD3BkuuIKH0KShBSLee3K5
	pV/FY0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIF2N-00000004Klr-2tvc;
	Thu, 30 Apr 2026 00:13:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIF2K-00000004Kkt-2FXL;
	Thu, 30 Apr 2026 00:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=icHsd1TlftPaJ6j5j1qmW4lXPQP4Ynfc2dJNOWPkDRc=; b=5PyDpKwyDJg0/Vcl2JJqPdv68b
	7mCT6ojdSToaLxVm1u96oyCfiHQVEkFS0Q3Tb6nZwGt/7FZWb8dPNrtLV4IpmU6woZsx6DxFiJ810
	erRRmoksoZl+QP+eY6C3aQwEnfyHtgA9fLV2fOUhW6vACPeZzQ2dY+itCnQWAMs7Nseg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wIF28-000bEJ-Uj; Thu, 30 Apr 2026 02:13:36 +0200
Date: Thu, 30 Apr 2026 02:13:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, chester.a.unal@arinc9.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
	ansuelsmth@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v4] net: dsa: mt7530: fix .get_stats64 sleeping in
 atomic context
Message-ID: <e06bee51-561e-4405-b3b2-a5d672d8e8b0@lunn.ch>
References: <16efd278e4f17776ccfbf8491e5be71a4689c137.1777385305.git.daniel@makrotopia.org>
 <20260429234612.2240476-2-kuba@kernel.org>
 <afKaVQ27GUQiWZTb@makrotopia.org>
 <20260429171124.07787599@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429171124.07787599@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_171348_572150_B467E6A2 
X-CRM114-Status: UNSURE (   6.40  )
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

> Not sure how much of the D in DSA is actually implemented but in terms
> of fix why not do what the bot suggests?

As far as i know, this device is not D in DSA capable.

   Andrew

