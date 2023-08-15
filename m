Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC9FC0015E
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Aug 2023 17:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XUys1huCh1+ir4pJ/yUia3YtNLT9j72S4nI3KcgIX0=; b=zlFGAwwKkXmaopuaW5MDPuXuH7
	CummvyEe3dmDIcQpxF5VqN6rivuo2ZM3I5C2Z9/s2kVttTBk0f7UNoPYeoPqA5dFEKWagWbuuLH/o
	CEEyYcwq6QIIxXDyp++/I+ijIWQ0vDWZcloyZjWKGs9kM8dTN4KPRC2ZG4bxz+i4pnVsX/wsdcicY
	r5fsKsfBh0ZYJiethZd28gOh73QBnkw21x3SrnYy+nzzSKAN1XaxKe70uyAo5Mlmrplp1OOPs+HTI
	t3huJiJs/2Kk7aMgwOWVnI0NfF052TBnlzdU65MZF6u3H0WW/v3ZzkpcAlgCj1VmfWWe7Gv5SOYUf
	Eec16VwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVxjc-0024Bo-04;
	Tue, 15 Aug 2023 17:21:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVxjY-0024BC-1j;
	Tue, 15 Aug 2023 17:21:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 50B5C617ED;
	Tue, 15 Aug 2023 17:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373CAC433C7;
	Tue, 15 Aug 2023 17:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692120090;
	bh=Il2uMTP6lG0+AKxD0SbiK86g8kR0jT68a3j1liMLNMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6xYkDOYe5/F6UacYnRo1uoKHSOBsQRSc2QXAihpKH0Uq7deScby6MYrJPS2gbi2E
	 tW6WPOz8AvWPP7hc9aEXDIgbAYBm2Marpg5AcTU1j2NfC9lgdQ5+VT1GpSj3TPYVWQ
	 o74MeGNE75lUwAIriAeD2At3m83zqvvC3BEyF3Kj3rjxRZRdW6kEErc4q/M8AnTpky
	 HrUgUtVGNsWLIAOTUvooDhSHkwzDzEFnDgJGXJLmkH+VdzZuKL8VAbrGjxhLRCNBO5
	 F61htQhvvC8JMPEor3x5Fk8LRA/1GNmK/xsXNQ9AjMJ+CVznXqVvjnzI7Zh2uGbyDC
	 DLSynANZNTbzg==
Date: Tue, 15 Aug 2023 18:21:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <Trevor.Wu@mediatek.com>
Cc: "linux-imx@nxp.com" <linux-imx@nxp.com>,
	"s.nawrocki@samsung.com" <s.nawrocki@samsung.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"xc-racer2@live.ca" <xc-racer2@live.ca>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"cychiang@chromium.org" <cychiang@chromium.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"judyhsiao@chromium.org" <judyhsiao@chromium.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"shengjiu.wang@nxp.com" <shengjiu.wang@nxp.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"srivasam@codeaurora.org" <srivasam@codeaurora.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"perex@perex.cz" <perex@perex.cz>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"quic_rohkumar@quicinc.com" <quic_rohkumar@quicinc.com>,
	"robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v2 02/11] ASoC: dt-bindings: mediatek,mt8188-mt6359: use
 common sound card
Message-ID: <052ba5ef-e689-498c-9283-95482acfadcc@sirena.org.uk>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
 <20230810063300.20151-2-krzysztof.kozlowski@linaro.org>
 <234edb7c2002106dee41d558481b4baf904208ab.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mZn0hmd24oe3x4bQ"
Content-Disposition: inline
In-Reply-To: <234edb7c2002106dee41d558481b4baf904208ab.camel@mediatek.com>
X-Cookie: Darth Vader sleeps with a Teddywookie.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_102132_686285_98CB16A0 
X-CRM114-Status: GOOD (  13.04  )
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


--mZn0hmd24oe3x4bQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 01:57:51AM +0000, Trevor Wu (=E5=90=B3=E6=96=87=E8=
=89=AF) wrote:
> On Thu, 2023-08-10 at 08:32 +0200, Krzysztof Kozlowski wrote:
>=20
> The mediatek,mt8188-mt6359 Linux sound machine driver requires the
>=20
> "model" property, so binding was incomplete.  Reference the common sound
>=20
> card properties to fix that which also allows to remove duplicated
>=20
> property definitions.  Leave the relevant parts of "audio-routing"
>=20
> description.
>=20
>=20
> Reviewed-by: Rob Herring <robh@kernel.org<mailto:robh@kernel.org>>

Something's really wrecked the formatting of this mail...

--mZn0hmd24oe3x4bQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTbtBEACgkQJNaLcl1U
h9AkVQf+LCyv4Rxv2WwJ4vwg9gYMeT9mlq2c9+h5yXrqF3W3m4rwBxpVYqN2Ez5V
VgEsH3D9dGm4h9LsqFw5IPnK25riu5Bb1Oj2JwigyD1wRnjimBC2C9zwa5IuzS6P
/6EmFdMiTrtbxM1cNjA/kPbxnxIsrqCD5Carl/ubZ6qcq/au08dFZA37AMRSpozs
DkiU38lOyP/SV6DW2jlJHV9BbIcxPmmrAl7Rw+9WcOhJqCg/TEFVSodXzX9PXx9z
AfR6BqxbB/mfqQ8R47vePrcpNZbJ3qrmW+psqxeroNx7kE4pyc8Zzsnhdb+PMn2o
bs8U5uonjNv62gLDqi2Sn/2f5Qrcag==
=9W3r
-----END PGP SIGNATURE-----

--mZn0hmd24oe3x4bQ--

