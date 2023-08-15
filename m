Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A9EC0015E
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Aug 2023 17:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MM9euffrr+V/1uq4G/APEfY56DZEA1NA8IRMKebX+WA=; b=mCRhDK/YTN/zppJm1DnwakHA94
	zpt/2hbKu0aGibWes9dGDkJGPrsDzM5SjLxGXmlW2WLZvqUELN4Ta0Wg1DAhjIxtceJW2E7OEmloh
	mJXn5DoCIfVSmVS2dNj7m6m+4YyRGbegR5oYKtseC/7JjENm8Dg7Z4EVevT9MMv+465TpL79F/wPV
	BcXXjN0uNQvvMsWO/s+GEHvdfHGYtanyxUyTdUFTnUAAw3z65cU5xJ3xoERGulOFq9Vi8L3I6QQQp
	vcgIFko5V1KFiQ746KVIbGoc/HPw/1uMmXVjSEviPFhzjAwX0YYWa7O9OKLzUKFPKhOLegFKCbuwN
	aihITCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVxkB-0024HV-2N;
	Tue, 15 Aug 2023 17:22:11 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVxk8-0024GL-33
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Aug 2023 17:22:10 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6bd6a34474cso29796a34.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Aug 2023 10:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692120127; x=1692724927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MM9euffrr+V/1uq4G/APEfY56DZEA1NA8IRMKebX+WA=;
        b=g5L59vBep0r+/ftR+REWdJrS6nXl1s1W1biL/1VPx5rGQotoKUGwnHslJpYPCDZAOF
         AMKl73/0gdHxuwNmrwV/zm9rnTtp3RdE3KbtVT51jCPUaEI8vgdaIaOwRz0xKL2dSOrb
         aXO5MtavbYMX/1gkvgUnfTzMkPnbUln80MGfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692120127; x=1692724927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MM9euffrr+V/1uq4G/APEfY56DZEA1NA8IRMKebX+WA=;
        b=iWg+X8XQec5GKfW+MT+TuvfqwHGhWQ//h5v6S3wxipYaOH5mF/tXIRSW4Ol18Ql5R7
         uFNetyn65Tp31NvfO71SnfWizkA+aaP9YDfpIV3rApgdoXNZUildJnluoavJKoB56sTg
         R3mpVKBLGoFJ6CGs9RgjOiRp2cmYnK1YYcMr7OL2eAO1ObZc4PaAIkSoEQimM/xRwVfT
         MNwM0P5smKeG/da6Rmq6U/JdCxmUwl+2qMyf6jTfFIPHlBCDIoT4T9k6SYoYUUGVCv+m
         6GLVl0kdQmHpf2L45kZ9wtGPe3CidCkbp7s6V2aSQGjEvP02YKfuK7Qrg/TSoGG7e1s9
         JY7A==
X-Gm-Message-State: AOJu0YykFiAm/ajgZaMCED0F7rn5TCzfcZDIPg0svCaiv4LYN6fIsovb
	zjxWu1hYJGWt1rIDjPN4WNLWXKyqiWvPYmQ4MWU4Zg==
X-Google-Smtp-Source: AGHT+IHgC2abKSNjRtwoIG7RPv/B0LrW+zFvRJCKfHpiwIXf0dkMMKZr7PMY0mgXqpc3ZPNNCyBizoMu6rSLlcxkZZs=
X-Received: by 2002:a05:6830:1e85:b0:6bb:1629:ab44 with SMTP id
 n5-20020a0568301e8500b006bb1629ab44mr11361067otr.7.1692120126879; Tue, 15 Aug
 2023 10:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230815154412.713846-1-hsinyi@chromium.org> <202A0C36-D1F6-4BB4-BDEC-F36A76B757A2@walle.cc>
In-Reply-To: <202A0C36-D1F6-4BB4-BDEC-F36A76B757A2@walle.cc>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 16 Aug 2023 01:21:40 +0800
Message-ID: <CAJMQK-iw7ikyHKPPC8+hnpXuRq-_nq_N+21BKgWxD2nx=vAeJA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add a property to override the quad mode
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, "Miquel Raynal )" <miquel.raynal@bootlin.com>, 
	"Richard Weinberger )" <richard@nod.at>, "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_102209_002888_B834D3F6 
X-CRM114-Status: GOOD (  15.30  )
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

On Tue, Aug 15, 2023 at 11:59=E2=80=AFPM Michael Walle <michael@walle.cc> w=
rote:
>
> Hi,
>
> >On gigadevice gd25lq64c, the quad mode is enabled after BFPT is parsed.
> >According to datasheet[1], Quad enable (QE) bit needs to be set to 0 to
> >use write protection (WP) pin. It also recommends setting default value =
of
> >QE to 0 to avoid a potential short issue.
>
> So you are using either dual or single io mode. Why can't you use the dev=
ice tree property spi-{tx,rx}-bus-width?

I tried setting spi-tx-bus-width and spi-rx-bus-width to either 0 or 1
and WP still doesn't work.
For this chip, quad_enable will be set to spi_nor_sr2_bit1_quad_enable
(QER flag is BFPT_DWORD15_QER_SR2_BIT1_BUGGY)[1]

spi_nor_write_sr_and_check() calls
spi_nor_write_16bit_sr_and_check()[2] and the function sets QE bit if
quad_enable is not NULL.

[1] https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/sfdp=
.c#L575
[2] https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/core=
.c#L879

Setting spi-{tx,rx}-bus-width still falls to this function and cases.

>
> >Add a disable-quad-mode property in devicetree that platform can use it =
to
> >override the quad mode status parsed from BFPT to use write protection.
> >
> >[1]
> >https://www.elm-tech.com/ja/products/spi-flash-memory/gd25lq64/gd25lq64.=
pdf
>
> should be a link on the vendor Homepage if possible.

Right, https://www.gigadevice.com.cn/Public/Uploads/uploadfile/files/202207=
14/DS-00012-GD25LQ64C-Rev3.4.pdf
is a more proper datasheet source. The QE description is also in page
13.

>
> -michael
>

