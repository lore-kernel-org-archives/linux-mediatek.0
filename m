Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD05AC3DA5D
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jul 2024 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGl5c3HNmBBbaK/O1r5iTiZ1Nkq9wz0Q4rHARmEMwjs=; b=ZV4INpRLy1HJvSqnZQNo274obB
	Tv1UYFIF+utt376txc+kTHvAHNUemJVT+T+I6C6YhTAcXfKawz+2R0LjGRJFBOlBLHk6cqbGqjThj
	Q0sRu9Of61UOodsDhmcZOOsEtEYzXya9U9/5LrXIwY5UnqPkW+tvpmrcrOft848BLtHn2NnfJD4Wf
	HPxlTRniWQjrhwORZv95+vwiCHh4PKnkvDQxe2o5G/obOWVAQHjdSt96Ornt/JZwK8V6T7UBwgbaP
	Z0oTfBzpL6JT79KJskQEmJT9q5lt0rKqA3FeSLKwwTX8EYE6DkWRdWVk/Uzrlz+FUqn10Pdq+pFBY
	xfLuxmew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWvoQ-00000000dPr-0l79;
	Thu, 25 Jul 2024 10:35:06 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWvoM-00000000dOR-2vNE
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jul 2024 10:35:04 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-52fc4388a64so1134183e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jul 2024 03:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721903700; x=1722508500; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGl5c3HNmBBbaK/O1r5iTiZ1Nkq9wz0Q4rHARmEMwjs=;
        b=QFXatFh6FL99ylqsC7kswtlJtcrn9Y5dWOO6KVd0MukMqmeLxj4S0iFVH+dFeECzzF
         ZRENrQ2DOHkDBnvPG6xBj8MvsE1qfOqmULt56+IMk9CC1M1tpatT4YY9rDH+F9MyUR7H
         83n/rCNGl/ngKEcEPZ5td2rDIxywxN/zaVYHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721903700; x=1722508500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGl5c3HNmBBbaK/O1r5iTiZ1Nkq9wz0Q4rHARmEMwjs=;
        b=A9yGc/2kubYEUpOsjTpkoAeXtPh/a6ZhOjvy5m+WJHX6sL6xaviGaVcNa6/VUJ1plX
         9+jS4kR02tfOS26hkR7QpN0UZCtsxECOCQ1lZ6O0xBeJkakSaXNYg7/Iq8rw5jRguf6o
         1oc5jyHtqEf2Lcg7rdkHT9D/J/MEaSWShpWpitOjY3vyOeAHcgUMdH6fkpEKjzg5lXaR
         8p4PSMzF7PGplpHrSBSngzU87tpwnTAYTjZr5YWI8G+F47eg99VfNWkRj2V7ZG23dREK
         Voa6C1XHn/0HIZJfB2bf0SKs71lH1RAQDVuvKtJPg6pnEQ3P4BRhi8JWXki0Q+46KSyM
         WSSw==
X-Forwarded-Encrypted: i=1; AJvYcCWzHs2410qJSvrxFmNV+Mghzbk2SxuaBRRxXIRrmpfg25+mA6lPYb8la6TD31wd9R/UL36v9ToC8uTWexvNZs4e1JqY/rgI+ppqQodvyoz9w1si
X-Gm-Message-State: AOJu0YziM8UNF9ldKTCkoYOutvpgjLnYLts3HyUB42T5ACN7nIcO3aM/
	Jm5kHW7gPJk7Q3TvfpelFLyc9nJAzjj1AtPBSHGExVSAF6Jb9vzxR6KVylkOpM6mDgDTseu1jY5
	hcOewoKlKU/YOis8wSTG+bJuXHsPG64JPjBs9
X-Google-Smtp-Source: AGHT+IHkE66wc/ZgxWkQgDaikOYMpwK+iI3oiC+hn7N1tRYSraZ86sG3P9nD/p1ufKpAexRHxLjoxCDlxy5nnXtmG6M=
X-Received: by 2002:a05:6512:2035:b0:52e:9ab9:da14 with SMTP id
 2adb3069b0e04-52fd60b6b10mr855792e87.31.1721903699732; Thu, 25 Jul 2024
 03:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240722-usb-1129-probe-pci-clk-fix-v1-1-99ea804228b6@collabora.com>
In-Reply-To: <20240722-usb-1129-probe-pci-clk-fix-v1-1-99ea804228b6@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 25 Jul 2024 18:34:48 +0800
Message-ID: <CAGXv+5H_pxR18sHeqdWPy9_FARrnLwyyOHV4VXCn9p5OExseiQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Add missing clock for xhci1 controller
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_033503_408756_86EAA1DE 
X-CRM114-Status: GOOD (  26.07  )
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

Hi,

On Mon, Jul 22, 2024 at 11:27=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Currently if the xhci1 controller happens to probe before the pcie1
> controller then it fails with the following errors:
>
> xhci-mtk 11290000.usb: clocks are not stable (0x1003d0f)
> xhci-mtk 11290000.usb: can't setup: -110
> xhci-mtk: probe of 11290000.usb failed with error -110
>
> The issue has been tracked down to the CLK_INFRA_AO_PCIE_P1_TL_96M
> clock, although exactly why this pcie clock is needed for the usb
> controller is still unknown. Add the clock to the xhci1 controller so it
> always probes successfully and use a placeholder clock name for it.
>
> Reported-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> #Kerne=
lCI
> Closes: https://lore.kernel.org/all/9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@=
notapiano/
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

So I asked MediaTek about this, and it seems the correct thing to do is
disable USB 3 on this host controller using the following snippet. The
snippet is copy-pasted from our issue tracker and won't apply directly.

This is also seen in mt8395-kontron-3-5-sbc-i1200.dts, on which xhci1
is used only for USB 2.0 on an M.2 slot.


ChenYu

index 8b7307cdefc6..2dac9f706a58
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1447,6 +1447,7 @@
                                      "xhci_ck";
                        mediatek,syscon-wakeup =3D <&pericfg 0x400 104>;
                        wakeup-source;
+                       mediatek,u3p-dis-msk =3D <0x1>;
                        status =3D "disabled";
                };

> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index 2ee45752583c..cc5169871f1c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1453,9 +1453,15 @@ xhci1: usb@11290000 {
>                                  <&topckgen CLK_TOP_SSUSB_P1_REF>,
>                                  <&apmixedsys CLK_APMIXED_USB1PLL>,
>                                  <&clk26m>,
> -                                <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>;
> +                                <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>,
> +                                /*
> +                                 * This clock is required due to a hardw=
are
> +                                 * bug. The 'frmcnt_ck' clock name is us=
ed as a
> +                                 * placeholder.
> +                                 */
> +                                <&infracfg_ao CLK_INFRA_AO_PCIE_P1_TL_96=
M>;
>                         clock-names =3D "sys_ck", "ref_ck", "mcu_ck", "dm=
a_ck",
> -                                     "xhci_ck";
> +                                     "xhci_ck", "frmcnt_ck";
>                         mediatek,syscon-wakeup =3D <&pericfg 0x400 104>;
>                         wakeup-source;
>                         status =3D "disabled";
>
> ---
> base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
> change-id: 20240722-usb-1129-probe-pci-clk-fix-ef8646f46aac
>
> Best regards,
> --
> N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
>

