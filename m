Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF311C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 02:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcK1exHDhSlHoAdUUFjKkrAP94hyw0NtS9+rJ4yzmbM=; b=a+QtrG5LLlodXd71HBgmgUGY38
	o0DFjHkaWghuulJ2Nwd0ArGe3BhzGCYd5IW1AjoWdA4aSyopW7V4EHM54LEneK4wnTEQeoqQgg964
	o/+GHZYdYC7ml4Yk2l/aVI4DlKRpGc5ln9GeJYodGSVN68d4j9MXVm5v4eRHGH8M/w4QCkGgk6XTS
	uJZhHfD/TJtu9bpPmZL2QuLJq4cqf9McXByDQt05+xQ/Dyei6t0AC1XkfqUxP5x7Z5QzlVwT9yz0c
	cszCgI22FbC6tzfYkvcwpK/iYyh2ugcf93llJ05EkGSwymBGbA3zLw7ObQfiosUG41n+MaRl7Eduy
	MZlrrPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryj36-0000000BiiN-2MTN;
	Mon, 22 Apr 2024 02:04:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryj32-0000000Bihj-3eAL;
	Mon, 22 Apr 2024 02:04:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 85CF4CE0939;
	Mon, 22 Apr 2024 02:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243D5C113CE;
	Mon, 22 Apr 2024 02:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713751485;
	bh=XcK1exHDhSlHoAdUUFjKkrAP94hyw0NtS9+rJ4yzmbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R554hteM0cdmVrLrliiRIZHN2kP2nYb45KXkzOeWnOoiUd/W3bD6SHzQgsxPToOig
	 0H/7n99flJ+uRz98U3Y/pToOrp/HhsQigKGwuU7NLJ6bYYmvQ7FAGyTHolRNq7VXIJ
	 DUhcianteItoDZ9TjTbE71oJAaM04Nio/6+yoENIg7fA9uO8aoq7KVztNCPH5fOTVs
	 cG3t+W2LLOtV1R/crYyseu97p1MywjX2ywzGPtIB7m+uPvz7MO3G/oC0ZPeu7D7gsW
	 LUsic5YAarf94BWohduddVCdgm1n1LWPt6O9m5CcORNTgYrdQj41+MUJBnFAly68LB
	 E0AwY434ZYxAA==
Date: Mon, 22 Apr 2024 11:04:43 +0900
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: djakov@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	keescook@chromium.org, gustavoars@kernel.org,
	henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	wenst@chromium.org, amergnat@baylibre.com
Subject: Re: [PATCH v4 6/7] regulator: Add refactored mtk-dvfsrc-regulator
 driver
Message-ID: <ZiXFu10_NBROj-jA@finisterre.sirena.org.uk>
References: <20240418094134.203330-1-angelogioacchino.delregno@collabora.com>
 <20240418094134.203330-7-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sWXCwk7xYCT2BASP"
Content-Disposition: inline
In-Reply-To: <20240418094134.203330-7-angelogioacchino.delregno@collabora.com>
X-Cookie: TANSTAAFL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_190449_449330_1BF8878C 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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


--sWXCwk7xYCT2BASP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 18, 2024 at 11:41:33AM +0200, AngeloGioacchino Del Regno wrote:
> The previous driver never worked, and never got even compiled because
> it was missing the DVFSRC driver entirely, including needed neaders.

Reviewed-by: Mark Brown <broonie@kernel.org>

--sWXCwk7xYCT2BASP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYlxbcACgkQJNaLcl1U
h9BPiQf+MHWLDD6c7mn4Lo9anxSg6sfBCPhJMRQgjilSVkWbO9u9qqRpZUcj6VfJ
cUaIU8rJOyel4ZYjFieZcFbw6+OQZvkAXb2mtrDYGod5PkB2iwYvZNHjmvuVIqzM
9WCbbMjphVoQtz3S8RJ44C00SIZdGLjjqyNH+OiG4BPjMHYM37lT70oTV/wv/4Nh
NblCIhPZfxgtUVVuRdyBB5NgpjsdHe+leEQp0UYBZ1+w6ES+z/bS41mCDgmSuOGh
0S7CP7CY5xy2A9e0G+LiZaBj7Y7AS8Xsn4rT0kSV9HeAwcWxEf/A6genOX8gDj0V
P4nqi3Cks0HOsm1EQABSBeVEPaOOEg==
=69No
-----END PGP SIGNATURE-----

--sWXCwk7xYCT2BASP--

