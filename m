Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5CDC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 09:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uiJY5+AkaAMp+NhogWhqvdKPXEcFzAOib0lDS14Z8y0=; b=z8OYR0l2PHOPejlsXV5NS2Obcq
	vb9w9NfKF2/XQJ6dpfD5HxH3PGKiYGc6SUqQ/1tz3gDVe3JpiRTSrDXtM1tF6vPCgIJWFPpu5yWhI
	sr5howGC6bnEYhc5jY3yqpWlRyJGnpYp4jeRpu6WOw8bIzVilvoKWMNdwWMywQBCJ20ksZ7DJWA2J
	9+d5tMbQNznNTcstwQQEbIYG2ZgluX2+UK7em8TATs5sS+JuZUQVhs/D5Z711aZVaQgxj+m6Z1HrJ
	k1C/PQwdkeoaB0D0bI3XUZTGdAqLYGleCuB+GITBk35pivuPa1stmXDR/5jaApBIIWZaSy8CZL87b
	EXIUeASA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiXzG-007VPk-KZ; Wed, 12 Oct 2022 09:25:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiXzD-007VOz-JR
	for linux-mediatek@lists.infradead.org; Wed, 12 Oct 2022 09:25:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4CFC761311;
	Wed, 12 Oct 2022 09:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F3DC433D7;
	Wed, 12 Oct 2022 09:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665566709;
	bh=uiJY5+AkaAMp+NhogWhqvdKPXEcFzAOib0lDS14Z8y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gde+pLBDezd1Hlldo5PeZMvMerNomZP/VdLolLF50NRihidToOkWg2zMmwkrwkK1F
	 te6Wg4S1Buk4Z4cxI2lvTV3X0YJTkkry/hu7bKbido3W6l27ghd2/oAkftw4SmEnQ1
	 MxnnQSVvBSyMdmC2tF0HSlAueypcf5EOxAX02A5ONo1RXln8Ho8e+qiVa5k3QnoOUs
	 JgwFrW7GX4DUbgPdy7S+XcGSY+DJQydeIBRWrJ2uI9jaKml1QDwkt72AoQG+aADbrx
	 kb7zTJfGqxY/XwlclrNgSZ/AAp79sOYiKssIuCDMGS4juo7+UflJhSFp2LcKpJve6N
	 46yAmI9xq71Lg==
Date: Wed, 12 Oct 2022 11:25:05 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com, ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com, daniel@makrotopia.org,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] wifi: mt76: introduce WED TX support for mt7986 SoC
Message-ID: <Y0aH8T8pTARNWcPE@lore-desk>
References: <cover.1664356281.git.lorenzo@kernel.org>
 <87r0zd4mxw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GTbcF8eMCdPYvLM9"
Content-Disposition: inline
In-Reply-To: <87r0zd4mxw.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_022511_699637_73CA46F9 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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


--GTbcF8eMCdPYvLM9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Lorenzo Bianconi <lorenzo@kernel.org> writes:
>=20
> > Enable WED TX support for mt7915 and mt7986-wmac drivers running on MT7=
986 SoC.
>=20
> What's WED TX?

It is the same as we did for MT7622. It is the capability to offload traffic
=66rom lan/wan to wlan. I specified "TX" since MT7986 supports even RX
offloading (I am working on it at the moment).

Regards,
Lorenzo

>=20
> --=20
> https://patchwork.kernel.org/project/linux-wireless/list/
>=20
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

--GTbcF8eMCdPYvLM9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY0aH8QAKCRA6cBh0uS2t
rAa3AP9n3aPsW3C7quL5gEke3mF4EKMJsdqzGKU+d/Bx2PfZwAD8DQOAz2RLH1dY
L6F3og0vGJZgBtk3tviFsjtUlOtInwg=
=Iy2J
-----END PGP SIGNATURE-----

--GTbcF8eMCdPYvLM9--

