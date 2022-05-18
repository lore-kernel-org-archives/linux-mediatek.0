Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ACEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 01:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=So0Pws6grI4hVd1v7O1BJ5DD3CJakLczpQVLAbeLbbk=; b=HxH6OgeCwRNWtA
	Elul4seTDPqPdpzVYj2gBE4qrinoA+nQqweIfOA79hVBjGZKb9ldUnCsYoJ3nP2OWg6PbVfREofFF
	Byzwwy0K2u2xEfkf2dQTMy4BMSGGDxExFiZj25KiGBNER99fZgLov25blEPhhQA9QGve+WIwKRSf8
	RrPdbLhGZPk+XZf0Df3LjsNDfvwhn4Ko6yrLjlvovMDMWZegUHZBpEKcNuU1UDF24iHbprlyF7NKu
	+JzDHI38D1RD98bfmN7tX7wxEUCj4qTa6NbOpkebFoebvlD2TZiBqnEN7hx76OTyXv2MzIjhitCSM
	fD93mpZAETtgR8GguSnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr8k0-00GclA-HK; Wed, 18 May 2022 01:44:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr8jx-00Gci2-QQ
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 01:44:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 04A51B81DF4;
 Wed, 18 May 2022 01:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FC5C385B8;
 Wed, 18 May 2022 01:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652838275;
 bh=jw9WY5TGpI68KaNjv0zfL25huNIRIdW/P8Q6Phay5WY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bwbAFNG6xWVALg36Hiu/dCS79vtJ58HL/feVRzcheNQxr0TEnRxrY4LTkxR7ZvgXy
 avQUnmmtrAYBOg0rHUWidg0oF8/GX4sZG0g5wXIV3ap15nG0W8JSgVKISuARYcoZ6x
 Yv9cCmoyJQ8XY9mnTqm31Bhvo7v618hXtIxeA2njxKGFLjS5E+VhsoPHjUd92+V6GE
 M6WClZNtNMxr6v3CBrVDRfZjAc271LL+vmLyzt3zvRUFpY9chkIg4tU8MwCoaAPq/B
 WzXv4RyyHz94Aa3FT8O0FCq708qOutTIuWeP0HcIZSbCp90KilK3kcJIA9+mGCU2Ns
 Xd5mWhI8Kp81Q==
Date: Tue, 17 May 2022 18:44:33 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 12/15] net: ethernet: mtk_eth_soc: introduce
 MTK_NETSYS_V2 support
Message-ID: <20220517184433.3cb2fd5a@kernel.org>
In-Reply-To: <cc1bd411e3028e2d6b0365ed5d29f3cea66223f8.1652716741.git.lorenzo@kernel.org>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <cc1bd411e3028e2d6b0365ed5d29f3cea66223f8.1652716741.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_184442_039361_B1CDD807 
X-CRM114-Status: GOOD (  10.85  )
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

On Mon, 16 May 2022 18:06:39 +0200 Lorenzo Bianconi wrote:
> +	struct mtk_mac *mac = netdev_priv(dev);
> +	struct mtk_tx_dma_v2 *desc = txd;
> +	struct mtk_eth *eth = mac->hw;
> +	u32 data;
> +
> +	WRITE_ONCE(desc->txd1, info->addr);
> +
> +	data = TX_DMA_PLEN0(info->size);
> +	if (info->last)
> +		data |= TX_DMA_LS0;
> +	WRITE_ONCE(desc->txd3, data);
> +
> +	if (!info->qid && mac->id)
> +		info->qid = MTK_QDMA_GMAC2_QID;
> +
> +	data = (mac->id + 1) << TX_DMA_FPORT_SHIFT_V2; /* forward port */
> +	data |= TX_DMA_SWC_V2 | QID_BITS_V2(info->qid);
> +	WRITE_ONCE(desc->txd4, data);
> +
> +	data = 0;
> +	if (info->first) {
> +		if (info->gso)
> +			data |= TX_DMA_TSO_V2;
> +		/* tx checksum offload */
> +		if (info->csum)
> +			data |= TX_DMA_CHKSUM_V2;
> +	}
> +	WRITE_ONCE(desc->txd5, data);
> +
> +	data = 0;
> +	if (info->first && info->vlan)
> +		data |= TX_DMA_INS_VLAN_V2 | info->vlan_tci;
> +	WRITE_ONCE(desc->txd6, data);
> +
> +	WRITE_ONCE(desc->txd7, 0);
> +	WRITE_ONCE(desc->txd8, 0);

Why all the WRITE_ONCE()? Don't you just need a barrier between writing
the descriptor and kicking the HW? 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
