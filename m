Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB59C07548
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 06:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrRtND/YRUzURuoQwjKJk/HonLng3kvTj/8TZ3Odh2Y=; b=eJyBUQFA2YnqV0qNYiOKh4hC5x
	MeNYICxGWr6jc5jEPMW9f7+MbUvALUhpPf6Nrd3gtE56qmwhkvzquWA4b0RU1gLodX+YPM7JV5gcW
	T+Wjk2Ow3xDO5xgBlKJokfWnn3UOFD7hIiLcScwA183JogZIzDYmh0R9yca+LAiKXqIAHrKMnF3Dt
	Cf/r8Lfm8jMfaM8tgQSwDV0M6IXegUTi0ly377kgkUwuleRRo0pKsqPnZdhK+KXfhosGsmK0o6UYJ
	lCVr2YGHDZTRixvQIXXnIBFG4KZjmRmFVIeDQw7l1rhzEZ9Xz7ywEWFXHYbA2kMxLeGBq8dFx1hj0
	G8ZKeGOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3953-00Hae9-2w;
	Wed, 15 Nov 2023 06:08:53 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3951-00HacY-09
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 06:08:52 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-507adc3381cso8567154e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Nov 2023 22:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700028526; x=1700633326; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrRtND/YRUzURuoQwjKJk/HonLng3kvTj/8TZ3Odh2Y=;
        b=BBnLik85pBlPA1XZAJcm+jpRU/WsVJ85jyb64OXq4foIUVadL5EcRrrbHFe23854Mk
         gy6DKclZ2/rshUbEM2KuVaXTJI5mFqWTt+o5tX/kHfCMHF8RCxgMz1Lp2YKtnYs0kXYb
         SHxdNwi91OFvQ31lqxHhfzXXgcQtqrQe3Yuuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700028526; x=1700633326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrRtND/YRUzURuoQwjKJk/HonLng3kvTj/8TZ3Odh2Y=;
        b=XAVzvlJLkwuHWtLl4DXIX9RKJmte9wRQaYm/dvkmFgl6Sb9tuQSaLzGbNzMUXrHI4p
         q+YAkV6d99fii14MyZZEBxiHmV3Lb71sgQlK3NEaMqarQjBUN+aUqBzeVTU455bPWuY5
         iK7gEOAJrxX10tfzzABXnoglkrtnh+TxppAk5UC0YKOAA8buzggvK4I/hdNkiaDgsIIe
         y12eIRxGWZiyit8DhKI3yFc/5BgwxmKXLEaSlOq+RHi3szr/mzVUEJiuwwnEf7qzwPjk
         CzpSMVoveqvIDF0+3ly3mGhigz2vB3WGKAJCCf9+5hYm4FF5u2pSCAQ1T8/Adp/7BPI5
         ISeg==
X-Gm-Message-State: AOJu0Yx62fTQvHc1N14pHX5LlQDiSfE2jjfwaSp8P7vIe3EFoZCCXKQ2
	QUl9Dk2uDCN0EQxhJW6f1fEbkum55i6/VVYEgMZWARfVamxT5IAc
X-Google-Smtp-Source: AGHT+IEElVyq/Wfz+fZN9g5gHhgB0rYPl8JRXgccOm8OavEsvJYgG8EGZ+VI+3AA2iv3HFdt3nFxSDC3zZjP6Wt+9vg=
X-Received: by 2002:a05:6512:b14:b0:509:8e3d:7cb0 with SMTP id
 w20-20020a0565120b1400b005098e3d7cb0mr11292990lfu.41.1700028525615; Tue, 14
 Nov 2023 22:08:45 -0800 (PST)
MIME-Version: 1.0
References: <20231115043511.2670477-1-treapking@chromium.org>
In-Reply-To: <20231115043511.2670477-1-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 15 Nov 2023 14:08:34 +0800
Message-ID: <CAGXv+5FnzLgnNfvK-KEd4OUysUXqCuCp7AJ3iuzEGn=fry0B1g@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mt8173: Add G2Touch touchscreen node
To: Pin-yen Lin <treapking@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_220851_136932_CEC22182 
X-CRM114-Status: GOOD (  17.43  )
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

On Wed, Nov 15, 2023 at 12:35=E2=80=AFPM Pin-yen Lin <treapking@chromium.or=
g> wrote:
>
> Lenovo Ideapad C330 Chromebook (MTK) uses G2Touch touchscreen as a
> second source component.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

I assume this patch will get merged relatively soon. I can base my DT
probing work on top of it, instead of having roughly the same patch
in my series.

> ---
>
> Changes in v2:
> - Remove the label for the node
>
>  arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> index bdcd35cecad9..8836ac3c4233 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> @@ -29,6 +29,14 @@ touchscreen3: touchscreen@20 {
>                 interrupt-parent =3D <&pio>;
>                 interrupts =3D <88 IRQ_TYPE_LEVEL_LOW>;
>         };
> +
> +       touchscreen@40 {
> +               compatible =3D "hid-over-i2c";
> +               reg =3D <0x40>;
> +               hid-descr-addr =3D <0x0001>;
> +               interrupt-parent =3D <&pio>;
> +               interrupts =3D <88 IRQ_TYPE_LEVEL_LOW>;

I assume Angelo might ask you to use interrupts-extended instead, but
I'd argue it's better to be consistent throughout the file.

> +       };
>  };
>
>  &i2c4 {
> --
> 2.43.0.rc0.421.g78406f8d94-goog
>

