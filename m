Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1138DCD4F3C
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qyg/N0RPWRdjh49dRdZFz6LZc2ehONUDsrWnJo4MvBA=; b=4bY0DNE04P9+EenEXVh3j89Q/G
	zYBbrCu0Zq3M8PAx8JLje/F8abpog7mVgxgf6UHSE8XHI9KL5dOx8yBe/MYH4FY5nMwBVbKgtZJt6
	d3bwDwjmUU7Lsvso/wKMUEqDicxIltocMaI2P0HRBpF2ns77+POuuVEuliH4CaRB5KAiLUklCSHU5
	FTD8E42t5fDE0+SQH8dxAvp1jB+bnuqNwgST0lS0O+av4oJcOavrJ/sp4HF2FtC5Yfas1BXpxWesF
	He26YxcFWI7bzPfyt6GHFbIufa16svnVDhGhsU9Lg6WNAWmT4xP6JcLMgbWlHDDTSCZzzHkJuC5nz
	x4FIj6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjMJ-000000056kJ-3ikI;
	Wed, 20 May 2026 16:01:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjMI-000000056jr-3AfB
	for linux-mediatek@lists.infradead.org;
	Wed, 20 May 2026 16:01:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2708760018
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 16:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D403C1F0089C
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 16:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779292881;
	bh=Qyg/N0RPWRdjh49dRdZFz6LZc2ehONUDsrWnJo4MvBA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=X/usQ1QwCSwG8o7OoxDK5LlZCyymqvRBUw8VjlJEpylcAPKlZoQfiVF/O/h2zPIGs
	 81394m/ZfWr/Q4J/Mckik9lffmjvezKZSSTV13Y5ku+1oojI0BrlX4qiRKcsTOqyAi
	 jm2K5SNkl582Ua8XlCTjdEjJHrq14kKlmo+M1+Jg/4PXBM/eoutf1TpHIJEfGVSvP5
	 xJ5BgDhwVVGW+Wy8Hj6YGEnP0Im6y6spd+XOU/zoaiWcm9S6aZiGTrYZaxAwOQ2HqB
	 7C5A6/UaBuQI+L4YwWae5GXBJopsbclqgjNJA5pslY7juhn7ldrephedFNMRwwGcQm
	 5RkqtAalGKwsA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-394095009beso45004611fa.3
        for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 09:01:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9NSzvi0aRwAKSfjntgpI+kQWIsuKyMeiy9Cf/NbsbjqsquO1rLZKQKxhF6Gf0yYP+5ihhxOG8Zg1akVCHQRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1PWmKb1KwNNzDkEM+IFNAWPXJY8yYPCWpKxni9HplA/BfX36G
	3McxWuQZlHhyw/qNYfL7KnBfZ2YCnBq7mwLjmY8sgqMGPHIuMPWjd4UZWnpZQGoUqUx3QtvtunU
	/pqWsbyWSI/CR/FbIQMSCJetn8mSVi2dB796/u5IaHw==
X-Received: by 2002:a2e:be8b:0:b0:394:1b05:4554 with SMTP id
 38308e7fff4ca-395619eff61mr78938081fa.4.1779292880531; Wed, 20 May 2026
 09:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org>
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 20 May 2026 18:01:08 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
X-Gm-Features: AVHnY4JiBPEmzMVtIpn3-9v_DqTGvSLjQ-NfRiMDk-zVR0iQCEFF2AVZFIteHmE
Message-ID: <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, May 15, 2026 at 11:02=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> Hi everyone,
>
> This series is my attempt at enabling power sequencing for USB to support
> the USB connection on M.2 E-key slots. M.2 E-key was enabled in v7.1-rc1
> with just PCIe and UART supported [1].
>
> Most of the series is based on next-20260508, while the DT changes also
> depend on some other DT cleanup patches I sent [2][3].
>
>
> Patch 1 reworks the power sequencing framework to allow matching against
> different USB ports. The consumer API gains an "index" parameter (which
> is the USB port number on the hub), while the provider API is reworked
> to pass the index to the matching function of the providing driver.
>

Sigh... I would really prefer to avoid going in this direction. IMO
it's not very clear what this index actually refers to in generic
terms, given that pwrseq is flexible on purpose and there's no
specific, well-defined DT property which could have an "index".

> Patch 2 implements the index matching in the pcie-m2 driver. Matching
> only happens when a valid (>=3D 0) index is given.
>
> Patch 3 reworks the power sequencing targets for the E-key connector in
> the pcie-m2 driver to add targets for USB and SDIO. The former is used
> later on in this series.
>
> Patch 4 reworks the USB hub driver to return the actual error code from
> hub_configure() in hub_probe(). This is needed in the next patch to
> correctly return -EPROBE_DEFER.
>
> Patch 5 lets the USB hub driver look for power sequencers for each port.
> Currently this only works for M.2 E-key connections, but it could be
> extended to cover other cases. It should also make port reset via turning
> off the port VBUS work, even when VBUS is not directly controlled by the
> hub.
>
> I expect some discussion on this patch, because a) it adds some
> OF-specific code into an otherwise generic (core) driver, and
> b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up powering
> on the port twice, which negates the port reset part.
>

I understand that you do this because the port device has no OF node
assigned. If we wanted to call pwrseq_get() for the port device, is
there really no other way to associate it with the correct pwrseq
provider?

Does the child index in hub_configure() relate to the port index as
defined by the unit address of the port DT node? I'm talking about the
X in port@X?

> Patch 6 reverts an incorrectly modeled OF graph connection for the
> MediaTek XHCI controller.
>
> Patch 7 then adds a proper representation.
>
> Patches 8 through 12 enable the M.2 E-key slots (used for WiFi/BT) and
> USB type-A connectors found on MediaTek-based Chromebooks. These are
> provided in this series for reference. The USB type-A connector changes,
> while not directly related, have overlapping context, and was easier to
> include. They were also used to test some extra local changes I tried
> to convert the USB A connector from an onboard USB device to a power
> sequencing provider.
>
>
> As this series changes existing power sequencing API, and also uses the
> changed API in subsequent patches, I think the best way to merge this
> is for Bartosz to take the power sequencing patches and provide an
> immutable tag for Greg to merge and then merge the USB patches.
>
> The DT patches can go through the soc tree once all the driver and DT
> binding changes are merged.
>
>
> Thanks
> ChenYu
>
> P.S. I'll be at Embedded Recipes if anyone wants to discuss details.
>

I'll be there too! Or should i say "here"? I live here after all. :) Let's =
talk!

Bart

