Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD3EC48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Mime-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeAZhE7j4dRyX+kzFFWa3n1YxsCqKudIIvx3LQHUXoE=; b=G5iTqLIQ2P4j3juvvpVDGlYF7J
	tTlk4oIdy+rEMwyL2yoMZ6cNbqLAwwD/QW/qKB7JDRPyfPalzk7hNOG96JoFVuMiu3XKXg9hpIYhq
	c7w2TmxRp7ZvGyswFbv4yRCX90yGOFzTDKEf2M+xNIwF1U8aCw+B1yPcD9T7kgRMIq2ZZNJiAdqI2
	vS3CA02DrJAWyAOsiPfmUIr4Ha3an68e+7iv9rEGQALytRKx+cA03WoqFvjb0t4eNyOI/q0xeziGF
	Fv00gwgZX7MGaoq7dhQFr4LH4H1fi21EY8SS+7nHbjenR+SDenEYZFX4pccW+ziAjCoOivpoHS/Fx
	TiBVzJVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rawQx-00000002AIh-3J5y;
	Fri, 16 Feb 2024 11:31:11 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rawQu-00000002AHV-0g8s;
	Fri, 16 Feb 2024 11:31:09 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a3d0d26182dso206567066b.1;
        Fri, 16 Feb 2024 03:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708083066; x=1708687866; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CeAZhE7j4dRyX+kzFFWa3n1YxsCqKudIIvx3LQHUXoE=;
        b=P1zVlKXHJ7lwF5d37Scu3sSNd4EL61kjERSXC5foeNh99J2G8/yYyqudfhoFW3skX9
         ieAVskf8HUu//0R7T9iV46900FKPCBAtSJmzC37+2gdE7WA4ZN9ADAIbks9JfdL5FIaZ
         b1EwaanSuHCaqBeopW34/TzHF/1ayicY4i/Oz0HPrxnvG0gFRgqypzIyTW5lSv9h9BV4
         tJMe3abXcB187nlbVkSVIiLP+mLLVJkszV6uESzwwDZp4bAkzy6yvzuLrP+2x781tgW3
         ksjYi/ZX4prBifeWXoiODGyfC8evMJZ9DkU0f32xffJzZGhWp6FnKaMDfLNkKS9QQmNw
         OnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708083066; x=1708687866;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeAZhE7j4dRyX+kzFFWa3n1YxsCqKudIIvx3LQHUXoE=;
        b=xBhC9VzTXomRMErfPISgeYH5orfrG+H4Z1n9xaxgLY4oCQhADQnymM9CztG9sRjlYs
         B14K1raIPk2br+k0UUYkOxRsSY41agTXewQjhIP1G6+6WAFOGBwrp9DqxQq8D9rRgFq4
         glTWxiegdYnn2yz5hD14pd5IZ+A+DGw76TDI8+hrYGDSZt/tcXRXi6LJ6hM+mYrWtjnM
         iAP5IdiYy/u4QGYvuyodqmw5YCwTgyRuEbQpf1zKWAVDpmtfeyiarC+H9ZMZhFfkTAJd
         t9v1LMqrbV5MfX1cMhSA+XJsozg5UWHMwIgv+qub66Y23vgLoio3KT6hLF6MQyOlEkim
         KlGw==
X-Forwarded-Encrypted: i=1; AJvYcCWy4IKrfOtbuwjKiH0mc2fPKQlSiiHKQFrgGRVFh5rHB6DiJ5obl2zj5SzQh91T85n8qmTJm3h/zmg+IqIzwvB8Bmpk4BCe3avt5pi3Q7ZAq543/ZNNf7JL4Vqg7qisSdG0ov7+8Oz3bFgKoWrEnfT7kgKoEyV9lfDd9G7JRv24o2xHSDAYaYftX6CywNJ4UonEmTov7OQecsSUg50=
X-Gm-Message-State: AOJu0Yw40+DavFIrR3MvjffZ7DYlLUasz7BqQtDizbiWNu4bBgkArOd3
	vn8whIE5FK8g+XATcZx3mPfmF41pn+Mb0h5/2/uOuvI/qrr6rFR2
X-Google-Smtp-Source: AGHT+IGXWz97gD5gN+VSAVL7iY1zPTDMUokWZgtmUOJLcJDV64j1IaqQ0abnS0651OrxU9XfbwlwlQ==
X-Received: by 2002:a17:906:11cc:b0:a3d:2cd0:c17a with SMTP id o12-20020a17090611cc00b00a3d2cd0c17amr3351354eja.58.1708083065855;
        Fri, 16 Feb 2024 03:31:05 -0800 (PST)
Received: from localhost (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ts4-20020a170907c5c400b00a3df003b6a9sm242282ejc.119.2024.02.16.03.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 03:31:05 -0800 (PST)
Content-Type: multipart/signed;
 boundary=b7223a00e4ef0df93c47d9276017bbb483a03ab38a891db7b003e5591ffa;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 16 Feb 2024 12:31:03 +0100
Message-Id: <CZ6GWUQ73SSL.6HP29PU9Q7R@gmail.com>
To: "Mark Hasemeyer" <markhas@chromium.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Cc: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Sudeep
 Holla" <sudeep.holla@arm.com>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>, "Raul Rangel" <rrangel@chromium.org>,
 "Tzung-Bi Shih" <tzungbi@kernel.org>, "AKASHI Takahiro"
 <takahiro.akashi@linaro.org>, "Alexandre TORGUE" <alexandre.torgue@st.com>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Andre Przywara"
 <andre.przywara@arm.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Baoquan He"
 <bhe@redhat.com>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Benson Leung"
 <bleung@chromium.org>, "Bhanu Prakash Maiya" <bhanumaiya@chromium.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Chen-Yu Tsai"
 <wenst@chromium.org>, "Conor Dooley" <conor+dt@kernel.org>, "Daniel Scally"
 <djrscally@gmail.com>, "David Gow" <davidgow@google.com>, "Enric Balletbo i
 Serra" <eballetbo@gmail.com>, "Frank Rowand" <frowand.list@gmail.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Guenter Roeck"
 <groeck@chromium.org>, "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Heiko Stuebner" <heiko@sntech.de>, "Jonathan Hunter"
 <jonathanh@nvidia.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Lee Jones" <lee@kernel.org>, "Len
 Brown" <lenb@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Mark Brown"
 <broonie@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Michal
 Simek" <michal.simek@amd.com>, "Mika Westerberg"
 <mika.westerberg@linux.intel.com>, "Nick Hawkins" <nick.hawkins@hpe.com>,
 "Prashant Malani" <pmalani@chromium.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Rob Barnes" <robbarnes@google.com>, "Rob Herring"
 <robh+dt@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Stephen Boyd" <swboyd@chromium.org>, "Takashi Iwai" <tiwai@suse.de>, "Tony
 Lindgren" <tony@atomide.com>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, "Wolfram Sang" <wsa@kernel.org>,
 <chrome-platform@lists.linux.dev>, <cros-qcom-dts-watchers@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 00/24] Improve IRQ wake capability reporting and
 update the cros_ec driver to use it
From: "Thierry Reding" <thierry.reding@gmail.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20231226192149.1830592-1-markhas@chromium.org>
In-Reply-To: <20231226192149.1830592-1-markhas@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_033108_235347_6157AAAB 
X-CRM114-Status: GOOD (  14.95  )
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

--b7223a00e4ef0df93c47d9276017bbb483a03ab38a891db7b003e5591ffa
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Dec 26, 2023 at 8:21 PM CET, Mark Hasemeyer wrote:
> Currently the cros_ec driver assumes that its associated interrupt is
> wake capable. This is an incorrect assumption as some Chromebooks use a
> separate wake pin, while others overload the interrupt for wake and IO.
> This patch train updates the driver to query the underlying ACPI/DT data
> to determine whether or not the IRQ should be enabled for wake.
>
> Both the device tree and ACPI systems have methods for reporting IRQ
> wake capability. In device tree based systems, a node can advertise
> itself as a 'wakeup-source'. In ACPI based systems, GpioInt and
> Interrupt resource descriptors can use the 'SharedAndWake' or
> 'ExclusiveAndWake' share types.
>
> Some logic is added to the platform, ACPI, and DT subsystems to more
> easily pipe wakeirq information up to the driver.
>
> Changes in v3:
> -Rebase on linux-next
> -See each patch for patch specific changes
>
> Changes in v2:
> -Rebase on linux-next
> -Add cover letter
> -See each patch for patch specific changes
>
> Mark Hasemeyer (24):
[...]
>   ARM: dts: tegra: Enable cros-ec-spi as wake source
[...]
>   arm64: dts: tegra: Enable cros-ec-spi as wake source
[...]

Both patches applied, thanks.

Thierry

--b7223a00e4ef0df93c47d9276017bbb483a03ab38a891db7b003e5591ffa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXPR3kACgkQ3SOs138+
s6FXyA//QEgOaLPJMLtFwzEUNlO0/8MF3SAbMW7kCkEt3S3OMXQ3wtyOeIC3nlyN
zwxSqhOzC1I/qdbqdnc5ejbrPWB/9d6ohPyc45vT19QAS79mc9nB2ZQm3AoVlPaA
HGQhrtMEx6KRBu+GjS9Sz9YQjBftSWl/kr8oAwXOs6wtg2m06tfm00LF3bVFLQEu
aTZ1Jal4+fIpK0OK/yz/yhczCMQCbVnKBClkwuoKQWJpxh7z/xYCY2Gm50VD4sN7
F60KcEQzW8DfY5dGd1eT9oY7UqqA+yoRDGNN7KNYYurFPoEL6jZqvSts1J26pp4u
MjFQS2jY6bjbQFR0RRUwwjPRRmUXRcGpW3qHN/+ajof0pXgRa/rWnthIB2boTs4Q
uApu3k81kwLXVgZZh9YRXCwcYf8sgMo7Qj849I8e5vRi/MuL6jwKyU7P8SwRrWRd
xIY0v+EKupY6iDvxPApV4b5Mw8gyxbRO6Kcm5Ep7Z8DBCeCr+g3iZFHVUXpG3vll
PjwZW9bC+U9kcn/W5qoJrdKqGFAsaqks7fzWoIBIX5rVNbNSNZpG7Dwi/EeNUmak
T5tJqIr3VbtsNd0ni6f42Efs9z/m0vsUKL6H5mGZoX3oTGXvzO91XF2gfFMEqOO9
8cxE1rJREy1F73S7VZWOE46nyNPlsD6qm5+fApxvV3eKGRO5wfU=
=fOyD
-----END PGP SIGNATURE-----

--b7223a00e4ef0df93c47d9276017bbb483a03ab38a891db7b003e5591ffa--

