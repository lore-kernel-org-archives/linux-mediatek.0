Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88611C71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 19:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iaEK6NteFZOogFVzVYxoisWJpdSFnSuds70zo7ptBas=; b=zm45rI+lco/+qH
	isgV+lO9vhUi6SHfEV7/u9f7w8sNcvuWP6EJ1fjxLCnFKk+BoHeMg5eP8DLtVfGtR1Q33d3jKf5tS
	DUUZs4ffcAYo9c1jz1/+1/JSTfT9WKNVXKB+JdGMZUj4qIvzQRKSrd7OiexTN7MT0mdgrp0DMjAWP
	u9h07JBrQ3gJXH9Vh8llq4vISJtFpnCWdlAkF7r2NsC5hWaoaw44mrj7MdN+OXDtW9BW7e1TmmgP+
	0zKCqivoStytP1lo+JR1zGi91TNX0CmRKMFZwE2YmHy6G+w60du69NKEOL6M2Wof25yuXPiJ7ec3o
	/9WrLleDwyn+gqlLyKyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaiDF-00AB9j-25;
	Mon, 28 Aug 2023 19:47:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaiDC-00AB96-1M;
	Mon, 28 Aug 2023 19:47:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B58376178F;
	Mon, 28 Aug 2023 19:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66336C433C7;
	Mon, 28 Aug 2023 19:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693252065;
	bh=C4Ir9bNWumGZzSRtNes2Jz5ys6JqBziIumxbHwsTdO4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pt2TiriD50KKRwOmmP5NpsaQE/9Yosb+AWCBsHFkuvx1YnDtVcr5cC1cMTTps4Ug2
	 sxYBUqkIdoEo3hg9uQnrdU3hoDPs9s6hRQsaXt8wIa2SWNyIYhXFz6TWN9rx+zFqwe
	 rDOgPOSjJDW3u+aLPC30xtSXRzOa09okhBs/XxYAre2ExymejyBtKIiHl1lwst4jcJ
	 vfKYGIOf6HwZ4G0d0AyMkJI+vkqQwMkRFqmeBzUGBiLihfMoL/fLKlK7Wn7myHZKRZ
	 hno996IvnfHCxH8vK2twXukWv8fKEiA4R5PU29wnMwWM3/ZOPOU2hKk1uahpHBTfdV
	 w40ubq/+KxytQ==
Date: Mon, 28 Aug 2023 12:47:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: add paths and
 SerDes modes for MT7988
Message-ID: <20230828124743.4882a1a2@kernel.org>
In-Reply-To: <e6bb7c95c93e7ae91de998d2fd32580db2ce05c3.1693183332.git.daniel@makrotopia.org>
References: <e6bb7c95c93e7ae91de998d2fd32580db2ce05c3.1693183332.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_124746_524876_56D2A6C3 
X-CRM114-Status: UNSURE (   9.11  )
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>, Mark Lee <Mark-MC.Lee@mediatek.com>, Eric Dumazet <edumazet@google.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 28 Aug 2023 01:56:19 +0100 Daniel Golle wrote:
> MT7988 comes with a built-in 2.5G TP PHY as well as SerDes lanes to
> connect external PHYs or transceivers in USXGMII, 10GBase-R, 5GBase-R,
> 2500Base-X, 1000Base-X and Cisco SGMII interface modes.

## Form letter - net-next-closed

The merge window for v6.6 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We are currently accepting bug fixes only.

Please repost when net-next reopens after Sept 11th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer


