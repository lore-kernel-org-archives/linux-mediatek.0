Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E4ECE7A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 12:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JXbgHqUQ0aKUPdu2YpA/gNhZEobY1Ib1Js2eZ6C4y4=; b=2oKsp1RDRoQHUpKu1zI6rwsjER
	RGuasKymAf9O/vLpCetHdEJDpeR6pxUFKkzksjTogXkWRD+kRdYOqsnZBHxTEs2PPJJaj+grD4Qbl
	gGTV3yu7erwkSePKFdaZEJJ5lqj0Qrr2O37PQ5KURxyagKLthBHhrDOSmZetO8FZ1mcAm5bf7va3V
	Qx+yfeSc5B/JdaWS2b/PcCrVhjoscCi4P5pRECov2x+wl1CKIgF1ppcpVLnAEsG0fzzjf2Xx6e5Uw
	JVw0Zv0omKk2kZuXcB+DPh0hjrA1pPrPhU5apTGoXyH21VsWG29eF54qUhbK6dFFiA2xleSaNSduC
	JmqQdMVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkY0-00EEyC-2g;
	Mon, 25 Sep 2023 12:18:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkXx-00EEwo-2U;
	Mon, 25 Sep 2023 12:18:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E92CEB80D63;
	Mon, 25 Sep 2023 12:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF963C433C8;
	Mon, 25 Sep 2023 12:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695644319;
	bh=+JXbgHqUQ0aKUPdu2YpA/gNhZEobY1Ib1Js2eZ6C4y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VSFJXhqMU2CPq714eb0uq2pEc9nv8j/cwX+sX0cQkJMfFGxsIUDvhY5cV5xmCjd/M
	 E1Hxf1DTQu5ojdO+6Wag6OTSsxYBgjPYjej15Hg5GhS4f+28eePgmg59pIKGs/1DHj
	 upDFAiWEv+IkeCUZczfxORA8SP1okbOUkEs63qVemIMTACFYGMrdRuFSM4CX5eBNG6
	 IuG3MXPG31SSkyJi6STlJMcc3lZZo/h6r1SmCr4xHEHAY51n6ljSYHevI4vqxMVU4m
	 EgebJXe+2nOqKz+eHk1JiT/RppNwmHnbVrMUVsStzmkQi4tFfD/2Mpoo5cUc8mYHXF
	 xZRyr7aR78lwA==
Date: Mon, 25 Sep 2023 14:18:33 +0200
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 07/12] regulator: mt6358: Add supply names for MT6358
 regulators
Message-ID: <ZRF6mbpswWoxdJsl@finisterre.sirena.org.uk>
References: <20230919104357.3971512-1-wenst@chromium.org>
 <20230919104357.3971512-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C03nZbIMQ4GsEMUt"
Content-Disposition: inline
In-Reply-To: <20230919104357.3971512-8-wenst@chromium.org>
X-Cookie: I had pancake makeup for brunch!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_051841_946456_AEFACC95 
X-CRM114-Status: GOOD (  12.11  )
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


--C03nZbIMQ4GsEMUt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 06:43:50PM +0800, Chen-Yu Tsai wrote:
> The DT bindings for MT6358 regulator now defines the supply names for the
> PMIC.
>=20
> Add support for them by adding .supply_name field settings for each
> regulator.

This doesn't apply against current code, please check and resend (I was
using -rc3).

--C03nZbIMQ4GsEMUt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmURepIACgkQJNaLcl1U
h9CZBgf7BZ9QaFpLALkLChBSjjaoNvvXZz88PigXkOGFHH1EzKUeQg2iA35QMiZU
5+HHyO01EtSiVuAAB7Ih/f1QjLgnaRc5rooaBYYgO2oy8TO7CDIs+zi58f5Rj3gq
ifKFsw/u3yfhd28Cg55RLbKugC/VmCjRD8fPthvhpSH9d4uKCwSwca4m5k48dUQ6
RuHHUSIr1lEbrL3cpsPUg65EYV2TQYFDPSZjLnqfpXvfna+a+JOnmYzT4WNBvwzy
wx0pVsbA5L+9FFuTPWWZlAbPL1gqnxaCVx4jnfaraolAciq53by4g59tbg4mkNoH
MFOeJQpe9yDMJaFeC1cWs0L6IZU4IQ==
=q4Ky
-----END PGP SIGNATURE-----

--C03nZbIMQ4GsEMUt--

