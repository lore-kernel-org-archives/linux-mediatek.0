Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243B5606A888
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4nr63t12;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hviX8UjR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jm+zkfC0aDj61p8db3QGEDzyqPbTXKA6Lfv6ZVi5xO8=; b=4nr63t12IBvoU0xbyyNJMZPMC5
	sAglqb9/+xx1xzTel16DYtlnIHLc1Qw/xn7jFvhfUHvcy5psZ9Sa/4NSy0R4Jpd4utZtmBzvovwWh
	SjO/LNVWHXoEJ5kAWZJPVm/YTicffjmxzxSTGD6ZUDCfR3hZJeA5+ZGmDI8wEu9NavFlFQ1Wabc/W
	9OkBkDDF92hl0xol7PxBNvs497Zm4I1x6sQ8TdXwh6EwXC52MxU+kC5ZRIcefCsuk5WOPOL5hz4Zg
	JfXpJxOBdiorYnkmAPmtXphrTXIxev6xEJ4QTiqdeWumegBKy/APcu/nOie6ezoIAULRMg+OMCMi0
	c/Gr8sJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSu91-00000001zZn-3dFZ;
	Mon, 16 Nov 2026 10:41:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSu90-00000001zZA-35GG;
	Mon, 16 Nov 2026 10:41:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B054F60D4C;
	Mon, 16 Nov 2026 10:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14B91F000C4;
	Mon, 16 Nov 2026 10:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825661;
	bh=jm+zkfC0aDj61p8db3QGEDzyqPbTXKA6Lfv6ZVi5xO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hviX8UjRlp9SSmeSVwQw+1RcH1nPyk3wSOCHzD9L1z27BA+RXfULG37781lY4MoRb
	 MsHLgBQ11vtYaHKZDBXc2tn+ZvBFgTgLUCJQsr1VOoPRpED9AwnC8eqWpLazGATxBg
	 w+ZK+QYX1fZ17uMLXqH2A3k6WJs+HZ5No9OSisLP2cemi4s0c9dZ1Wkzmo61fxDaZr
	 oDHmm293H76V76MRhIR2DSG6CJiMn+vYflZILXepWst1txc0y++Rc0BnHrmN+c9i6k
	 HsdtCaceilkyYOEbJYWt/1C8h3XABW0UA/rIKiv8SvX3ClQVjwnlxtHfgSkL092SqG
	 hHnjN1LMXa0bA==
Date: Mon, 16 Nov 2026 11:40:59 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Florian Maurer <fmaurer@disroot.org>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/2] wifi: mt76: npu: return rx slots to the NPU
 only after refilling them
Message-ID: <avrdu8qr9L2sEuTz@lore-desk>
References: <cover.1793927986.git.fmaurer@disroot.org>
 <d6314f34e0965464207656d38a145490b6437aa5.1793927986.git.fmaurer@disroot.org>
 <au3igPTxdz3i64SO@lore-desk>
 <20261108205350.2956138-1-fmaurer@disroot.org>
 <avGnv8Jr7BAiQhG1@lore-desk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LqmHgd5bDG2pnVB6"
Content-Disposition: inline
In-Reply-To: <avGnv8Jr7BAiQhG1@lore-desk>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--LqmHgd5bDG2pnVB6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > On Fri, Nov 06, 2026 at 03:21:52PM +0100, Lorenzo Bianconi wrote:
> > >> +	Q_WRITE(q, dma_idx, (q->head + 1) % q->ndesc);
> > >
> > > why are you writing q->head here?
> >=20
> > Once the ring is full, (q->head + 1) % q->ndesc =3D=3D q->tail, so the
> > value is the same as today. Only the timing changes: the slots go back
> > to the NPU after they have a new buffer, not before.
> >=20
> > The +1 assumes the NPU completes slots only up to dma_idx - 2. Every
>=20
> I guess this is used to mark what is the next index the mt76 driver is
> expecting but I guess airoha folks can provide more details about it.
>=20
> > slot it can still complete then lies between its own position and
> > q->head - 1. The host has not consumed those yet, so they still have a
> > buffer. If the refill fails, the same value is written again and the
> > ring stalls instead of handing back an empty slot. A debug patch that
> > cleared DONE after each consumed slot saw no slot completed early in
> > 60 minutes of rx load, though I can't tell how often the NPU reached
> > that slot. Can you confirm this is how the NPU treats dma_idx?
>=20
> q->head and q->tail are not the same when we have refilled the queue with=
 new
> buffers. Moreover, I think if mt76_npu_fill_rx_queue() fails (so mt76_get=
_page_pool_buf()
> returns NULL) it is not correct to use q->head for dma_idx, we should use=
 q->tail.
>=20
> >=20
> > >> +	if (nframes > q->queued)
> > >> +		return NULL;
>=20
> Can you please check the updated patch below?
>=20
> > >
> > > can this really occur?
> >=20
> > I have not seen it. The slot at q->head is never cleared while the ring
> > is full: it is the one kept free, consumed in the previous round, so it
> > still has DONE set. If the NPU has completed the first slots of a frame
> > up to q->head - 1, the count reaches past q->queued and the next DONE
> > check finds that stale bit. A page pool failure makes the stale region
> > larger.
> >=20
> > > I got your time, and I agree this is an issue we need to fix but I gu=
ess we
> > > should avoid a double loop. What about the patch below? (just compile=
d and not
> > > tested).
> >=20
> > Keeping the partial frame in q->rx_head is nicer, and it lets the slots
> > of a half-received frame be refilled early. Comments inline.
> >=20
> > > +	if (!nframes) {
> > > +		nframes =3D FIELD_GET(NPU_RX_DMA_PKT_COUNT_MASK,
> > > +				    desc[q->tail].info);
> > > +		nframes =3D max_t(int, nframes, 1);
> > > +	}
> >=20
> > PKT_COUNT is read before DONE of this slot, see my reply to 2/2. Once
> > q->pending keeps the count across polls, a stale count of 1 would
> > stick. On top of your patch, something like (not compiled):
> >=20
> > 	if (!nframes) {
> > 		u32 ctrl =3D READ_ONCE(desc[q->tail].ctrl);
> >=20
> > 		if (!q->queued || !FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, ctrl))
> > 			return -EBUSY;
> >=20
> > 		/* PKT_COUNT is only valid once the first slot is complete */
> > 		dma_rmb();
> > 		nframes =3D FIELD_GET(NPU_RX_DMA_PKT_COUNT_MASK,
> > 				    desc[q->tail].info);
> > 		nframes =3D max_t(int, nframes, 1);
>=20
> ack, I can fix it.
>=20
> > 	}
> >=20
> > > +	while (nframes > 0) {
> > > +		struct mt76_queue_entry *e =3D &q->entry[q->tail];
> > >  		int len =3D FIELD_GET(NPU_RX_DMA_DESC_CUR_LEN_MASK,
> > > -				    desc[index].ctrl);
> > > +				    desc[q->tail].ctrl);
> > [...]
> > > +		if (!FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, desc[q->tail].ctrl))
> > > +			return -EBUSY;
> >=20
> > Three things here:
> >=20
> > - ctrl is loaded twice, so len can come from before the slot was
> >   completed.
>=20
> ack, I can fix it.
>=20
> > - Nothing stops the loop at q->queued =3D=3D 0, so it can take the stale
> >   slot at q->head, whose buffer already belongs to an skb, and
> >   q->queued goes negative.
>=20
> please see above
>=20
> > - q->pending is never set, so after -EBUSY the next poll reads
> >   PKT_COUNT from desc[q->tail].info, which is now a later slot of the
> >   same frame.
>=20
> I can fix it.
>=20
> >=20
> > So:
> >=20
> > 		u32 ctrl =3D READ_ONCE(desc[q->tail].ctrl);
> > 		int len;
> >=20
> > 		if (!q->queued || !FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, ctrl)) {
> > 			q->pending =3D nframes;
> > 			return -EBUSY;
> > 		}
> >=20
> > 		dma_rmb();
> > 		len =3D FIELD_GET(NPU_RX_DMA_DESC_CUR_LEN_MASK, ctrl);
> >=20
> > [...]
> > >  	Q_WRITE(q, dma_idx, q->tail);
> >=20
> > This still hands the slots back before mt76_npu_fill_rx_queue() refills
> > them, so the oops is still there. It needs to stay at the end of the
> > refill as in my patch. With your structure that also lets a frame that
> > runs into the free slot finish, since the NPU gets new slots after
> > every poll.
>=20
> I guess q->tail should point to the next already allocated buffer, right?=
 The
> only corner case is when we consume the all the allocated buffers. In thi=
s case
> we should wait to update it. Do you agree? Can you please check the updat=
ed
> patch below?
>=20
> >=20
> > I can fold this into a v2, test it on the W1700K for 60 minutes under
> > rx load, this time with a counter for misframed frames, and send it
> > with the results. Since the structure is yours, I'd add
> > Co-developed-by and your Signed-off-by if that's fine with you. If
> > you'd rather post it yourself, I'll test yours instead.
>=20
> Sure, feel free to add your Co-developed-by tag if the patch below works.
>=20
> Regards,
> Lorenzo
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index 2ade848fe3bb..9537c6d28e8d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -249,6 +249,7 @@ struct mt76_queue {
>  	int ndesc;
>  	int queued;
>  	int buf_size;
> +	int pending;
>  	bool stopped;
>  	bool blocked;
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/npu.c b/drivers/net/wirel=
ess/mediatek/mt76/npu.c
> index c4c7c0af6321..3ca83985376d 100644
> --- a/drivers/net/wireless/mediatek/mt76/npu.c
> +++ b/drivers/net/wireless/mediatek/mt76/npu.c
> @@ -56,61 +56,81 @@ void mt76_npu_queue_cleanup(struct mt76_dev *dev, str=
uct mt76_queue *q)
>  		q->tail =3D (q->tail + 1) % q->ndesc;
>  		q->queued--;
>  	}
> +	if (q->rx_head) {
> +		dev_kfree_skb(q->rx_head);
> +		q->rx_head =3D NULL;
> +		q->pending =3D 0;
> +	}
>  	spin_unlock_bh(&q->lock);
>  }
> =20
> -static struct sk_buff *mt76_npu_dequeue(struct mt76_dev *dev,
> -					struct mt76_queue *q,
> -					u32 *info)
> +static int mt76_npu_rx_process_entry(struct napi_struct *napi)
>  {
> +	struct mt76_dev *dev =3D mt76_priv(napi->dev);
> +	enum mt76_rxq_id qid =3D napi - dev->napi;
> +	struct mt76_queue *q =3D &dev->q_rx[qid];
>  	struct airoha_npu_rx_dma_desc *desc =3D (void *)q->desc;
> -	int i, nframes, index =3D q->tail;
> -	struct sk_buff *skb =3D NULL;
> +	int nframes =3D q->pending;
> +	u32 info =3D 0;
> +
> +	do {
> +		struct mt76_queue_entry *e =3D &q->entry[q->tail];
> +		u32 ctrl =3D READ_ONCE(desc[q->tail].ctrl);
> +		int len;
> =20
> -	nframes =3D FIELD_GET(NPU_RX_DMA_PKT_COUNT_MASK, desc[index].info);
> -	nframes =3D max_t(int, nframes, 1);
> +		if (!q->queued) {
> +			q->pending =3D nframes;
> +			return -EBUSY;
> +		}
> =20
> -	for (i =3D 0; i < nframes; i++) {
> -		struct mt76_queue_entry *e =3D &q->entry[index];
> -		int len =3D FIELD_GET(NPU_RX_DMA_DESC_CUR_LEN_MASK,
> -				    desc[index].ctrl);
> +		if (!FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, ctrl)) {
> +			q->pending =3D nframes;
> +			return -EBUSY;
> +		}
> =20
> -		if (!FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, desc[index].ctrl)) {
> -			dev_kfree_skb(skb);
> -			return NULL;
> +		dma_rmb();
> +		len =3D FIELD_GET(NPU_RX_DMA_DESC_CUR_LEN_MASK, ctrl);
> +		info =3D desc[q->tail].info;
> +		if (nframes =3D=3D q->pending && !nframes) {
> +			nframes =3D FIELD_GET(NPU_RX_DMA_PKT_COUNT_MASK, info);
> +			nframes =3D max_t(int, nframes, 1);
>  		}
> =20
>  		dma_sync_single_for_cpu(dev->dma_dev, e->dma_addr[0],
>  					e->dma_len[0],
>  					page_pool_get_dma_dir(q->page_pool));
> =20
> -		if (!skb) {
> -			skb =3D napi_build_skb(e->buf, q->buf_size);
> -			if (!skb)
> -				return NULL;
> +		if (!q->rx_head) {
> +			q->rx_head =3D napi_build_skb(e->buf, q->buf_size);
> +			if (!q->rx_head)
> +				return -ENOMEM;
> =20
> -			__skb_put(skb, len);
> -			skb_reset_mac_header(skb);
> -			skb_mark_for_recycle(skb);
> +			__skb_put(q->rx_head, len);
> +			skb_reset_mac_header(q->rx_head);
> +			skb_mark_for_recycle(q->rx_head);
>  		} else {
> -			struct skb_shared_info *shinfo =3D skb_shinfo(skb);
> +			struct skb_shared_info *shinfo =3D skb_shinfo(q->rx_head);
>  			struct page *page =3D virt_to_head_page(e->buf);
>  			int nr_frags =3D shinfo->nr_frags;
> =20
>  			if (nr_frags < ARRAY_SIZE(shinfo->frags))
> -				skb_add_rx_frag(skb, nr_frags, page,
> +				skb_add_rx_frag(q->rx_head, nr_frags, page,
>  						e->buf - page_address(page),
>  						len, q->buf_size);
>  		}
> =20
> -		*info =3D desc[index].info;
> -		index =3D (index + 1) % q->ndesc;
> -	}
> -	q->tail =3D index;
> -	q->queued -=3D i;
> +		q->tail =3D (q->tail + 1) % q->ndesc;
> +		q->queued--;
> +	} while (--nframes > 0);
> +
> +	dev->drv->rx_skb(dev, qid, q->rx_head, &info);
> +	mt76_rx_poll_complete(dev, qid, napi);
> +	q->rx_head =3D NULL;
> +	q->pending =3D 0;
> +
>  	Q_WRITE(q, dma_idx, q->tail);
> =20
> -	return skb;
> +	return 0;
>  }
> =20
>  void mt76_npu_check_ppe(struct mt76_dev *dev, struct sk_buff *skb,
> @@ -155,18 +175,10 @@ static int mt76_npu_rx_poll(struct napi_struct *nap=
i, int budget)
>  		goto out;
> =20
>  	while (done < budget) {
> -		struct sk_buff *skb;
> -		u32 info =3D 0;
> -
> -		skb =3D mt76_npu_dequeue(dev, &dev->q_rx[qid], &info);
> -		if (!skb)
> +		if (mt76_npu_rx_process_entry(napi))
>  			break;
> -
> -		dev->drv->rx_skb(dev, qid, skb, &info);
> -		mt76_rx_poll_complete(dev, qid, napi);
>  		done++;
>  	}
> -
>  	mt76_npu_fill_rx_queue(dev, &dev->q_rx[qid]);
>  out:
>  	if (done < budget && napi_complete(napi))
>=20
> >=20
> > Thanks,
> > Florian

Hi Florian,

do you have any update about this patch?

Regards,
Lorenzo


--LqmHgd5bDG2pnVB6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavrduwAKCRA6cBh0uS2t
rDMpAQDj3gXJCZXk4KYSPUnFroGe3NPfTuFQI0zqSsQ6EVM3EwD9H4j6NULngp1s
pD6aFOP5EF74nh4wUivMWDCFKmJStAo=
=7q7A
-----END PGP SIGNATURE-----

--LqmHgd5bDG2pnVB6--

