Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20341EE4998
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUxhqY9Y4TyEPukYlg5sAYfxkIWkJv8VMwZcg9eHpXI=; b=FiIra2pz9/9LE7JliQBtTluthQ
	RVsGAx5+YNtElquGA3xPn1xyEtWpYEk+jTR8eEf6E57OjJEdF2SXWCvEBitsgNuzAXndJR4QqGnwG
	F2yz0P47BDkE8dGQLq0ZEZabQsJanm0MWLTf0E6BLlzyyNDag7GoRTTU4qs1GNUfTPtoCqNAOPM9Z
	9Mv/MjBK5Y1FSiOZQnGJR9vIHGzfgnsvBjCUCTD0JRKM/6VCHYmmClv5nHbA3TYNpnuQvYA89fNRF
	Kil64rXgP56ANJdoLIq0BXf4vf4adUUEVEZkp00LEndRK24x475kTDSPNS0Tgwy+kFbnfQvLlUodx
	RvNQdXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLiu-00000009L4B-3UBM;
	Wed, 11 Sep 2024 11:41:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLir-00000009L3h-3nbj
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 11:41:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 518AEA44CB9;
	Wed, 11 Sep 2024 11:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FF0C4CEC5;
	Wed, 11 Sep 2024 11:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726054880;
	bh=9Ff5CcqOR1YG6EDTYOSXZ/lMsTO4cJ1WRyPod0s+/9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ikvqh6Rlp/kPJjy8jzBlCQj051T+9r0X7WTLZPJ7utoxrHvi5Sip0LAdo+Thsm9v3
	 kwdh5CALo8Ka5NiLx/SaZoyguMVGXDMag1w2JQoHPMlVpEVbjHmUIp7VhIMs1CzlT/
	 r3JErK+tfK+KF+5BjX4gdFaAlHVrE/j6YA4zk2rf9Mm+vJP3Nm6QPsgHINBvpSQt2H
	 DMsxshlW583pu+sjody+JZcGB9+T9b3vI0SvGs3dMWL/NJEVADyDpLmPug+4gV8RMf
	 1MeRopd/pCbi0SnuUSgLW1ze/6YezqUsHW3unS9fzeukYA9+HR1eDW1GJBMKXshL5T
	 45v4DNvvv/s4w==
Date: Wed, 11 Sep 2024 12:41:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Qianqiang Liu <qianqiang.liu@163.com>
Cc: amergnat@baylibre.com, angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com, matthias.bgg@gmail.com,
	linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mt8365: Fix using uninitialized value "i2s_data"
 issue
Message-ID: <eb21bcab-333d-4ab3-9222-058764ced720@sirena.org.uk>
References: <20240911001516.47268-1-qianqiang.liu@163.com>
 <9ea8731a-7888-40a2-a183-4598884bbb27@sirena.org.uk>
 <ZuGAwQGPWdpO1-G9@iZbp1asjb3cy8ks0srf007Z>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q51in4Tbj9DzVb7D"
Content-Disposition: inline
In-Reply-To: <ZuGAwQGPWdpO1-G9@iZbp1asjb3cy8ks0srf007Z>
X-Cookie: No Canadian coins.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_044122_034478_5CC8B27A 
X-CRM114-Status: GOOD (  12.68  )
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


--q51in4Tbj9DzVb7D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 11, 2024 at 07:36:33PM +0800, Qianqiang Liu wrote:
> On Wed, Sep 11, 2024 at 11:52:58AM +0100, Mark Brown wrote:
> > On Wed, Sep 11, 2024 at 08:15:17AM +0800, Qianqiang Liu wrote:

> > >  	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);

> > > +	if (!i2s_data) {
> > > +		spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
> > > +		return;
> > > +	}

> > Why would we look up i2s_data without the lock, take the lock, then
> > check if we actually found it?  That doesn't seem right.

> Just check the "i2s_data" is NULL or not.

That doesn't address my question at all.

--q51in4Tbj9DzVb7D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbhgdsACgkQJNaLcl1U
h9Dd+gf/XpYSVrJXYWSZflF2+Mnro1CePEcrfJpjk4v4ucJNLSTRozAKskqvZSff
XEiSPDRVj7jAqLSduflUTvv8faamui4SZinWSq4v1uRg2hQChLrdoeJZy2YD+Z4r
YAaAFfwBN1XYv1H0LDZG29/oqK0/3DKRWsU2fjkdb0AQEiZt96pQiGJR6LzXAeLK
xTVd2ifwALsRNNFouHFtgajOyybitV80htpkLCkpnqz3kg5ApT3TK7fBqSNLss8r
8RfcnfrCMC749oBl55oioH+uedaM+w+WXDn7BhKlz2GcU2O6AdHxBOirJOlUgJqK
aDP1+jhRqBgYvIuZVOloGOyHyf0uQQ==
=0dpD
-----END PGP SIGNATURE-----

--q51in4Tbj9DzVb7D--

