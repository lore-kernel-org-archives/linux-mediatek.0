Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFA2C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 15:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFjf9PEaoJi14CUAATwY45BK0qqNZE+cgvT7EX51gUw=; b=n6n/PGN4wqlVecEyRSy/fBKdsS
	+U41TwQ9jdMDaEg0OT5XOK2ClQdXlZoOC5MkXXv1DU0AFXpFXvX4z3wOthHOoFhmE/pGw5MUUyDWy
	07wcfwH31rJB1zI7Ew5/EYG7prSDhPtklgNnvnaJh5TZ9gM7K2yYYiS5OsSb0NUwvHlGt8oBXwGne
	IUj82qac3oeNitctiANyLKViN7crheikb2Y9rcFwuPQzm5BU1nJ10cSYDfyHbEJm8uzUuMDh/w7Gz
	ApqpbnyRgEsEph7enetmVa3YBp10cNtfl0g6PRp+v0P9oasE6KKb/M2BC5NcJsnyD60I9y/V0pUS3
	x9MipCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidaF-00ApYJ-2R;
	Sat, 01 Apr 2023 15:56:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidaB-00ApW9-38;
	Sat, 01 Apr 2023 15:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KFjf9PEaoJi14CUAATwY45BK0qqNZE+cgvT7EX51gUw=; b=UKWmWRSTJKdxjIME6/xKk7QkZG
	ZSePWqucj9TwogJAHYMYQ77bPtOHbSAvKdLXP9fVBz6be3pdidYWDgApPnO7ielCgxIY8yhP3MWdK
	908qsRM7Ncv+JwppwpcnkvGOPgf67yxshUb1zTkHK2BiZ6CuhH2M/c0F3jtOICxrbIM0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pidZn-00994v-Uj; Sat, 01 Apr 2023 17:55:35 +0200
Date: Sat, 1 Apr 2023 17:55:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Simon Horman <horms@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: use be32 type to store be32
 values
Message-ID: <c7684349-535c-45a4-9a74-d47479a50020@lunn.ch>
References: <20230401-mtk_eth_soc-sparse-v1-1-84e9fc7b8eab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230401-mtk_eth_soc-sparse-v1-1-84e9fc7b8eab@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_085600_006233_847BD2EE 
X-CRM114-Status: UNSURE (   8.32  )
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

On Sat, Apr 01, 2023 at 08:43:44AM +0200, Simon Horman wrote:
> Perhaps there is a nicer way to handle this but the code
> calls for converting an array of host byte order 32bit values
> to big endian 32bit values: an ipv6 address to be pretty printed.

Hi Simon

Maybe make a generic helper? I could be used in other places, e.g:

https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c#L6773

	Andrew

