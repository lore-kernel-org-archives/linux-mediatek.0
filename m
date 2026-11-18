Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BA8606A32C
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mrf05FCy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTblGmb+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r2HKNGzBGFFLB7QXLG+/OIKe34xl3sEbWCjmo9naTVw=; b=mrf05FCyAnSCTgYck2A3aKWuGM
	/FK6HYM+Zml+Hnw7Pi0WKe9mBcSOR76OiuqaSH7CjGWKHWR1yBhIkGHHGzRmwMF4GHer0fNaKctQB
	QVZsxBH90Y0BLhJxOwh/5DGUe99HHDNSkA4HLYet7FB1qxS/x2lMrLHJCjhe8IJgIwD02b7M3QGOw
	YHphQhJNaFNV9Q+Q4SSVklxTex0uoX/ZLK7fzSszblnvWMKXxcPARME5fgoDsl9wvEmYCGZ+VtFLF
	/DhrccGy2sWaARwMLHgfK/0PumYrD5Mam3TZKrYhgt9eNGl57f+KUJ4aNpGK42ly8+rhv5xh+38mM
	fttseqZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkCr-00000009sHp-0DIt;
	Wed, 18 Nov 2026 18:16:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkCp-00000009sHJ-27a8
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 18:16:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA57463697;
	Wed, 18 Nov 2026 18:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD971F000CA;
	Wed, 18 Nov 2026 18:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025785;
	bh=r2HKNGzBGFFLB7QXLG+/OIKe34xl3sEbWCjmo9naTVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mTblGmb+fYTrsL7tRop8916Fv0mAUgWe8OBhjSYMCDi7byKzGjiKmEvbfl7SXmJE5
	 2jBM06yZCJ1Cvc6l+k4nCNgdTlWlPk/xw0cZxNmqHDT+Frpk9yVYBIsL+tgLZFkM1O
	 hesGpRCfKijHAdGXNKofYOOWDB6fs3PfufhZ/1mWUgAgRpIKEo0E9w+T1nW/9fcOkn
	 TcV1Mqntorf7EnfAbECDIvNagkM8cg+d9SAy/8pomMt0Gmou4YYdHyJ+wCyl5UxybY
	 ZXTWGGNv0LAsfyvIEWYxPeNOagEM3utltSdFoHa9QN2wDXxq+foZ8zXrwroSdC2gvv
	 w2bFnA5pt2q8g==
Date: Wed, 18 Nov 2026 18:16:19 +0000
From: Conor Dooley <conor@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, lei.dong@airoha.com,
	Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH v3 5/9] dt-bindings: mfd: syscon: add airoha,an7589-iomux
Message-ID: <20261118-referee-pavestone-aff74f682ac0@spud>
References: <20261116174854.342912-1-john@phrozen.org>
 <20261116174854.342912-6-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lCDyaRCixzLSR6ce"
Content-Disposition: inline
In-Reply-To: <20261116174854.342912-6-john@phrozen.org>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--lCDyaRCixzLSR6ce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--lCDyaRCixzLSR6ce
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3rcwAKCRB4tDGHoIJi
0uILAP9Jmc8hP8rsJzS7SaMgn5XrRGp+P0oOcHC60Ja4tsqStwEA1ibV8ymvGbep
Hd6X5xJIDfJZPBUs/48MBWivEUqgXg4=
=Pxz8
-----END PGP SIGNATURE-----

--lCDyaRCixzLSR6ce--

