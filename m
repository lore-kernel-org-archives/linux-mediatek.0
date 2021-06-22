Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC2DC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 06:41:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3B9661289
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 06:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3B9661289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXKjAnCkY3bi7u49jNMF7GIiNnN4vzNBn4YJOXDlgNA=; b=zKe4Mj4RP6MOpu/gNCga5daMjJ
	6nY4b0OOqFNTo2dYYYoYfChGVhLKKIDlBlz1Cx9yLeWwsv+vqeM2+flwtWvNrE2Fcn9NOQJkCBjCi
	SHYgndUXArR9LxMQVQruTKU0bGMx1slaSqA46ptg1vtjlvvquB3Iqmc4A9W3+L7oNHcCpUgr0Qfbg
	M8My/5yemqSXDWkWNuZBCetMdFO7SxNZ98yYYIUTp2zHvsi3A7CtG69dazyZiwNnlcsntJCzAsW+9
	hQM8c6x44IQE2HG2WM9F/9za/qs+Wwx3QzgdW/vPhYG2g6mqeiNZ6uV7WHsfqYQyN25MeAprx8ztV
	deCBzCiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lva5e-005r8j-45; Tue, 22 Jun 2021 06:40:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lva5a-005r6n-0G
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 06:40:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD443611CE;
 Tue, 22 Jun 2021 06:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624344049;
 bh=8IVeoj39SKXmg91zm5BlPJZ7feT5hJa+UWQdSelyYpE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q5Fo0hQOj+PgJXEE8O8+cJkzFlyJ/iY5e4XbvTZNMZSR/A4QpP/hHGZ/v/P2/UK8R
 kCOVTfq7tmpzeaCsxeKBwBTV7lbywvGJ2Gqi43GOF121RPi8K3niEsimgGXDxR+2nT
 LXxun14q6ObSb0hII/5NU/MhaakH1ApC0EqRbTUfEcDziiatm1qN7921XEzXUagJHQ
 DeU2xBtraxoNZ0ruMAS38n1gcSl8pwiH7AZvuQiMXwE6ymtjf62SqJirdFeIXyxnW0
 PsV2I/PVWWAb8qaOV0O0D45z3Mwq/hO8iIXY5lFOpv8mGg2YEqG7YPmUSUl3CPK058
 qwIeJOXKvlj4g==
Date: Tue, 22 Jun 2021 08:40:44 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: lorenzo.bianconi@redhat.com, nbd@nbd.name, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, jemele@google.com, yenlinlai@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: add .set_sar_specs support
Message-ID: <YNGF7Bl2uP0SAnv9@lore-desk>
References: <YM8NBUZp+/97kiIH@lore-desk--annotate>
 <1624315331-16608-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1624315331-16608-1-git-send-email-sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_234050_104337_98EAF4A7 
X-CRM114-Status: GOOD (  12.13  )
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
Content-Type: multipart/mixed; boundary="===============0247006163745138976=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0247006163745138976==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gGYiClTCWJBu/p1R"
Content-Disposition: inline


--gGYiClTCWJBu/p1R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[...]
> >
> >I guess there is an use-after-free here since sar is freed at the end of=
 nl80211_set_sar_specs, right?
> >
>=20
> Nope, there is no use-after-free case happens here because frp->range jus=
t points to an entry of const struct cfg80211_sar_specs table, not the one =
created from nl80211_set_sar_specs.

ack, right. I misread the code.

Regards,
Lorenzo

>=20
> >Regards,
> >Lorenzo
> >
> >> +		frp->power =3D power;
> >> +	}
> >> +
> >> +	err =3D mt76_connac_mcu_set_rate_txpower(mphy);
> >> +
> >> +out:
> >> +	mt7921_mutex_release(dev);
> >> +
> >> +	return err;
> >> +}
> >> +
> >>  const struct ieee80211_ops mt7921_ops =3D {
> >>	.tx =3D mt7921_tx,
> >>	.start =3D mt7921_start,
> >> @@ -1209,4 +1253,5 @@ const struct ieee80211_ops mt7921_ops =3D {
> >>	.set_rekey_data =3D mt7921_set_rekey_data,  #endif /* CONFIG_PM */
> >>	.flush =3D mt7921_flush,
> >> +	.set_sar_specs =3D mt7921_set_sar_specs,
> >>  };
> >> --
> >> 2.25.1
> >>

--gGYiClTCWJBu/p1R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYNGF5wAKCRA6cBh0uS2t
rBhsAP95npOocHCGoicDiaIO8Uf1rLxnUf6RItP8GT8jhzI96wD9Grh9Tc8PSd/+
JGauE3SBfDXGS9Ey6tjP/AIhbplcdgY=
=rm2D
-----END PGP SIGNATURE-----

--gGYiClTCWJBu/p1R--


--===============0247006163745138976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0247006163745138976==--

