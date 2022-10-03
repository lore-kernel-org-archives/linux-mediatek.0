Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B90C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 13:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nFzv9zqPOpBZez9dT7ZITO/5nYcroyyujAVt3AO4cg=; b=ne1X8hL4jmE2vYOl9A2sg8lHSd
	wFpiIkOwbqxEtHRYmY9QghHVBhqzafWZyBQVGX1IvphkYS2S56R+TVC4UkouxNoCn7UAlix7ZJsVr
	CNkzHHmFyUs5CHi1QsyyKbQFULzggMuNLTc2wJ9crTLiczJeXMJSe34x4vC2xD1+mmEUJFhQeoPxZ
	nf1iOs3f3+376z4gIKZI0zChEd7tuiK5iC78tEH/wEMC7+qIstTT2UiqtpJ/6UItF7fra5HuG7Z7S
	H1jfJfZWKaRN4asn4oDiEUadXQzGjy5PDSuv5teDSPLslBQUhCyYRV4rVlYSXva6wyEB2UG5UIFtB
	YI1YBlOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLnf-0065D3-9F; Mon, 03 Oct 2022 13:48:03 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLnc-0065Al-Mb
	for linux-mediatek@lists.infradead.org; Mon, 03 Oct 2022 13:48:02 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ofLnR-0004nb-3A;
	Mon, 03 Oct 2022 15:47:50 +0200
Date: Mon, 3 Oct 2022 14:47:42 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Matthieu Baerts <matthieu.baerts@tessares.net>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen Minqiang <ptpt52@gmail.com>,
	Thomas =?iso-8859-1?Q?H=FChn?= <thomas.huehn@hs-nordhausen.de>
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix state in
 __mtk_foe_entry_clear: manual merge
Message-ID: <Yzrn/ozGZn6v9oQ1@makrotopia.org>
References: <20220928190939.3c43516f@kernel.org>
 <YzY+1Yg0FBXcnrtc@makrotopia.org>
 <6cb6893b-4921-a068-4c30-1109795110bb@tessares.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cb6893b-4921-a068-4c30-1109795110bb@tessares.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_064800_766390_6DC49AA7 
X-CRM114-Status: GOOD (  20.48  )
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

On Mon, Oct 03, 2022 at 02:59:32PM +0200, Matthieu Baerts wrote:
> Hello,
> 
> On 30/09/2022 02:56, Daniel Golle wrote:
> > Setting ib1 state to MTK_FOE_STATE_UNBIND in __mtk_foe_entry_clear
> > routine as done by commit 0e80707d94e4c8 ("net: ethernet: mtk_eth_soc:
> > fix typo in __mtk_foe_entry_clear") breaks flow offloading, at least
> > on older MTK_NETSYS_V1 SoCs, OpenWrt users have confirmed the bug on
> > MT7622 and MT7621 systems.
> > Felix Fietkau suggested to use MTK_FOE_STATE_INVALID instead which
> > works well on both, MTK_NETSYS_V1 and MTK_NETSYS_V2.
> > 
> > Tested on MT7622 (Linksys E8450) and MT7986 (BananaPi BPI-R3).
> > 
> > Suggested-by: Felix Fietkau <nbd@nbd.name>
> > Fixes: 0e80707d94e4c8 ("net: ethernet: mtk_eth_soc: fix typo in __mtk_foe_entry_clear")
> > Fixes: 33fc42de33278b ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> > v2: rebased on top of netdev/net.git;main
> 
> FYI and as expected when reading this email thread, we got a small
> conflict when merging -net in net-next in the MPTCP tree due to this
> patch applied in -net:
> 
>   ae3ed15da588 ("net: ethernet: mtk_eth_soc: fix state in
> __mtk_foe_entry_clear")
> 
> and this one from net-next:
> 
>   9d8cb4c096ab ("net: ethernet: mtk_eth_soc: add foe_entry_size to
> mtk_eth_soc")
> 
> The conflict has been resolved on our side[1] inspired by Daniel's v1.
> The resolution we suggest is attached to this email.

conflict resolution: Acked-by: Daniel Golle <daniel@makrotopia.org>

> 
> Cheers,
> Matt
> 
> [1] https://github.com/multipath-tcp/mptcp_net-next/commit/7af5fac658ba
> -- 
> Tessares | Belgium | Hybrid Access Solutions
> www.tessares.net

> diff --cc drivers/net/ethernet/mediatek/mtk_ppe.c
> index 887f430734f7,148ea636ef97..ae00e572390d
> --- a/drivers/net/ethernet/mediatek/mtk_ppe.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
> @@@ -439,10 -410,9 +439,10 @@@ __mtk_foe_entry_clear(struct mtk_ppe *p
>   
>   	hlist_del_init(&entry->list);
>   	if (entry->hash != 0xffff) {
>  -		ppe->foe_table[entry->hash].ib1 &= ~MTK_FOE_IB1_STATE;
>  -		ppe->foe_table[entry->hash].ib1 |= FIELD_PREP(MTK_FOE_IB1_STATE,
>  -							      MTK_FOE_STATE_INVALID);
>  +		struct mtk_foe_entry *hwe = mtk_foe_get_entry(ppe, entry->hash);
>  +
>  +		hwe->ib1 &= ~MTK_FOE_IB1_STATE;
> - 		hwe->ib1 |= FIELD_PREP(MTK_FOE_IB1_STATE, MTK_FOE_STATE_UNBIND);
> ++		hwe->ib1 |= FIELD_PREP(MTK_FOE_IB1_STATE, MTK_FOE_STATE_INVALID);
>   		dma_wmb();
>   	}
>   	entry->hash = 0xffff;


