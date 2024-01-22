Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0ACC47DD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 19:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Z6SXTn8YhiWrcZlgd1ZQ8j3V9FW9S8AEHmuF/IWI4A=; b=k7NET/Zy1YR5BtCoS3/1D+zOEr
	3QUO98Nd7FT29bwQWeEv0zmrVb3Z9KTaAd1tvo4/v3CvPCIWCoIMQ0kIPGlszWqKEih5wqsYJP7de
	AJlf0+TxSIk/XmWSQXbiXUrD5CgLTngO5w45vq98cpZPfi+db6NzMnaQ0T7I7K9NGcoG49K5E5z7D
	QqZk2cXlhS9N1JP5bX33STg3mdO5m1ZT0IVWA1L/LTZKAHEgNaNohs54OZXluzsuYAPG4mb5ZqrSK
	equUwg7/DX1G6tiu1Fg4y34+B7NvN8M1PlEc7cSSk5K24rLgig7iOSjcmzQzWhvqojC8X+6a3IV5g
	/hid2fXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS03W-00Djo6-1F;
	Mon, 22 Jan 2024 19:34:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS03T-00Djms-07;
	Mon, 22 Jan 2024 19:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/Z6SXTn8YhiWrcZlgd1ZQ8j3V9FW9S8AEHmuF/IWI4A=; b=jO/DHwQ3UDrqPgaEKtXlb4KHhO
	uOoDeXsV8PaWWb+8cBpTjQXStv6T5GVS/7ybW/ZtdJ1r8nBWbNzCHUtWA3OmkVQyxNdroow63o24l
	u3pH6TnbNKF6aXOkIrgkVw8Ia0qjLYomaVI/PL7XdWk4S9HhXx5mLLyoTnsBu5ggpgO0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rS031-005lA4-Eo; Mon, 22 Jan 2024 20:33:31 +0100
Date: Mon, 22 Jan 2024 20:33:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Breno Leitao <leitao@debian.org>
Cc: kuba@kernel.org, davem@davemloft.net, abeni@redhat.com,
	edumazet@google.com, Ioana Ciornei <ioana.ciornei@nxp.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Paolo Abeni <pabeni@redhat.com>, Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>, dsahern@kernel.org,
	weiwan@google.com,
	"open list:LYNX PCS MODULE" <netdev@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next 03/22] net: fill in MODULE_DESCRIPTION()s for
 PCS Layer
Message-ID: <52e39a1b-c551-4eea-9606-62be0cbad39f@lunn.ch>
References: <20240122184543.2501493-1-leitao@debian.org>
 <20240122184543.2501493-4-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122184543.2501493-4-leitao@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_113359_070545_AB9B4841 
X-CRM114-Status: GOOD (  11.65  )
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

On Mon, Jan 22, 2024 at 10:45:24AM -0800, Breno Leitao wrote:
> W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
> Add descriptions to the LynxI PCS MediaTek's SoC.

That patch now does more than that.

> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/net/pcs/pcs-lynx.c      | 1 +
>  drivers/net/pcs/pcs-mtk-lynxi.c | 1 +
>  drivers/net/pcs/pcs-xpcs.c      | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
> index dc3962b2aa6b..d51d09beaab3 100644
> --- a/drivers/net/pcs/pcs-lynx.c
> +++ b/drivers/net/pcs/pcs-lynx.c
> @@ -398,4 +398,5 @@ void lynx_pcs_destroy(struct phylink_pcs *pcs)
>  }
>  EXPORT_SYMBOL(lynx_pcs_destroy);
>  
> +MODULE_DESCRIPTION("MediaTek SGMII library for Lynx PCS");

pcs-lynx is for NXP hardware, not MediaTek.

    Andrew

---
pw-bot: cr

