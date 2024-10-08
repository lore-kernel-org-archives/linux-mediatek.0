Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEF9CED26F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 06:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5N200fvxTREEyrxekftq3ggWOWagokPaTUYSEaBWtcI=; b=guSzU+LRoGr2wq5c/teyFWrHgW
	UXq4djgGB3rN5oJ/hAWF8ejqnAC3VHtoeXkfvCIwQ/N9L3lIPV/rUXnlhx6b5ylQRwdznk4dszwvo
	WZLmkFKYazfNTlTmVAHbxwDLwW11wPkDCtrtbdGy6MduHv/AD51ZCGT3fYNiYy5atQAzc/Ad0LOrb
	yNl74zlmLTxecKp7F+v1O7CvqkarkEnmFL04gPhpXaKlLmU8poRQkQubz/ObwK0ThNfGq2Y+gXnwg
	nJA+1ieP21DGKMz0BfkQLDfkbPtm1yMulRHAjG6P77mqM8tPmby5S8lm3Sw3+rVk0wBR824RJCeR2
	OdKb2uqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3yU-00000004hKh-1e5A;
	Tue, 08 Oct 2024 06:45:38 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3yS-00000004hJv-1ITR
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 06:45:37 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5398e3f43f3so5978211e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Oct 2024 23:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728369934; x=1728974734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5N200fvxTREEyrxekftq3ggWOWagokPaTUYSEaBWtcI=;
        b=ESsh1ynq5CkKTobno4O8NSTYIaJB4M08akJYm7TQNy3jydET+roC+5sMddowxyKv+R
         V83Pb77yQeeBInb0GzKNV7NTTlH+sP2zJjPJuA45HsPZCxN/0F/Eqv/pUFbanZDgAJW/
         wnT41Sp57nL90xD4gvDOrBLZt7rVqMk4Caahg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728369934; x=1728974734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5N200fvxTREEyrxekftq3ggWOWagokPaTUYSEaBWtcI=;
        b=YzpUwcKhxnCG9koZRgf0EBkWpNj4jj1w/eXqXcYf1IsnyEq5t0UH9JC2AJN2DdbICN
         ofpodLrNTKi7GTY/11Uc7FzHaLkI/73NL/O/FkGB0E6a+fsNHlNBXpRGwAD9V2r2mQsF
         T0U8226ssK0Szriwhp4eA+Yo2JHJaXBfmR3SRRbnFnkLPsljAgmMIAazPCVpsDuCvHly
         iXHXtg5FDqY/ZbQkJTp2lpVhzZuQZQ+wpwQ7dMDHr9p1OpenCoRmnQTv709A0pDE9EoO
         ywYOtr2VNpec6GL1ghmymWGeq9u6f7+jOwKXadbKOIV94Z5Ez5Qf1nod8gKGuN0Dw5CW
         j6Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXLB8EygT5Hw/FYABm1aI9o1O0pLONZ/GfZplGUg6R01PY41kIOiVl0T23VArZ5XlIkzfkQZxYpBuijpBVckA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz57xBIir4XJ337qxcGyv9UoJzExeSTD4b93zTmlv1lNNe3ryhs
	hWg6rHiEUq41z09yw1XP9ERGnGCrDRzyNhdOyGEgGFqVOLm44+yO8pjxuiRXehvV9/0FDCn40GP
	oMOnS0+SIFA4Z4DArkhyKsLI0tLbVNrwuy3bi
X-Google-Smtp-Source: AGHT+IECT4esT7ue1aARCMGP0UOMUnxo/PP5VibgnFTCBR5NhImNPoYeKUOnemVNGvm97mlnoQmK4bDcS1hCoUrx8yU=
X-Received: by 2002:a05:6512:3e0f:b0:52e:74d5:89ae with SMTP id
 2adb3069b0e04-539ab9e4165mr7000253e87.39.1728369933828; Mon, 07 Oct 2024
 23:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241008053514.6800-1-macpaul.lin@mediatek.com>
In-Reply-To: <20241008053514.6800-1-macpaul.lin@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Oct 2024 14:45:22 +0800
Message-ID: <CAGXv+5HVBP31H2hr8BuAy-4jNkS-T12L_mdmPSCV2po1FnO81g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Fix dtbs_check error for tphy
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Seiya Wang <seiya.wang@mediatek.com>, 
	Tinghan Shen <tinghan.shen@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
	Sen Chu <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_234536_526493_3914B337 
X-CRM114-Status: GOOD (  16.83  )
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

On Tue, Oct 8, 2024 at 1:35=E2=80=AFPM Macpaul Lin <macpaul.lin@mediatek.co=
m> wrote:
>
> The u3phy1 node in mt8195.dtsi was triggering a dtbs_check error.
> The error message was:
>   t-phy@11e30000: 'power-domains' does not match any of the regexes:
>     '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
> Fix this issue by dropping 'power-domains' of u3phy1 node.

You should also mention why this fix is correct from a hardware viewpoint,
i.e. why removing the power domain won't break the device.

> Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation =
board")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index ade685ed2190..1c6f08dde31c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1920,7 +1920,6 @@ u3phy1: t-phy@11e30000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
>                         ranges =3D <0 0 0x11e30000 0xe00>;
> -                       power-domains =3D <&spm MT8195_POWER_DOMAIN_SSUSB=
_PCIE_PHY>;
>                         status =3D "disabled";
>
>                         u2port1: usb-phy@0 {
> --
> 2.45.2
>

