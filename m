Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0869C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 09:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMa0kJjbDp/RHRHSQL0NuquNsxt+1w7ne9NO5Vk64hc=; b=RdatBuVL+/T8aDBaXY8KfkQLPw
	Wgu6qN4Vi607/56wekQvp4lnbh2SLrTu3lSElNspIPmqZmyEOF2LFZoWYUkd2aFrEcVhM0Yk3Gxn+
	uhDUNJQYuV8+Y8IGnuji2/iU1FPvKgBwMoPhi4C/QLn5Xdj8y764uI0iPJygtKku8QW74y6wPUucz
	JfVLI9Mgcvvz9qliA4rXYPccfTFCeiaz8SRM6rljZS60xRSdzU8Yn8QhjqKgY9AKZ0AOPEWn0y99L
	7eAL3KqKPgHNYR4DvZ3GOzfuLa4VUCen7+Q+7kGoLkvp1avT4MQKHpJ/k/o/vtELSfZKr8z1swgwE
	e/3vF8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrGMt-001CSq-M6; Wed, 18 May 2022 09:53:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrGMq-001CQl-Oh
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 09:53:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BADE7617B2;
 Wed, 18 May 2022 09:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFF4C385AA;
 Wed, 18 May 2022 09:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652867596;
 bh=5gqBzS4hqEVHVcDeIKJ/pK7OHoUOClp7PDlQPjda0Io=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VQu+0AvIuaLFj51kcWbrHdXMufiGQ8dLdZrQMZlv9ew+7v1D5kCkTR+/hu9ihcKRJ
 Q8px1Mla06YbjbT0IYMlCndab+4tc1Wali8zfU/D2vwDHHaQar0KFyR4Fsyp6xRiCT
 Ufr2GX85FcQZwHyCv9SmbfCwsmqX72RWWHQyYFdybHhO2TKHVtiXoG8lFfw7ggQLvB
 sLfGqKxL+I43O2k8lhETvuFZSIGP5V+5beoQkSqPKXxiVb7DmdP/GiiGd3tgk1DJY+
 CbsK1PHAAC7Fvc8cFPELPKLIpO9Tpa5oSWfiizfdmLgai29x6qrPVNjA7PKMeNrqDi
 38tZC1y7ziuWg==
Date: Wed, 18 May 2022 11:53:12 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 Sam.Shih@mediatek.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 12/15] net: ethernet: mtk_eth_soc: introduce
 MTK_NETSYS_V2 support
Message-ID: <YoTCCAKpE5ijiom0@lore-desk>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <cc1bd411e3028e2d6b0365ed5d29f3cea66223f8.1652716741.git.lorenzo@kernel.org>
 <20220517184433.3cb2fd5a@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220517184433.3cb2fd5a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_025320_884540_7DEEEE2E 
X-CRM114-Status: GOOD (  14.68  )
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
Content-Type: multipart/mixed; boundary="===============0709371471657925407=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0709371471657925407==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="py/BeQuNQzkJfHTN"
Content-Disposition: inline


--py/BeQuNQzkJfHTN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 17, Jakub Kicinski wrote:
> On Mon, 16 May 2022 18:06:39 +0200 Lorenzo Bianconi wrote:
> > +	struct mtk_mac *mac =3D netdev_priv(dev);
> > +	struct mtk_tx_dma_v2 *desc =3D txd;
> > +	struct mtk_eth *eth =3D mac->hw;
> > +	u32 data;
> > +
> > +	WRITE_ONCE(desc->txd1, info->addr);
> > +
> > +	data =3D TX_DMA_PLEN0(info->size);
> > +	if (info->last)
> > +		data |=3D TX_DMA_LS0;
> > +	WRITE_ONCE(desc->txd3, data);
> > +
> > +	if (!info->qid && mac->id)
> > +		info->qid =3D MTK_QDMA_GMAC2_QID;
> > +
> > +	data =3D (mac->id + 1) << TX_DMA_FPORT_SHIFT_V2; /* forward port */
> > +	data |=3D TX_DMA_SWC_V2 | QID_BITS_V2(info->qid);
> > +	WRITE_ONCE(desc->txd4, data);
> > +
> > +	data =3D 0;
> > +	if (info->first) {
> > +		if (info->gso)
> > +			data |=3D TX_DMA_TSO_V2;
> > +		/* tx checksum offload */
> > +		if (info->csum)
> > +			data |=3D TX_DMA_CHKSUM_V2;
> > +	}
> > +	WRITE_ONCE(desc->txd5, data);
> > +
> > +	data =3D 0;
> > +	if (info->first && info->vlan)
> > +		data |=3D TX_DMA_INS_VLAN_V2 | info->vlan_tci;
> > +	WRITE_ONCE(desc->txd6, data);
> > +
> > +	WRITE_ONCE(desc->txd7, 0);
> > +	WRITE_ONCE(desc->txd8, 0);
>=20
> Why all the WRITE_ONCE()? Don't you just need a barrier between writing
> the descriptor and kicking the HW?=20

I used this approach just to be aligned with current codebase:
https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/mediatek=
/mtk_eth_soc.c#L1006
https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/mediatek=
/mtk_eth_soc.c#L1031

but I guess we can even convert the code to use barrier instead. Agree?

Regards,
Lorenzo

--py/BeQuNQzkJfHTN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYoTCCAAKCRA6cBh0uS2t
rFcEAPsEE4SH1pWFhrUuCVVh5wJ9R0iCDZrsIRMA13UFQ1FqcAEA/i7P7a2wwN3o
b/PBY5gsePzROcyMFUtToLos6mKsrwg=
=kZTh
-----END PGP SIGNATURE-----

--py/BeQuNQzkJfHTN--


--===============0709371471657925407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0709371471657925407==--

