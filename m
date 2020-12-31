Return-Path: <SRS0=2t6o=GD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77352C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 10:09:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB2E2158C
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 10:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDB2E2158C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xJWnLRDN/51QepS7CBLXMFX8F+gI+2lbtdcjwOFfSsM=; b=qpIVNcYnSW/JfeVNrGqK0xbXb
	I1NqPR0WXfD/RFjZ/38T5ZNQQ+TCsB59jZoggWMh94koVYKE9D1FbkJ6nSXbUN5XJHPCZlMVg85Cp
	Z7p9eOmUXhi3I0hN1qy7n+esbEw+9CyqpAwlKqj2eIjc5ttWOpl2qc0d0asyFaaBAxsmBCVP9eGyF
	4wn4NnSExjIbSKB4mChtUsCKSZqrnGW+kPiwIzaLnRkW1ruks/IuBl+w7ETfB+4WMOfZB9VKvk6mS
	pqZOpTJ9E60m9IizcLuhhIjVaYbuUA2FaqwOmP95aqrSEIt8YeGjwRZ5cgcoTJrDra+M2n5cM3dZl
	+HA2koTLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuutM-00061K-L6; Thu, 31 Dec 2020 10:09:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuutJ-00060v-Rw
 for linux-mediatek@lists.infradead.org; Thu, 31 Dec 2020 10:09:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58F4A207A3;
 Thu, 31 Dec 2020 10:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609409347;
 bh=d7t6jUuuirI4aZvjNFGRK+ftezBCarKE5fHOLdqpTcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q5lnce7m3LK9x6Tbzp3a3PzmmpN9FUxvSNv7PYPQVCUtHqvVkP+GEgxdiNyVE3zWI
 fRILM57WCz9PBAcabFcvUaWmHul0ksNf+3rmhVd0xFbJkc/pvzXxtJCdkmSOdVCvL7
 xQUHgCtuA1ew2D/nPk78WOmwez7Se0o+RAZiycdSHTFn47XpolP76ybRjnbV0OWLCd
 n3uwugb4cGy/Et4JsCmARIP3x3YH8lqDyLbu2wBfY1yAcz4Pm3iNnlFUowFZVtnzPO
 eDJFzKYYDowvO9P8IGQwtZwaTBAgso3cx4V1Nes/K14FrfvOHZT0Zz2cB2OKbyoGSV
 yLOd60RWO/9dA==
Date: Thu, 31 Dec 2020 11:09:18 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] mt76: Fix queue ID variable types after mcu queue split
Message-ID: <20201231100918.GA1819773@computer-5.station>
References: <20201229211548.1348077-1-natechancellor@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201229211548.1348077-1-natechancellor@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_050910_299700_C6351F41 
X-CRM114-Status: GOOD (  19.29  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felix Fietkau <nbd@nbd.name>
Content-Type: multipart/mixed; boundary="===============7968982627562550029=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7968982627562550029==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Clang warns in both mt7615 and mt7915:
>=20
> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:271:9: warning: implicit
> conversion from enumeration type 'enum mt76_mcuq_id' to different
> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>                 txq =3D MT_MCUQ_FWDL;
>                     ~ ^~~~~~~~~~~~
> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:278:9: warning: implicit
> conversion from enumeration type 'enum mt76_mcuq_id' to different
> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>                 txq =3D MT_MCUQ_WA;
>                     ~ ^~~~~~~~~~
> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:282:9: warning: implicit
> conversion from enumeration type 'enum mt76_mcuq_id' to different
> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>                 txq =3D MT_MCUQ_WM;
>                     ~ ^~~~~~~~~~
> 3 warnings generated.
>=20
> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:238:9: warning: implicit
> conversion from enumeration type 'enum mt76_mcuq_id' to different
> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>                 qid =3D MT_MCUQ_WM;
>                     ~ ^~~~~~~~~~
> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:240:9: warning: implicit
> conversion from enumeration type 'enum mt76_mcuq_id' to different
> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>                 qid =3D MT_MCUQ_FWDL;
>                     ~ ^~~~~~~~~~~~
> 2 warnings generated.
>=20
> Use the proper type for the queue ID variables to fix these warnings.
> Additionally, rename the txq variable in mt7915_mcu_send_message to be
> more neutral like mt7615_mcu_send_message.
>=20
> Fixes: e637763b606b ("mt76: move mcu queues to mt76_dev q_mcu array")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1229
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c |  2 +-
>  drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mcu.c
> index a44b7766dec6..c13547841a4e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> @@ -231,7 +231,7 @@ mt7615_mcu_send_message(struct mt76_dev *mdev, struct=
 sk_buff *skb,
>  			int cmd, int *seq)
>  {
>  	struct mt7615_dev *dev =3D container_of(mdev, struct mt7615_dev, mt76);
> -	enum mt76_txq_id qid;
> +	enum mt76_mcuq_id qid;
> =20
>  	mt7615_mcu_fill_msg(dev, skb, cmd, seq);
>  	if (test_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state))
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mcu.c
> index 5fdd1a6d32ee..e211a2bd4d3c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -256,7 +256,7 @@ mt7915_mcu_send_message(struct mt76_dev *mdev, struct=
 sk_buff *skb,
>  	struct mt7915_dev *dev =3D container_of(mdev, struct mt7915_dev, mt76);
>  	struct mt7915_mcu_txd *mcu_txd;
>  	u8 seq, pkt_fmt, qidx;
> -	enum mt76_txq_id txq;
> +	enum mt76_mcuq_id qid;
>  	__le32 *txd;
>  	u32 val;
> =20
> @@ -268,18 +268,18 @@ mt7915_mcu_send_message(struct mt76_dev *mdev, stru=
ct sk_buff *skb,
>  		seq =3D ++dev->mt76.mcu.msg_seq & 0xf;
> =20
>  	if (cmd =3D=3D -MCU_CMD_FW_SCATTER) {
> -		txq =3D MT_MCUQ_FWDL;
> +		qid =3D MT_MCUQ_FWDL;
>  		goto exit;
>  	}
> =20
>  	mcu_txd =3D (struct mt7915_mcu_txd *)skb_push(skb, sizeof(*mcu_txd));
> =20
>  	if (test_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state)) {
> -		txq =3D MT_MCUQ_WA;
> +		qid =3D MT_MCUQ_WA;
>  		qidx =3D MT_TX_MCU_PORT_RX_Q0;
>  		pkt_fmt =3D MT_TX_TYPE_CMD;
>  	} else {
> -		txq =3D MT_MCUQ_WM;
> +		qid =3D MT_MCUQ_WM;
>  		qidx =3D MT_TX_MCU_PORT_RX_Q0;
>  		pkt_fmt =3D MT_TX_TYPE_CMD;
>  	}
> @@ -326,7 +326,7 @@ mt7915_mcu_send_message(struct mt76_dev *mdev, struct=
 sk_buff *skb,
>  	if (wait_seq)
>  		*wait_seq =3D seq;
> =20
> -	return mt76_tx_queue_skb_raw(dev, mdev->q_mcu[txq], skb, 0);
> +	return mt76_tx_queue_skb_raw(dev, mdev->q_mcu[qid], skb, 0);
>  }
> =20
>  static void
>=20
> base-commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
> --=20
> 2.30.0
>=20

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCX+2jTAAKCRA6cBh0uS2t
rAxYAP0f0XgVE5eJY2f4tP7MT5fX7WJ8MmFaiXKtkd+0UVZsLQD+JJVnlAsbv2g0
9j+j5nl0uK4wtbnOauzQykFDergmVAY=
=7ZmF
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--


--===============7968982627562550029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7968982627562550029==--

