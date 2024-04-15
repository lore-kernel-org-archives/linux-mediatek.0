Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2D3C00A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyAUoqBvIOKTY3LdJCpcnCDojqj4JBfKWFR06e36DaU=; b=uUSfS3h3iCcz/iGwTmDvaP50a8
	INI9rD5Ewr2Lsten1DDVtXA9Uu4fNOImgnJxhoAB/YRbS7pw/NVGkysirXhP+BphVzEi1wwu6zHag
	+8iUIQqA4D1qZoyYTJPx6+0uy8j3WTu0MuEYMhyh/Ocui6OPXLqLi5ZEF6pVpSiYgXMoL1hIIUqH4
	MZ+Pn68NVQHNuzIfhjn9RWCT+aZqZCJ4OEXrkZowIVGJh4VuIqOazse9sOlyDP7Ay1Xk4OAjYsX3a
	b9IwIWvomHrwH6Eoyh+rPsEqfverDec1ptb+O8o16sfOdUKjFxsO9zToRruF1nEUi/AY55175yzlj
	5KrplqMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwGou-00000007M5d-04f1;
	Mon, 15 Apr 2024 07:32:04 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwGoo-00000007M3d-3K70;
	Mon, 15 Apr 2024 07:32:00 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6eb7ee5a776so379608a34.3;
        Mon, 15 Apr 2024 00:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713166316; x=1713771116; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyAUoqBvIOKTY3LdJCpcnCDojqj4JBfKWFR06e36DaU=;
        b=dUtOz1dOtCqrtv4n/nHwp+xNxwCrloAbtlfXKuvk3J7ApguS5bSAJxMnYYttpJCWqG
         uIJrVX0jv/E6XURgd1ObMVD5qOMstJA3mGEzQEU2z/njYKTqYNK5Kr3mjq3FRr8xPQAx
         hZY/SvX50ih+wDUDWqaE12BLlzDoo4K0q6ra/EB4ruFVbgIVga+vUlHkSk5kiThUURs9
         +kKdm7nfFHwykqaF3L+rwLnpB93YJK9BXBSa6p1i3suM3vFSPpricK51gLMiG+F4u11q
         sgtva9/40dg5yzbErOT7BpFkLFrUIMGUKtumfo+zV0I1PQ7anxhc24q05gp8ML80m9o8
         WUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713166316; x=1713771116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyAUoqBvIOKTY3LdJCpcnCDojqj4JBfKWFR06e36DaU=;
        b=UPlE+mrgdNppXMe45pmiiWjBAa4vUF+TV6UJy5FpK7sVfoYApYwfQmXXzwfL72w76b
         GvBVUnG3Y0HO/olpiFeg0DgMjpgOXQogzGWAzFltmtUo3x26O33tFaOAxjLtcYw9JANM
         IzI56YrJxiqEANczBD4qR3hcfS51jKZ0L85v/kO24Pe0QLLGSAC+a/NyfX73DhmInTh6
         AuEf3XBxxWJMLrXj5rI5ud+vyFczlkan9NpksHFtUik6fyprQIFK9LC3y7J6xRk0oS7k
         pErSueJ56+aQhqYMxfFFZJ/KargCyl1d3S4yivKLYKTguJMU6fnZzP4yl2qHuZSakmg0
         muHA==
X-Forwarded-Encrypted: i=1; AJvYcCVmxljm8fp3ZoyFtIxb32ti02n7w3D0YykMjFBGWoE5urFeA5Wxj8NR5ivZu8DH9JN0np+tokxMXlBMEFCahQ26A5jx4ntyIMaNsVHip4WWoRmc45+qAi9Ja7c8iMg7LTxvTZGjiicm7A9Yp/ud5jb3mZofLYi0WetuoNH6Wax0Wi2nowm2Znp1IX4FuoRmLwDC/VnnxhXKI7EyYfjeGLIJHPkvLYRYuCpH6rQlKNqD0da1WwCBUzGESX+mdgO+TVpR2g==
X-Gm-Message-State: AOJu0YzghQUcGtGGWas9y7gHpvD9NoeksawcaIUaAxlJyfYcOU30zC+5
	vme1SW5NN2c4iHKZqMasta6tHA+xf1kZvpQBtVWixMizpglO9rU0MFZsKif5X/VjgYELU0zF5xt
	K9ugT0sSjmmw6RGzQmYn5GP7YSdI=
X-Google-Smtp-Source: AGHT+IG+mHEf+9pMHePulndcOmqJAFoy+0e8uxd+TwOgPTDj/IhKU2JtlX/85TmoPDDzrhRzFX9Fs3nWYPxdgLlCL2I=
X-Received: by 2002:a05:6870:ac26:b0:233:b575:4b4a with SMTP id
 kw38-20020a056870ac2600b00233b5754b4amr10413015oab.36.1713166316068; Mon, 15
 Apr 2024 00:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240413151617.35630-1-krzysztof.kozlowski@linaro.org> <20240413151617.35630-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240413151617.35630-4-krzysztof.kozlowski@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 15 Apr 2024 09:31:47 +0200
Message-ID: <CAMhs-H9ADfuDkFcD==7x+VaN2q92JV1gxuyrWvfNYK1psEnrQA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: PCI: mediatek,mt7621-pcie: switch
 from deprecated pci-bus.yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Will Deacon <will@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Srikanth Thokala <srikanth.thokala@intel.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Tom Joseph <tjoseph@cadence.com>, Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_003158_852146_FA90E77A 
X-CRM114-Status: GOOD (  17.36  )
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

Hi Krzysztof,

On Sat, Apr 13, 2024 at 5:16=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> dtschema package with core schemas deprecated pci-bus.yaml schema in
> favor of individual schemas per host, device and pci-pci.
>
> Switch Mediatek MT7621 PCIe host bridge binding to this new schema.
>
> This requires dtschema package newer than v2024.02 to work fully.
> v2024.02 will partially work: with a warning.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Important: This depends on change recently merged to dtschema, however
> no release was yet made with mentioned change.
> Therefore this patch probably should wait a bit. Previous patches do not
> depend anyhow on future release, so they can be taken as is.

Does this mean that we should set DT_SCHEMA_MIN_VERSION to 2024.02 in
Documentation/devicetree/bindings/Makefile then before merging this
patch?

>
> Changes in v3:
> 1. None
>
> Changes in v2:
> 1. New patch
> 2. Split mediatek,mt7621-pcie to separate patch as it uses
>    pci-pci-bridge schema.
> ---
>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

