Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030CCC001DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 17:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xA0nxblLEhHPpBIZZtW+HOiojWVRcj+llWDtNwnRsQI=; b=gHwP4zPCqEa0xVaGuzM17GiZaP
	AQd1h9dl5l1Hhy3eqR6BAiwSYuHoxooUTgUz6Mwre3i/VFkyhWUp+kkMfJ8k7wiywgMNjmNWljjxz
	QK6VSTt4ErE5S8yXiR7LLGXRD4f3R9n4M6Xy76VMU/Ta3aUbuaFY9Et/UL4Z6iG+jDae2BStrKs1L
	488FIN2NJTcIlOxrCtEzsg2yYgQzZeVRQRtLguTrR9zArWZ2B/84WA5bz0yN9cLHoZyj6xaLQVsw9
	sGro1htNG4wZGkaCdUW4gVxSRWWbEoMgfl2+1DkHY1ZiP6TlUFxwelmzjucGFgQX7aqrN2XvkjqlJ
	O76zzSWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWK0x-004g6O-2D;
	Wed, 16 Aug 2023 17:08:59 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWK0u-004g5h-2X
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 17:08:58 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-986d8332f50so918505766b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692205734; x=1692810534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xA0nxblLEhHPpBIZZtW+HOiojWVRcj+llWDtNwnRsQI=;
        b=HAfFLZfhCRxkyl5u95IFPqqfih7JYGxKOVKc+nBLaJW0OA0m9m/jcmtSftnEHhU0N1
         8ikbyxj3g7nfOJKPLfpEVAVjtDF8z9CgIJC8fah8DN4bF+I3SCP1mlPEFqVn6tRWcwSt
         Zwua8pwfyOx9OzDFS1hB3uFK5CGdxZLG46qCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692205734; x=1692810534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xA0nxblLEhHPpBIZZtW+HOiojWVRcj+llWDtNwnRsQI=;
        b=SzY12yPxuIOjjbBpNQihlVlLTRmQAs3jOLQ6//lt2i7hH9ejRBFvQRlFnM1VNn6Cvt
         d1zGMnGw1Jmb0x2ZUTPTRpF/jjtF1m1sBPI3teTw7T8ISit8/N6ux1sbeZj0zCHNX64J
         tZDd2gj/tWUApWVEnSgYOmI+94xWRJGBImeWJPcHfLw2un+RaMi3ZFvU8ORYw4DFyoNE
         2A59UFcRPq1ruSlI5DHEhySPp7uk/qLt8Mv0SSy+UbNqCcuNZ9GPMeI28FJPfM3sMwjN
         MS9N9C2v4w1sK3XK00sUwdp6bBo/7Cy6o/aEv65YIhY9dh+MnHIne8iO4x5vnFWC+zHw
         o7mw==
X-Gm-Message-State: AOJu0YwpmomM89dUtZCA8n6LIlZ4h2uEM2P0FrynIG/WJ+UKQGzpnKjk
	jpHuQHZWapFohMsGvUtlCeVlM4IAC1XtCByJeNi+BjUh
X-Google-Smtp-Source: AGHT+IHJpN+Xy6Z4nTW/yv4PJ+t+27pDDreNJXdAMZ/QP4BE/zO/ju+NS8p3r7JrwJW7CpzlnIkUYA==
X-Received: by 2002:a17:906:a3c7:b0:987:47b3:6e34 with SMTP id ca7-20020a170906a3c700b0098747b36e34mr1891297ejb.67.1692205734218;
        Wed, 16 Aug 2023 10:08:54 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id oq27-20020a170906cc9b00b0099ca4f61a8bsm8741867ejb.92.2023.08.16.10.08.54
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 10:08:54 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fe32ec7201so3045e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 10:08:54 -0700 (PDT)
X-Received: by 2002:a05:600c:4fc2:b0:3f1:6fe9:4a95 with SMTP id
 o2-20020a05600c4fc200b003f16fe94a95mr6307wmq.4.1692205427880; Wed, 16 Aug
 2023 10:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230816104245.2676965-1-hsinyi@chromium.org> <20230816104245.2676965-2-hsinyi@chromium.org>
In-Reply-To: <20230816104245.2676965-2-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Aug 2023 10:03:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UH0NFH9LGk663WeWodD9oN7o8M70jy26CYBXd7=o5-VA@mail.gmail.com>
Message-ID: <CAD=FV=UH0NFH9LGk663WeWodD9oN7o8M70jy26CYBXd7=o5-VA@mail.gmail.com>
Subject: Re: [PATCH v2,2/2] arm64: dts: mediatek: mt8183: set bus rx width to
 disable quad mode
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
	"Miquel Raynal )" <miquel.raynal@bootlin.com>, "Richard Weinberger )" <richard@nod.at>, 
	"Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_100856_844811_A47A040C 
X-CRM114-Status: GOOD (  16.62  )
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

On Wed, Aug 16, 2023 at 3:43=E2=80=AFAM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> Some of the SKUs are using gigadevice gd25lq64c flash chip. The chip
> default enables quad mode, which results in the write protect pin set to
> IO pin. In mt8183 kukui, we won't use quad enable for all SKUs, so apply
> the property to disable spi nor's quad mode.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index 6ce16a265e053..ef472b522f2e7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -877,6 +877,7 @@ w25q64dw: flash@0 {
>                 compatible =3D "winbond,w25q64dw", "jedec,spi-nor";
>                 reg =3D <0>;
>                 spi-max-frequency =3D <25000000>;
> +               spi-rx-bus-width =3D <2>;

This feels wrong to me. Is your controller actually capable of "dual
SPI"? If so, why wasn't the rx-bus-width specified before? ...and if
you're truly capable of "dual SPI" then why aren't you also setting
the tx-bus-width?

My best guess (I can look up the schematic if needed) is that you're
actually _single_ lane, not dual lane SPI. Thus, a more accurate
description would probably be:

spi-rx-bus-width =3D <1>;
spi-tx-bus-width =3D <1>;

...but... I think that the default of rx/tx bus width isn't specified
is "1". Thus I think you should drop this patch.

-Doug

