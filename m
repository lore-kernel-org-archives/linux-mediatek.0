Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B6BFCC066
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 19:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+3NTRRRtkgOTvh5mtd+iKhL1Y2otrgIc1JfWN0MOUI=; b=dOW14tAdHzOZGwgIyKnzw3eYYn
	Pcmasm2i1w52Qs/W+CJH8s8+1q78x80iwrxOMz1pg7hTwgZLdABV+KldVAKCOPBwQf9a6Rs7UWsZx
	KuM9562iCK+XPgeyxBVzC8fXrWmGBOCEjBLn1PjWcjNlXhpDzZk9LQrJThaAidPEaxluVCwB+64fa
	lbMx/g/w5H+lh2AR4Z7WjSD+nM5Z8czIWG6Kea1VFAbfyVZzfjUAsU2a65x/nb5Y4i6hLAEt1/d4K
	Rt+BJxN1pKDtK2SySbjrrzTkAhxmp732TXzduMroLpkJcWSjn/EJOI5VMlZPK40Q8NSoE+Cn2doLh
	008wuuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyb7J-00000004PyU-0oJo;
	Fri, 06 Mar 2026 19:45:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyb7G-00000004Pxm-2kEo;
	Fri, 06 Mar 2026 19:45:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA77E42A08;
	Fri,  6 Mar 2026 19:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778D4C4CEF7;
	Fri,  6 Mar 2026 19:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772826341;
	bh=x+3NTRRRtkgOTvh5mtd+iKhL1Y2otrgIc1JfWN0MOUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lugK7+scdJBBhiZq7oTAcGs9SAzNLQGkGinHM39UgUtCk37lQ0ue0jJ/93NWH5iXI
	 Mi3hAHfVtTzu/EjCt7gi4SoixNl6t6yMT6Y7zQT8TAihU1LndL/eRi5SxceE/KY/1m
	 hVE89Rs002u3eU5o1zpiQ8PPtTxkQnB4B1Y93gSRb5He2kfrUkzqHmKRxSLAogWlgx
	 0rrmNp9pEmD5wIv7bjK6kO2DzxVFP8qhuPNleJRNLZLXItsDKyAy89CuwyxMFTSt8P
	 O+DXLMzAI1QBJ/ZMH26MYd0gkCwBLj4KNng4lGSdrrR1Z/9zp21HsGVf+oQ+hxjfSP
	 DtO+WQlht1LLA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A0A0C1AC52D4; Fri, 06 Mar 2026 19:45:37 +0000 (GMT)
Date: Fri, 6 Mar 2026 19:45:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] dt-bindings: regulator: add support for MT6392
Message-ID: <aasu4UqZv7HMXX6V@sirena.co.uk>
References: <20260306120521.163654-1-l.scorcia@gmail.com>
 <20260306120521.163654-3-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/GMRHJnvF89z60eQ"
Content-Disposition: inline
In-Reply-To: <20260306120521.163654-3-l.scorcia@gmail.com>
X-Cookie: Think big.  Pollute the Mississippi.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_114542_716893_FD713605 
X-CRM114-Status: GOOD (  11.27  )
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


--/GMRHJnvF89z60eQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2026 at 12:03:06PM +0000, Luca Leonardo Scorcia wrote:
> From: Fabien Parent <parent.f@gmail.com>
>=20
> Add binding documentation of the regulator for MT6392 SoCs.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Acked-by: Mark Brown <broonie@kernel.org>

--/GMRHJnvF89z60eQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmrLuAACgkQJNaLcl1U
h9AXeAf+PIlXpslfrQ8vsFtLhhUNWSZSG2c6ukWLzTxJvTlhYNpKzP2XF//6/nvm
nLOsknmi8T7cornx+o6miEp6e88p5JtEiAaYeupKHrUi+GbOhFf364SiHG6U7TF+
eG1zvzep5B0vPGc2GqKWOcHAG4+3xIVxYbF3rnG0gHct/qXK7S1J7RQxaA4DAdNv
OfxEIGzD5qR/yJCjtYioMDnBibUnj9vPyrt0G3Ekcgiptn4gWziw5HnhjKacbECL
dwlH2HrVrEB2VocQGishwscx+TftyqSSm1NiAWRtOuroXq5/a6GLX9lYvqTMlWVJ
EtubtKoks2gAKmRLIP67uKQgfyPzww==
=inXS
-----END PGP SIGNATURE-----

--/GMRHJnvF89z60eQ--

