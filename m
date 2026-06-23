Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD95CDB470
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2026 20:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouMHGOvMc2V/MonYeZTIKoTCZTr7oOqL3Hc354KdZOA=; b=IrVuk9xbpnGZNUZmpRzHmKDh0V
	hT8ElaMcTPItoiL10ao9lbTQB63lzLp664o1ogeekLxkP1q9CBT6rDI61YTlNzibmxsjl0mOpvUxp
	faZfB23/s1bm1g385Do8G0TLy47jeI6rL5oea4SQGu73x+gaxmSy4TYCB42ImsRaBhKrN91ljcwe6
	+4marKDSw7eGDk1491YgmK7V3w9sB2wSLVRwnzUXA+jrg6eD77MQWOXB6NoGlSxiBaf4ds9kqX3lq
	ae6dhvL3xK74dBWcCUUSQdpCLHBH/C9Pzn1+Q+szuMZdO95b3Ek8JSW3wqGJP0dlc6jjABeyZITcK
	r5Fg/M4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7no-00000006qqq-30My;
	Tue, 23 Jun 2026 20:33:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7nm-00000006qqb-3bVb;
	Tue, 23 Jun 2026 20:32:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F067D60018;
	Tue, 23 Jun 2026 20:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EC01F000E9;
	Tue, 23 Jun 2026 20:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782246777;
	bh=ouMHGOvMc2V/MonYeZTIKoTCZTr7oOqL3Hc354KdZOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N/gAeghPXWBeOOzXW3MobOa/tkuES83zcd5MWcmhYfJrT45375eKspP20DNt/fq+8
	 9r79BBM2GV4GzdQofzhjudn6HhXfuQvX5WjygacOE1QINuHJT2cYaF9pZJRIsonKDz
	 TUpJU7hgm173+LuAaAtv6KYXU3z7P+CKf9XcQVsMtBN+PQpMNv3IBeBJ29gw3lJNyg
	 2+flqG/6SkILKa5URY89XXiVg3A+8Fq7StR+5quae5c6Col4I1Dbu7DwDtgRaIck5W
	 TT1aZ7Rz9tno+F1irbgeS+e5TXTiaTyP49sj5KFBL0E9qmjnVMhZbZSCPTLhXhqElp
	 sPPjTrLCOrpGA==
Date: Tue, 23 Jun 2026 22:32:55 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, leto.liu@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	brown.huang@airoha.com
Subject: Re: [PATCH net v2] net: airoha: Add retry mechanism to
 airoha_qdma_set_trtcm_param()
Message-ID: <ajrtd5WA2GFzQyV9@lore-desk>
References: <20260622-airoha_qdma_set_trtcm_param-retry-fix-v2-1-95a83ac99dbd@kernel.org>
 <20260623105341.1076863-3-horms@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UkOWUaq6LIU/PkBM"
Content-Disposition: inline
In-Reply-To: <20260623105341.1076863-3-horms@kernel.org>
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


--UkOWUaq6LIU/PkBM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 23, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://sashiko.dev
>=20
> Simon says: I'd appreciate it if you could look over the first two issues
>             flagged below in the context of this patch. While the third
> 	    and final issue looks like it is in possible separate follow-up
> 	    territory.
>=20
> ---
> net: airoha: Add retry mechanism to airoha_qdma_set_trtcm_param()
>    =20
> This patch introduces a retry loop to airoha_qdma_set_trtcm_param() to mi=
tigate
> bus timeouts when configuring QDMA parameters. It attempts to verify that=
 the
> configuration is correctly applied to the hardware.
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 3370c3df7c107..bb5c0599a4eed 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -2673,14 +2673,30 @@ static int airoha_qdma_set_trtcm_param(struct a=
iroha_qdma *qdma, int channel,
> >  		     FIELD_PREP(TRTCM_METER_GROUP_MASK, group) |
> >  		     FIELD_PREP(TRTCM_PARAM_INDEX_MASK, idx) |
> >  		     FIELD_PREP(TRTCM_PARAM_RATE_TYPE_MASK, mode);
> > +	int i;
> > =20
> > -	airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
> > -	airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
> > +	for (i =3D 0; i < 100; i++) {
> > +		u32 data;
> > =20
> > -	return read_poll_timeout(airoha_qdma_rr, val,
> > -				 val & TRTCM_PARAM_RW_DONE_MASK,
> > -				 USEC_PER_MSEC, 10 * USEC_PER_MSEC, true,
> > -				 qdma, REG_TRTCM_CFG_PARAM(addr));
> > +		airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
> > +		wmb();
> > +		airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
> > +
> > +		if (read_poll_timeout(airoha_qdma_rr, data,
> > +				      data & TRTCM_PARAM_RW_DONE_MASK,
> > +				      USEC_PER_MSEC, 10 * USEC_PER_MSEC,
> > +				      true, qdma, REG_TRTCM_CFG_PARAM(addr)))
> > +			return -ETIMEDOUT;
>=20
> [Severity: High]
> If a bus timeout causes the write phase's read_poll_timeout() in
> airoha_qdma_set_trtcm_param() to fail, this immediately returns -ETIMEDOU=
T,
> aborting the 100-iteration retry loop.
>=20
> Doesn't this defeat the mitigation?

I agree we just run 'continue' here instead of returing -ETIMEDOUT

>=20
> > +
> > +		if (airoha_qdma_get_trtcm_param(qdma, channel, addr, param,
> > +						mode, &data, NULL))
> > +			continue;
>=20
> [Severity: High]
> If airoha_qdma_get_trtcm_param() times out during the verification phase,=
 it
> indicates the hardware hasn't finished the read command (DONE bit is stil=
l 0).
>=20
> The continue statement then immediately starts the next iteration, writin=
g new
> commands to DATA_LOW and CFG_PARAM.
>=20
> Can writing to command registers while the hardware state machine is acti=
vely
> busy violate hardware protocols and lead to unrecoverable lockups?

@Brown and @Leto: can you please comment on this case?

>=20
> > +
> > +		if (data =3D=3D val)
> > +			return 0;
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but if the bus drops the comma=
nd
> write to REG_TRTCM_CFG_PARAM, the hardware never executes the command and=
 the
> TRTCM_PARAM_RW_DONE_MASK bit remains set from the previous operation.
>=20
> Consequently, read_poll_timeout() returns an immediate false success.
>=20
> If both the set and get command writes are dropped by the bus, the get
> operation will read back the newly written DATA_LOW register value.
>=20
> Will the data =3D=3D val check evaluate to true and falsely report succes=
s without
> the hardware ever processing the configuration?

This seems quite a 'pathological' scenario, is it really an issue?

Regards,
Lorenzo

>=20
> > +	}
> > +
> > +	return -EBUSY;
> >  }
> > =20
>=20
> [ ... ]
>=20
> >  static int airoha_qdma_set_trtcm_config(struct airoha_qdma *qdma, int =
channel,
> >  					u32 addr, enum trtcm_mode_type mode,
> >  					bool enable, u32 enable_mask)
> >  {
> >  	u32 val;
> > =20
> >  	if (airoha_qdma_get_trtcm_param(qdma, channel, addr, TRTCM_MISC_MODE,
> >  					mode, &val, NULL))
> >  		return -EINVAL;
>=20
> [Severity: High]
> Standalone calls to airoha_qdma_get_trtcm_param(), like this one in
> airoha_qdma_set_trtcm_config(), lack a retry loop entirely.
>=20
> Does this leave read-modify-write cycles fully vulnerable to the same bus
> timeouts the patch attempts to mitigate?
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but the patch mitigates bus
> timeouts in airoha_qdma_set_trtcm_param() while entirely missing
> airoha_qdma_set_rl_param().
>=20
> The latter performs the exact same write-and-poll sequence on identical Q=
DMA
> configuration registers:
>=20
> drivers/net/ethernet/airoha/airoha_eth.c:airoha_qdma_set_rl_param() {
>     ...
>     return read_poll_timeout(..., val & RATE_LIMIT_PARAM_RW_DONE_MASK, ..=
=2E);
> }
>=20
> If bus timeouts affect QDMA access broadly as stated in the commit messag=
e, are
> the rate-limiting configuration paths randomly vulnerable to the same fai=
lures?
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but in airoha_tc_remove_htb_qu=
eue(),
> hardware teardown incorrectly uses queue + 1 instead of queue:
>=20
> drivers/net/ethernet/airoha/airoha_eth.c:airoha_tc_remove_htb_queue() {
>     ...
>     airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0);
>     ...
> }
>=20
> Does this leave the removed queue's hardware limits permanently active
> (resource leak) and inadvertently disable the rate limits for queue + 1,
> corrupting the QoS state of another active channel?

--UkOWUaq6LIU/PkBM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajrtdwAKCRA6cBh0uS2t
rOA7AQCVwcnGTvgsBMt3sEm3xy+Xm0d3pO8aN3W5C9mTe6BnwAD/YJ+REZqwrvs3
BpaC9wSWuXEuVLVX0mq5PSr7zq6ucQQ=
=Z/ww
-----END PGP SIGNATURE-----

--UkOWUaq6LIU/PkBM--

