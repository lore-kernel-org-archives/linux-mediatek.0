Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66209C636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 07:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqHKaFpBaYV5IA8dxSlzzDAzoZA4YyFZKcjo68RFyoA=; b=puSCtE3MK5N8sFqQD7DXXV1oyu
	YRCsXeaV7BKxTEJ0qv7zSwW/WBXRzFoWHWOjhg5ETkm42dtTgew/pwqLzf8XFs0sv6rloD3bWLx49
	Mq8ax3b8Ad3+Ox2+JwhQji2H096t5hvkEtXeN0H0GZ+FY5D54DMd2BBafRad8Uf7caNi5mazFc7t4
	3g78puxhEhhXZU6xtO5LCW7pSgKqorhLa0Hzv0+z3qbVtzM58pa7QeuAFEsqy1l94Gg5mawhEXaAA
	y2RPxwFuDR5th18EJ80Vq8KS/3XUEmHB9VaGCcFyfWReaPMfO1C/wfRpFrNKNu+bMwBt2IqJIR2l5
	fBbfq5AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRT3q-00DQGv-2P; Mon, 13 Feb 2023 07:15:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRT3e-00DQFM-VC; Mon, 13 Feb 2023 07:15:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 51B1C60DEF;
	Mon, 13 Feb 2023 07:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B09C433D2;
	Mon, 13 Feb 2023 07:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676272525;
	bh=kXKrIKkF4Pu9CcKWI5PNeLrNZKIdxo0dgi5K9xPGp/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O1yz/Yv6oTPAWaNRVpj1JnF9ZBDsXPAH1RWSCKsTeeKJah/JH7Lr/zIowbs5fEi5j
	 7i8RmsI8DPJ/Jj1iRLkUBXjhEkn67FZrgpWqQYnbPpj45/tpj557qXkCNo+4Gysp1B
	 G7B/HUGPKl7EgRCYzyqnzIis8D21Fiw4GZ6IA6Z1SCTXs4OLEY73IlUNVGu6ck8K4U
	 2MEAH0k/MluhGWWKoan2mnkQVfN0T4UMl4KzH4MVcQNKp2S+2G3f+ALGzmGcX21a7I
	 m67tPhyzSgudF6E5ZmXwS4WHc5cVgfuqx8DNC6wUhmSKx5mvqirbuenklI5RH/6wXU
	 TNitnH2k+DmCQ==
Date: Mon, 13 Feb 2023 09:15:21 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Richard van Schagen <richard@routerhints.com>
Subject: Re: [PATCH] Fix setting up CPU and User ports to be in the correct
 mode during setup and when toggling vlan_filtering on a bridge port.
Message-ID: <Y+njic6vxAlGp72l@unreal>
References: <20230212213949.672443-1-richard@routerhints.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230212213949.672443-1-richard@routerhints.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_231527_085288_01848C73 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, Arinc Unal <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Feb 12, 2023 at 10:39:49PM +0100, Richard van Schagen wrote:
> ---
>  drivers/net/dsa/mt7530.c | 124 ++++++++++++++-------------------------
>  1 file changed, 43 insertions(+), 81 deletions(-)

Please read Documentation/process/submitting-patches.rst

Thanks

