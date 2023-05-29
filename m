Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A93DC7EE29
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 14:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0lsLEu8+OX1i7KbaDbSPJtrAmfcuMpjCKFHxHn5ehg=; b=NyPngJpP3osFIlh6xkBxXMyXk3
	cegEp7eEQGfqCyFnT1SgOYmYfqxiwdxHDYtPvpzmNCIeMGb+q/pjZXI3/JrD4HySDXiSlcZFndGET
	GYaTg39/DisJpxCdaRRREHpGWpDBJyPvAE+1cfRDerVeC7TynRF6Ld4Thlop1MgDtHW5uRLFOK2WP
	/squjtitiGSa3XtVbzX89P+c9qeSTUvdayzS0Vag2yXcSMiGiJpIkJKFBy1r+kS7jVncJOh/2XzZ/
	6omxFV4NmbJCTQErX2H0lbx0GA8GjS0FWZ5YSIPvvGdiXEKqKhhOW0VxT3Gvn8leJbdnnUg36gLO6
	VnlROMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dQf-00AhHm-1d;
	Mon, 29 May 2023 14:00:57 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dQb-00AhF9-1j
	for linux-mediatek@lists.infradead.org;
	Mon, 29 May 2023 14:00:55 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-bad97da58adso2867772276.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 May 2023 07:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685368850; x=1687960850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0lsLEu8+OX1i7KbaDbSPJtrAmfcuMpjCKFHxHn5ehg=;
        b=dUrk+VoNd2QGzgHdhxCBXJVTcLex2IrqFF1iVjAJXnB7DttdI+VhquXTGOAWNFDRbL
         WUzcJZAXCQpaVy7qGM/wik5QFlD3eWKcxOMTWB2U0jUYUD33xKEq4xbU8Y9ADOi5BwJ3
         OvTYon9xz6IQVw3qo+8qOA/RAGySkOO/UeCf/9HdghUzlYLc4eo/sZvSwPWs0ncst6RT
         SWgvJUXIJG0yzhHKpLDtW8HsZjyl2xa67kKULW0qq39SDEYAC1ogmNPDCdjqBzFXRufw
         RUofaSdRyY5t7CVuS4AnD4HETyVn9Q7udLKIqQxgaSOzLbQUPd1GBJh6kyeOJOAdVPss
         M6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685368850; x=1687960850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0lsLEu8+OX1i7KbaDbSPJtrAmfcuMpjCKFHxHn5ehg=;
        b=FSVMj0n2g0DgrkmygYMiBKkvZaIE3Va7BA+BvZWNultWzvnNCRMZSixKh4cQ9Duc2Z
         X00qUGGAtpFqj4NSpknRV3EYOUgv180NaD7jjVKc//KSFG/XYeVySqBOx10Oo9QXGkoY
         ghHAj7rRWRyWCGhi67n2Q4Ht9INbBQYZmpJlhDfqGjYjO4DDusUob9yRpP5TIaFRlgrN
         h2/viqIoJaO9ndO32Umt7iKLp2uqfXxuaW7yURjH9mCuaZsFar59trM/ffL47VR8bpFF
         gCG35ywK9AA5iCiT9O3R7WqIw83EALLXn37TCNXBr8hK+HxwnTBkLj6B8BVMjkWOZbUQ
         2v9w==
X-Gm-Message-State: AC+VfDwiOPkxn8DrJqeoP2TJneyinEw0G9lJMb3CnearcO2uE8y4CyBI
	n16m/nKZ5xXTznmXn0ZYaRMAyAFpAFPueeEu89M9pg==
X-Google-Smtp-Source: ACHHUZ42AT/mF/LxxNdkE53oZiXxWBfZJhlq7TnCakjSMuYCKiH16dgciBk4JBiaVy1ulIc56tiPp6gn6WhGBvDsPF4=
X-Received: by 2002:a81:52c9:0:b0:55a:12ab:a739 with SMTP id
 g192-20020a8152c9000000b0055a12aba739mr13826747ywb.47.1685368849831; Mon, 29
 May 2023 07:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com> <81193660-ee37-2fdf-6668-13f1e2649a1e@gmail.com>
In-Reply-To: <81193660-ee37-2fdf-6668-13f1e2649a1e@gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 29 May 2023 16:00:38 +0200
Message-ID: <CAFGrd9pzg4E-JPGgvo80FnpBDxV_q3jRcV5R-E94=JJgBf855w@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] Improve the MT8365 SoC and EVK board support
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Kevin Hilman <khilman@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_070053_571846_BD476942 
X-CRM114-Status: GOOD (  24.44  )
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

Awesome !!!

Thank you Matthias

Regards,
Alexandre


Le lun. 29 mai 2023 =C3=A0 15:22, Matthias Brugger <matthias.bgg@gmail.com>=
 a =C3=A9crit :
>
>
>
> On 25/05/2023 10:33, Alexandre Mergnat wrote:
> > This commits are based on the Fabien Parent <fparent@baylibre.com> work=
.
> >
> > The purpose of this series is to add the following HWs / IPs support fo=
r
> > the mt8365-evk board:
> > - Watchdog
> > - Power Management Integrated Circuit "PMIC" wrapper
> > - MT6357 PMIC
> > - MultiMediaCard "MMC" & Secure Digital "SD" controller
> > - USB controller
> > - Ethernet MAC controller
> >
> > Add CPU Freq & IDLE support for this board.
> >
> > All previous dependancies are merged and released into the v6.4-rc1.
> >
> > =3D=3D=3D Build:
> >
> > To test this serie, cherry-pick this serie, and build it using the arm6=
4
> > defconfig.
> >
> > Regards,
> > Alex
> >
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> > Changes in v8:
> > - Change vqmmc-supply of mmc1 node.
> > - Remove all always-on regulators from the board devicetree.
> > - Link to v7: https://lore.kernel.org/r/20230203-evk-board-support-v7-0=
-98cbdfac656e@baylibre.com
> >
> > Changes in v7:
> > - Rebase to the kernel v6.4-rc1.
> > - Remove "dt-bindings: watchdog: mediatek,mtk-wdt: add mt8365" because
> >    it was applied.
> > - Link to v6: https://lore.kernel.org/r/20230203-evk-board-support-v6-0=
-8d6b1cfe7f29@baylibre.com
> >
> > Changes in v6:
> > - Add commit message for the arm64 defconfig changes
> > - Fix the mail list
> > - Link to v5: https://lore.kernel.org/r/20230203-evk-board-support-v5-0=
-1883c1b405ad@baylibre.com
> >
> > Changes in v5:
> > - Add patches to build the MT6357 regulator driver and MTK PMIC keys by=
 default
> > - Remove "dt-bindings: pinctrl: mediatek,mt8365-pinctrl: add drive stre=
ngth property"
> >    patch from this serie and add it to the pinctrl serie [3]
> > - Link to v4: https://lore.kernel.org/r/20230203-evk-board-support-v4-0=
-5cffe66a38c0@baylibre.com
> >
> > Changes in v4:
> > - Remove v3 applied patch from the serie:
> >    - arm64: dts: mediatek: add ethernet support for mt8365 SoC
> >    - arm64: dts: mediatek: add mmc support for mt8365 SoC
> >    - arm64: dts: mediatek: add mt6357 device-tree
> >    - arm64: dts: mediatek: add pwrap support to mt8365 SoC
> >    - arm64: dts: mediatek: Increase the size BL31 reserved memory
> > - Drop "arm64: dts: mediatek: fix systimer properties" which is done [1=
]
> > - Fix style, typo and re-order properties.
> > - Use interrupts-extended for the PMIC node.
> > - Link to v3: https://lore.kernel.org/r/20230203-evk-board-support-v3-0=
-0003e80e0095@baylibre.com
> >
> > Changes in v3:
> > - Remove v2 applied patch from the serie:
> >    - dt-bindings: mmc: mediatek,mtk-sd: add mt8365
> > - Add trailers and simply resend.
> > - Link to v2: https://lore.kernel.org/r/20230203-evk-board-support-v2-0=
-6ec7cdb10ccf@baylibre.com
> >
> > ---
> > Alexandre Mergnat (9):
> >        arm64: defconfig: enable MT6357 regulator
> >        arm64: defconfig: enable Mediatek PMIC key
> >        arm64: dts: mediatek: add watchdog support for mt8365 SoC
> >        arm64: dts: mediatek: add mt6357 PMIC support for mt8365-evk
> >        arm64: dts: mediatek: add mmc support for mt8365-evk
> >        arm64: dts: mediatek: add usb controller support for mt8365-evk
> >        arm64: dts: mediatek: add ethernet support for mt8365-evk
> >        arm64: dts: mediatek: add OPP support for mt8365 SoC
> >        arm64: dts: mediatek: add cpufreq support for mt8365-evk
> >
> > Amjad Ouled-Ameur (1):
> >        arm64: dts: mediatek: Add CPU Idle support
> >
> >   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 235 +++++++++++++++++++=
+++++++++
> >   arch/arm64/boot/dts/mediatek/mt8365.dtsi    | 142 +++++++++++++++++
> >   arch/arm64/configs/defconfig                |   2 +
> >   3 files changed, 379 insertions(+)
> > ---
> > base-commit: d2b7e0f7ff8e0b21e4c8d0ae6dfa38786fe44b35
> > change-id: 20230203-evk-board-support-d5b7a839ed7b
> >
> > Best regards,
>
> Whole series applied, thanks!

