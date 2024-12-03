Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F39CE6C61A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2024 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKpX/3oOMoY2CpjSV1lkQJtqW/CgZx6kTl37vj9RWvQ=; b=BLzAfEY6GBGxnR5MsYT9cOtqq4
	Q9v+PP0/IVCc3DmpdmUh6qx86E7uyXTVCm2bi2r+UqDrS7nrqYQ6510BUTcILz0Hl98ZulOgZFLMh
	qjvCXk1EU38TJX6XCtHIsGY5AhjZH1s/pteRePnwXx3x3VQYmMIVqB7uVL50v1JUMH9Pq2am4yFT0
	GiAXeZhkgShRp+sHqIRZow3zVbB+6tciF8h9/17mxHtgQDioX5m3UqG1xTVDIDulp/YYWYX2oDISU
	1cBZddWEciae0R5ucopmQcfVcXzC69+jKSWJy4zrdCCYEc6+cODtm50lhyO4lsa6zSgQPTf1JYoOO
	XHcvZqVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIP1r-00000008qFs-1MGS;
	Tue, 03 Dec 2024 09:17:11 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIP0q-00000008q4A-1T6w
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Dec 2024 09:16:10 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53dd9e853ccso5529856e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Dec 2024 01:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733217366; x=1733822166; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKpX/3oOMoY2CpjSV1lkQJtqW/CgZx6kTl37vj9RWvQ=;
        b=gCOWPjaT+NikgrzIQBXbDZZa3nzyOncM0YBf3yUGherF6LU3aKUmbxERppzpG/UvBP
         NNN3YkiXPazihaeR7UzKSGBCNdQrm2sKW8gWSPwUQSpChgsbY6MkRCVLuwpF2tnuAWYS
         VPa2GYkarr734vl8O4RGUrPDOvsbo7UZJz4dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217366; x=1733822166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKpX/3oOMoY2CpjSV1lkQJtqW/CgZx6kTl37vj9RWvQ=;
        b=bEH/7ZbOk40bmc0chOO6WnDUESDjxjXet/YF18p5Lka3TeGWXoYwk/BQTmtkJD2HUH
         1YEFOIrcFqStBJV3J80x9kJmSXDH8wnJrmTC5t9eqSzN8DAU0IIz+0ighHLRu+Yn6eld
         NsDTcsHwxJ8c1BjfQWd1dDrg2Zb5AzYIVrKAGyqg0DdKug2cNZjpXJPMX05+6LyQehNI
         jDlDXponllD0Y43vY7IAPXX8AWvyMCBAaUERzPLH1FYgKcREW4X5d/qROlQTwCfMC42M
         7Wss+y97Ff3/S9oxEfSkS4zMsYfwJktWnaFvgBZ+jC/AxagO0t3B5t+wcI3AYtMakqpd
         H+cA==
X-Forwarded-Encrypted: i=1; AJvYcCU5mlhry1sVN+p8MZHoxdRtKZ5WuKw173Gn8x/NX3Z65wNzd41nvivmvTaKljuTSVfKo0VOxPnwn0mwSdetgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKBrHR1OPI2BDLawMPc+H5HRwhf0d4swkCcIVnn+iHXcgYMWWZ
	nOEIbuJyHXKkxWrdh1KOH2mQfJMrGbclf2I07/3l1cel0190Jib9gfh9yA9zHm+E2Ri9KH+/yHM
	vjs+nESWQ1VRWOw9BZyM+fwU15rrWQXsN60Ca
X-Gm-Gg: ASbGncuimQP9YG2EDAx1n3OTAJOGzoRVFPPyGx7wOfgHT8kxGbSLO6Lh2lqdKltq/bI
	N/tPORykQaAPJkqioL8tIhGXIS1XylD2x/b/3zfzX9YbkBdZre4h7r5PvmcU=
X-Google-Smtp-Source: AGHT+IHblgyX3h9C40czpfBFU4FlCVyQGCJtmnMsdRZhtqjaXaMQ/snRbicpRd77CCHWP8KcHzPutSl+2EBTyk0stG8=
X-Received: by 2002:a05:6512:474:b0:53e:166d:bdf with SMTP id
 2adb3069b0e04-53e166d0c7fmr436640e87.14.1733217366415; Tue, 03 Dec 2024
 01:16:06 -0800 (PST)
MIME-Version: 1.0
References: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20241202032035.29045-4-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20241202032035.29045-4-xiazhengqiao@huaqin.corp-partner.google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 3 Dec 2024 17:15:55 +0800
Message-ID: <CAGXv+5HsOgRCpGOFxEJorVD+=-6GbW_=K3AChkBSxTs27fNJ3w@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: mediatek: Add exton node for DP bridge
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hsinyi@chromium.org, sean.wang@mediatek.com, dianders@google.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_011608_407364_9053CEF7 
X-CRM114-Status: GOOD (  13.26  )
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

On Mon, Dec 2, 2024 at 11:21=E2=80=AFAM Zhengqiao Xia
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>
> Add exton node for DP bridge to make the display work properly.
      ^ extcon.

Same for the subject.

> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> ---
>  arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8186-corsola.dtsi
> index cfcc7909dfe6..e324e3fd347e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> @@ -424,6 +424,7 @@
>                 ovdd-supply =3D <&mt6366_vsim2_reg>;
>                 pwr18-supply =3D <&pp1800_dpbrdg_dx>;
>                 reset-gpios =3D <&pio 177 GPIO_ACTIVE_LOW>;
> +               extcon =3D <&usbc_extcon>;
>
>                 ports {
>                         #address-cells =3D <1>;
> @@ -1656,6 +1657,11 @@
>                                 try-power-role =3D "source";
>                         };
>                 };
> +
> +               usbc_extcon: extcon0 {
> +                       compatible =3D "google,extcon-usbc-cros-ec";
> +                       google,usb-port-id =3D <0>;
> +               };
>         };
>  };
>
> --
> 2.17.1
>

