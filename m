Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF12CE7B0B
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Nov 2025 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tFYx+r0LtpX/2l5hmodetJ2Wuc+Oih4VLt/Zf0jWOY=; b=iBjyc6Cg0hk05Iv7bIQoiNYkX3
	OVEQuWUi6bKrV5GbodxlVZKRgMiWzUB0W+IqUghNH1Q26Ff8R+VSfUkwTdPdfoNWFbiqaAsC0lDBX
	15YYdsWZI76x64yEhpQw11LFZ9unpMNIttNhBlkW0Juwt6Oog6FUwunOaYVV7I5GSomY0rZWQhPvN
	IAiOP4kSlZYtU+HnRIu5SgaaTNgb5kSZsHr4FU03BY4NsZLdu66diP2zV4AOLnI90HeLYFRKyL9kf
	+UrRvQq253WQRSL35DOM0rAp/SmY2F8SjAMg3JWvHwfUqz895YFtTG48J0pg1ag6Y1T8Pfu2zyjgz
	eJ7dCz3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtnG-0000000CFqp-3olA;
	Fri, 14 Nov 2025 13:24:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtnD-0000000CFpu-14MJ
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Nov 2025 13:24:49 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47754e9cc7fso12271315e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Nov 2025 05:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763126685; x=1763731485; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9tFYx+r0LtpX/2l5hmodetJ2Wuc+Oih4VLt/Zf0jWOY=;
        b=eMdBvtfXCq5L1bG1GD7YJstBRAF/6zKuTdiqVqJxTM7DeqSafb4TKXAAOYBDoQvnxg
         BOVVgZAOYnGxIaNwc8mxyL1HslM8nsPC4FONtucsoZ6ILdOKEtQnEJ9yHipeJ+aR/npn
         HmbFJhUW7neiGswwE7ibGvgwDGh/AE3qVnhPoNp2w1ZMUVdUvhg3L1386ZiT9WimPZO3
         AzAga8NtkN3XJ8CpaZQNbtrQ6OjfB3a8tGtf159QRbPSb7RR0zuhGKMRL2MEnlvtvXkr
         Zb4Mjtaw3gaYDI4cro6vhH7E+6mgCFJW8pFurcGKk6oiE6zw6RKKiAMG+ha3h5erKTqY
         vW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763126685; x=1763731485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tFYx+r0LtpX/2l5hmodetJ2Wuc+Oih4VLt/Zf0jWOY=;
        b=wWiTFTbzY8VUMubd1EZ4jkYAnNA/b/qBkC0bK5Jg7twKW+ubJFz1j9KvYbx73x2zVE
         LUgeaDx/v+XCDiS6idH1lXpPGhJDRe1BE6F7S5PXykXAh9T6jmTQmJFBgoXuR2xhP4OA
         PGko6/+b3Va7cFbcurVVkMGZEsrKggGhXBXxLgjK0bdD4gjkMeKWPpu39ru1nkKrSLIc
         VMzkR98L242rZ7g5Dk+3pPNZfTYT1qtnkpPN9cTHvz7LAdtWtboSKlInZn9qnh3uwmpF
         GmuUEComIPTaBsfH3baHtMYcEWDC8Ev/gn9AgiBSyQDPzVovCudwLlvcGRyjHKFT1MHE
         DAUA==
X-Forwarded-Encrypted: i=1; AJvYcCVrvKtxGGo5dR+xlYAZBIYdhUr2p2n8oYhD3RWpe0F3qT0YyXBJSxC7jzU/2t9kSP8WVDKZFaVwP+15XKMfcA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy473VcEwNOUU3hppGrn52Gu2aViMwkNYHXpo/LMbmoO22agqQh
	nrzAiuCsWvQMsPsUEQWqv3uO/0aGh6B854vIHu6LJiRlTQtB7XMUB55o
X-Gm-Gg: ASbGncsdmOCljwUbY29NfNjaa3R0Ju1qiPABCLMR4InI8topoC8rzU8Y4WU5vAiNZY/
	t829lTm9v9D1EtqS6iCIcDvYIa4r8YNj9cO6rIYhs1bJy9FAtl+C7gF7tZ6cDYBpIEgeyu14vag
	IeKkcju3p/KQdMpdSl+A2vP2JHoO9S5Rohu3hZFBrBSZnk/x/ss5cq8BBTwc0c5XyyPWeT4HECe
	WOIGvzM8lDkLxjCUxPWD8ZkFFvciw/5psG/h1Jtet8Xm68i4AmYFYVckGU7P77Gfl6zOHdB5W7m
	DMRRkWDOXq2QtoRAurVt2nMvyfRLn1l1PJUpWYz7cQuwwRrs6CfiE0ijrm+wxaYWe9w4ProxCd/
	EH6UhC0Yh/njNaubnneUlzquBnqFuDwr07B2aOJ26UvPpTueWBAxwutjzIPeZWXuw+9pmQfzrNJ
	XwxRWRB4AGxWHTPUVlyJpacEZIBQ2Fi3fiIJD70z91Aw9AsBHMuvUIEXwo+5ADi3bASw+kDxX72
	w==
X-Google-Smtp-Source: AGHT+IGGro6Ab6Q6hQTIcaBq7Nzqv7eihH1X2JDeRvd7W4sKRsUWsSzI35q89svHlSq6wH7pBHiBUw==
X-Received: by 2002:a05:600c:1c20:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-4778fe4f635mr29777265e9.5.1763126684877;
        Fri, 14 Nov 2025 05:24:44 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb454a6sm46271815e9.2.2025.11.14.05.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:24:43 -0800 (PST)
Date: Fri, 14 Nov 2025 14:24:41 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/11] of: Add wrappers to match root node with OF
 device ID tables
Message-ID: <kqtjfqkzz3lfnpg7lo5m4dctowsxqxtlcdtktoatpze3hr3tue@ku6p25skb666>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
 <f949c2a6-df24-41bb-aac7-f5567d03c5f5@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ntn2juw5rgeaer4c"
Content-Disposition: inline
In-Reply-To: <f949c2a6-df24-41bb-aac7-f5567d03c5f5@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_052447_301447_36EAC6CB 
X-CRM114-Status: GOOD (  14.53  )
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


--ntn2juw5rgeaer4c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/11] of: Add wrappers to match root node with OF
 device ID tables
MIME-Version: 1.0

On Wed, Nov 12, 2025 at 12:52:48PM +0100, AngeloGioacchino Del Regno wrote:
> Il 12/11/25 11:28, Krzysztof Kozlowski ha scritto:
> > Changes in v2:
>=20
> Note:
>=20
> Looks ok based on code and based on testing on the following platforms:
>  - tegra: Jetson Xavier NX Development Kit

Thanks for testing, but Xavier NX doesn't run any of the code changed by
this patch. soc_is_tegra() is a legacy function that we need for DT
backwards-compatibility and should only run on 32-bit ARM devices.

Technically there's one case in drivers/soc/tegra/flowctrl.c that runs
this on Tegra210, but it should probably undergo the same treatment as
the PMC and FUSE drivers. The code that needs this is only used for CPU
power management on 32-bit ARM devices.

Thierry

--ntn2juw5rgeaer4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXLZkACgkQ3SOs138+
s6G/cA/+IgP1K3OXIF03hJ/xSNn2a6/dnr1TTFLAUI6Ge13aBNVPxKCDqoxLZCAt
pN2vtjYNWX0Z80+tnCpGdf961hS6OY28OJmABKNotQvlrnzBSn8ggsZ64UlAka80
SRr74Do7F4bWqWrBHEDD4FRjlYR0OVy2/s0i5Zcavhixa1bqN/F9gTWT+kKItZOE
TcV+O8gQF/op9NSShu+oXIZFRcPKdugCNN8w77cE/9B/0o1iII9DzX5uzFYK0Au4
M7rAxBiHHh71czN3ts79Mcyinj9kcC3zGq9wtusv3N18sDRqwZCp+mPP3Y8Up0t4
OotwMzxf59FsoSpNDUh/FgkCNoDoDXbajVzHTig9OQspb/nNis+P5Pbw7FIZb8Q2
3jq8uRvMP3p8gc2pB7nnyQoC6ToofIcHlnhbW0oi1Fi0HovauoN7Vb8/gsJDWY6c
hBe4ABpghzhh0VXFf8CM0vK2MonZYPO0BTyDguUr4nx6QGrrLnBG7S/B2wvaIzgs
UeyUPjbgEhQVdyWALBKf6aK9IXi/Wp+s9w0XJ7qG14q665MqwxIXXIo0ZOIiIe28
e+Ajuapyv0juG6x+mVb44mHgWqZ6bquDTegdCr9PakfF4rDYnDKAcdzOM7/y8/UX
FXAgwJiScvxp/LO7D70bNXMPtYPQ3TVxDJu2I5128N5iNtuaxgE=
=vxrn
-----END PGP SIGNATURE-----

--ntn2juw5rgeaer4c--

