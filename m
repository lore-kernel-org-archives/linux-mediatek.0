Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18593C369D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Apr 2025 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XV4yjXWpsfgvi2gIF5WipGrZ8nMjBf4R4GhF3QGKVo4=; b=mfpuyipGME/55aM/h+Mgh9zz5U
	Kfrf0PuzNoQHRd+L4EI+mCwOvpNVF3rcB5L6dJdYbWOUHS+S7rH1G3zRK5q8/jy0t5AZkApFgTlHb
	nHrZyOWbkNxik0zMxg3KadHm/Se9YB3CBeGZ5liZ9g0eMLMjDWIWGfPxTcpH3rGnYWTflmJe7sGPx
	6W2X3V6ozeVlK8TzFWVeehPCUBc8jXFpA8BVq8Gj/Xl3YaOh8IplZHzSSPlYWZ9y/5VQZTL9jBa2s
	2aKRsvLY3Mmuubn7/1ebUE2qYEHicFB8eD/R1CgTwZx2N3fi5vqoFpxbLFITicikIex/J3RNmhNnY
	qcQw44VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ROX-00000006wTu-48wa;
	Mon, 28 Apr 2025 16:31:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RJA-00000006vU6-384k
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Apr 2025 16:26:19 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so33715125e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Apr 2025 09:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745857575; x=1746462375; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XV4yjXWpsfgvi2gIF5WipGrZ8nMjBf4R4GhF3QGKVo4=;
        b=fuaCuTozgB7TVpMX+PiP+RXvLHM2FiZaymVJj40U/ZOSBTciB+0oKgavSaUE7zoCBU
         HtLXWZBKXILJhO9XdV9u1raHO2tcQO2Ovyqro8cCDBf9u587uTxPB/57p09z5MDXCdDx
         EsTIrWnK/5nh+DH64ULA3qpNG1FQLESCSNohgSYR1aXn5h/16/8n22dAYWpai5YjHfKI
         /6ueXyCj39q6MDKVocC/J5FMR25ZnvNVx4V4DeSI5rqOCfK8lYvwwdnXFONVcTx2o6uW
         9JlbibCW+4jerhZxBBpbrUxUjTDrVMdhGQKghMxysVSHf41DgdexJSQtWtgxnPv8EOsX
         ceyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857575; x=1746462375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XV4yjXWpsfgvi2gIF5WipGrZ8nMjBf4R4GhF3QGKVo4=;
        b=EuPprj+FVtgzdjK9kXDh1zna8u5drW/OQDaLai8PP64Sdr/njdiFKWnVjXADcWtaVe
         SDixVVRnj/SpICfdQYynFVifF1ow3/KrMt8s9AsIQJbtdsRcfDCdixYZSY0dva4CdlaJ
         U4ivlSw9qXqCWJ8WoBQ5TaoO1scRcGQJX4bylm436DM38N/QuRlHtgfcBu8Va11kQ58A
         1iKtwgVm3WyORTWPt5CG9mJ9zmb5NYYwOkkRDMTJk80nSEyWvUYftlVFP1nd70CD5YpT
         R/FQCfAX4Z24uVv0BUcat4KRjKjR8SHNWXZrrFCvtqmXZ22K9urtt545W7lUPhfzj7mw
         wLTw==
X-Forwarded-Encrypted: i=1; AJvYcCWDal6ms3etRUOLxtxUzoWivl3CrA/v26zNIurKAiDYAR5cFctY91Itr85TWT+HcPpb3Yd8PC+CMp4LbXM2LQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhs7ScrNl/D34XpuA4vaGBQ5e1B4b8z8mf1RM/wdqBZOFdYcRw
	Wbck875EkuxErg5qNohGiu+wfe0rhUeJI0e85o99WK2fslfMrngpg1e2sO/VjKs=
X-Gm-Gg: ASbGnctVEIn6xjON2rIk5bHVQEw8dvzqS1wvQE45+MfulAxZqejsgKcDuVMgQ9v80XN
	tZygtgXz1T9QJbWvnYuoc9rIDFQxm91R/t/4jYVE3ynJ9iZO7CtgF39NuEayvksG679BxpQKZ+G
	ymi68SCD5vjMRncIyzOfdqHusEQA8QLNNnMwiyveg2EMqs20RudvWABJhf2jDi73KgpXWpnYAyZ
	5okVmCVKidsN9zA68lbAiTR2xD/8yqelZJ3yyLdZ0Algch5r6aLfKIrPYA6Y0gmp6YF3yIidqV7
	V5jOdDmjjrS9L/xNFapgFcjwx8IxToh6eSqu4WkMovvHTf+3XvrjRZHrCuqo8PVjXmu2f+gzt39
	8QC6Gmn4=
X-Google-Smtp-Source: AGHT+IEP8H3aiAFda5s5dKpOrFeQRMJEIdcZabiUZJB78eZVPzFrS+hWt+HhXg2/aWcVvb4/lTgz0g==
X-Received: by 2002:a05:600c:55c7:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-4409c4615e0mr119997455e9.6.1745857574733;
        Mon, 28 Apr 2025 09:26:14 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-440a5310a8fsm131672255e9.22.2025.04.28.09.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:26:14 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:26:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: mt6359: Add mt6357 support
Message-ID: <darxi3ojg6c6uhzyzb3224sb4lmpqcwx72pvoaam5qn5b6v5du@36zqss6i46ig>
References: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xvyefmwg7jcr7kfx"
Content-Disposition: inline
In-Reply-To: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_092616_854563_A17A066B 
X-CRM114-Status: GOOD (  11.57  )
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


--xvyefmwg7jcr7kfx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] rtc: mt6359: Add mt6357 support
MIME-Version: 1.0

On Mon, Apr 28, 2025 at 04:29:55PM +0200, Alexandre Mergnat wrote:
> The MT6357 PMIC contains the same RTC as MT6358 which allows to add
> support for it trivially by just complementing the list of compatibles.
>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
Tested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks a lot!

Uwe

--xvyefmwg7jcr7kfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgPrCIACgkQj4D7WH0S
/k5uzggAkQji5a5MAOBNxwmFwsge9xxOpHA0xqM5HwRUZBCYeca34VWPG6n6U0GA
bVXWEN1KWJBrgdsv/505roy1O5c3HcRRroWFLF4euSrMAl7kKfPvKbCb92TMLNwt
KO/BFcz7rRZ60I3Re6vmSTR+tW8915S5vXOV6PNh/YgvNMCnGCtIH2lCzdE8dc49
F2tW/utynBHpBiUnDE0UgFr18FyM3PQtpSCJWVpUaGwp54yVfozTDv19k4p9e4sP
XdJBBDNhi8yhT/855addjBUKSFWAW7cxCx64lq7Agwx7yZMcaaoEgdEOq75R+8Lg
SZ4wlhsxQ3BXN7P43l5g6dm94TzLZA==
=TwLE
-----END PGP SIGNATURE-----

--xvyefmwg7jcr7kfx--

