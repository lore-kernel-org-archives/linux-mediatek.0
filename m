Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35279CFB43F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 14:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VpJqPG77cRnKIElit9HVU/ZFAUvGvJjnRRplNr1AFg=; b=xwz1ed1OyGFr/WeeFVuYhZWntx
	tVWmseYVHaI6HRv3sUiJ/dhOINLQsgSMdvMnZkZ8CewgZggQatUtqqSVm8/MhkWu9+JL23l2GeJFt
	2r7p1sVor7XghUDleZwGgTYRuX08ROaK5E0n8/fDNs/pEXDpYp+4/AEo2eF2tEE2RY5BhBG5HdudQ
	SRxoWpcRX3zRPB/CVy3y1nVE1nJfbfwhBLR0y5PbyHbzanjkeWh8/PK2z4XXzoNYL/vKVjpAYtdWh
	2lJUgRW7IN3Up0wmDpPBw8XBqNlBrwsGMRDSUxq6Th15D/sUDJHr6QyJS9lSE/9/fH3GxAtTZjoE1
	pSIM5EFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoIN-00000002bil-0mkL;
	Mon, 07 Oct 2024 14:01:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoH3-00000002bMf-2K89;
	Mon, 07 Oct 2024 13:59:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C46DBA405B7;
	Mon,  7 Oct 2024 13:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFC2C4CECC;
	Mon,  7 Oct 2024 13:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728309584;
	bh=j2KITGRUJh2rGqtoamaW9s2IDnoCKVh9a5TyQQoqQ8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oxo3YbOM3U4jGqobpzw4AzbqBC7mPiB00NqK1EnxGc/OMB9886B7pMMv75qenhW7z
	 d90Zh596aqAa+AohB+60ixcNs1K5ud30z/7fA5u5EGCs81GvFj8nYMVS4fJ6/lE9RN
	 431MsYszwelYEr+0RNHm5982h9wsPItcGfug5LFNPPqbTWI0ft6YKMO/DEYB7v86ny
	 37hiRwVNb6NCxrRJs3HW0eHpzICpO9kaGmLN68Vez4IRgX2gExPATx6mQNiAYYqEoV
	 6QkuIkx7AEvvZLoBhWA8qrwntxS6dWl9/MMhztaWxSnoTey6lVufVFojBUGdTcXaZU
	 goOaz5QCC+TIA==
Date: Mon, 7 Oct 2024 14:58:09 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Update tx cpu dma ring idx at the end
 of xmit loop
Message-ID: <20241007135809.GB32733@kernel.org>
References: <20241004-airoha-eth-7581-mapping-fix-v1-1-8e4279ab1812@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-airoha-eth-7581-mapping-fix-v1-1-8e4279ab1812@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_065945_673967_5B0961C2 
X-CRM114-Status: UNSURE (   8.66  )
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

On Fri, Oct 04, 2024 at 03:51:26PM +0200, Lorenzo Bianconi wrote:
> Move the tx cpu dma ring index update out of transmit loop of
> airoha_dev_xmit routine in order to not start transmitting the packet
> before it is fully DMA mapped (e.g. fragmented skbs).
> 
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Reported-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


