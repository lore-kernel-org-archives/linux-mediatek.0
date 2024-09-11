Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FADEE01EE
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUqxDXMcEh9crbr3c/PbT3G9s68qqdywqVLq0BU36JQ=; b=D+OpySkGMUmzrpzelBrl3x9rox
	9TEyK/Kr5XlvAesTBA41zDjwbc9ZLYY8eWbRnMYzZ56jjcIDQ+rPOp1r4/m217n3aIOGGbbSjx0ar
	p0PYIptypmkF5fPps5ObH3JEj3vuaiYthjEOUaXwMSkDm/OXbFjvLd1B4EMXKyzJFsEiltCH3z1Xw
	xIcU7BHi8ro8Fr9tqYKyXozBcxKhAPYB+aYfWpPKgi7S2tneG7lmiTAUI3H15ANl/8U/pOR/bQvxA
	jTdcRYwVASEeIehDz+W1r69wV365EnFiidrX9PsiACIwPZ1FPwenuzMotGW0RGU1vkUV/wP0AM98n
	irQpO8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLEK-00000009EXv-1mMt;
	Wed, 11 Sep 2024 11:09:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKy9-00000009BBM-0qCj
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 10:53:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F1A35C03FD;
	Wed, 11 Sep 2024 10:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5320C4CEC5;
	Wed, 11 Sep 2024 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726051983;
	bh=CWU1usM1Fc4L8jz0AwjuWs+azk55gYJ7fhnDIUQdpjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lRUJtG8604pBhZnJqcL5I3TA4+qfLCb67YzWONKZvN+Ml2igh0jgaqfbRS0jr6Qv+
	 KCUUFzl/VewWqOzkwMipnALyBGGr3HwNdRRQLBD1w1hw+TfDCBTi0X0t7l9ZiocPEw
	 p7LI1K+smLgR5P1Y3pObnHu7eOUbiVXwlrTeCkDbWQCQlp6zO1qMR8O+zLN5SCv3vF
	 GIPDauuNC412nXH2FQpJwQBXdvx8ZZgTZBrrQcO7ly7bKVt57b2wtrMkXLnTqZkDzZ
	 mv08TesOeuQh/2yzmKwFu3TDWRmVA+uYMfyHcU97irFGBspfne12EcnAresvhMNl5w
	 N/PAognTiz20g==
Date: Wed, 11 Sep 2024 11:52:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Qianqiang Liu <qianqiang.liu@163.com>
Cc: amergnat@baylibre.com, angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com, matthias.bgg@gmail.com,
	linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mt8365: Fix using uninitialized value "i2s_data"
 issue
Message-ID: <9ea8731a-7888-40a2-a183-4598884bbb27@sirena.org.uk>
References: <20240911001516.47268-1-qianqiang.liu@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xkIdGi0B1wK94o1V"
Content-Disposition: inline
In-Reply-To: <20240911001516.47268-1-qianqiang.liu@163.com>
X-Cookie: No Canadian coins.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_035305_463268_2F5A46EA 
X-CRM114-Status: GOOD (  10.08  )
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


--xkIdGi0B1wK94o1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 08:15:17AM +0800, Qianqiang Liu wrote:

> =20
>  	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
> =20
> +	if (!i2s_data) {
> +		spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
> +		return;
> +	}
> +

Why would we look up i2s_data without the lock, take the lock, then
check if we actually found it?  That doesn't seem right.

--xkIdGi0B1wK94o1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbhdooACgkQJNaLcl1U
h9CIIAf+Meowos7+a1r47+yCHWWJrSYtF4np5O3KaZc0Y5hwBG9w69H1+o9kc8Qo
x8o9x2g7ba4KlKEBjP+MnbF/zQ3McjMUlRz+MiVJsDXw04INZXg9VKUMmr1j1InY
slcW/8YC4mn93rT4tWoDuzcw1SjSzVeh4fISJU6wPGW2waJMZ94HCHeSGF7ma8yJ
zDQ1yPCdDmpTTkWgritboCk2wBluOvoxbmXcYQ/mYEcIsB5peCZORP6PCZndDmh2
thMaYWTbK5g6UnnV2hC7D7eSI6+9RxdOWnrf1N6WSg6ggQteo3EWTHv2ViMXZCeH
y8rPm4hyU28upJIHhKJjDq0M+TIU2A==
=qOee
-----END PGP SIGNATURE-----

--xkIdGi0B1wK94o1V--

