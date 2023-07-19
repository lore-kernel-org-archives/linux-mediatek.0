Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603DEEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 07:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7xRfRSvgVVrhgxbOcK9k3MGaaEalRaBl97IvWBViA4=; b=BD9g6w+vI/0OoxZtAkelWYjUMc
	WbR38fCQH18jLabG1EzhNQt3TowKMhpaTRB2GBz7GnLYRQkjaboLScd5i8an2FLrFM1XYk0k2nirm
	z0wA3+qAs5ipP1K694Wuu9QuOV3Hkp18muOjP5bgiku79/0SbDea6Ib7Ih89coe+RQpCCUjHFkq1U
	xdfbd0HMa64io5cN1wqjZK0CUR0XldkdDo/9ko03gpWu2wEGpZp06FxSnM5IsslHmmTwa2SX0bKGF
	zez2s43JTyremJxKly1vlPy8jEL34m18bBgf6eiaDe7CFVUlGLSX2RGujvpZ9/yPnPrveWgqRn2KN
	cLFtFguQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1sz-00687U-0l;
	Wed, 19 Jul 2023 07:46:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1sx-00686r-1j
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 07:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=R7xRfRSvgVVrhgxbOcK9k3MGaaEalRaBl97IvWBViA4=; b=I6MaecFUqIdyo8rmuh1/qu4Wj2
	846RDYcDtkBOJ/Tiyq4V9erbuLcncYfHtuD7bAhrcD8/45gZJUE+HTa7Lopz4lr8F9Ab7huGlTqbc
	44MQkQnqvnJhkzwhMwblpN9F2YgLHh4bIiY/r+tMMS1VUHnPE6meyn8zDnpVEBryVXzKxlZGrw4aT
	RIsgEgveexo2MhSl/90cDvt8elTzXYrw5lnqySeiVcCXKIz7neL08XvG/ClGWHQ1Mjxa50uVaaZyF
	lDdj4cMKkzkPvucxHGpleEHKChXlCZ/pBMLIxBgotENv98YBZucS86ok3PFVpwrQkkbK5+VZ1B79S
	rGtvcA4w==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1ss-00DSpI-1c
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jul 2023 07:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689752751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R7xRfRSvgVVrhgxbOcK9k3MGaaEalRaBl97IvWBViA4=;
	b=UD12wRActMb/ZA2W+kOW5FHcvugbG2YlxCLSXovHW6M5OSMsRXQ519C7LqV2PqtvU7soGZ
	ZxFUf1yePsxUwciFSMPMywR89rBktrhsqlwHpE6uBZI7izY9fU6w2AYdGbHDL/7IoLmPzc
	wvAV+Tx8ALkaD57C+jp9jEUXErfgVlg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689752759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R7xRfRSvgVVrhgxbOcK9k3MGaaEalRaBl97IvWBViA4=;
	b=LAOrIwFlApDYmfj+hGiIkNzaG5yLbkPTEAxK7f1vS4L7TM4wu6zQqNA4El+hquOn0rAf4A
	SsCeeBNZ/Z+G8vVTMl206slK8XjpKdtXkSkkTKo3lgx04VXaLX6XnS5pl+wEs54HTcn0Kb
	JX/oFpA3d2HdhOXEalZfHBkuTzB85ko=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-UGA6pw2yN_6xWcYT-UciPw-1; Wed, 19 Jul 2023 03:45:49 -0400
X-MC-Unique: UGA6pw2yN_6xWcYT-UciPw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fbfc766a78so36950385e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jul 2023 00:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689752749; x=1690357549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7xRfRSvgVVrhgxbOcK9k3MGaaEalRaBl97IvWBViA4=;
        b=ElBCO5UA5QHkYGSoybsqGPTv+zLcaqsLCjG9S9+OkYWMJBGpLpHZwpHHfisumQP2K7
         WOG+2ggyDdd3CRlq2ZZuFueAKRuUsWoucWjnaqVtNWX6CgD2J437fs+30WGOZlJ83PXa
         sZq7clIzS9LIp68VhjdybpSV9+oFtMRQTLplzrQITJBFW4oegqty0d0L//Q2seKvMM6j
         YiPrQ0phlhUc97vp+9qbiKWRRao25pezAWzJn9Vjvzjv0YAsZOuFB9JnLHfcgma3mpH4
         4jJMqdFU3jCKb8INwLTJN/BP+xwF5hXnpinBzzcY4f0e9OfyEWf3Cc4qZGZzFPPGLS6f
         F52g==
X-Gm-Message-State: ABy/qLYndN2syl3NqNnQM+uBzCgGjiwPYrNm90rdvLcEoVMlU8gYTffY
	TlM9jzzHffQzFxscbccaw8+ZGwXDTQESm6iR4btAiLW93MSSb+UitFx/VbLvZnc/L5XR0UaeAko
	ZJ5iTtAtgQk79JJydiJDnCK77bFX9e9h9
X-Received: by 2002:a7b:c456:0:b0:3fb:a6ee:4cec with SMTP id l22-20020a7bc456000000b003fba6ee4cecmr3820579wmi.33.1689752748813;
        Wed, 19 Jul 2023 00:45:48 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHFMLZKSxq7F5LPg4Fx0AA5d2LL5/pFgLGRKxUm8gQCvGOZCvpj1Ssuw2aSS+V/KfG/hnhfaQ==
X-Received: by 2002:a7b:c456:0:b0:3fb:a6ee:4cec with SMTP id l22-20020a7bc456000000b003fba6ee4cecmr3820569wmi.33.1689752748478;
        Wed, 19 Jul 2023 00:45:48 -0700 (PDT)
Received: from localhost (net-130-25-106-149.cust.vodafonedsl.it. [130.25.106.149])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c0b5200b003fc015ae1e1sm1019510wmr.3.2023.07.19.00.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 00:45:47 -0700 (PDT)
Date: Wed, 19 Jul 2023 09:45:46 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: always
 mtk_get_ib1_pkt_type
Message-ID: <ZLeUqlqHcHbUSQVX@lore-desk>
References: <c0ae03d0182f4d27b874cbdf0059bc972c317f3c.1689727134.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ESqLmvJwzuWNyDyo"
Content-Disposition: inline
In-Reply-To: <c0ae03d0182f4d27b874cbdf0059bc972c317f3c.1689727134.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_084606_897388_3C9BB5A6 
X-CRM114-Status: GOOD (  17.20  )
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


--ESqLmvJwzuWNyDyo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> entries and bind debugfs files would display wrong data on NETSYS_V2 and
> later because instead of using mtk_get_ib1_pkt_type the driver would use
> MTK_FOE_IB1_PACKET_TYPE which corresponds to NETSYS_V1(.x) SoCs.
> Use mtk_get_ib1_pkt_type so entries and bind records display correctly.
>=20
> Fixes: 03a3180e5c09e ("net: ethernet: mtk_eth_soc: introduce flow offload=
ing support for mt7986")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c b/drivers/ne=
t/ethernet/mediatek/mtk_ppe_debugfs.c
> index 316fe2e70fead..1a97feca77f23 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
> @@ -98,7 +98,7 @@ mtk_ppe_debugfs_foe_show(struct seq_file *m, void *priv=
ate, bool bind)
> =20
>  		acct =3D mtk_foe_entry_get_mib(ppe, i, NULL);
> =20
> -		type =3D FIELD_GET(MTK_FOE_IB1_PACKET_TYPE, entry->ib1);
> +		type =3D mtk_get_ib1_pkt_type(ppe->eth, entry->ib1);
>  		seq_printf(m, "%05x %s %7s", i,
>  			   mtk_foe_entry_state_str(state),
>  			   mtk_foe_pkt_type_str(type));
> --=20
> 2.41.0
>=20
>=20

--ESqLmvJwzuWNyDyo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZLeUqQAKCRA6cBh0uS2t
rMItAP9cG5nx1x++wWRU+VItTbh4XWUmLjFZMBYxpuC6g2SryQEA9jlez1vrwO/l
iJfZu2dQp7s/Fe1wazOV2nLlYLp+0AE=
=r4Sz
-----END PGP SIGNATURE-----

--ESqLmvJwzuWNyDyo--


