Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5D0606A336
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 18:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xPs7Y3Sk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESzuzTBO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=43NE97/+suR2lvMlOlQq/OVozCS12mum69E+yjyBLwU=; b=xPs7Y3SkcFFPYp6F/zJF3CN+b2
	TLiJ1I+72f4j8iIEZZ69C97sDBAwluqROeUywysWKNFDhK5orF2TtXaAtWLj7sMAQd33R/vKjANIq
	0ABa/mugf+a3BkZ3z133ZVLGfsGFElDOsRVIjJaJ0FaoLtX4aJY/MEwJHces99X7J+bxOXQPsF7yH
	dCMGSoDQKQWmb3siZrxst21iKnsncMQEAyrMMY7EfD2hDwaYVV0Y0n061xqzGOAciXK9Ae4xFs9LZ
	1C6IlAvO/hHR4kArwx3kr/2weqqMH3JCLlbZxThOGUd+s6wWEbz8yHaptlLYoWer6csyRspza+lII
	MekKUxaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkDZ-00000009sOA-0deC;
	Wed, 18 Nov 2026 18:17:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkDX-00000009sNB-3Z08
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 18:17:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 098CD6369C;
	Wed, 18 Nov 2026 18:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8931F000C6;
	Wed, 18 Nov 2026 18:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025829;
	bh=43NE97/+suR2lvMlOlQq/OVozCS12mum69E+yjyBLwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ESzuzTBOdkG4ZukOFhNH6zujywousEuGxMY42b71Y6toogP16WegXnUnOOwAu2xZM
	 94LZk5i9vZhTnQXMXusP42QNdAlAe9KShFKOVk+B+6bhewI2T+RxcPnL/YG8kc0AXz
	 2CM5e3dLzcfJeAeLi4ajfCEs0OgeRZdhvp0phDi97Jad8vI5sdxu2UG2Veh0u6eDEi
	 EixE7c/90DvlK3vM7prJB2HR0cHe/IPJOWqcXbDCf5E3++orBQyflIVHoTC3fDAJD5
	 Qx4f8tr5ICkQEvJf4wnJbU21ZSvJhLcYj8DtScqMT/nkgLgm7ZWIzbis6+ubU2ux/A
	 MzFijBjpm1v4Q==
Date: Wed, 18 Nov 2026 18:17:03 +0000
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
Subject: Re: [PATCH v3 6/9] dt-bindings: pinctrl: airoha: add AN7589
Message-ID: <20261118-refried-storm-d43378dd6a28@spud>
References: <20261116174854.342912-1-john@phrozen.org>
 <20261116174854.342912-7-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Nod0t4s8ldmFfdkU"
Content-Disposition: inline
In-Reply-To: <20261116174854.342912-7-john@phrozen.org>
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

--Nod0t4s8ldmFfdkU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 06:48:51PM +0100, John Crispin wrote:
> Document the AN7589 pin controller. It lives under the GPIO system
> controller and selects functions through a separate IOMUX syscon,
> referenced by the airoha,iomux phandle. Every pin is a GPIO in mode 0.
>=20
> The AN7589 has no chip SCU dependency and the vendor SDK carries no pull
> or drive registers for it. Groups follow the SDK naming without its _grp
> suffix. As in the other Airoha pin controller bindings, a function names
> a block type, such as uart or i2c, and the group selects the instance. A
> node selects one group, except for pcm_spi and pcie, whose groups carry
> different signals of one device. The PON groups keep the working mode
> only: the SDK encodes the driver reset sequence as extra pinctrl states,
> which belongs in the consumer driver.
>=20
> The pwm function routes a PWM channel to one of GPIO0 to GPIO15, with
> one group per pin. The pin also needs its GPIO output enabled, so conf
> nodes allow the GPIO direction and output level. Pull and drive
> properties are not allowed, as no registers for them are known.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
> Changes in v3:
> - Move the IOMUX syscon compatible and the GPIO system controller to
>   patches of their own (Lee, Conor).
> - Allow one group per node, except for pcm_spi and pcie, whose groups
>   carry different signals of one device (Conor).
> - Fix the uart5 example, which listed uart5 and uart5_full together.

As discussed elsewhere,=20
pw-bot: changes-requested

Thanks,
Conor.

--Nod0t4s8ldmFfdkU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3rnwAKCRB4tDGHoIJi
0mgMAQCtXqMjFyJDkPv8x2z7GuoGiMd4YO4oxN1j6Y64gK6v7wD/ctkEr5B5wNU4
UN8LKSfygbDfpSW3r7urO7YQwtw7bAQ=
=apU9
-----END PGP SIGNATURE-----

--Nod0t4s8ldmFfdkU--

