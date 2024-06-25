Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65DBC2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 16:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j18EIEhV/0eWKuJab6C4OTry8zO9GoGZ95gJnHfxilE=; b=qTCb5udtf+9b8hI0vz2DOfwaX+
	f2ru3ZWx7N6uCzq5UcvUch0n2/TKOHf/Ueh8Qws5iObXOVuNwGNxAgaUmL1V/gtm/8UvmDBUHtjea
	7OOqeAIhgbcmZMPYszyXMwkYDDaITi00a5r45atajBTbphs0N5gwzyiuY+SPd8foYWFDqZ5B4NtR6
	54RhLcrFdYhDGmdtSJZcWJTrlV7zJxPulMtBUz7xM9GAxqTbRrtIDiu2Sm9/dfKhcO0h+lmoo2R3J
	isfSN9Q1cORjKFirWrJK6oDb/qzctjUKRAOM3jZLQK2R3XjwlSgeXiv/bDDZ1bfMAfCWd3UoksxsI
	fJ6uKtGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8bB-00000003ckH-40rJ;
	Tue, 25 Jun 2024 16:00:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8b3-00000003cid-2MU0;
	Tue, 25 Jun 2024 16:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E6C6CE1BFF;
	Tue, 25 Jun 2024 16:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05D5C32781;
	Tue, 25 Jun 2024 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719331238;
	bh=sx/Sgu2zVexidr0e78d7Q0hdZTohsDJNYxZNJiQaDaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qa6o1FoUsO/Sp505hTm29y18Lo/Rltp5dpBDd4UW2av9eBN2v6Imq9j4cZ0X/CB5m
	 +kzxuGRNnd132A2hlWTncI7py3CmerB6MX8Sqz+ZrTglp1A89NMiwlWtaVh1T/gIF6
	 6VklMyE5BQScupkJinY9PBdqxapKd9dnm6+Z+vQWf4widCWAu20MKraXdOiuRnNfDu
	 rDOi2sk80exqC/JcUx9IHKt7s0wrl9H+lmPpzpDVZBauvoLwsfpF/rZq4/urWTaBIo
	 iAF7v+Nu59IAz95sDAYoy0XfaLiFzsaxxk2Nxdem0MLqU2sT+43tpY2TkuISscAgyh
	 8qiORVuTc/mdA==
Date: Tue, 25 Jun 2024 17:00:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH v2] dt-bindings: net: dsa: mediatek,mt7530: Minor wording
 fixes
Message-ID: <20240625-battle-easiness-7ac3e81c2d6a@spud>
References: <20240624211858.1990601-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ns1bPUFGUN+nbcz0"
Content-Disposition: inline
In-Reply-To: <20240624211858.1990601-1-chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_090041_978261_CFB65845 
X-CRM114-Status: GOOD (  17.86  )
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


--Ns1bPUFGUN+nbcz0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 09:18:57AM +1200, Chris Packham wrote:
> Update the mt7530 binding with some minor updates that make the document
> easier to read.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>=20
> Notes:
>     I was referring to this dt binding and found a couple of places where
>     the wording could be improved. I'm not exactly a techical writer but
>     hopefully I've made things a bit better.
>    =20
>     Changes in v2:
>     - Update title, this is not just fixing grammar
>     - Add missing The instead of changing has to have
>=20

I don't really want to ack this, a 4th ack for some wording that has
no impact on the binding itself just seems so utterly silly to me...
Instead I've spent more time writing how silly I think it is than
hitting the ack macro would take :)

--Ns1bPUFGUN+nbcz0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrpnwAKCRB4tDGHoIJi
0lhUAPoDy72HR6FZqbTZ9VCwwM+664FV/l5ZosGtfzIwwNtHDwEA3erCBpYxanRS
dXx0JBUj4DkqzhTFirctNFUCIuUuBAk=
=gPM2
-----END PGP SIGNATURE-----

--Ns1bPUFGUN+nbcz0--

