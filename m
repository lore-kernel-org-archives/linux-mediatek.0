Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C024C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 10:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqfltUzO9/7XC4DYmyYNWNOkXYukgueL2I3mGg1oQAA=; b=QTZy/VI0Ft8S+2ZrGaLbHo6xLL
	jDQM/9M6449xZ9Fn9JKhXEW67xf+idmIzWaISDFiB/Wdv9n/Iyqh8PDImBUyzZJcqxsSRBtWt82M5
	zo7WLSbOdnScfhvaqdGskysZtIN1KS8AznQ5dU9hj2+Tk6s74zd/TC6gzPRV/mlNurKzGC/+C8KaT
	X6hA7ZWzm08TFt2MhFaUEnscpLFuT/SUL/NszPOGN/WzpusQQ67nyR4GWHj0UIADnsjlyHVa0Gnbk
	T8EYnjKJecOlIdfk1yhO8FXZC8PEWVENo09AJt3nI5ecScsmHjBl9opwe40cTIbb4wXD1xQQPyT6c
	ExfxE4KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWE4A-003tdo-0i;
	Wed, 16 Aug 2023 10:47:54 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWE46-003taO-2l
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 10:47:52 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6bd0a96e63dso5495674a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 03:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692182866; x=1692787666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqfltUzO9/7XC4DYmyYNWNOkXYukgueL2I3mGg1oQAA=;
        b=Fq65ng7kO+56O688EyACOxLCzvqd//sLdtPogj3dPsTM8xaGxawYIleaF4EvMy/j4X
         dgjU3gcW3l+SJpPFMN4HY0cM5ju/GLbX1EsXHNcfhQZs7FuAVRK3Mkr+Wlrztg+2IJff
         3n22RO5sbjmW2j0UJXPerWGEDMHTaZLuM5ZeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692182866; x=1692787666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqfltUzO9/7XC4DYmyYNWNOkXYukgueL2I3mGg1oQAA=;
        b=AtQ6gRmEk3MwTVBtiwwm7Zpk7uOe3LIZkUnCqjoV5fRPyw9wr+4qjzCqUZoYg4Rjhl
         m1MPQpoGfRXsydATkyu2JsXUVQw9AfxJt7Ocy0QSKK1VYvw2pDAH0k5EgcnwGv625sfr
         S4ojN7wdWOI9jYIW63hWYArI0zfMw2k9LNffWKKLzBpmQL6SXPWIgi4e/eHVab4vEFcD
         Ypxd+pYQgEuKjZTeWdCbkEPt5GB3ovvHP7lmsKb8pRqp5KuLDUlZAl3BaAwvDGHmo5/b
         jj3HehmgsDuw0PJLcBOkZRX87tsaxaNYwyPHopDStjbtNfXADKqejcFl5Cqx1X9sUvzJ
         mr+g==
X-Gm-Message-State: AOJu0YyaMbl6aHC0Xuc7T6qdsOBCyRiYHmtz9OhPMB9T8cYoJ/aoAtjM
	33L45QScDGQ3YulHkz8YE/rRD4x+U8aDBrotzMjp2Q==
X-Google-Smtp-Source: AGHT+IFP9WgOa+Uiy6lzdS/I4FjriYORF5bZW6c+fXS5Unla5QE6KDKixuRVgSimwfA4N1KJgy/utNzBq8HRGuK/BQA=
X-Received: by 2002:a05:6830:154a:b0:6b9:350e:4051 with SMTP id
 l10-20020a056830154a00b006b9350e4051mr1202859otp.4.1692182866233; Wed, 16 Aug
 2023 03:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230816104245.2676965-1-hsinyi@chromium.org> <20230816104245.2676965-2-hsinyi@chromium.org>
In-Reply-To: <20230816104245.2676965-2-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 16 Aug 2023 18:47:20 +0800
Message-ID: <CAJMQK-j2LNvPOC4G=jwdZ3+F+ynpicnVA-ZZ1B6cdDmOnsCxhA@mail.gmail.com>
Subject: Re: [PATCH v2,2/2] arm64: dts: mediatek: mt8183: set bus rx width to
 disable quad mode
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
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
X-CRM114-CacheID: sfid-20230816_034750_902019_F8315FED 
X-CRM114-Status: GOOD (  13.90  )
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

On Wed, Aug 16, 2023 at 6:42=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> Some of the SKUs are using gigadevice gd25lq64c flash chip. The chip
> default enables quad mode, which results in the write protect pin set to
> IO pin. In mt8183 kukui, we won't use quad enable for all SKUs, so apply
> the property to disable spi nor's quad mode.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
change log:
v1->v2: use existing property.
v1 link: https://lore.kernel.org/lkml/20230815154412.713846-1-hsinyi@chromi=
um.org/
---
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
>         };
>  };
>
> --
> 2.41.0.694.ge786442a9b-goog
>

