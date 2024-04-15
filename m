Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABE1C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 16:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqEMn3xCw0Dafz2xJ8ucZOhDOyq3Wzm7Fy4SPtMqoJ8=; b=ZAThU274Ss/bwXzJlsC5Ci2Pqe
	vIDzFHylMLzpvSeYWpkH3yiXnS5WpTvOyDSgKWzHGPw5cXG0sntUFdcEfhMhNRsOKsZr+3G3qpHY/
	OyzO9DSnu/W+wE6Q9KK0MLwW/STjtdPUA12cgUVO6X4UNIUsT80x94pNXM0JZkcwhxx2ZeRxq/BVM
	15E4n9YZFZUfAYr7wtj3L1ClcUjJgWbkN+B6pwHmmuK4q7DpklQszo68+a8WWpUo2PWlGsDXVJmEz
	d/g8NwWxzPkJcA6gAdYkhkeSElyXJQsx/0+ylcOBcYdH17CZcYLIJFDdvGtE5ZwZGxFUvRmEjDj5H
	iDGoa6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPal-00000009A5Y-0PfP;
	Mon, 15 Apr 2024 16:54:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPag-00000009A3k-1LX4;
	Mon, 15 Apr 2024 16:54:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37A7E60ED4;
	Mon, 15 Apr 2024 16:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A1CC113CC;
	Mon, 15 Apr 2024 16:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713200036;
	bh=bjV4DXgKFrW20X0211p/gXf/Oq51kNqeX2mqwtPMTrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fRfswVGC27iBvN0WXoeaMs/TNz6tEKcLkXpGh33CopHaODHPESOjiZgxo0AKKVsi1
	 tVg0dnyvjeSIjnuX05iJHxEWyTsZB/hO71zPo8VG9XCHaGfossagSHsS+3jH+GFuXN
	 4AEV15tyr8AVWtbbNQFHqVcBZ3Tn3uejIe6MUHP4g3+B8ot87XE22j+PNRJ4wfzOgR
	 i/JCeAQpuChlaDxbI21NRlNtrW1F2xh7fUFsOpAILO0/VctxDRzrWvg4i+RDYRVYTO
	 wkZPV77VhVd7OSy1R3GS3/YUaDsgG+puMal2xoo2kfse3BNGkKsWn8CPYP1eBdbyFp
	 oFMDafUA75QrA==
Date: Mon, 15 Apr 2024 17:53:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Houlong Wei =?utf-8?B?KOmtj+WOmum+mSk=?= <houlong.wei@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Shawn Sung =?utf-8?B?KOWui+WtneismSk=?= <Shawn.Sung@mediatek.com>,
	CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 02/10] dt-bindings: mailbox: Add mboxes property for
 CMDQ secure driver
Message-ID: <20240415-uncooked-gently-22743a504b30@spud>
References: <20240403102602.32155-1-shawn.sung@mediatek.com>
 <20240403102602.32155-3-shawn.sung@mediatek.com>
 <20240403-conflict-detest-717b4175a00c@spud>
 <9b9707a4a0e285a12741fe4140680ad2578d8d2b.camel@mediatek.com>
 <20240404-lankiness-devouring-d4d012b22cb9@spud>
 <e6a30feb1e4bb41c90df5e0272385d0f47a7dcab.camel@mediatek.com>
 <20240405-remindful-galley-2dee9eec4f34@spud>
 <f2476233528e18f78cdfa4eb7bc4c5ae91f70db8.camel@mediatek.com>
 <20240409-scratch-rift-41f0967c2dc4@spud>
 <f38f46c4d3c81f86bd33d3b78e15dd42bc0797c5.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PxLc+TUR+R0iF7Js"
Content-Disposition: inline
In-Reply-To: <f38f46c4d3c81f86bd33d3b78e15dd42bc0797c5.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_095359_249082_E80352C9 
X-CRM114-Status: GOOD (  26.86  )
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


--PxLc+TUR+R0iF7Js
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 09:00:53AM +0000, Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5) wrote:
> On Tue, 2024-04-09 at 18:52 +0100, Conor Dooley wrote:
> > On Sat, Apr 06, 2024 at 04:15:51PM +0000, Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5) wrote:
> > > On Fri, 2024-04-05 at 17:13 +0100, Conor Dooley wrote:
> > > > On Fri, Apr 05, 2024 at 02:33:14PM +0000, Jason-JH Lin (=E6=9E=97=
=E7=9D=BF=E7=A5=A5)
> > > > wrote:
> > > > > On Thu, 2024-04-04 at 15:52 +0100, Conor Dooley wrote:
> > > > > > On Thu, Apr 04, 2024 at 04:31:06AM +0000, Jason-JH Lin (=E6=9E=
=97=E7=9D=BF=E7=A5=A5)
> > > > > > wrote:
> > > > > > > Hi Conor,
> > > > > > >=20
> > > > > > > Thanks for the reviews.
> > > > > > >=20
> > > > > > > On Wed, 2024-04-03 at 16:46 +0100, Conor Dooley wrote:
> > > > > > > > On Wed, Apr 03, 2024 at 06:25:54PM +0800, Shawn Sung
> > > > > > > > wrote:
> > > > > > > > > From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

> > > > > > > > > +  mediatek,gce-events:
> > > > > > > > > +    description:
> > > > > > > > > +      The event id which is mapping to the specific
> > > > > > > > > hardware
> > > > > > > > > event
> > > > > > > > > signal
> > > > > > > > > +      to gce. The event id is defined in the gce
> > > > > > > > > header
> > > > > > > > > +      include/dt-bindings/gce/<chip>-gce.h of each
> > > > > > > > > chips.
> > > > > > > >=20
> > > > > > > > Missing any info here about when this should be used,
> > > > > > > > hint -
> > > > > > > > you
> > > > > > > > have
> > > > > > > > it
> > > > > > > > in the commit message.
> > > > > > > >=20
> > > > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-
> > > > > > > > > arrayi
> > > > > > > >=20
> > > > > > > > Why is the ID used by the CMDQ service not fixed for each
> > > > > > > > SoC?
>=20
> Did I misunderstand the ID here?
> I thought we were talking about event IDs, but it looks like we are
> talking about mbox IDs.

We were talking about the event IDs FWIW.

Just send a new version with some actual explanations added (as we
discussed earlier on this thread) and we should be good here I think.

Cheers,
Conor.

--PxLc+TUR+R0iF7Js
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh1bnwAKCRB4tDGHoIJi
0jnuAQDSK26EjY38cq+JsvVM52aMoEOqDTJK9m7QIORTzNDSrQD/VrDnAVPIghjR
raveZ2Z17XwKlJiIOqZXOYHPOzhz+w0=
=GUlt
-----END PGP SIGNATURE-----

--PxLc+TUR+R0iF7Js--

