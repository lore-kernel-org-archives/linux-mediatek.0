Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B97C77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 11:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXZ0PSYYEUSQM6MUSU71WkUYgkP2oLrJLIzkIBO8434=; b=4IoTX8KBGY+amLmWU1wss9zZDu
	fOdPr3wWnxo8Ha2TzioDl5KS36eRH0Y2JRSavoHPa/afqjjLhCKA1kTGKRzoZ9JaZ933HumFDl/gT
	a3m7CQA208BzauFhqtHJ+Mol0JO5Sdpt8HLUmmAPbaGLhP6/nhAQwUBZ2VKMUd2vCWMUT0YQyRKGC
	/Lil1JZKdcTCp4zFvZ6WPN+ETiBAen3Zq5hpTt/vdawo9CumsFLlZkSQ4alPKTPBF//D9v5ah15dc
	6yB6klkAkd/YgPdvq+IXnG8XEWTLU9YpS5UGXEsRzq8Uyr995N3hu54GFr9r+UE+BMHDZDW+GveRd
	LEQsj+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmunE-005zRZ-0o;
	Thu, 13 Apr 2023 11:07:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmun1-005z8H-2S;
	Thu, 13 Apr 2023 11:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SXZ0PSYYEUSQM6MUSU71WkUYgkP2oLrJLIzkIBO8434=; b=E2ESEEw4VwBGJ6iLlhyRjHivez
	mj+RQbrFp+fyqkz531bJBzSNsJq0TMVOxlae8D9XEOevvrCXCeAkDg7/QAR78VYUKzygAjQCAoLYo
	lF5zQoaJa9N3IHz1G6oMl2xIYBWnxzrPx/EO1UaFGJwp24t2qR30u+MefvCjdrPCye99WjOJBPjHv
	aKPnHfmTwAYwpV0G5Qsinf6BY5QMTym9fR1qRnuSTpWQsMQe+bqNAFI3zeOPcpBbDZN3gt8/l4MNy
	RVMXEr//N7fGQzv6jT6CdueTbQFgjJwQzaI+XQa/gqkb75G7+ShhiHX+ttvDSJj+xBm269TPWjejm
	M7yviYKA==;
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmumh-00EiRf-2i;
	Thu, 13 Apr 2023 11:06:43 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id E56251C0AB2; Thu, 13 Apr 2023 13:06:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1681383989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SXZ0PSYYEUSQM6MUSU71WkUYgkP2oLrJLIzkIBO8434=;
	b=N6WXCJQDiINNrIEwT8U18KBjg96Szyb1Q95VOeDY0uA5RkJFYnQ16GsoiFqv7HyXn0/k5w
	wIcvmF43g2konV7rwQ/43yfMAY0r/3nnVgqm6gvTQK+kZj3/w9Xj4h4AXJjJ9voKaQ3v3n
	4ldD4oBPYcOzBgdCV02juaMF1i9vUno=
Date: Thu, 13 Apr 2023 13:06:29 +0200
From: Pavel Machek <pavel@ucw.cz>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 7/7] leds: leds-mt6323: Add support for WLEDs and
 MT6332
Message-ID: <ZDfiNSAs3Bc7xe1l@duo.ucw.cz>
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CMT5ytgWM88tDRdu"
Content-Disposition: inline
In-Reply-To: <20230412153310.241046-8-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_120637_167063_FDAA4720 
X-CRM114-Status: GOOD (  14.73  )
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


--CMT5ytgWM88tDRdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add basic code to turn on and off WLEDs and wire up MT6332 support
> to take advantage of it.
> This is a simple approach due to to the aforementioned PMIC supporting
> only on/off status so, at the time of writing, it is impossible for me
> to validate more advanced functionality due to lack of hardware.


> @@ -467,14 +590,24 @@ static int mt6323_led_probe(struct platform_device =
*pdev)
>  			goto put_child_node;
>  		}
> =20
> +		is_wled =3D of_property_read_bool(child, "mediatek,is-wled");
> +

This needs documenting in the binding, no?

> +static const struct mt6323_hwspec mt6332_spec =3D {
> +	/* There are no LEDs in MT6332. Only WLEDs are present. */

"Only WLED is present"?=20

> +	.max_leds =3D 0,
> +	.max_wleds =3D 1,
> +	.max_brightness =3D 1024,
> +};
> +

Is there chip with both LED and WLEDs? (I'm wondering if this makes
sense in single driver).

Best regards,
								Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--CMT5ytgWM88tDRdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZDfiNQAKCRAw5/Bqldv6
8v6VAJ93zFWTkbyH0IbcZNqsmvmIBiG//gCgqu69T4ZeaIUzp48MojiPkugt8CQ=
=AxkP
-----END PGP SIGNATURE-----

--CMT5ytgWM88tDRdu--

