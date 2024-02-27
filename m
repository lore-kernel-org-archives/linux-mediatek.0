Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0886BC54798
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 15:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3D4xRZMC0yQwYg0k8TI69T+UK0TZgamquLZlrSqBIg=; b=nW5WbcvbyhHBS+mxcjGmtuR/KR
	nmk2oR5M8nYwKFsztZ63Bo1hrcowhrJwoJkJT2QYj5Llf63teF12mJ4UVbS4Vtv/GbwV5/33KoA2M
	V9WNgiI+39oB3Eb0HajSYZUITGTjFW6kiUyqo1WcnrcB1uS62o6CJdU0eUYGMwvobsCcZ95WnvETU
	u8F6BpW+tHI7rASlMvVBHkEiwWFTlix3Pm0hCNWfMbLs788abKhArkoH3MjcVfL5USPxWjmh78Pt/
	o9qThZOSSAcQtEXuye6kF5790YJfCkeiURLmjwh56ajhLK+Ir7PMiHMEUcNvXI35Mr3IrZpWLtzLW
	pxAsyJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rez30-00000005iQn-0F7G;
	Tue, 27 Feb 2024 15:07:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rez2w-00000005iOQ-0CHP;
	Tue, 27 Feb 2024 15:07:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 784D861228;
	Tue, 27 Feb 2024 15:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE7EC433C7;
	Tue, 27 Feb 2024 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709046421;
	bh=me+PaR02OqhyQDVfheZnctQBFyoYjMvRYEUCFZryMNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgLCqJl5Tjup29jLQDrfmHzJGcqm6Vn0A8QXbh+nlYBzo2ztnaVO69jw/ROGGmueY
	 Q9CPhg0EF4DmsduPBINCvhKNEiGUEtH2sTIg7deV+MJ6/U8qYhCiUAdMgk8XbPVToj
	 9wtNHmraZWYT1fxgj94MCWn8gj21ORbqXgMnPCijB49ft1u4dQcyICfaz2g+vmNMMs
	 rZZsVNAfiQZ0jA3ObE7SKMxvTqvsNl4f5z1q0W1ZwJwQ5UCk+f8WCRJyArGfEyJdrh
	 OINmmHKU5aIdMSwoD6cUeaIBcBAd4w8YASgdaCcJMogfF+vg1YgDVX3fDIbOTvokyG
	 yiquWurwJIAEA==
Date: Tue, 27 Feb 2024 15:06:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Nicolas Belin <nbelin@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 00/18] Add audio support for the MediaTek Genio 350-evk
 board
Message-ID: <4ffde184-cf68-4b71-b81d-9b5894529926@sirena.org.uk>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z6rJHLYKeV1xaopM"
Content-Disposition: inline
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
X-Cookie: Please go away.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_070706_175297_9C9E5D8C 
X-CRM114-Status: GOOD (  13.59  )
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


--Z6rJHLYKeV1xaopM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 03:01:38PM +0100, Alexandre Mergnat wrote:
> This serie aim to add the following audio support for the Genio 350-evk:
> - Playback
>   - 2ch Headset Jack (Earphone)
>   - 1ch Line-out Jack (Speaker)
>   - 8ch HDMI Tx
> - Capture
>   - 1ch DMIC (On-board Digital Microphone)
>   - 1ch AMIC (On-board Analogic Microphone)
>   - 1ch Headset Jack (External Analogic Microphone)=20
>=20
> Of course, HDMI playback need the MT8365 display patches [1] and a DTS
> change documented in "mediatek,mt8365-mt6357.yaml".

Given the number of custom controls here could you please post the
output of mixer-test and pcm-test from a system with this driver running
next time you post, this will help with review since it checks a bunch
of things around the new controls.

--Z6rJHLYKeV1xaopM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXd+o0ACgkQJNaLcl1U
h9D7bgf9HvLTv1/D7ibf9xpiO/7Y8mdR7blZxSERHC0VJyzegzQI6g+LO1qHYqc3
w9Kt0UwtxRgeVFwzBejVVYpZ72d9DoqN3nS4osApKoOChjapCsvasw+uqAodEk5j
he8RYvVZ5UJWO6P1D5+DkvesptWMDXHFbcoASdlGpEURjMBSLgIOZPnhsZumU0tf
AzDfDa1BwQwuIS/hg7ebHpzFlevB7SEUANSppMJ3Jp7/SbgTPt9w+/+lERnOiAh1
G86yCidp9TlgUpb92TVwFyOcdnXT13VmhCwZ/7xwye2IVNnv4CXmFgPk8C4TyNdW
s1HkIR6EuDYgEsxPOSQt7+eWhweHYg==
=/HK9
-----END PGP SIGNATURE-----

--Z6rJHLYKeV1xaopM--

