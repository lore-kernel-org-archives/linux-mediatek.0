Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2F8C001B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Aug 2023 19:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QUc0x0pjPpKWnmgAca1QOq5TW3L4ejfm50N+84Kmuc=; b=nU5NFdRtWMkXqK4wIJuIFoiNvy
	iIbv7Xb2Y7hYD6i5kGBe3whmgsPcvmhK0TbVtEMcTADP6ighaNHna5bgDLuV1xmv6Jj0V08X730dJ
	j6p6T+TFiDLqkHdia/vvZr9jBUIob63AppcsefGpfQn5mjkbmpD9BLp3384p0c5/0iZkJCXyNmTfM
	L7j5oE9VNXqG6+YnDqB+HJl2WnKzWuyH8NDhaP4vfM4iF6fv4AP8A9bJTMN7my73nWqo+0E9Qyr08
	IrSB7TAWWMNyvVlgJYctgO9gg5nyOjfrjaYBIWAPpcO+ohw64TrePWMyQEKopccaeOWX/HssISeNY
	oOa3hBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVzsx-002KZG-0Y;
	Tue, 15 Aug 2023 19:39:23 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVzst-002KYO-1k
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Aug 2023 19:39:20 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-523bf06f7f8so6035066a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Aug 2023 12:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692128355; x=1692733155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QUc0x0pjPpKWnmgAca1QOq5TW3L4ejfm50N+84Kmuc=;
        b=epkn3nESY5n3HxS7FqV7X+dZmCrr567ksE1leWFQXG6a2VYZ3kIFukk34i7A4n2KTn
         XKHaP44TIML7qAi0CLOrJpJnBDADxItCyFs80OYIx/3pnomlFbS3Bza8ebqn5Rqi6+GK
         Q4eY6mUSP90fphwRqNaFmr+mtcHJamid/Bczw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692128355; x=1692733155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QUc0x0pjPpKWnmgAca1QOq5TW3L4ejfm50N+84Kmuc=;
        b=TOaIlGlxhUFH/vBaSITOUXZfbBatl6Yr2p37YG1+aOgdXyaGbdJ54ol5sIVjts/1R6
         auUe+I9CM/G351mCpVQyVNHOs7K8aiCpdCd5DySVrL/8x/rM9nCbUqOqnrRLaFZy5x2w
         o0/yb3QWG0MjzQuhL+c9aV1e+ldnVF7fT98Ub8iTDe2PlqG6gtCU9RV4IVHxPojlq/WR
         XxfpdaQhtKc5FOe/IxPEBr5uiLwC1ndERDDxl38DhAxaBbc7U1cU3sgyy0ZFXJnvWsqF
         UTA9HvFDutMnrE8QKRfkh/VfnCER1DBGk0UFwKr2QGzarGymRs/+vF0Ir2LYNp5OYE0+
         i/DQ==
X-Gm-Message-State: AOJu0YzvqRQApXLxS7RbI089A4BDVA7i3wFI40OErQcJ6szarKhxL8os
	8jrxhtKL1M0jAQGodglyF5UjfKIkcCISoJMr+2Do3bSb
X-Google-Smtp-Source: AGHT+IEC7cAUwOqDnO1mbIhjlRPermwXJGzMyZW8tv1a4yamwaLy9k9B0BYjU1x7A2sr0/acPJMcMA==
X-Received: by 2002:a05:6402:20c:b0:522:2111:1063 with SMTP id t12-20020a056402020c00b0052221111063mr10424320edv.18.1692128355354;
        Tue, 15 Aug 2023 12:39:15 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id be18-20020a0564021a3200b00523d5d9bf1bsm5567702edb.23.2023.08.15.12.39.15
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 12:39:15 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fe2a116565so1895e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Aug 2023 12:39:15 -0700 (PDT)
X-Received: by 2002:a05:600c:35c7:b0:3fd:e15:41e3 with SMTP id
 r7-20020a05600c35c700b003fd0e1541e3mr24772wmq.2.1692127947638; Tue, 15 Aug
 2023 12:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230815154412.713846-1-hsinyi@chromium.org> <20230815154412.713846-5-hsinyi@chromium.org>
In-Reply-To: <20230815154412.713846-5-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Aug 2023 12:32:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UvDZOgJ0TxeBYGgDMqSUYUX9am+QAMEXpRQ0C-Hh=kVw@mail.gmail.com>
Message-ID: <CAD=FV=UvDZOgJ0TxeBYGgDMqSUYUX9am+QAMEXpRQ0C-Hh=kVw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc7180: disable quad mode for spi nor
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
X-CRM114-CacheID: sfid-20230815_123919_583130_18B46648 
X-CRM114-Status: GOOD (  16.07  )
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


On Tue, Aug 15, 2023 at 8:45=E2=80=AFAM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> Some of the SKUs are using gigadevice gd25lq64c flash chip. The chip
> default enables quad mode, which results in the write protect pin set to
> IO pin. In trogdor platforms, we won't use quad enable for all SKUs, so
> apply the property to disable spi nor's quad mode.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/bo=
ot/dts/qcom/sc7180-trogdor.dtsi
> index 5a33e16a8b677..0806ce8e86bea 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -436,6 +436,7 @@ flash@0 {
>                 spi-max-frequency =3D <37500000>;
>                 spi-tx-bus-width =3D <2>;
>                 spi-rx-bus-width =3D <2>;
> +               disable-quad-mode;

This seems unnecessary. Unless "tx-bus-width" or "rx-bus-width" is 4
then Quad SPI isn't enabled. You don't need an explicit property since
this can just be inferred from the tx and rx bus width.

-Doug

