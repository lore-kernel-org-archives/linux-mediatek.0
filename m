Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEAFEED615
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5yJ7EnhShI7tD/Aw6YIbw5YDeQO6VyZqu+RRc+mhEs=; b=RvjumZqBW+zDsAAxBmgrV5YP00
	LIErSUjAr20fDslvBrkKXdKr3uwVxNwh0h64SnPxJp3ER+uPGN6pEMK+MOw/u3cPeGrKdWgpPVX3R
	0jiemY+/xzGUt+uPCz60I4iVH07D8x6yAN6PwXwEl0He34JWYx5l5HmhqPok/F093R8Jp7DkkFtbR
	srbbx99TK/gWvy9/7xfAsk/0ns/pQUKwV+JgfXnUQzV/Kj56QrpCUerncIfUDi+DD4W/uX3vn1COX
	7Wa/8Y3I9IPtLm7cTfOhGgsWlKsTylwa5dSlgl+PnvREF2CEKFyHApHOUJADJpJ4Lne35Dr+/+Lui
	K/yxnpDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1solg6-0000000DXrO-1MnZ;
	Thu, 12 Sep 2024 15:24:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1solZa-0000000DWey-1RMd;
	Thu, 12 Sep 2024 15:17:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FD6A5C5B51;
	Thu, 12 Sep 2024 15:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E35AC4CEC3;
	Thu, 12 Sep 2024 15:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726154249;
	bh=2UwdqZFC9xO/m0eQjrelfthM5Arpc7S3EOd9x/RSR+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LAxiGqLYn+sNKb+kgEcfh7PhpwNdMHrkCSj8xVs3HJf+6+0Ki/yi1Jy511Apeomr7
	 xRqu/opQo83N4OEJAgarhmBFQOYqPcZYNrRguTXxanX8cdMtdp9r8e+ZHUrm2WaYS0
	 ZkjQjZbYOhxSy+P9/CkPQPC9ppzlbX86wdmiQypiLdgca+oUvNLsOedxPmuTXY6XG+
	 9m/tXPEpXrrP6kj2hmhItobsBHtXng/Gk0SgS71eIn10yxrPHLYEZDe+s88Pmu9Ojc
	 vzxJIv0lJOunfh5pCUgNLlW5hKCOUUY/5LuFqLUpO/ZTDhMyEzrT76YPZgLCFlRE7G
	 Qj2f2QPFuvzjA==
Date: Thu, 12 Sep 2024 16:17:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: (subset) [PATCH v7 00/16] Add audio support for the MediaTek
 Genio 350-evk board
Message-ID: <10c1217b-d8a3-489c-93fc-6de45dcbe47c@sirena.org.uk>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
 <20240912145100.GE24460@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y3oLGwx0CbwVg8fa"
Content-Disposition: inline
In-Reply-To: <20240912145100.GE24460@google.com>
X-Cookie: Happiness is the greatest good.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_081730_445211_3F3EF71A 
X-CRM114-Status: GOOD (  13.22  )
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


--Y3oLGwx0CbwVg8fa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 12, 2024 at 03:51:00PM +0100, Lee Jones wrote:
> On Wed, 04 Sep 2024, Mark Brown wrote:

> > [03/16] dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
> >         commit: 761cab667898d86c04867948f1b7aec1090be796

> Did you mean to hoover this up?

It seemed to go along with the series and had a DT review so it looked
like you'd just left it to the DT people to review, there wasn't any
other MFD content in the series.

--Y3oLGwx0CbwVg8fa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbjBgAACgkQJNaLcl1U
h9B5NQf/ZWJ40S0xb5uKIaaPLShhD3p7geYHZwZ9a66tMrFPvLQPcedOcWej18uU
fY+5w+dmP0Ga6zV3m5paFAgei5w8LIJvnnPSmTUshEfxuFuhJ/83qu69Abj+Ewm9
V8j06cS1jSPE+onhQv5NOUTHkDWyL3HGf2uyps5Y0c7Mqd9ABe3AiJK1MSAiWiXN
4PDBhsNjMNMuEVfKRmNzGc2Z4deVPu+xzeXk+KWcccz4vUjUuCLlFnHklaT29sTa
2WON5KGah1lT7hyVYvf4wA+x6MTorlvAczP4W7fm+yd2s3anZO05OB/xFSqniPr7
x6OaFpBbyGm4Wivn5Ikvo3Wbze2Usw==
=cfaI
-----END PGP SIGNATURE-----

--Y3oLGwx0CbwVg8fa--

