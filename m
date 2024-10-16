Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251C2D1AD38
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaw9D/kIN1b9T3KHw5WABachNfPeN4gFtGnPwB52lsw=; b=yH1O0odd997+pNYZhZw8DO8mca
	Z590D2gv2xT3KSfzE58FAL/cNXAIdFf2vYqLt/8xZBIw1QHvuqNOogc8lM+xRDCCug/uvm+MRp7V4
	S67wxTMwjcGhmIYHivb3ckzBy4X7DA7FBGAwKqtrYrH56ST+I/f3MGjOOaYkuEfJioQ0M6XuohyMd
	yvotQ8V7mjH0RbDzLpVzQV1dtuw3ZeTQRL339viT/yRVr5SpAodw2vU9SCaq5TXbGvJwaIa8GacWS
	s+qtgE5Nwzm2zfyVdLDTHok1NsGEpMGF0NZqzGjIncdy7Clr8zpy5jYU/NKLb4TJRxGruuFnXFq55
	d0JquK0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t10S4-0000000BFks-08JP;
	Wed, 16 Oct 2024 09:36:20 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t10KV-0000000BEZD-1Jts
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Oct 2024 09:28:32 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539e1543ab8so7872158e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 02:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729070910; x=1729675710; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kaw9D/kIN1b9T3KHw5WABachNfPeN4gFtGnPwB52lsw=;
        b=tzIIds2tOIPBpmTLolJ95hmZxkYhT9sMlCLMnsP7FZYxGau4Tjuc2JXMMVZZq1gtNh
         4Jtbp7pVmRAT8IeLKJ7B+fi4h1V+oHw4D4y922vz/4pg1E0F6XHXgaJitsKFvYce8Hij
         hOPp5e+DoRpsruiepZ4MJYmvec2a9QHzWkRFFuYfUrxtrP+qJYirRS7fuJ1leOh7bc6A
         qu6r4bm9LChfRCJohTAlQlHMv916HxB+Te1jOTEqqzBKeyxyO4wj1K3Uz2C+Zqua28hI
         R8+Y7WF+7TwHgxJEQAnuNUHTXzyMo8rpiosCX5hV/3axfHgu8C+8gfKL2PkRI3SEYC1V
         uutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070910; x=1729675710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaw9D/kIN1b9T3KHw5WABachNfPeN4gFtGnPwB52lsw=;
        b=lZMi4jMlFxm7uVlewhdwfzyP/MYKnilKoCV0z6+Tlnd+XEnW/7tChV7G6sFQxfB+Yi
         GOY7yYuBwKRSDrUYIr5eDGvW9iPHHdJhSMdOrTx6zkBUpJyu8hd9ofTHT4sgz4Pxj9eB
         fJaKdbQy40V0RdVQEr/V4Q8xsPwSjXEbGEE2vZpVbeYuTxciD0WAB3OgRTwU29XeVWgP
         hA9nrdfGJ1oQ8FaA6X0II05KwfG9IcSZYr6hcVKn3oRzYuX3Bsnfo2EVmhLP6A6whOJv
         0bfn7LtEL6C8WdZLjDoJ/+Y0Q9hcks1sjZB1mwprTKPVH/SLMd73nAP6qZguy5rVE+tK
         Bbog==
X-Forwarded-Encrypted: i=1; AJvYcCViVTgEdWso7GSI0vt2Yt6PON39oEBwlSq5Vc34FAnXRk0iTtkhZ4Xzey22XRxfHG/JChYCoRxLwmKE7T6wPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YymS9YBtUYKMWMOxWXmPHp4ElKzf6CAWptjw/ZpvCLNDrzCVjIZ
	fiDVVQQwtAeq340cHs/3XbEkeoiqlIvIKxejMXV83S4/VnOw8mJu+KmHkOHXF3o=
X-Google-Smtp-Source: AGHT+IEYMXVIC9kQZtbFQfvHujJ0M6Nwf6BwktePWGcoHKQTcxo7zOicGTDhPJBpQsGkrBNyf/BB/g==
X-Received: by 2002:a05:6512:1048:b0:533:4785:82ab with SMTP id 2adb3069b0e04-539e54d771fmr9704988e87.1.1729070909399;
        Wed, 16 Oct 2024 02:28:29 -0700 (PDT)
Received: from localhost (p200300f65f19e3002f38cf427133ca7b.dip0.t-ipconnect.de. [2003:f6:5f19:e300:2f38:cf42:7133:ca7b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29844899sm163143966b.178.2024.10.16.02.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:28:29 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:28:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/2] clk: mediatek: Add drivers for MediaTek MT6735
 main clock and reset drivers
Message-ID: <vn466kmo2uqrf6ap54oat2bipj4lsfri7asnsrptrlthva6j5m@dop6xit2pzjk>
References: <20241010132659.81606-1-y.oudjana@protonmail.com>
 <20241010132659.81606-3-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6bxbshljplwl4jbm"
Content-Disposition: inline
In-Reply-To: <20241010132659.81606-3-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_022831_379591_08B2182F 
X-CRM114-Status: GOOD (  12.11  )
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


--6bxbshljplwl4jbm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v6 2/2] clk: mediatek: Add drivers for MediaTek MT6735
 main clock and reset drivers
MIME-Version: 1.0

Hello,

On Thu, Oct 10, 2024 at 04:26:57PM +0300, Yassine Oudjana wrote:
> +static struct platform_driver clk_mt6735_apmixedsys = {
> +	.probe = clk_mt6735_apmixed_probe,
> +	.remove_new = clk_mt6735_apmixed_remove,
> +	.driver = {
> +		.name = "clk-mt6735-apmixedsys",
> +		.of_match_table = of_match_mt6735_apmixedsys,
> +	},
> +};

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers. Please just drop "_new".

Best regards
Uwe

--6bxbshljplwl4jbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcPhzkACgkQj4D7WH0S
/k7bEQgArCTzD5wMQ0rkFmO4HdAGU33tE1m4k67OBzCAjqlOkLRUzTBNiue26/qP
myno/ZoWRk9VMaPetbpV2f72ZVg3dmDGe+DmF7Qhw+caPS6pJXYiM0NSeZUMjkBp
490i+X1spsTL+mCSI+9KNlAu9MiZXCqP2BIe8xErHkux7P4/O0kvTjik5vg4DDDv
hSLm4ZqhhV1jA0bi8TmmGpIo858UEKfRYCU3a9ahA52Clfn8zQO015ZDX6U2lMB0
LHrUU0ERRCY93AXylv6+kie1Ya8u/mNvxg8mmrvQehoeMErLnOw+LrJ8US+ZxXWz
CfQKArCVe6lrYB4VLK40QijGnf0V4A==
=LV0J
-----END PGP SIGNATURE-----

--6bxbshljplwl4jbm--

