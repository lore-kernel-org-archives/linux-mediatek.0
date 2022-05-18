Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EABC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 01:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=moYpwbYE46YfBuQofGVGjZudDs1dkCn6RbososeGjq4=; b=wu64XEAXvmL22U
	K1ADM7qtN7Z9udJC6Jez+OScKXGMmkFeXgozsUCgu2yStVCYQnh3itubzFtDHQesoQShNNyXh45K7
	0yYKV69U5OIIyqaSO2qu0ZGKH7Q84v/KmW2RFKXpzJsMethT/7qDwew0MUM5qFzaMr+E4KX1JM1Eo
	HhGCNyCRDhX7+LPfTyejrky8sF6ZqG2UEMBPVi/aJYc82snQKtYuslx5cxxvO7VPolVToSQAmVjDQ
	VcMmO05lixkIlJJI4OpP1enkAzUHaJma8jv9VqPAPJnIqLAVWmwT4jK9NfwnnyIJxobVbVJDb/DV5
	ODUKGDJbI+LdmUzPFqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr8Yx-00Gaye-Oa; Wed, 18 May 2022 01:33:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr8Yu-00Gaxo-LL
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 01:33:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7F0261620;
 Wed, 18 May 2022 01:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B3EC385B8;
 Wed, 18 May 2022 01:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652837593;
 bh=+SoCN+SFVG5flL/deCdtvEfxB8FWbtMZDFfGrT1AdEk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RCa2Q8jgXuCPUaD3yoOQ5ZPNL4sm6X5FetMeK9vFyqC+WkW3oqup9K3xMKLWLBpcG
 1SNUAuPTrFtiv7VumBsOy/gG3ErdIujP9f2oldiSHo3tg4xCndis6PK9cOLlgGHhCv
 tw2t1YaMRRcg+JvvLA3ojLGtNJF3h/nf9L7IAUGIAoytntCCTwUzSaFxhv3m5aRfFG
 pbwpHM6H0i/CZxrtaSPvwNjywunCdBHmpftO3bBJVGCEJcrCUIKB7GlJLniiJ4ntFH
 aSlwbm+K5lbYDXkBwES5xv3uubwbNayZC/SmrJnQrFAKHMlxAic8lYvMYDsvl1ilvO
 UfkZbdunkINKg==
Date: Tue, 17 May 2022 18:33:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 04/15] net: ethernet: mtk_eth_soc: add
 txd_size to mtk_soc_data
Message-ID: <20220517183311.3d4c76fe@kernel.org>
In-Reply-To: <22bd1bd88c09205b9bf83ea4c3ab030d5dc6e670.1652716741.git.lorenzo@kernel.org>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <22bd1bd88c09205b9bf83ea4c3ab030d5dc6e670.1652716741.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_183316_782634_86AD8D0D 
X-CRM114-Status: UNSURE (   8.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 16 May 2022 18:06:31 +0200 Lorenzo Bianconi wrote:
>  	eth->scratch_ring = dma_alloc_coherent(eth->dma_dev,
> -					       cnt * sizeof(struct mtk_tx_dma),
> +					       cnt * soc->txrx.txd_size,
>  					       &eth->phy_scratch_ring,
>  					       GFP_ATOMIC);
>  	if (unlikely(!eth->scratch_ring))
>  		return -ENOMEM;
>  
> -	eth->scratch_head = kcalloc(cnt, MTK_QDMA_PAGE_SIZE,
> -				    GFP_KERNEL);
> +	eth->scratch_head = kcalloc(cnt, MTK_QDMA_PAGE_SIZE, GFP_KERNEL);

Unrelated, but GFP_ATOMIC right next to GFP_KERNEL caught my attention.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
