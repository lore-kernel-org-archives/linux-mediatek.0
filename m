Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC608C74A5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 09:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJ3WDXO7KIBK+9sdkadIvKuygfT1XfD4Bd0FxI61Ogk=; b=e90nEYl386p19LtKpOjMMURqza
	n7FVLm0NQ5RWC/TTYBjGRawwStV0V7mtkIvZMjRbB3bBBTZVGCYuwTitGI1FwR+0dgO0zw9Hmk8q6
	FMnK0FchFA889TgKTF3sEqUVb8jhIdKLB4oJGjaLe33dTNERD06mLwIUqeZDYg2eEeOIYh7KQwljJ
	SubPBSvLEXxsNxaoX6SWvBo6BQEWV7P6eGvfWuRBqvOpb+az79HkXXebyMBccn9x46N8E5yqOYPcm
	6QNR+i81y9z/m+4y7o3r2NOEgfcr8hb3B28iUI9zTdtrGZM+hvqbkI6z5prEK6pjOlWHBuiZmeDHk
	vM8T5+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peYRC-00Bu21-1P;
	Tue, 21 Mar 2023 09:37:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peYR9-00Bu0X-0l;
	Tue, 21 Mar 2023 09:37:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6A8F9B81339;
	Tue, 21 Mar 2023 09:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A446C433EF;
	Tue, 21 Mar 2023 09:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679391464;
	bh=M2km7NeYtbDiNvCXTjsmLfBwsmrUm67rl9hiQ4CAzCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VeQrEKjA92buWjy+LQhn80xdgzkiTvrIzUWOrQQ5Xa2D38LQGiGuyY/vyJZof+i6C
	 et+G2qmFU439tDb3LlEA32s+D727+EVLLaxzI8h3fUacOQqQrAMDjkTSoIxJJ586TU
	 3GWKE+RST/M0SzPJW/ume0Ssd7RMKNajVCYpfwSGjHRociXKDtPgxL/aO/q3j1FPmr
	 v6HKmp2/RoEub9pakT8f5+bJRBYSWg9bLom6AlbaKThLYh+it3Ejz/XFepk6O5fuA2
	 awa4uvR87SVg04kjSSwTt6AxG3jyWtNWVs8Ppb2Z0aCEj2xYbSNy1ZKxGRje0M55sN
	 IqEonHN9szF4A==
Date: Tue, 21 Mar 2023 10:37:40 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	lorenzo.bianconi@redhat.com, daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 00/10] mtk: wed: move cpuboot, ilm and dlm in
 dedicated dts nodes
Message-ID: <ZBl65HJ/C0OXbs8p@lore-desk>
References: <cover.1679330630.git.lorenzo@kernel.org>
 <20230320214356.27c62f9f@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7BR5PQLPyhuqm5AG"
Content-Disposition: inline
In-Reply-To: <20230320214356.27c62f9f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_023747_439554_5F2803CC 
X-CRM114-Status: GOOD (  11.35  )
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


--7BR5PQLPyhuqm5AG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 20 Mar 2023 17:57:54 +0100 Lorenzo Bianconi wrote:
> >  arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 69 +++++++-------
>=20
> Do you know if this can go via our tree, or via arm/MediaTek ?

Since the series requires some network driver changes I would say it should=
 go
through the net-next tree but I do not have any strong opinion on it.

Regards,
Lorenzo

--7BR5PQLPyhuqm5AG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZBl64wAKCRA6cBh0uS2t
rB+oAPwP1g2z76hQlLN/oEDtcCxiY9GmZWFZZzNvBaPcTD27cQEA0RXphY5285ku
1RcoYXlNoBdNys3TTdVzRncL6v6GuwY=
=NAfq
-----END PGP SIGNATURE-----

--7BR5PQLPyhuqm5AG--

