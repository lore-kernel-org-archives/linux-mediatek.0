Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD50EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPf+RlKCWYeJ2aVI3eNR9jEFVj+GLbPZKNJRCgguFF0=; b=vq2U/jYv5lP4A4jvz9hiUwCRY2
	NNhaqFsSWY/byjsNpyAkuZa9m7UdqbghgVVAeCYac1aZ7GS/wcUYvcj/xbUNo88QQN9nStWOqwB8J
	UBQN9HaAer41E2m9RvlWxYCnVAwEnKEpUUlJta9vpcZdecwtNy7GF5vdzB1xLd6K2r2PdnRA4UEIP
	aBWp4XTaRwgQGa4CDpjsQyyG2kItx5HmhVBZV7qb7Uiy0ssbXbv0Ibdfwe9VkDDAMqt6i2KG3C15g
	2Xa2jUxUyAo2qKnEYtUdLKIZ19ZdAVNWYbFGge+UWxzSsLCTCoPrjXp0AqghXcP6K8Y851+9CckEe
	G3JYD/zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpB1t-00H0eu-DL; Mon, 22 Nov 2021 15:14:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpB1q-00H0dp-Ja
 for linux-mediatek@lists.infradead.org; Mon, 22 Nov 2021 15:14:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A726D60F25;
 Mon, 22 Nov 2021 15:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637594086;
 bh=OH6FgXhpWT9k5P7jfUy+KIL7OhDtxFhPgZSvVtlxFB4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BQW28OH0c9j2B2t3iZBaqmbW2icgiJZ4Xrkkl4fqk+nKprgwAZyBo1aiT4ZXedny0
 SrcNuu1hXHnCC2fYRDktudRD0rKk+z4lPLyXj8fLLnKtx8p4G3NnVNSUU+ocM7PLBr
 dAshLImWGiMen6dIGqpal9EAJ0PzmU3B3r+G5FK2w5kC7kD6mygii2TCIKV5xK4FSs
 W1bjc9QzOiUVo1Wnpg06wFu6wKzkKDDFGkC121m/bZSoBLGqHtLNt3KjTjO5mnbWsa
 NcIYosD/2BJSKPpFXfypc7BwGJpRIKdQRA0q75wIoPGExABWDxzTH78mvwf15QNRAz
 nkdCPTjwmKVYw==
Date: Mon, 22 Nov 2021 16:14:42 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Deren Wu <Deren.Wu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>,
 CH Yeh <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>,
 Eric Liang <Eric.Liang@mediatek.com>,
 Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7921: fix timestamp check in tx_status
Message-ID: <YZuz4rJvinnT69tq@lore-desk>
References: <934b51921e22ca6f8983d7cbd9feb5248f804303.1637590567.git.deren.wu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <934b51921e22ca6f8983d7cbd9feb5248f804303.1637590567.git.deren.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_071446_689084_D8B5C5F9 
X-CRM114-Status: GOOD (  15.12  )
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
Content-Type: multipart/mixed; boundary="===============3721002794840422281=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3721002794840422281==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="673l5YOoA4Vyf7tW"
Content-Disposition: inline


--673l5YOoA4Vyf7tW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Deren Wu <deren.wu@mediatek.com>
>=20
> Should keep SKBs only if timeout timestamp is still after jiffies.
> Otherwise, report tx status and drop it direclty.
>=20
> Fixes: bd1e3e7b693c ("mt76: introduce packet_id idr")
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> ---

I guess this fix should go in wireless-drivers tree.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>  drivers/net/wireless/mediatek/mt76/tx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wirele=
ss/mediatek/mt76/tx.c
> index 11719ef034d8..6b8c9dc80542 100644
> --- a/drivers/net/wireless/mediatek/mt76/tx.c
> +++ b/drivers/net/wireless/mediatek/mt76/tx.c
> @@ -173,7 +173,7 @@ mt76_tx_status_skb_get(struct mt76_dev *dev, struct m=
t76_wcid *wcid, int pktid,
>  			if (!(cb->flags & MT_TX_CB_DMA_DONE))
>  				continue;
> =20
> -			if (!time_is_after_jiffies(cb->jiffies +
> +			if (time_is_after_jiffies(cb->jiffies +
>  						   MT_TX_STATUS_SKB_TIMEOUT))
>  				continue;
>  		}
> --=20
> 2.18.0
>=20

--673l5YOoA4Vyf7tW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYZuz4gAKCRA6cBh0uS2t
rEFuAP97vLFYKpu0U8Rl6cOHSd6z6G8TGo+93uHanRCsuZQ5WAEA0b0MKC462mlF
w5IkoKlkba+PMqAWwyuq8Pm4RLG8pwA=
=JGvl
-----END PGP SIGNATURE-----

--673l5YOoA4Vyf7tW--


--===============3721002794840422281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3721002794840422281==--

