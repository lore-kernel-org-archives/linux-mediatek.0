Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DF1CA0FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 06:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qy3RayiwfBU1/zuQfXQ+IdwaYW5zap/grmBI6ndAc0k=; b=G0qjAayPPawWFXYSL1vtLfhcy+
	w+1kMsr42r6LZtGCcGwqtyxMrqDaJ7agbxXyrJgo5IDyf31yqh8qKEDA+o8wsi85HXHluI9MOS3XS
	RnY1uoZIKmX5mvKAG4+Im8V2t1gOcIRD5XYJHZQ+jJ5BDXUSr7BM24rtL+gnJtxtrqmLrECNqURte
	ayGfL5ADlmm0sXiFgYD+mURFPKs1mWaJj3QWUbd8AztXdcAKUbxcnrGEg1FI12rOI17gg/CQG9+pI
	i/s1VLyFsPjBRLAPfITy2Xi4+6iZyhje6SPJcVLcz6rAAwsya6r+1QPs00EKOHxQAuBAcceOoEtpC
	96QwaI5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBy-00000004pbU-34aw;
	Tue, 09 Sep 2025 06:51:02 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvj1c-00000002M5t-2k6W
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Sep 2025 21:03:45 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-336b88c5362so44394981fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Sep 2025 14:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757365423; x=1757970223; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qy3RayiwfBU1/zuQfXQ+IdwaYW5zap/grmBI6ndAc0k=;
        b=glAt0GnZ5XXzlkMmGLL7rxKW0uL+XTHPtiocSmX6RJo+OPEAHppg4IGMM5fagZXryc
         bMfzCIH7PB7vSx4C2s/3PGurNwU9uGdXndjmGqAU/UzHYgjuroFca5RBvaAB5Ivkevce
         zzGM2dwEeKfaUdYZWrsowRKEM5A5YTSTxwsIjHD7aGbmlRVIYesbLTYY4mEgwU29JuzY
         5tbG35wq4HxPLGyHIPV8V8+x5c/uRojRGCWISQrOf05qXzw9Ejiq2HiepOKELHSWvMo1
         RvxyrcJGk49jegUVUu1oBoTpNFifr/E7m4dfW0vgORc0DtKP11ioFK3MmyGR449YfsxN
         7zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757365423; x=1757970223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qy3RayiwfBU1/zuQfXQ+IdwaYW5zap/grmBI6ndAc0k=;
        b=pyyH/KGPD7qLm+5vKAelBkqlIZCFH1Q+o2beDCYgyQrDNKmD1fopULaodHj3CERzWa
         8Zk+mKHOgHmyIE5TL/fqh6FaS2N+MYXHI548IvCv1S67h/2ZTuSdzCxzjzfjnX9kbjAJ
         8wWerkDLXvxbBxbQjwECs5Dg9vnn5VBq+GG7Ovwueg96vGw1QkciphgYhyG2+ejb/OCL
         EOcC4G/mOXvKhCsvhicmbV/8aMCBe5q2sJBt9D3Aav0YLts8v3DdoEak6z7FvrvvFBz+
         DT2UPeVvPGQbeE6/BzGJ2q5mgyXuZP40nQeHWiwwPovG3geDXZ8gOOgys6BEu9ITU6um
         UaRA==
X-Forwarded-Encrypted: i=1; AJvYcCWYanfjP6qPXGSxWVZ49qo+oYStBGAoBFQ0PxyS/Uyd7U/x9mkAfPsiVH+9zp32XEKE32KZpsSvL3BAlP01pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVpvJrWcoqM8R63JjrTBIFakfbYfSzvRJ2bYZYDEkizE4kmT1F
	KJMmku0SgnX0UlJbppa8YX3X6qTIpcZ0HMOHq63a3dJuX9inA9+4tFajIPsGxOb/if/iJprhxDE
	O7h+ZJGzdmEO4HRheJoLMoJXGFJlL/pe/pEjQRFAJDQ==
X-Gm-Gg: ASbGncuwwjjBXWKoiv0ORXP3qB1xgQ5wqnqOB0YsDZUm3bkVfZ5U1M+GpayPCyXrLum
	LGzkANBK/6XW89qF129qBm8G+y9PyclPGj5irsUAoVcjaiYr67B988WT8n7zSB7GUjtY9wBZn4I
	5FMT434ojwF65wJaYEYhtORNh37t2TaVwcnmeQCAJ2yZ0yQGMkf9yjQcuHz7nyjUlwlQbaTxl9a
	q233oNDLYtQNntRFA==
X-Google-Smtp-Source: AGHT+IH8+J/vFeWhw9eoYEb1/3GvltvNA5l3205lsYcHvwWXC67kAnznt4uB6zdL3+zg2WYqt7lJoZenJW0OZDDgeRI=
X-Received: by 2002:a05:651c:4358:20b0:336:d915:cc5c with SMTP id
 38308e7fff4ca-33b4fe4da4bmr23851571fa.3.1757365422821; Mon, 08 Sep 2025
 14:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250908113723.31559-1-ansuelsmth@gmail.com> <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>
 <68bf16e5.df0a0220.2e182c.b822@mx.google.com> <d1bc3887-5b88-4fb9-8f89-4b520427ccdc@lunn.ch>
 <68bf2b2d.050a0220.7d5a6.b11c@mx.google.com>
In-Reply-To: <68bf2b2d.050a0220.7d5a6.b11c@mx.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 23:03:31 +0200
X-Gm-Features: Ac12FXzsPzr9I2HjnC5t_HYUtDe_Oo71i-LHOVM3Q5owLY6JPkPWVDiLSF9uLf4
Message-ID: <CACRpkdYuT0x3JSFWHMF5thH0UyNF1Cse+W9joE12yQ0iAAXjuw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_140344_702977_21B6B460 
X-CRM114-Status: GOOD (  12.97  )
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

On Mon, Sep 8, 2025 at 9:14=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:

> The usage of GPIO might be confusing but this is just to instruct the
> SoC to not mess with those 2 PIN and as Benjamin reported it's also an
> Errata of 7581. The FORCE_GPIO_EN doesn't set them as GPIO function
> (that is configured by a different register) but it's really to actually
> ""enable"" those lines.
>
> Normally the SoC should autodetect this by HW but it seems AN7581 have
> problem with this and require this workaround to force enable the 2 pin.

In reply to Andrews comment I copied the two above paragraphs into the
commit message in the applied patch.

Yours,
Linus Walleij

