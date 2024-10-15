Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9B3D21690
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 12:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sn2S05TaQpNtWEkFfmQh9ZJsMAyfoxMcOZDWo8+MjEc=; b=tKaHnTARKQTh//iVIejbYP7p+I
	3AlFeyGKyFvuULaHflo/O1cKyzVCnDlrxjZvNqA761u/8XsxekHLlFwQICHxJmHDNupvrnQFpc3MQ
	aei7xYtrjLIwi8WpQ7MLuVfrxdsLWjGPcu/0kSQIk72+fihqxSmOSYdB9g5nkVqWpY1f2SEMGCmhQ
	Fbkn5n+Ujo7fURWmTmji2kuM7F0SN27ck26C9hYz/jkLFk78FDA9tk39Voj18NYzupBEWkfgU2eyj
	TG+Lws7gvsdxkE7Sc8q48lblRFbdXgkBxu/pUcLL40t/LFe8GkYAaaLC6I3tEoHD6QgjeAlreyotE
	sDMSTA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gzX-00000008F2J-1ywQ;
	Tue, 15 Oct 2024 12:49:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gpW-00000008CHk-1AR9;
	Tue, 15 Oct 2024 12:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 647C1A41C4C;
	Tue, 15 Oct 2024 12:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC26C4CEC6;
	Tue, 15 Oct 2024 12:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728995953;
	bh=QTtYFAEPIf5I0d3qekBOMwiJidbWoVXnP2kMc1zPBC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GFaLvdqKM641PB4NIUtGmSOACidFNEUEyl+fFoA7ibrfvakrbRNHx0FZkTYazGoRP
	 LQmguEsQeLXaCIQVo4SsQhcGgSSEUHo3fzsNExRixt49Yr23coWF3IRKUI/iQbz1Zo
	 UPYpLeiIh3cwQG7fcrm14bCWcNfxhmhuDOHaM0WTyEaF8wmmX0sGjhzjcqhhpFS7/D
	 1yjQFJ2IWOmpyzEcdtIwU7f0eP2cbkVkb5gGV1mBP/zre+gGu12BqqJ89HojVSxWN8
	 +a5WN7I14ca4PyC/TUbdIE67eqowNyjDDgjaLJwncR4EGPGenvA5hMhtNYYaqpjZuW
	 MArpXchwiyaYQ==
Date: Tue, 15 Oct 2024 13:39:07 +0100
From: Simon Horman <horms@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix memory corruption
 during fq dma init
Message-ID: <20241015123907.GG569285@kernel.org>
References: <20241015081755.31060-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015081755.31060-1-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_053914_405461_3CF518F2 
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
Cc: Jacob Keller <jacob.e.keller@intel.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Mark Lee <Mark-MC.Lee@mediatek.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 15, 2024 at 10:17:55AM +0200, Felix Fietkau wrote:
> The loop responsible for allocating up to MTK_FQ_DMA_LENGTH buffers must
> only touch as many descriptors, otherwise it ends up corrupting unrelated
> memory. Fix the loop iteration count accordingly.
> 
> Fixes: c57e55819443 ("net: ethernet: mtk_eth_soc: handle dma buffer size soc specific")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Simon Horman <horms@kernel.org>

