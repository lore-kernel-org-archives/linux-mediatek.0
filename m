Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABE1E9B24D
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 11:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOR7dw2e6VbSE6TAo2/QiB5hJHo3XCf4r9aWZj1VUpQ=; b=MWh4YheP7smV0T
	+bfgkY+Qj3Fio8gQ3TBi4bITxLasCDxeXg5CxHhk3BBlx3a3U8lNxd6lpG4kpOlC4KftZCyOb/s0D
	8kmDk55+3+MH6wcYLZjderQIK8O1cd+9NXmU/oHtJ53FA7cfIBydy84hVjOx1XrfhnEDVDWB7Mufs
	oQf0ugmuv3tJtGwzmuiy3NCeJktzHRytueekCNCURHuq954y6F9Z+Po50dTI3c9IIWwGGMolZhmnd
	tFJx2HG/6La6HZzMDegi/DdspKfJyRvLZOzkf9idWx0QQUcOodyC6uk1x4Rb/jPQWNBmPLLgKlopI
	uQ3mP5WA8pvyrZ30KcwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqRo-00000001xtl-3eBJ;
	Tue, 24 Feb 2026 11:19:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqRk-00000001xrQ-3Waq
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Feb 2026 11:19:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 20259445A5
	for <linux-mediatek@lists.infradead.org>; Tue, 24 Feb 2026 11:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039CEC2BCB8
	for <linux-mediatek@lists.infradead.org>; Tue, 24 Feb 2026 11:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771931960;
	bh=B5BzWRm+eShin5kvq4aIMD1wYheUUZDI+gvled/jh1k=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=CBlFHkCqyw+h08K9vVyBvEC3FyrbEus9slNsgNQZkIcncNWsDW6T4c7zuKO6gBh7Q
	 L4zk70XHlv7nX5/H8bOvm0Ff2T6Lkd5ORrb1SDemGccIevbVhLjZQ1SJWDZYRo96z7
	 s7nQazecFlce8JZ6ieFb0ODgeIg2H+2F9irwESDySXVSJRjLdwYEZ/DUEY5DQg9v+d
	 IvqGHEVlhoTNJlpwDfhwmlokzWItmFXcA3vUiLJvU1TcIfZVmakyc5M38iiYF/XkFL
	 M3EVdJ2HbgfCFEAFMqJMJC2FUG8oKaPsvpte/q8Fm/Vf4BNvqsV8Cyhc3GzH8639TV
	 UwMi7AjJXEblg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so516581e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Feb 2026 03:19:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwMBapf/kQeLHBhQZhPNB3hdebydS05fNNbbZUnChZKrEJnvd8g7L/AQEYm3JbZg3Jj86ZeoxWzgdUuDGsmw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy54l6BqVtde4RD6Oj8YDvjVbsBIqMAWpUtzfzXgZtxAjLXaTGk
	FqVDQUBV0iLbNfAap/ljiExBcpbFK4VwdQKyxnVhO7UNnC585ROo2LzqsnWjHV/FRNR0YNlgGzn
	UhKT7axYaNSsuP5O+U/AkUKENmd+oK4A=
X-Received: by 2002:a05:6512:334b:b0:59e:5fc4:26b2 with SMTP id
 2adb3069b0e04-5a0ed83e246mr3961609e87.0.1771931958134; Tue, 24 Feb 2026
 03:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20260215100302.136719-1-work@onurozkan.dev>
In-Reply-To: <20260215100302.136719-1-work@onurozkan.dev>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 24 Feb 2026 19:19:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v65ADpZYcwG+nd6sDE3j-wc7v5LEQft9tkbxDh7C-MnziA@mail.gmail.com>
X-Gm-Features: AaiRm51ME-8YiE4AvLn72GWWw2sauxN-ScuBUrDsWnKr42ng_6yKdEudjebdqcE
Message-ID: <CAGb2v65ADpZYcwG+nd6sDE3j-wc7v5LEQft9tkbxDh7C-MnziA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: add missing sram-supply to mali gpu nodes
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_031920_931314_41BFA450 
X-CRM114-Status: GOOD (  15.97  )
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
Reply-To: wens@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Feb 15, 2026 at 6:04=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> Some arm64 Mali GPU DT nodes define mali-supply but
> are missing sram-supply.
>
> As discussed in [1], sram-supply should be explicitly
> defined for all relevant compatibles. If there is no
> separate SRAM rail, it can reference the same regulator
> as mali-supply.
>
> This change adds the missing sram-supply properties to
> affected DT files. This aligns DTs with expected regulator
> modeling and avoids relying on implicit fallback behavior.
>
> [1]: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts               | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts           | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi            | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts             | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi               | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi   | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts     | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts           | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi  | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts    | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts     | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts  | 1 +
>  .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts      | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts           | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts        | 1 +

We don't know the internals of these SoCs, even though said power is
likely from the same regulator, as that rail provides power to most
of the SoC. But I would rather not speculate.

I think these systems are at the other end of the spectrum: the power
rail for the GPU and the rest of the SoC is simply never turned off.
Neither is DVFS available. In theory you could make it work, but the
voltage range is fixed so there is little savings to be had.


ChenYu

