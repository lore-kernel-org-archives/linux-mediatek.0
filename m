Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A9CC43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 07:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWU0v4sjJbD2CQ9MCYUXZFpGOf/MY7CyUDjnbwNep8k=; b=t8PGzeWC1xPKWo32OnJsfoPFhr
	Fq/6JL37PTVr4QdpRuODfEa0j8Ec1IX877o1HJFbf0UuVDL6Uij+WxOgNOlq5iaHnFDeIbtO3d9v7
	MLOVfzpEty1cZXG5IKLaqXxtf/1v7HWJ9IK3lNrKFvD6V5pqpulULr2GwHUJ8xmjd3WXyIi14jOns
	Q8mnakpd+spU/6or5X3BoqnDhAYgBcKL1zQl1mfDmBrtJdZI8caGzkqHPwGJ2xuWDE/KTWGptwXO5
	1ML9jLDaLHiujCvzGXckI911UxuI/wmekkAp/bh9mEuMyOq0vap+UD0Zg0pgsWSYZdl4Etkp9sDRm
	bC4dMyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5pf-00000004MIN-3ZmD;
	Fri, 10 Jul 2026 07:39:35 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5pd-00000004MHa-08Ex
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 07:39:34 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so366766f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 00:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783669171; x=1784273971; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWU0v4sjJbD2CQ9MCYUXZFpGOf/MY7CyUDjnbwNep8k=;
        b=gskHSTdGqGqX3eP6iUbJ9heG7LajKq14AetjRZpvWueTErdkVGvtTNBHFs5sCdksyT
         jVzDP8yl+B7TPmKMkhrhMByQwOrH/JuPwkVCtEcfBTlko9aLd71vXpjzBJmDu2tQCTWD
         dFo/1OqTno5N03IE2dZVFi4WlTIGpbyZbJeAn5Ho2b1VdOw6tH4GOHHZU/vrYKqQQ7vl
         th90urRsiNKrZQKD7ySamCZRcfAcOh5I63HrdkGjKdlGURuvx0yiAONELmvulNpZK2tH
         oQYqscRX0DK17pdqz3Jsbg1f837o/09O+R/N3sFWOGi3bhGxrwpjc2tyO1w5SwXhmgzQ
         S3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669171; x=1784273971;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWU0v4sjJbD2CQ9MCYUXZFpGOf/MY7CyUDjnbwNep8k=;
        b=pmKg//SWs0hWl32pPyVif5qrYpJeDRSMUG/oM4sqX9+VUCpzxHm4kPBSrMMVgcNgLc
         z3N8VpGKbf91glmAV8o8IpWNNmsgvqliwVo9vNKJw+LJMj+RKgjqTjXTw/XM2PK/CVZq
         sfd0VzcfMK8/mzSM+OZCzBPOPeJOn2Z4SYGecsnb8iTguBTOnIPRVnThju/tX6110RsB
         JZFepZXzIz1fHIKnViIsRBXr5gNkWunW4wnaqS7ps3L6IILcNOpqnDMm4jiqRNuBv+Uu
         0vzY+j2vVQuY7tuEuiliNoUp1ZMuLUDcmk66N09yCGsuL3U01uTt1sMQrxw11SnTA8tu
         jrYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2ONyYJsHbRxKib/y0VWManOHRcZztaZEmRk3XltBcJCXXmmyJs1+b/o0i8Rerx9ogZAAJYGIQ+n03eFfo1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YymmPKvylh8flxPxrJenMGvYu9/qHlqGq9HfUEGgn46JGOCSW6s
	nLxgSJi9A2qdwMoFns86ey/ctZpVtaExSjGx4wyiBqSxRnpaNXSrVOEf+Aj3HT84Lsg=
X-Gm-Gg: AfdE7cmBEI8+XrJy2fIKAnEaA7dsWDyXlmRHtrsdfXePdR4HI5HWBaogg75G4aQjlst
	wmpy8hNUeyP0u4pqT0DaX00+cjS0/VnVrQKfDaO2vah6BZpAFkwx96bUJjiKmIQbPaHSyyjRzsT
	KtY6hVXOLFqbo91oGec3o89IhZXqQrydfomOl46xEVx6+Rxm0l53aPmzSYQVBJkHYGdvxxoK+E5
	/AeSgd/31pRm49EqJugLO9CsFYJdrcxUWDj1kV1UGwJ6uG2dF612SQOskIjV7QWOJIdDha+ijCe
	ICBJsKdAJIXHkija+xknCdUwtOymMRJ5vVvDYgXG7jB6oOK/w6RHsmoBwQswKnGmv091owlHOD+
	ByAqJbzifSdQXRHYjgMeEfuEnowOlBKhzozjrZz6zkgdHCLe5Rdy0Hs929Wgxouel2RB9cLwqPO
	cHhsdkLvzPHEpflAPVNNDtXgUGP6ef6U717N04LoXzpbX5fnxPtNBJ0wAWj4b1jemKGrtjgttQN
	gdP
X-Received: by 2002:a05:600c:638d:b0:493:df5d:6ca6 with SMTP id 5b1f17b1804b1-493e68c41d7mr93044945e9.25.1783669171165;
        Fri, 10 Jul 2026 00:39:31 -0700 (PDT)
Received: from localhost (p200300f65f47db04fbea22a44ee9ba38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fbea:22a4:4ee9:ba38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493f4f09f89sm33853675e9.10.2026.07.10.00.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:39:30 -0700 (PDT)
Date: Fri, 10 Jul 2026 09:39:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Ben Grisdale <bengris32@protonmail.ch>, Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v5 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
Message-ID: <alChi9oG0-2XUFXK@monoceros>
References: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
 <20260709-mt6323-adc-v5-2-d11b8332a735@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w5zvd5vp4pqaarjf"
Content-Disposition: inline
In-Reply-To: <20260709-mt6323-adc-v5-2-d11b8332a735@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_003933_081733_4D91289A 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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


--w5zvd5vp4pqaarjf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
MIME-Version: 1.0

Hello,

On Thu, Jul 09, 2026 at 01:52:48PM +0300, Roman Vivchar via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--w5zvd5vp4pqaarjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQoa4ACgkQj4D7WH0S
/k4pDwf+MvHDR2NtPifHQ1UsidnZd5iG/SkGcVotUqLFeN2Q4NzZWdluwEBDlqYP
3AALM8XUIbkGVP7dg/LDiffqfsK4fE1kUa3Tmzp3lYrTzMlgZwuu4FxN6V4FTDqt
ljrJFdNgUMcs20mDR6iIwDq5KUqFbuBOTeLF/8HHcoScvTb8j+3rfp9D+k8iVIWF
begEnYaOM//SpubNhltzxmf0rcnRnm8+hlR6A3vcLOkP10KQBxk3OAK4oZjiN4dz
AhMCwZu8VjRctocECGQE6ZTH1aKUSzuGcFX1QrXDPRnhyzHjoMoBZZien0jrGL0J
A8nk7InQ4UXOD6YjGdppmL36xpQKsQ==
=N5IU
-----END PGP SIGNATURE-----

--w5zvd5vp4pqaarjf--

