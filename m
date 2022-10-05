Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD0CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 11:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jMzYU24d+yMcsfaBx4vsYUmNNj3cHQ/4Qvv5atAB90=; b=aVD6/tp4vYGKDCFJHowO+o91ja
	aXpbCXz1gHmiZA6juWjROkQOQBgw6MxADa6Szi9lxA4qPZZNSHF9yoGmcp+GcUVX/RHOHDtKk1rFQ
	vStz3+V7Gs3bIrR8GmHUB3RYng9i85rkUJSbjVJoKp30YS0D19vAR/GhMt3pmMrb99+YjqGIbhvlF
	H2TwzQlV5xQzKl74nzWNWSnEDbj2wJvArAqM+3Cf9huWx/YWSlBpFrktdiqpx/r2AWlmvNK2Qg5Gu
	2OY663fUJH+ptgluuaZ/UUDSXtAHIugItIY8K4BoFcyIQrWdsG2Nq6OAks7vsA/xLfBXy55afVn0x
	l7Rhh2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og289-00DfkF-9x; Wed, 05 Oct 2022 11:00:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og27x-00Dfeu-1b; Wed, 05 Oct 2022 10:59:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C36E5615FE;
	Wed,  5 Oct 2022 10:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0837C433D6;
	Wed,  5 Oct 2022 10:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664967587;
	bh=4jMzYU24d+yMcsfaBx4vsYUmNNj3cHQ/4Qvv5atAB90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sTFtUD9liLjl7WLjHQo9PkZqVUv1WS49na83tXcwV1XDblWGoJS9XhIxLrHsF9bkM
	 J+wIT2LpUcp8dEWJ8A11qVMdMqtJOEfPI2TOFwhbetcMld3OzyXXRRPkvlL5Fm+aWs
	 SRGW0Oq1eyFSu8hFPfgUQoBlVbfkN9A43/7qsfsddSxl/gWfbSZoi9gZ9YNq+6jLyI
	 eqnTm+VsnAIm2SPvlTafw4kc2H/+ozTJq54/M/U7imPMSjephI7JShfTalx7rkxLzG
	 430kgIwvhOEoHOzpq/HvCGT7+QzUAhAc3gNJiqiDZLXSgSHcoN2/Z7qudBcZNFC9F+
	 C0fET9YU/C2Pg==
Date: Wed, 5 Oct 2022 11:59:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <Trevor.Wu@mediatek.com>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"lkp@intel.com" <lkp@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 08/12] ASoC: mediatek: mt8188: add platform driver
Message-ID: <Yz1jnb03bsI06rQB@sirena.org.uk>
References: <20220930145701.18790-9-trevor.wu@mediatek.com>
 <202210011740.ZdLtxKq1-lkp@intel.com>
 <de20b79da18bde2bbe56784cf4e209894f8235bf.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FJN3P96NgRROT9Pz"
Content-Disposition: inline
In-Reply-To: <de20b79da18bde2bbe56784cf4e209894f8235bf.camel@mediatek.com>
X-Cookie: Poland has gun control.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_035949_145694_1A7A7EAD 
X-CRM114-Status: GOOD (  15.06  )
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


--FJN3P96NgRROT9Pz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2022 at 06:50:53AM +0000, Trevor Wu (=E5=90=B3=E6=96=87=E8=
=89=AF) wrote:
> Hi maintainers,
>=20
> As I mentioned in the comment, this patch depends on a reviewing
> series.
> Should I remove the related code from this patch in case of the build
> error?

It's bit easier to do that, though it should be fine to just note in the
cover like you've done.

--FJN3P96NgRROT9Pz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmM9Y5wACgkQJNaLcl1U
h9BpvQf/ViaTtdSwbnr8r5a/PKyi33v6+70ypVPJ7U7DC3iVnoob7xh2CQFQ2gLX
d0Te48W6ZDxbn1e2XJDjCTizZubyJz89RbVGCg1Wibo7MkH6k5mRlmid0tlZ2Mq3
N+9UYz7o6J3WVelnqLnjbka3ZgbDhhdK+zFzUk9GcOJ+mrum1zsSxz2DYGmyMcMc
LXO+GljHMiR/v0NkCd8is0F9CHL51VzAr2GRuCPIpZ9k0JPUicmU6GSHonnsgDkA
71QA9FB1l4mIx08vqkJONs2M6TqjVPtssxwsaokQZRNtSMW32QgFyKcqAa+MubXf
kg7ZSAzRJCdkZAO9ITzwMosQFlVfbg==
=NONF
-----END PGP SIGNATURE-----

--FJN3P96NgRROT9Pz--

