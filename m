Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3988FC52D6F
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 20:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0doI7EW+trTelLfpGjOE+WMVt0A28mMUQkrPupUb1M=; b=GcQY6RPiBhVk6yDrJc2jmGuYTZ
	OZefYdXVwl38g0zfDqG3ZH4uUfSCAQLs6NhW6IPCjMgTG3k5lF7sSUP9odnF0A9Evisu64MSTT1J2
	4B8qMGa/QNTolEV2eNSB4OXepvYL4useHCZ1ZI09tOhs2L8zGbz4n0pltC0zL/3tPCWuuvNrW4Xg3
	BCLu8EAR/aCfjH6r8X6p6O3vDH2RmBewLwz/Il6bQ0tSH4d4k2PC1I5+m1Jnrwlj4/HWX1OhQZYQv
	BPhgULbZza2lJqk3DMekPXQXNkR26it84TtDvdii2ka9Y97qcojHRWZuDJTJt/LwsPpOgRojLWWFv
	Rswcd4UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbR5p-00000002sCF-3Xqw;
	Tue, 06 Aug 2024 20:47:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbR4A-00000002rg9-0Xk6;
	Tue, 06 Aug 2024 20:45:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5188360F08;
	Tue,  6 Aug 2024 20:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B28C32786;
	Tue,  6 Aug 2024 20:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722977157;
	bh=DQ4di4g7iT1eApSTupyvEh0ZQhuK2NwMcj4qW+uji00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CXdthX0/9BmWfLQLLyK8FHps/5SL/MitMI5ZU2/k2UJPP7Vb793LFABCFx3S8JaaA
	 clOCQXWoc1bf6oLMyZbFX8ZQ0u1DlSKXZfOFYH/AnS9/xjYcop84lFTFbqHLpnxbAi
	 kB6oUUD3pZa75qLvrmtAv/XfPL8B74dlWP3uMHojQ3XE4Ghjjq31VrSK6h7Xq5ToTE
	 d8wX19mCQkWRr5/RWtLP90xi13qX/LDeGXtk4pKrCoKnTnptHU987a1BTq5ANnm+UR
	 Yrm5deHrXNkyzvgki0SX1ew7mmsJSkSw1mbyo0FBsEO8bU/Hp1hnIZlr/BgO7ciqvW
	 aus+7x4I/hKlQ==
Date: Tue, 6 Aug 2024 21:45:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Sen Chu <sen.chu@mediatek.com>,
	Jason-ch Chen <Jason-ch.Chen@mediatek.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] dt-bindings: regulator: mediatek,mt6397-regulator:
 convert to YAML
Message-ID: <7186e664-ef52-4552-b91d-d6ad358eed4e@sirena.org.uk>
References: <20240806122507.2766-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pJ/AckYPDty924kc"
Content-Disposition: inline
In-Reply-To: <20240806122507.2766-1-macpaul.lin@mediatek.com>
X-Cookie: She's genuinely bogus.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_134558_310891_98A038C3 
X-CRM114-Status: GOOD (  11.46  )
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


--pJ/AckYPDty924kc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2024 at 08:25:07PM +0800, Macpaul Lin wrote:
> Convert the MediaTek MT6397 regulator bindings to DT schema.

As documented in submitting-patches.rst please send patches to the=20
maintainers for the code you would like to change.  The normal kernel
workflow is that people apply patches from their inboxes, if they aren't
copied they are likely to not see the patch at all and it is much more
difficult to apply patches.

--pJ/AckYPDty924kc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmayi30ACgkQJNaLcl1U
h9AKDgf+IWMZpBQCI8bs1vbOgAI2X4JErCQSfq1xCOp+2JAccBEB+IMftlvfNWz3
Jhmh02Z2WWfM5ykM2VQR1cfvuksln0n3ZTgpQnI8iPZffqSrMO0XR65afdsTfdG4
9XIr+JYZYVLO74BOunvm5/e5j29r7NIdiiMeQ/cncS+blZK/GpT5lAzZRfo7tdeB
9/Lo05f/twaWXY/loZv5hAl9TjXFrr51pG7AOX2Y5HfL7kPpoaHu/Tup9WAt23JE
bF2PsG80Wdp+bZVgrK/dZsYlsxMENlUmbSuEnIhsKgM2iKbWrOpbtdc7iNqaMpf0
iwRLxZh8ajeC8D1FY2UJ8xS2Wykbpg==
=W0Cr
-----END PGP SIGNATURE-----

--pJ/AckYPDty924kc--

