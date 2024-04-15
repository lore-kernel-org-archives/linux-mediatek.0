Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED4AC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 13:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFXhpJysJPGuXbcIUji4D5PA3EJTVGXCEd//a8Dkdns=; b=vHyVRBrmbxrcZWxQ1O4yNADFJn
	008PDrQTXU3Vc6uMtI3N67iiapg0bvAiQ0iD3uO4TEWNZOz7XWHaFqF2cghlySgcxAxMTwKyyoaM4
	GwzbsrMATjTBLCLlLBi5QggFOUUNZrlClPLSUUzHtiunez3ZlInBwsD89nToILrXbiO/ymHuTL+cx
	AJbamGQBkHSmgBaunqQl4mLnoh2+ZJ78yAx5PKoFYNnHE9f5AlOg9fTKuWA2OJWt4t4nZWNC421Ng
	vSA2bqsBsAHjPqn5pVXF5K7yixyjlE+zmfsbNAwMNhV11ck0UHILUa59NpcqKmdizJ2Xp5eK1Ltsx
	vPYdr/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLxK-00000008LVP-0E8X;
	Mon, 15 Apr 2024 13:01:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLx5-00000008LPD-1Wn1;
	Mon, 15 Apr 2024 13:00:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C06E460B84;
	Mon, 15 Apr 2024 13:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38BBC2BD10;
	Mon, 15 Apr 2024 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713186050;
	bh=gFXhpJysJPGuXbcIUji4D5PA3EJTVGXCEd//a8Dkdns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+qh7+JX/x1EW79kqiWY4vAPsXJARYvMII4b6oB3Su0n3rgAi67ZqH7eFotLhSluZ
	 Szt2K44M8DO7amY6lU2kMWLbRXUNG5ZC46gUy0zHEaG390nB13JIe4Rwl62IehI5YW
	 w0BdqCjQVct4HblJEIinAq3WGFZX1mvtB6JFcHjlnAXFeDO6bF/95Mi9MqQbkjyRYB
	 Yr0aeQA8HhJ4wdGDEQWOV28/Q87JVdLsM6jJwQnwQP1uabGPwY2S3lPwVCD3Q2MYvj
	 OU3mhq4yp2Q1D5enQ8AzV2E35epNQrigp0pnNUiJafe6X1nrjSdThMtPnrj2CAAkNJ
	 pCHN50U9telPA==
Date: Mon, 15 Apr 2024 14:00:44 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-scsi@vger.kernel.org, alim.akhtar@samsung.com,
	avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	peter.wang@mediatek.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, lgirdwood@gmail.com, broonie@kernel.org,
	matthias.bgg@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 5/8] dt-bindings: ufs: mediatek,ufs: Document MT8192
 compatible with MT8183
Message-ID: <20240415-quaking-silicon-e98cac305bee@spud>
References: <20240415110012.148871-1-angelogioacchino.delregno@collabora.com>
 <20240415110012.148871-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7VZHj/xqicOvVrmG"
Content-Disposition: inline
In-Reply-To: <20240415110012.148871-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_060051_475080_392AFF4E 
X-CRM114-Status: GOOD (  11.86  )
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


--7VZHj/xqicOvVrmG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 01:00:09PM +0200, AngeloGioacchino Del Regno wrote:
> The MT8192 UFS controller is compatible with the MT8183 one:
> document this by allowing to assign both compatible strings
> "mediatek,mt8192-ufshci", "mediatek,mt8183-ufshci" to the UFSHCI node.
>=20
> Moreover, since no MT8192 devicetree ever declared any UFSHCI node,
> disallow specifying only the MT8192 compatible.
>=20
> In preparation for adding MT8195 to the mix, the MT8192 compatible
> was added as enum instead of const.
>=20
> Also, while at it, replace Stanley Chu with me in the maintainers
> field, as he is unreachable and his email isn't active anymore.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--7VZHj/xqicOvVrmG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh0k/AAKCRB4tDGHoIJi
0oGyAP9q76hXD18n90xaMMymxRKrhzGMtdg5ikpw3IkeCOxQiwD/RjOm1GlQs/q9
5EhQIN3rerOGKrdYGgLZzpX3goItPQE=
=7MNQ
-----END PGP SIGNATURE-----

--7VZHj/xqicOvVrmG--

