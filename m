Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572BFC7113E
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ziAnfRxyNjEpCFfJWS21721Am3P++TML+hoaHXrdOSE=; b=a3EPhhcQXPMXzW2tm4H0AIJZiK
	SoBJHzd5FEcwt6yxRmQDJplg+xtC0KRIf4ypOtbslVedzDss+LSPo3PpKfvnj/JZnN+UWDhCvqe7f
	+2tOmi8648n0VUIJWR+5SpnkIwXy9dvnfmo1g+nexnOPJy0UUdvawSfalWnW1WUH8dnkKB4ySqluY
	Hf5IZb1OtOKa08X+6SrkdkT8OmjP1EQJMsUs8VgJGVwIkWUiStG/Cws+Fxb19y6IsvM9u/LWhFOZO
	QQQ9Sw/JXsci7hCJjDohOoW5fKNPPeq5WueKw0s7yqtd/YJTEKyMTH3RKdHRlpnZDshGu5cVbY5Rq
	nK3yW3yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYh-0000000B4hL-1uoq;
	Wed, 11 Jun 2025 19:56:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPODW-0000000AbE1-4AuD;
	Wed, 11 Jun 2025 16:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ziAnfRxyNjEpCFfJWS21721Am3P++TML+hoaHXrdOSE=; b=BUpEn+TjIo5YdfxGO8xy3RqsOY
	gmszBxMqrE8ZYQHueXAVhBxgnYbu5fyF6/5uHRH8WkUDV6g4tuVfZ6IO2ikYLUuHS4QKeJVffhLI8
	HrETDg8tUEgDYKbpWmEPcxBS0/36V4AmLDB7JrIZCLZtUi2s1lnK4teTk9p+KzOKgRv++vBgTnnhA
	3D6gJBPQfh3vOjteeycmyTMk7OB4/uuBRs8jRiJyyK2ZfiEX8OQlsmCTU1TotwjXsi2iYefp8ToNk
	XBxuu/xdIohmHYUT4QpqezSM+UNpC8lbaiUsrngqXh1MAPlWNnGRerHW/zK27ESfpd/pD3VULyo03
	jVlMCHkQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPODU-00000002RLj-4AG3;
	Wed, 11 Jun 2025 16:22:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BE61EA5194C;
	Wed, 11 Jun 2025 16:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1A4C4CEEA;
	Wed, 11 Jun 2025 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749658936;
	bh=ziAnfRxyNjEpCFfJWS21721Am3P++TML+hoaHXrdOSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EYDhMv3P1nNHg7yQuL9LjYXiZ9ORAsq3I68fYTi/2MNVIkJkwzZ9gQUBM0bw6BRD/
	 uOIgFxIblO8opvv5LsAMfBCV3JzloO1RU+Z4O+h9gN3jmb6Vowpf4LdTv8LZrRZx8U
	 qvOBN+9Vt3fAIFctk5tBrnICe6qGbKihcNe/SvUJ9H0r6vDlte0Zlgl6JYjjVAA17L
	 Ei96J7SqN5MeI5JlM8IpMY+pHQH96geciXxUkoTsa6Ienw5cOXVqs2vQ9odQol+RmC
	 ZQPMz+HK68AAsgRKnxaAgBoJOJpt+oUgPyyTdJvs4dET0RNjYu6wJZlVWNql8nkVQT
	 L0h3l3NTO/8Mg==
Date: Wed, 11 Jun 2025 17:22:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/13] ASoC: mediatek: mt8183-afe-pcm: use local `dev`
 pointer in driver callbacks
Message-ID: <d9107e29-ccb3-4a60-b6d7-dfd938c45b4f@sirena.org.uk>
References: <20250424102509.1083185-1-wenst@chromium.org>
 <20250424102509.1083185-10-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OKDsn+6sk/Ui8xxs"
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-10-wenst@chromium.org>
X-Cookie: I've Been Moved!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_172221_231171_40053316 
X-CRM114-Status: GOOD (  14.82  )
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


--OKDsn+6sk/Ui8xxs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 06:25:03PM +0800, Chen-Yu Tsai wrote:
> The probe and remove functions in the mt8183-afe-pcm driver repeatedly us=
es
> `&pdev->dev` for |struct device *|, but then assigns this value to
> `afe->dev` and uses that in other places in the same function.
>=20
> Store `&pdev->dev` in a local pointer and use that exclusively to avoid
> the numerous dereferences and to make the code more consistent. Lines
> are reflowed where it makes sense.

This doesn't apply against current code, please check and resend.

I'm just about to drop everything else into CI so it should just be the
couple of patches I flagged.

--OKDsn+6sk/Ui8xxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJrTIACgkQJNaLcl1U
h9A0swf/YV8Fwq4XzOoUcESeG40woM73Nf36oZKuCPnJShafmWlvwGNu1nrxUXgT
B5uc4HFldlyHz9V+Z3ICpZcWX8BxfVGgGQz6gdUFv0dHmTrF1Uw8jMLQnRzW7Ay8
mPUO4wGiDkOzS4Fr2c0CIs1rjLnFlRg+V4cwfXgC7Tt9MEZl/A0Njgp/WF85PD9A
fHpwE5sBvo57t2tkt/Jy9p6F7JT7QkVTAGljnbiuxQMBkqrX6rj+Old5UhDaYoaJ
R7ktKAYju/Xa2ChFYSwSipX7Mg/7vPMepYJSW8WsYf+XHkUYjjHPqZ99mpCOPvsC
AZJCtp3kY5y+dz8R35xID2GHWqvstA==
=F1JI
-----END PGP SIGNATURE-----

--OKDsn+6sk/Ui8xxs--

