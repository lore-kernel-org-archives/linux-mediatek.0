Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7186C02185
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Jan 2025 01:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcOYHS4bX7LzqpJjsFZMXEZcTsTm/fL0ct/AtOV0tFU=; b=06CTuWT10/zRfaRnKCjfVQhw/b
	V6ozNVBSgJvxZiNWFHMYU4B/XCC6OiIzrd/EjyL6lXC2Y1HlUBjbnjE5uJ7IX3wGaaDHpwewfClqA
	NodcuUeaALSiISi/51atRqxm3YsawCFYUbmkxtmNeMp2SqoXY1kmc2NBPsCQi2nwawUAa0DDXW5aR
	LRBOes1FBasngZVzARIzt3z/xULKdopqJthrBUEfo2YfXIxMwiH3ByECkCy7zdZ0GtCxONps+Gyrp
	sDOnvkCqSKRBrknGDsKqXJ2G6N6BXF4FZl54zYlEyme0aRxwElLb+HFISP3PvyddiBB8o+kpLywsd
	ETytzFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZKG3-00000003BW3-3BD6;
	Sun, 19 Jan 2025 01:37:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZKEl-00000003BNE-2PWL;
	Sun, 19 Jan 2025 01:36:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36EAB5C0A15;
	Sun, 19 Jan 2025 01:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D8BC4CED1;
	Sun, 19 Jan 2025 01:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737250586;
	bh=7dPA2JyohzqGwNqe2MaAcpWML5RGCuFC0E0OQTFSPZw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tq+4NRqLZhfAH5TX2RJPslZrcPv8Gtgn1xQ82nK2p5WuwTmDEsHqJ9unvq/C6cpSh
	 uszVu9hqicle8/GQIFo1ZaSNaELIIdRiQE73PP8p43eetd4iS16WQi8Pzc/WYE/Wqx
	 vDinO1QD0kiCxL5aPAxJ+QNLi1XDcfzz4/wsGqypl4ts07z+akUGzc8rlwp4bOnhab
	 Ou7TqeoGNxADG8AQXZ0/aA0cg214uzKhfkwGbCxTGxCrW72hSSVQh1aXySWELAN/Gn
	 yUjVhefPRWxaTMvMplI9cfSPXqrEpx/dzPogr4pDTEQJYlqRN2eo12IfOc2yKwj33/
	 ZmLmH0fO6gxJA==
Date: Sat, 18 Jan 2025 17:36:25 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [net PATCH] net: airoha: Fix wrong GDM4 register definition
Message-ID: <20250118173625.03d48516@kernel.org>
In-Reply-To: <20250117155257.19263-1-ansuelsmth@gmail.com>
References: <20250117155257.19263-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_173627_663703_72345248 
X-CRM114-Status: UNSURE (   8.02  )
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

On Fri, 17 Jan 2025 16:52:39 +0100 Christian Marangi wrote:
> diff --git a/drivers/net/ethernet/mediatek/airoha_regs.h b/drivers/net/ethernet/mediatek/airoha_regs.h
> index e448b66b5334..30c96f679735 100644
> --- a/drivers/net/ethernet/mediatek/airoha_regs.h
> +++ b/drivers/net/ethernet/mediatek/airoha_regs.h
> @@ -249,11 +249,11 @@
>  #define REG_GDM3_FWD_CFG		GDM3_BASE
>  #define GDM3_PAD_EN_MASK		BIT(28)
>  
> -#define REG_GDM4_FWD_CFG		(GDM4_BASE + 0x100)
> +#define REG_GDM4_FWD_CFG		GDM4_BASE
>  #define GDM4_PAD_EN_MASK		BIT(28)
>  #define GDM4_SPORT_OFFSET0_MASK		GENMASK(11, 8)
>  
> -#define REG_GDM4_SRC_PORT_SET		(GDM4_BASE + 0x33c)
> +#define REG_GDM4_SRC_PORT_SET		(GDM4_BASE + 0x23c)
>  #define GDM4_SPORT_OFF2_MASK		GENMASK(19, 16)
>  #define GDM4_SPORT_OFF1_MASK		GENMASK(15, 12)
>  #define GDM4_SPORT_OFF0_MASK		GENMASK(11, 8)

These are defined in drivers/net/ethernet/mediatek/airoha_eth.c
in the networking trees.
-- 
pw-bot: cr

