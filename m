Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85830C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 07:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyAXFQwuU6lcvWv+uwQFsDNP5qwece5yXFokR0fmiyY=; b=gDwxbjVBLjAdDhJobaHQe1sbVZ
	AeoHxgTyA0hELtk3VX0AoGOh7iEPyUKQtLDld4pwZBsrpuqmM9tzUqxOqnbiB5xb0WeQJGN1IL6xj
	DiX/5Fy7A/BtPvhRJOJP0ocitzRLk4Uq+MbdpAZMMWluIx+Q4FQ1/TkLm/OmKiEdpv70ZfUIGeZ9p
	1zXDvh4KdQjaVDrnkQmkt1W6CTpQgr6AH79Axvw6aDVAd70wyDsG6F4eF3XBIwDK9ujs41pSbhVDm
	sGE+tUdPPdEBzUABUKARdsKLtseiba9pQ87QnJMxh3HgziGF8Au9EO8+0E+8mJivJQyfG058OZr4V
	CktTWcOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orwxZ-00ClhK-HS; Mon, 07 Nov 2022 07:54:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orwxL-00Cleq-Jr; Mon, 07 Nov 2022 07:54:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6234560E2C;
	Mon,  7 Nov 2022 07:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D97BC433C1;
	Mon,  7 Nov 2022 07:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667807645;
	bh=4i2O5JJ1QiNuhw1wMEWnXWWxuTHBkjmjjAezmrxcXuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VWDiaeFoqbIyPAek4tFSTBE03ISRKgGLSL2gxQZyiwaVZD3dGab3nKTXV0bA1qWDP
	 QruMp76+K5yLI3/5sYCr8VivlFM6m1gt+mksEP86N6PugPVYOX2h9L6X89oIxaZanq
	 hGY4y0YQm7cLRLSBKqGtMiqHjEb7gq8jwAK/v72UbxAC2OHIwn3Aw0yZRg8Dnkp0PU
	 wmhVrEIhDt91aFwewiSpymoaiBDza18BvIPjs9HXvM2nNSA+QUWcEf0QTj2VlY34+A
	 O0Akzu8cuvjDtHRdaEJON/MEQ+2kaCNP+BrKKnaiuZscuEKBOs77lM2/k0RU5DKkU0
	 WRDmqmvcW75OQ==
Date: Mon, 7 Nov 2022 09:54:01 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Zhengchao Shao <shaozhengchao@huawei.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	bgolaszewski@baylibre.com, weiyongjun1@huawei.com,
	yuehaibing@huawei.com
Subject: Re: [PATCH net] net: ethernet: mtk-star-emac: disable napi when
 connect and start PHY failed in mtk_star_enable()
Message-ID: <Y2i5mc04/XDfNqAs@unreal>
References: <20221107012159.211387-1-shaozhengchao@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107012159.211387-1-shaozhengchao@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_235407_736988_F3B392A0 
X-CRM114-Status: GOOD (  11.27  )
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

On Mon, Nov 07, 2022 at 09:21:59AM +0800, Zhengchao Shao wrote:
> When failed to connect to and start PHY in mtk_star_enable() for opening
> device, napi isn't disabled. When open mtk star device next time, it will
> reports a invalid opcode issue. Fix it. Only be compiled, not be tested.
> 
> Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
> Signed-off-by: Zhengchao Shao <shaozhengchao@huawei.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_star_emac.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>

