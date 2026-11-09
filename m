Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B0F606A323
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 01:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GV2BTrvF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=b+Id5PbC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Frm8Ld1QHHVrzUA5GQZVw3rqE7QJ68oePOVoIDDUukc=; b=GV2BTrvF6MVRiiVOPaJ158UvgW
	bQw0jYq6I5REz8ZDPx09GC+fkaAklsNDcUcUR8yzOUYUTR+6O/aaI8jYDwyBfQjAKQU5DE3OIPFDN
	qweK8QItsO8Xm4sP3K4QpRGhKjaRvNOcJjbUFAyPzgY/DpUb1V3rl6iiwUwSXAu4m/teiKDXTIwhm
	uniUWOgJzl6Gsq3QWRD0K6M7zmVpznTUNZI8cc4z9oncZX1DOLHjDQuWd/CecCUIICbaJXE6pAnYd
	M3PojkZNx25v7zQ0NDO3VwnP9f/T9gI1O+d4f+DKNxMs+skSJ1P2ur+P1PWUcMFYtSYS+MqnESNBf
	7qk93Cyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDuw-0000000H0st-13kW;
	Mon, 09 Nov 2026 01:11:26 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDut-0000000H0sR-1gFJ;
	Mon, 09 Nov 2026 01:11:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794186680; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KP965G8gNTMXnOxdmYqv3VegVDyYxZjTMCfqdCMlwasTJEwk082tTk6NmHHdc9KnNzik3brm/jt9gb9ttHgClIG3pK7Ccq2ZWPRfqtuQMtM0AmTpPB53xvLpZPzWtVb6Sdd+YHDr7wtYpb4qtrdkV4Z97rBsbg3ahTG/pxk33xo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794186680; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Frm8Ld1QHHVrzUA5GQZVw3rqE7QJ68oePOVoIDDUukc=; 
	b=KBlG6TI5MZffl2bZP/tJRVMEsmjF2moYAiNOpxXdtvC7uZG4H37fKKljMEoKIK+THaskaVVZ5igeYViASIgvFbxNS9+RBTMhtxB6E5tXqLZPWv5o8+nEEPl3EXXFfJcY6ozSv9cEQSbpf8gvrA/aGrx8o1A90xaaTcrIqceLPEs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=b+Id5PbCX3AVSwyxjoQuhreG3Ca6WHoor5xr6ydh4NCvgX1mXdZzCKuEK52ttJARkqW2zhYXgo9Gd1CG1gXWigvMer+/oxX5eGSzvwi9egn1/B81yQ2J8cyb4k+lIgEsJEk8nW0vCeNjijWfClExtiFNtLlglVf9WVeXU+frkh0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Frm8Ld1QHHVrzUA5GQZVw3rqE7QJ68oePOVoIDDUukc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794186679307914.4749060070615;
	Sun, 8 Nov 2026 17:11:19 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id D5A5F1808E6; Mon, 09 Nov 2026 02:11:18 +0100 (CET)
Date: Mon, 9 Nov 2026 02:11:18 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: hyunjungg <hj351016@gmail.com>
Cc: linux-pm@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] power: supply: fix work-vs-devres teardown
 use-after-free
Message-ID: <avEdYFDUHIj6mq0Z@venus>
References: <20261106160057.2754689-1-hj351016@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3sgy7kbr5gvb4f26"
Content-Disposition: inline
In-Reply-To: <20261106160057.2754689-1-hj351016@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.182.33
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_171123_521305_0EF7239A 
X-CRM114-Status: GOOD (  14.82  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--3sgy7kbr5gvb4f26
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] power: supply: fix work-vs-devres teardown
 use-after-free
MIME-Version: 1.0

Hi,

On Sat, Nov 07, 2026 at 01:00:54AM +0900, hyunjungg wrote:
> From: Hyunjung Ko <hj351016@gmail.com>
>=20
> Three power-supply drivers register a poll/detect/charger-detect work for
> device-managed cancellation (devm_[delayed_]work_autocancel()) in their p=
robe
> *before* they register the power_supply via devm_power_supply_register().=
 devres
> unwinds in reverse order, so on unbind the power_supply device is release=
d first
> and the work is cancelled last. The work handlers call power_supply_chang=
ed()
> and dereference the power_supply, so a work instance still pending/runnin=
g in
> that window touches the already-freed power_supply device -> use-after-fr=
ee.
>=20
> Each patch moves the devm work-cancel registration to *after*
> devm_power_supply_register() (and before the IRQ/poll that arms the work)=
, so
> teardown drains the work before the power_supply is freed. No functional =
change
> otherwise. The relocated devm_[delayed_]work_autocancel() still runs its =
INIT
> before the work's first queue site, so no queue-before-INIT window is add=
ed.
>=20
> This is the same class as the recently-applied cimax2/extcon work-vs-devr=
es
> fixes. Found by static analysis / code review; none is reproduced on hard=
ware
> (each needs its charger/PMIC/gauge chip and is not QEMU-reproducible) -- =
treat
> accordingly.

Please don not send direct AI output. You need to drop useless
comments and trim down / rewrite commit messages to a sensible
length. Instead of huge amount of spam.

Greetings,

-- Sebastian

--3sgy7kbr5gvb4f26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrxHbIACgkQ2O7X88g7
+poe5g/+ND+IudgGMavaYHWAq7LCDjhvxcm1V3Vn7sBhoNzaT22/LDNlL7a5VbPa
TX00osbNQCELsH3CwfnCx46PmOAqWvQiLMz1yoTTMBxM5XSi4wRCEnUmvS0QJRP/
KhDAeGaR+0t7FpgtTjKlM2AJP9NgjVB2NK4F5rlcdlKBUAyfHXGfp5kxVh2hv0ns
Yo3wFquqlYxzXbHKVGUH9OsE/f3vuiSLhZPZh/UbUFGzzKzn+SmRDx2edMCTXYSP
zNCDXhwqfclvwErrnEtCXxCYtAY9atPJr6FtSVz9SqYfI72n9Ms1QSGUikvv2fZv
Iy2qmGFXqEuzIz5GboSvaFZN1+QsDfXXMe1+IlcutSsFOPi92uymSLFfoItLnw0b
vOfSQWg2WmaPa1RfjwJhIaqS4UuGj9GXL9+GoIUNPw6coaA45Pqv+EDwY/j6mYwl
0wsb8WUXnsZmcbIAZ4Rau5nsQyHU0FVQKajapECVLELodWIbKpV8nbijUMrUKlHf
hbFnaJPST8I42E+tD3HG1W0n72viZ5smTUsBwh6P322430iUnGtAFmnI0Y7FJz9f
CwHxdD0KEmiFJWjcGwUv+rhQVdhisCdv0b6wRS4YGrHHA/cypYsjbNxW9RyQvEQp
1kvT+ScdETMReV5gctHUFd010wS0NcoLUc3syx1+ZPTYEQvfKH0=
=yLSK
-----END PGP SIGNATURE-----

--3sgy7kbr5gvb4f26--

