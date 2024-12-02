Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19E6D7832F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJFQOhHvRWMfU0TK3Z+kwO6rmT9pNjzCjW1otfK4k08=; b=lyH6K7bbEQ9wMJMyx3xYYso95S
	AlwPMdRFbFo2jhOLLfjB4ijsQaFGnnXCJ4MPID68KdvTem71KapqXhPTuxjY7lJmPgxemUchwK543
	rMXN0Q7i6CAjwJbOWU4kWJYbuXImgcQ1Up0GFcV7xjOiD2QDVqJDK4MCzh878pCXkBRASTUKB2iZp
	B8JdF/68xLuNeE8lmUegF0+QhzDjcGnM4VmPhb1IzDgGpoIPOSVkRbRj32MGaZmioukKpdwsenVMN
	67pXGRbH5i+mq4SQ9OT6lboch3Qm3OuEdDl/5Vww+W2ZZZB7S8eJyGWisqEZXLmRwgdCzmv3Jea+p
	G5tWyqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8Ou-00000006fJ4-24GJ;
	Mon, 02 Dec 2024 15:31:52 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8Or-00000006fIF-0Iwn
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 15:31:51 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-434aa222d96so55743205e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2024 07:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733153507; x=1733758307; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QJFQOhHvRWMfU0TK3Z+kwO6rmT9pNjzCjW1otfK4k08=;
        b=IfYVFOSUpzuAHGS+/D1WFDR9ofomHQj5aPWoFm/EQfuyIUTekqpMCmcuP3tI5210dC
         WTtJvZw45/s3dNIkewrwNm9ol0CZPdGVDfbGIrv5UanuXwU5z1HYJSnGR+c6rGXSx/KQ
         b2CVJDGMg4z6zs0xFlHRgoMl6AckgXAycxE+s6zz1t99gDR85fKMs/FfXSbKqloTp6m4
         4QmPqrULhqne1blfTUkaHdrhTZ9WVqPrMer1EyToSjMk3tlLy/2mzFJoIcHSvVaHuHzV
         Ke5kKa4lPyjdy2FO5thNK8tLfJEk8KZMuoQgMpnCYGXltrNL9+hy+AAofYt2IkmZscL0
         gIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153507; x=1733758307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJFQOhHvRWMfU0TK3Z+kwO6rmT9pNjzCjW1otfK4k08=;
        b=FCM2qv7LrZJsEQxoI8okHEHXGRBab6XotKVv28l+E6RJNqDhd+UiwZBzvjwe9P9lBR
         JqvpohrOkgTKa7YmarTFDR2KjzoM99SS2YQe8YTNWMVBcGflWQz95uIThV/39A7C9CWo
         lsNOQ9WaWd4hUkghWbHGjHuhBhfyXh2aCSomIET+S/lPOWPt7jexHx4dk2qhLYRb6eK1
         wsPLDlmANNllynxZZYz1vd5hdPtEcWpyqRiHK38jh5KbdkUXw2/AGEGdR4tqYv/OBiRu
         14irty/Ip+n4djziluvfLLYzWeqpGLtLyxa9l1GLoONI7E7HldSu6wspjk0a1H88649/
         GOVw==
X-Forwarded-Encrypted: i=1; AJvYcCXxuFj7OGHqH/lcZ4c44g1U9Hj3OpZX5nfC6IZ6N/Bmf7Rw9dqg+euz540onkXKsDoh/dLFvVgVVmbxXSKEuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjkC3hjaevQulnIQPeIbqpA347RqUWFVqe8jFDwV7Yv8/Av95f
	U26tY89Wh31jSdMpZiQRc0+3xjzjIwwF7dT3rnD6Sa09Nenchm6UlOOlTk8v2pg=
X-Gm-Gg: ASbGnct3730O0oAeqcY328ArbClbu6oaxak8AlfRMHVvGGEN9Eq1iFyvmJYmGPMchBb
	cwwy8JA9VXj/h9SB3NmyuhsFr/hrfW6Ylgo7Heph6Yj9YakMuBLgozmX7j9OP/q7v1pObj9gw7A
	WuvMIUX0OKdvXh86NsoNFrZgAQ5RD8Gvfyn+L+AZj0pF5S/P4HkSo7DRDpw9OGSs4hJftqHOpKI
	H3jXCaEkG54kN8v1E6FKiy+1oFYrIRD7SC4bvLGKnjI9jCwPID92zE=
X-Google-Smtp-Source: AGHT+IHMBE300Bcm54Mmq/v3tBkO0lxgfJUVqj14Z7wnWfcFOCNvI3wDAreuaFWCRfOaW1RTUGcZhg==
X-Received: by 2002:a05:600c:458b:b0:42f:8229:a09e with SMTP id 5b1f17b1804b1-434a9df7b85mr236310305e9.29.1733153507008;
        Mon, 02 Dec 2024 07:31:47 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:ebc7:b34e:f4a6:7947])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434a5dfc03csm105063765e9.2.2024.12.02.07.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:31:46 -0800 (PST)
Date: Mon, 2 Dec 2024 16:31:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] devfreq: Switch back to struct platform_driver::remove()
Message-ID: <ecae7326gzjpwpg4a3ba2dgddh4jg362ybsf64xla4lyff3mk4@x3q6bocz2car>
References: <20241130135813.895628-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="peon3ci7jqimuqo3"
Content-Disposition: inline
In-Reply-To: <20241130135813.895628-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_073149_321210_BC67A31F 
X-CRM114-Status: GOOD (  15.33  )
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


--peon3ci7jqimuqo3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] devfreq: Switch back to struct platform_driver::remove()
MIME-Version: 1.0

Hello,

On Sat, Nov 30, 2024 at 02:58:11PM +0100, Uwe Kleine-K=F6nig wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>=20
> Convert all platform drivers below drivers/devfreq to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>=20
> While touching these drivers, make the alignment of the touched
> initializers consistent.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Note this patch is obsoleted by
https://git.kernel.org/linus/e70140ba0d2b1a30467d4af6bcfe761327b9ec95
=2E

Best regards
Uwe

--peon3ci7jqimuqo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdN0t0ACgkQj4D7WH0S
/k6qNwgAiyaoRUBzt+ES/sXpbjU1ikMyNnk8Olj+yqwh6q3TT7T/cGK/mJZ+n8Jx
Kf/b7GtwcRk3RScaL6SOlRNRgJCTKyfH7s8Ko1mLum0vsaTXMeCq2v3LWmKvMqk8
IKYihoDhPxfvbFrY6VlUixTkGip8fHGONhs/PShKhoM0Q5UeBXRq0jtssisQqaDj
MD4pC+pZn9OtMP1OzIoYDm9txIY+TIQfYil1fC3HJLrS+i19CGizdK1R0gaJPl4t
YRrVt/aAZ09xtLiGt1FM8hS+DbwwIi4/t5eYPFEEzUMxFE1IAMuSkiwcr2GIQ2Wg
9eZ8IqZADcB+nKoGJhVo+lkPfeR5fQ==
=TKo+
-----END PGP SIGNATURE-----

--peon3ci7jqimuqo3--

