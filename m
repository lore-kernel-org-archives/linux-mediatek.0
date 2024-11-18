Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9BAD591AA
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2024 17:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tIib4eNH4Bj55ytCO2SrDsnedFwF9aGSQvLrHzbjSk=; b=LMGhhWgroOs2PmXkDtqgIM0YAg
	CYqkItADfMXnyqSlFMwuuVXjaN0FYv3O7KjYKWjBfmkP9xZesN4GZfIjvgqOTepwsTHMLz6uTfmPC
	IE1+UMmYz1uy9zO+p8sTrCh7nNyq7rtkUcfkdhn8KaF8x0NI7bV1A6k7Fdixdwh7NKINDbKaxU2Aj
	lUu8Z2gOkZvsrH8Tk5R49OnecwzesZEcOuY8Usj2DD2e+2UFUzZFVBpOjj9Wrp2Q9mFa0mQgQ0onF
	ThY1dAdfe1dYYyI7FhiVVEjeAAngd44+OCJggPy1Ygy1Ii4vhoYP5PhO6XPUhSQe818+vyGaUdE1P
	qplKSIYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD5ka-0000000AEvo-11Of;
	Mon, 18 Nov 2024 17:41:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD5jc-0000000AEo3-3by2
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Nov 2024 17:40:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so39215325e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Nov 2024 09:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731951623; x=1732556423; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1tIib4eNH4Bj55ytCO2SrDsnedFwF9aGSQvLrHzbjSk=;
        b=PNGldatg9asndfeO44dlNRI1QYRxASrXMSSGwyl+tv4JNvlq+6JTfWCOtJS5oJ/l+j
         ZPnY4sXJQqTwmF2y0XGNWrioPl4Ru3BkidfE66OM0DLyVGI+MemnLZmDDUrLiFXdvD6H
         sSJAcEWqYnKdEP0cJTuFOdtjuJ+UKaMbEmXamq/AoJAG6WcLPaj3lRax3/bOOY3WFXPF
         m4N2GkwPhQLQdb2cQEsE3ceh6xz4fPAcc1wcDeZJPDbimTE0jb5PuZVWNuTxeG43LvAc
         lZBC4z/WxMLpJtAkq9xKbM4umdymBJV7ipRmX8p0f9I6ZMpxYY/z8VDsdRHD13Hh6pq+
         FiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731951623; x=1732556423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tIib4eNH4Bj55ytCO2SrDsnedFwF9aGSQvLrHzbjSk=;
        b=S7Me+zLOd9A9GujXOWjp86zXG/4VUS+KXYnAmUuEIay1ucdXTvnOyD2l5UHzmYqpl8
         w53B9iHkHsuka2wlt4N2/004DEYVsXAdRjP+cGCgayInt4ivwhqrQ93oc3coFtK+vDaS
         1yv9sU2OPpCwR2+/qirRCyALN4ubuI+59OIYz4xhMAu2T34J9Qm7QB3egNPHBfB4N1Gm
         nufapqyF3st2lzABhQECk32RZi4h5qmVS8QWKL7WiNYRvIXRCngbGsAjC9rBAQCkJf5Q
         Ld8IQ53TvDXFXuUQZuePTTTeraIFi979+zbHJOEae6K581lPStaVO/bnv7qbnIg8LaS8
         BTsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6mC9JyHLIkqtRTthIjj6kJVoeD6UcZKG8ZEzz0Xw/aoh4YnPVKmyNNeWvVNP48IEIRiwkT48i/aW7peJL6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYqZnXeYZ0qaEumf5I0fCW0mmUdofs7zZfMNsdsQTfAJxQeQax
	QmfYXCQFlj0fA1auExipOPqKhGToPOgVN+uHNX0Gk7rX9saBXgmgHRBnRebYAp0=
X-Google-Smtp-Source: AGHT+IF3nj2yHydrx7Ks+n+zytE68ZdQxoMq1sSNeM0Nynyzk3P/uHdIYwyssSFKYkQ+6vZqXuvURA==
X-Received: by 2002:a05:600c:198c:b0:431:55bf:fe4 with SMTP id 5b1f17b1804b1-432df78a99emr105241745e9.24.1731951622735;
        Mon, 18 Nov 2024 09:40:22 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da298760sm166249345e9.37.2024.11.18.09.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 09:40:22 -0800 (PST)
Date: Mon, 18 Nov 2024 18:40:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v10] pwm: airoha: Add support for EN7581 SoC
Message-ID: <kpbylpee46nmxxvzxfbylscfafrlkpzjt37lkfdt4vtoq3qvfc@5v7khvwwohty>
References: <20241103-en7581-pinctrl-v10-1-1990fb6996a0@kernel.org>
 <673b47ae.df0a0220.2187ad.bc2a@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5bt3c2qqssojeolk"
Content-Disposition: inline
In-Reply-To: <673b47ae.df0a0220.2187ad.bc2a@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_094025_159064_0B18E956 
X-CRM114-Status: GOOD (  11.52  )
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


--5bt3c2qqssojeolk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v10] pwm: airoha: Add support for EN7581 SoC
MIME-Version: 1.0

Hello,

On Mon, Nov 18, 2024 at 02:56:58PM +0100, Christian Marangi wrote:
> since you gave revision for v9, any news with this? Is everything good
> now? It's sad if this last piece doesn't get through after all this
> efforts with the previous series :(

I'm sorry. I still have your patch on my radar, my todo list is just too
long to give feedback on a short-term basis. See
https://patchwork.ozlabs.org/project/linux-pwm/list/ for parts of my
queue.

Best regards
Uwe

--5bt3c2qqssojeolk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmc7fAIACgkQj4D7WH0S
/k6GNAf/Uv0TP2XG1eM5gVUAzPsO8nIbVqSQu0qVstgU2m0w4fwe4Sf5ikqykVsD
jeYs+uIgK1r055ifeUSf32mcXOb5nW1GPob8stTVfViOL0diAuv4d88kPzGnDi/D
vn+BwCd2pOi6dGopB+ZqtajsRasx7NNFvTf8ZRcq5V0/kpElLAcLQLjAJZGigjbt
a9d1Y1lnBUk+GeCg1rLvNDo5MPkL1t0xcRZgxr6qp+VVGBuO2SsL2IpW/eZz9HU+
M+evGLlT8hwlrNoBgZQ5vGvfZtda51JmcHTiF9b28iZC3pOnws8QiXpmznPlVhDN
5Jp1+kkmy5YbonA6ZlI/SncX7LzzKw==
=eBCO
-----END PGP SIGNATURE-----

--5bt3c2qqssojeolk--

