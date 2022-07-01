Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447B7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 12:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WeGYBPwVDixR2qJouCEO0ByS8rMRdZZ7Fc5WEDHOkR8=; b=qkE1CCZv4qTEEZReMwXFlfA8Iv
	rwo6T9x9INabbXGNxHWc81NeNN7A7v5IGxzpwnrSB20RNalhjvOrGpvyOfBqR3LAZDggvHTOUMbMp
	l8LhBJkHArE1kCVzcuIjEGK0QOu4kkt3nb83vzFnQlrvpuzPIukgYc80HMtjotS0MzZQjURUbkb78
	o4pzDnOLfjeUal7iQRex3CveayzWFGXp44WRg04SvZBGh2FcBA2Q8CjXBtCygoQBjTn8/LOaoieqk
	0fl/iucDMR/hnHC7ydfXgbMuBVluC8MUE64qyx14Uzij64AzAMmynBNOaHjzu/iw/0B/PVfTGe4B+
	KY0ZWNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7G1F-004q8c-5p; Fri, 01 Jul 2022 12:45:09 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7G1C-004q7T-L7
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 12:45:08 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-31772f8495fso22578627b3.4
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 05:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WeGYBPwVDixR2qJouCEO0ByS8rMRdZZ7Fc5WEDHOkR8=;
        b=fwJ/7oQxr9u0A+gZ+PAk5PGvMB3ZTFUSYKEOHOxcSmW6hg2LlJhh1bYkZAkskHhjud
         nBiWx6xjWRpRv5zrvSfNVCGJw2lM/I2mR5YZ7CWbfEBcKoJewqKDF1qGILgw1+GImUsx
         oTZz5efquRuj2iDioBDF17v7f79Dsep40ga0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WeGYBPwVDixR2qJouCEO0ByS8rMRdZZ7Fc5WEDHOkR8=;
        b=CN5pgovfJ2gbbvLBHfAOivQIjpNL3rkF2x2wNu0nyhcQO6HH/i5jmkW95p39kfdyA3
         I0ppwIepuXyM5F6e3bOBRwNBqG1lmdw1ak5JTKCqq6uiGhegnWuPIcfAMYlvkIfb+Og2
         TJUOCVLzsR0561Qbzihn5+bRNdz0r/7sxvgZJ2edLGheraK9yKMYwWQgTEFEqTUmpRAC
         CBlwSQTgJIoc+y/RdA2OIEzICEB3JNENPZG8C+lO8MWPr6SPyoDM4L1wrYrf8KOzLTiN
         gbZrKxVHpmdn3YuSKXTPTx60jdUGmRlM1tevP6g+h0XAHEoOMpazoA4smu3WsVt8aK+5
         F1yw==
X-Gm-Message-State: AJIora+rHv6TwI1jcOiT5PB4ntd6MOsBC4dXwsuHBU8XFiYzQ/EEybru
	/LVts7swEz7NIv8KPhUHI+6Z+/iBU/blnaHQCaO7cw==
X-Google-Smtp-Source: AGRyM1sTMCFR93Cs/lcO5WPfXN00h1mu0K5SZtXz0zhdzHdEqwF3pf2Anm9v9f5YHNas1DSzoSqgOZLlmMh4l0Obodw=
X-Received: by 2002:a05:690c:316:b0:314:2147:2b90 with SMTP id
 bg22-20020a05690c031600b0031421472b90mr15915094ywb.318.1656679504880; Fri, 01
 Jul 2022 05:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220629155956.1138955-1-nfraprado@collabora.com>
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Jul 2022 20:44:53 +0800
Message-ID: <CAGXv+5Epmo1=DZvoFkqj57hiO8nim=cuP1v3i9b2diZwqBe3Mw@mail.gmail.com>
Subject: Re: [PATCH v4 00/19] Introduce support for MediaTek MT8192 Google Chromebooks
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Luca Weiss <luca@z3ntu.xyz>, 
	Maxim Kutnij <gtk3@inbox.ru>, Rob Herring <robh+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_054506_755096_75D16D59 
X-CRM114-Status: GOOD (  21.11  )
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

On Thu, Jun 30, 2022 at 12:00 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
>
> This series introduces Devicetrees for the MT8192-based Asurada platform
> as well as Asurada Spherion and Asurada Hayato boards.
>
> Support for the boards is added to the extent that is currently enabled
> in the mt8192.dtsi, and using only properties already merged in the
> dt-bindings, as to not add any dependencies to this series.
>
> This series was peer-reviewed internally before submission.
>
> Series tested on next-20220629.

Just FYI I also got the internal display to work after some fixes to
the dtsi [1] and copying the stuff over from the ChromeOS kernel tree.

It might be harder to enable the external display, given that we don't
have a good way of describing the weird design of using the DP bridge
also as a mux. See [2] for ongoing discussion.

ChenYu

[1] https://lore.kernel.org/linux-mediatek/CAGXv+5F_Gi_=3DvV1NSk0AGRVYCa3Q8=
+gBaE+nv3OJ1AKe2voOwg@mail.gmail.com/
[2] https://lore.kernel.org/dri-devel/20220622173605.1168416-1-pmalani@chro=
mium.org/

> v3: https://lore.kernel.org/all/20220512205602.158273-1-nfraprado@collabo=
ra.com/
> v2: https://lore.kernel.org/all/20220505194550.3094656-1-nfraprado@collab=
ora.com/
> v1: https://lore.kernel.org/all/20220316151327.564214-1-nfraprado@collabo=
ra.com/
>
> Changes in v4:
> - Added patches 17-19 enabling MMC, SCP and SPI NOR flash
> - Switched mediatek,drive-strength-adv for drive-strength-microamp
> - Switched mediatek,pull-up-adv for bias-pull-up
> - Updated Vgpu minimum voltage to appropriate value
>
> Changes in v3:
> - Renamed regulator nodes to be generic
> - Fixed keyboard layout for Hayato
>
> Changes in v2:
> - Added patches 1-2 for Mediatek board dt-bindings
> - Added patches 13-16 enabling hardware for Asurada that has since been
>   enabled on mt8192.dtsi
>
> N=C3=ADcolas F. R. A. Prado (19):
>   dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-spherion
>   dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-hayato
>   arm64: dts: mediatek: Introduce MT8192-based Asurada board family
>   arm64: dts: mediatek: asurada: Document GPIO names
>   arm64: dts: mediatek: asurada: Add system-wide power supplies
>   arm64: dts: mediatek: asurada: Enable and configure I2C and SPI busses
>   arm64: dts: mediatek: asurada: Add ChromeOS EC
>   arm64: dts: mediatek: asurada: Add keyboard mapping for the top row
>   arm64: dts: mediatek: asurada: Add Cr50 TPM
>   arm64: dts: mediatek: asurada: Add Elan eKTH3000 I2C trackpad
>   arm64: dts: mediatek: asurada: Add I2C touchscreen
>   arm64: dts: mediatek: spherion: Add keyboard backlight
>   arm64: dts: mediatek: asurada: Enable XHCI
>   arm64: dts: mediatek: asurada: Enable PCIe and add WiFi
>   arm64: dts: mediatek: asurada: Add MT6359 PMIC
>   arm64: dts: mediatek: asurada: Add SPMI regulators
>   arm64: dts: mediatek: asurada: Enable MMC
>   arm64: dts: mediatek: asurada: Enable SCP
>   arm64: dts: mediatek: asurada: Add SPI NOR flash memory
>
>  .../devicetree/bindings/arm/mediatek.yaml     |  13 +
>  arch/arm64/boot/dts/mediatek/Makefile         |   2 +
>  .../dts/mediatek/mt8192-asurada-hayato-r1.dts |  47 +
>  .../mediatek/mt8192-asurada-spherion-r0.dts   |  62 ++
>  .../boot/dts/mediatek/mt8192-asurada.dtsi     | 959 ++++++++++++++++++
>  5 files changed, 1083 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1=
.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-=
r0.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>
> --
> 2.36.1
>

