Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40F6C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Nov 2022 22:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3i7nN5aw5OVLfa/b8XeXSZKgZlxzWp3qsauPMLCOpAM=; b=bmYzogcAhRgTFRnNz9KcxytQtD
	45fxxsmjpxH7wTpCloKWYpdimy60eyWAg4hegQIwbRR2Qqr5rVlE2l0ZzePtc9THAGZRze/xwJnG/
	YAe7YD7kH3zaKljMJPzg0QFu+Xqw1TE+x+rLyqsZwlLPYi4RLavhbkX8jPTpK8ROkNeJudVfWHdJg
	UmUgEoWa87dYzpv8MlCsisi7pnyJj+TgD6LUlx+3alQDr3l/tDVIMkWevEgCz1+VXM8RNWNZODxos
	tzoqdnE+YFlP383KWA27oLjq3Cfk4ZVTVQwH/UGlms7LMkehQ0kijFRj0kHH5eRyr5pSJIu0wnT5h
	QIdkQ03w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opzOx-007MFn-86; Tue, 01 Nov 2022 22:06:31 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opzOf-007M7D-Th; Tue, 01 Nov 2022 22:06:16 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1opzOJ-0007B1-0b; Tue, 01 Nov 2022 23:05:51 +0100
Date: Tue, 1 Nov 2022 22:05:47 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ethernet: mediatek: ppe: add support for flow
 accounting
Message-ID: <Y2GYO9muWSmRypnF@makrotopia.org>
References: <Y2FvtampxpDGua2p@makrotopia.org>
 <5d8e00d4-830d-19ff-a3cb-59bd81618903@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d8e00d4-830d-19ff-a3cb-59bd81618903@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_150613_988556_1933E3A3 
X-CRM114-Status: GOOD (  22.22  )
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

Hi Felix,

On Tue, Nov 01, 2022 at 08:38:59PM +0100, Felix Fietkau wrote:
> On 01.11.22 20:12, Daniel Golle wrote:
> > The PPE units found in MT7622 and newer support packet and byte
> > accounting of hw-offloaded flows. Add support for reading those
> > counters as found in MediaTek's SDK[1].
> > 
> > [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/bc6a6a375c800dc2b80e1a325a2c732d1737df92
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >   drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  11 +-
> >   drivers/net/ethernet/mediatek/mtk_eth_soc.h   |   1 +
> >   drivers/net/ethernet/mediatek/mtk_ppe.c       | 122 +++++++++++++++++-
> >   drivers/net/ethernet/mediatek/mtk_ppe.h       |  23 +++-
> >   .../net/ethernet/mediatek/mtk_ppe_debugfs.c   |   9 +-
> >   .../net/ethernet/mediatek/mtk_ppe_offload.c   |   7 +
> >   drivers/net/ethernet/mediatek/mtk_ppe_regs.h  |  14 ++
> >   7 files changed, 178 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > index 789268b15106ec..5fcd66fca7a089 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > @@ -4221,6 +4223,7 @@ static const struct mtk_soc_data mt2701_data = {
> >   	.hw_features = MTK_HW_FEATURES,
> >   	.required_clks = MT7623_CLKS_BITMAP,
> >   	.required_pctl = true,
> > +	.has_accounting = false,
> >   	.txrx = {
> >   		.txd_size = sizeof(struct mtk_tx_dma),
> >   		.rxd_size = sizeof(struct mtk_rx_dma),
> > @@ -4239,6 +4242,7 @@ static const struct mtk_soc_data mt7621_data = {
> >   	.required_pctl = false,
> >   	.offload_version = 2,
> >   	.hash_offset = 2,
> > +	.has_accounting = false,
> >   	.foe_entry_size = sizeof(struct mtk_foe_entry) - 16,
> >   	.txrx = {
> >   		.txd_size = sizeof(struct mtk_tx_dma),
> > @@ -4259,6 +4263,7 @@ static const struct mtk_soc_data mt7622_data = {
> >   	.required_pctl = false,
> >   	.offload_version = 2,
> >   	.hash_offset = 2,
> > +	.has_accounting = true,
> >   	.foe_entry_size = sizeof(struct mtk_foe_entry) - 16,
> >   	.txrx = {
> >   		.txd_size = sizeof(struct mtk_tx_dma),
> > @@ -4278,6 +4283,7 @@ static const struct mtk_soc_data mt7623_data = {
> >   	.required_pctl = true,
> >   	.offload_version = 2,
> >   	.hash_offset = 2,
> > +	.has_accounting = false,
> >   	.foe_entry_size = sizeof(struct mtk_foe_entry) - 16,
> >   	.txrx = {
> >   		.txd_size = sizeof(struct mtk_tx_dma),
> > @@ -4296,6 +4302,7 @@ static const struct mtk_soc_data mt7629_data = {
> >   	.hw_features = MTK_HW_FEATURES,
> >   	.required_clks = MT7629_CLKS_BITMAP,
> >   	.required_pctl = false,
> > +	.has_accounting = true,
> >   	.txrx = {
> >   		.txd_size = sizeof(struct mtk_tx_dma),
> >   		.rxd_size = sizeof(struct mtk_rx_dma),
> > @@ -4315,6 +4322,7 @@ static const struct mtk_soc_data mt7986_data = {
> >   	.required_pctl = false,
> >   	.hash_offset = 4,
> >   	.foe_entry_size = sizeof(struct mtk_foe_entry),
> > +	.has_accounting = true,
> >   	.txrx = {
> >   		.txd_size = sizeof(struct mtk_tx_dma_v2),
> >   		.rxd_size = sizeof(struct mtk_rx_dma_v2),
> > @@ -4331,6 +4339,7 @@ static const struct mtk_soc_data rt5350_data = {
> >   	.hw_features = MTK_HW_FEATURES_MT7628,
> >   	.required_clks = MT7628_CLKS_BITMAP,
> >   	.required_pctl = false,
> > +	.has_accounting = false,
> >   	.txrx = {
> >   		.txd_size = sizeof(struct mtk_tx_dma),
> >   		.rxd_size = sizeof(struct mtk_rx_dma),
> You can leave out the .has_accounting = false assignments.
Ack.

> 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
> > index 2d8ca99f2467ff..bc4660da28451b 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_ppe.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
> > @@ -545,6 +592,16 @@ __mtk_foe_entry_commit(struct mtk_ppe *ppe, struct mtk_foe_entry *entry,
> >   	wmb();
> >   	hwe->ib1 = entry->ib1;
> > +	if (ppe->accounting) {
> > +		int type;
> > +
> > +		type = FIELD_GET(MTK_FOE_IB1_PACKET_TYPE, entry->ib1);
> > +		if (type >= MTK_PPE_PKT_TYPE_IPV4_DSLITE)
> > +			hwe->ipv6.ib2 |= MTK_FOE_IB2_MIB_CNT;
> > +		else
> > +			hwe->ipv4.ib2 |= MTK_FOE_IB2_MIB_CNT;
> > +	}
> Use mtk_foe_entry_ib2() here.

Ack, turns it into a one-liner ;)

> 
> > @@ -654,11 +711,8 @@ void __mtk_ppe_check_skb(struct mtk_ppe *ppe, struct sk_buff *skb, u16 hash)
> >   			continue;
> >   		}
> > -		if (found || !mtk_flow_entry_match(ppe->eth, entry, hwe)) {
> > -			if (entry->hash != 0xffff)
> > -				entry->hash = 0xffff;
> > +		if (found || !mtk_flow_entry_match(ppe->eth, entry, hwe))
> >   			continue;
> > -		}
> What is the reason for this change?

This has slipped in accidentally as it was part of the patch in
mtk-openwrt-feeds. I suppose it may be related to the rather mystical
2nd part of the commit message there:
Patches-4 fix __schedule_bug issue in the __mtk_foe_entry_clear().

However, as things seem to work just fine also without that I will send
v3 skipping this part.


Thanks for the review!


Daniel

