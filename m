Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27637C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 18:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pHlT12Imr86fFGxhQr/Awzalzz5puKumydBMktHOWU=; b=uCZmY39xLXAiKFNEB62joOTp2f
	PPd5OvKi5/Mz+5TaCLC9/KCP9iD0w3IveWThE9GtjPPvReHCedUITXG+vrT5mD6WHeYsTdG5GXy11
	jbyu4ryIqZ1rc0gqG8yLZ0JoUhHaC/ZtN0orSr5ZiYkVLdwczy6XEQDdpJQdqBAlNj+N3F1HE0G0D
	l8zNojLD+UuF8F0JII7iRSfhbfmJxp3QA+DInZgrqbNBP4MpyCTK/xlq3vR+qXEhOO+SwXkOqkBtu
	ubF0Lr+E9vKmxn2J2qPcOkx8yHSKte1sOR3fXSL86iZTji3qm+1IafDz1wdDlR87ZhNcsDbBNQwoU
	TXYSb+fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMOY-00000005HeV-1jp3;
	Thu, 02 Jul 2026 18:44:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMOW-00000005HeI-34EC
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 18:44:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22A3541082;
	Thu,  2 Jul 2026 18:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404F91F000E9;
	Thu,  2 Jul 2026 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783017856;
	bh=8pHlT12Imr86fFGxhQr/Awzalzz5puKumydBMktHOWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kpwY/1fXCqTNL1UQJCJQlY8inwD0B68VgwcrxsaecntpxLA5MeRUN9Y7w4sWXQVU+
	 /vfPPCFAuwGDnkxUaLIWBwvp684+DwZ8YDz30ZtT+vsdKdFSN5yDyBoFrLOPWnh/Tl
	 OX0fVNJGjbBoiqYrDV1yGloqsIT5dYR7dUhXJzz0rOpFz+r5t3TS35shTbpBq7aQlo
	 n3Ysg+02626Q4ecxHhtC79Hsl6xurhzqkKxnnv0rGi9Q0IKDJQDLRRyWtPT+aC4L8Y
	 wZO1x8xlpFuOd88KnoosZyR96tsHTrG5kJRDayX+aKPcMYk7T83Fua3K+18z5cCvie
	 fmVcVvLK1zbLg==
Date: Thu, 2 Jul 2026 19:44:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Peter Wang =?utf-8?B?KOeOi+S/oeWPiyk=?= <peter.wang@mediatek.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Alice Chao =?utf-8?B?KOi2meePruWdhyk=?= <Alice.Chao@mediatek.com>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	Ed Tsai =?utf-8?B?KOiUoeWul+i7kik=?= <Ed.Tsai@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Chun-Hung Wu =?utf-8?B?KOW3q+mnv+Wujyk=?= <Chun-hung.Wu@mediatek.com>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-devicetree@vger.kernel.org" <linux-devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Naomi Chu =?utf-8?B?KOacseipoOeUsCk=?= <Naomi.Chu@mediatek.com>
Subject: Re: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
Message-ID: <20260702-scariness-daughter-fe97d4a1b23a@spud>
References: <20260626074820.2537772-1-peter.wang@mediatek.com>
 <20260626074820.2537772-2-peter.wang@mediatek.com>
 <4ac862d82690a850eeaa997f041f22ee61233ed7.camel@pengutronix.de>
 <d077d61fa0e22a2e602dc3c8b47512a847f1049e.camel@mediatek.com>
 <20260701-city-during-7d76a326f2f4@spud>
 <4fedff0acaa249f4ce1e874f7f791d8cbe52556b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aO5HbnTSGKnhrEZ1"
Content-Disposition: inline
In-Reply-To: <4fedff0acaa249f4ce1e874f7f791d8cbe52556b.camel@mediatek.com>
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

--aO5HbnTSGKnhrEZ1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2026 at 08:52:53AM +0000, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=
=8F=8B) wrote:
> On Wed, 2026-07-01 at 17:57 +0100, Conor Dooley wrote:
> > From what I recall, mediatek ufs is a mess with lots of vendor kernel
> > type things slipping into mainline without proper review on the DT
> > front.
> > Because of that, I at least am going to require that everything is
> > done
> > completely (and perhaps excessively) by the book here, including
> > introducing complete bindings for syscon regions rather than partial
> > bits for components like this one.
> >=20
>=20
> Hi Conor,
>=20
> I am sorry for giving you that impression. Yes, it was our=20
> oversight due to a lack of experience, and we missed some=20
> binding-related documentation. We are working on completing=20
> them step by step, as we are doing now. We hope you can=20
> kindly allow us to address the missing parts gradually,=20
> instead of requiring everything to be completed all at once.

No, sorry. I expect to see a complete binding for this system added in
one go.

> > > This approach is also consistent with the existing 'ti,syscon-
> > > reset'=20
> > > binding, which uses a similar per-entry table property 'ti,reset-
> > > bits'=20
> > > to describe reset lines within a syscon block.
> >=20
> > This was done about 10 years ago, I would not consider it a guide for
> > what's acceptable today.
>=20
> This should simply be a difference in hardware design and usage,
> with software deciding whether to opt for flexibility or a=20
> fixed approach. And it's not that the previous method was 'correct'
> and the current one is 'incorrect,' is it?

I'm not sure what you mean here by "previous" and "current", since both
approaches are the same just with different compatibles. Times change
and so does the standard for what is acceptable.

--aO5HbnTSGKnhrEZ1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakaxewAKCRB4tDGHoIJi
0rxHAQCPYi4KDYXvt3uaWcqd8AEx0XC9AKatQK5kdlNuvykWRQEAj8+7K5IGhglD
9c0U7TyMLObUYnONynIAgZ2r4+LNAwA=
=QlQc
-----END PGP SIGNATURE-----

--aO5HbnTSGKnhrEZ1--

