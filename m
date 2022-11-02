Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8D4C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 22:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yt5IB5knkVf77kcKACvxdYcGkUHcp0Bvm5SU2agY7rQ=; b=hZtYPe8LT/djLyz38smyb0WrDq
	UO3WcNsKt6myScsGqDcaQ6Q4jyypv9Uv5xS+4gbJLOqdK4iBt8ItzSNfuqYwOEwlGOXzLrhX5t0SV
	xYoGnnXBUt0I+NDa1OIttLfTv41bX6/mDNd03JEQnk9h1mDrjeuyXNxMDnijNXfaYwSdtmt2BVYXB
	lsTgdUS7bum5m9RNb2YSfHHMf1OENmoOQzId9hCuMOu7UY/CiJ9f+viZW17ZD/lY63YBnIFd6ZUbx
	g+m/HJ2V4KPe+GqK/poVJZUxpEr/yXNRVaFkdVCJbFTr/i2MRg74pTXcSMKrEtvXJLZSobUlJs70u
	OryCQA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMMB-00Ejs0-BP; Wed, 02 Nov 2022 22:37:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMM8-00EjqH-Ma
	for linux-mediatek@lists.infradead.org; Wed, 02 Nov 2022 22:37:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 11696CE2265;
	Wed,  2 Nov 2022 22:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C10FC433B5;
	Wed,  2 Nov 2022 22:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667428624;
	bh=HGrNUTgAl8c/oQJAl4TiiTH5QHvDd9Mu7yXf5rzTRao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UudH/B14WAcaNzxlgTJzts9Wo9DUqqYNk52xGI2zi0Jix8vWA1t6fEnG7RFMca4lZ
	 zIZ7voUHJqyEf4hJ8ux4FY8rKbSPB0aj8N1O7a14oV4Ih0LXSy8V+QUTweQoRcWnQY
	 tD+UkLzfpCL1RT6ali0QhSujUwIcWD/kMbkG+FUTV0wdFkeWO7+itdKKpqVIHc9tZO
	 VFecJz/VW0ybiU6blCASnAN3WnSJ8ZuL8D+gfmpGnfyuT+OfMXc+HMKhJfvKCeIUvs
	 7Ww2LeodQ0M7KuIVeRHmCMLHC0evmAub+MKemRNqqIc1NiwR0bg+s/a2h0Id/CYMu4
	 WJeqJpE2fr+QQ==
Date: Wed, 2 Nov 2022 23:37:00 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: Re: [PATCH 01/10] wifi: mt76: extend aggr_stats for tri-band support
Message-ID: <Y2LxDLqPa45Xbe9n@lore-desk>
References: <20221031164000.17063-1-shayne.chen@mediatek.com>
 <20221031164000.17063-2-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8OepT4zXwtk9Efj7"
Content-Disposition: inline
In-Reply-To: <20221031164000.17063-2-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_153708_943543_45093FB4 
X-CRM114-Status: GOOD (  17.28  )
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


--8OepT4zXwtk9Efj7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 01, Shayne Chen wrote:
> Make band2 able to report aggregation stats.
> This is a preliminary patch to add mt7996 chipset support.
>=20
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index f9bdf16fc6c4..42847b327cb0 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -781,7 +781,7 @@ struct mt76_dev {
> =20
>  	u32 rev;
> =20
> -	u32 aggr_stats[32];
> +	u32 aggr_stats[16 * __MT_MAX_BAND];

I think this patch will break mt7915 and mt7921 drivers.

Regards,
Lorenzo

> =20
>  	struct tasklet_struct pre_tbtt_tasklet;
>  	int beacon_int;
> --=20
> 2.25.1
>=20

--8OepT4zXwtk9Efj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY2LxDAAKCRA6cBh0uS2t
rEB8AP9Dm5/DXpvQLm3l29yvDhyBM5gPC9tAq05+24dkf8At3QD9HVpnd8JIW8ZR
E4bSiHw7IUPp15+Bp53TQvck0WVT0ww=
=vlXf
-----END PGP SIGNATURE-----

--8OepT4zXwtk9Efj7--

