Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A23D49798
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 04:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jem2dHb0CIqQfqKZWUZqxzpx7Oxum1MlxW1zvUuUsw=; b=xjufM7GPgW7LXj
	Fk8V1bGhjZzlvwrSlYQe7hmCSnZb9Nl3BXqQ1AxiZyN+Yy7cYYcgf/fxp4ObeI09lUZcwwJZf/y0O
	BkNQjUgEBQNw7jbX4VdiultbGj1lx54mLXqsOEBdprlmiLkfAUSClvoLh8OB53vOcOk2hZRoQ+sBG
	3ljXbMeslYnuRSI9DnbCgDiNhotJObzTC9UwY3WKsLVG1nZutJepiItlrTUhjIpfPrs9aLvGCKoxL
	+fhCiOUpYHYDqGV1qnUt5tdj0cHui8ZvqzpMdS5vtE7tsbI8glbRm4mQRihO1zgNbjRJy8aIuLUJg
	HDMh1ZtOpWZNxO2e3zPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHy0O-000000051v4-2UCf;
	Mon, 02 Dec 2024 04:25:52 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHxzO-000000051kb-0yPR
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 04:24:52 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53df6322ea7so6081238e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Dec 2024 20:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733113488; x=1733718288; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jem2dHb0CIqQfqKZWUZqxzpx7Oxum1MlxW1zvUuUsw=;
        b=JA5Q3Bwv16v5r0HxYRNRfRInqUwzoNlYd4NGdqQLgZ3We+cpJnIIiY9uYTZkti7xr0
         XpuT9d91J1lu3h2RlqCiNhfUIxX80IP+DLEG2K0EskqUgk0YbT1Gjjgnp5hUQWoVlTdI
         i829JqUhok1u57XMm1gL9lLL44v0fYrX+ghRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733113488; x=1733718288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jem2dHb0CIqQfqKZWUZqxzpx7Oxum1MlxW1zvUuUsw=;
        b=iwWHKiK1uYmByLX8H7kRofGYYx1Bs3FaDZXUFaQdw9PqKMFUIpUmCBKR3DdKNFc9Eo
         Bj7BoBz5KKfTk6zg7jzGT3TqJeqNLGRP7cQlEAlB7HFbGfkZzMx7Jxgxz269Hgat2qmc
         ZHOectHmzoz6RUhgCXqxbtX17pBKgNmwH9A8J3t06GRCfalprWtFdG2LF7H61RB+j+pw
         zL2vyb/ERNm726DaBjoOZApZCGIFcPPtkk68WlsT1CWLUSSXFnYGjg3+3rnO9sPAisL9
         mSAtsnViWBPsg0F0dM/Ac02qusRbcAEqeI5BOZ5ooRtDrrlPpqgR4y/TAmpSoZJmQ/xa
         6mRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOKlHO+J+Y8t3UBQE47hu376aZ1RYKs/MjFOPkl99TGMtXZ4q1j6xv+VL3+jlnEK0Y5Y3DOjgocx9L5DT5KA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnhOiy+w9O46vvUXCZspcDSX9tIHqWPOnQLfmiVU8/2x1KDxpU
	2K4MKO3I1PfOfPmo/7NC0qKjRIh7usrL5GJTV0EFV2aN9AKowEfAhA0lFbKSeGU+xZsezuNbB6X
	FEs1l4snhCOlqRcVksWdXUqQI9mp8LeffxEhw
X-Gm-Gg: ASbGnctU+kOoWTUo/hmLsUHhB9N0VkfrHHhLSQJgVd2R9kI+KOa6qg1R8NdhSzBZ2se
	2JXWXP+7rxi7YtSq1vcb5cW5K1UasqfMrEg/NBhLL1Nr8BbKqGHql+XCAJwU=
X-Google-Smtp-Source: AGHT+IHt/vITEDYHnbNLIeuL8UfGCtEad48V6Gq5+hXkXt9A/7GYxhY5NyWdbJAiTmoRwPFhqaSLnctzzSQH8pUcJcs=
X-Received: by 2002:ac2:42d1:0:b0:53d:f09e:9a1d with SMTP id
 2adb3069b0e04-53df09e9c34mr11711959e87.31.1733113487710; Sun, 01 Dec 2024
 20:24:47 -0800 (PST)
MIME-Version: 1.0
References: <20241001113052.3124869-1-fshao@chromium.org>
In-Reply-To: <20241001113052.3124869-1-fshao@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 2 Dec 2024 12:24:36 +0800
Message-ID: <CAGXv+5E4=dKkUo73x5vCMHawcr9AUd71LyLmDbdyOdJZv0ZBaQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] MT8188 DT and binding fixes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_202450_282534_3F987E62 
X-CRM114-Status: GOOD (  17.40  )
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
Cc: Xia Jiang <xia.jiang@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Yunfei Dong <yunfei.dong@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Fabien Parent <fparent@baylibre.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, linux-media@vger.kernel.org, Bin Liu <bin.liu@mediatek.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, MandyJH Liu <mandyjh.liu@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, Oct 1, 2024 at 7:31=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote:
>
> Hi,
>
> This series is split from a previous series[*] to focus on few fixes and
> improvements around MediaTek MT8188 device tree and associated bindings,
> and addressed comments and carried tags from the previous series.
>
> [*]: https://lore.kernel.org/all/20240909111535.528624-1-fshao@chromium.o=
rg/
> [v1]: https://lore.kernel.org/all/20240925110044.3678055-1-fshao@chromium=
.org/
>
> Regards,
> Fei
>
> Changes in v2:
> - new patch to MediaTek jpeg and vcodec bindings
> - new patch to move MT8188 SPI NOR cell properties
> - revise commit message of vdec power domain changes
>
> Fei Shao (8):

>   dt-bindings: power: mediatek: Add another nested power-domain layer

This one ^

>   dt-bindings: PCI: mediatek-gen3: Allow exact number of clocks only

>   dt-bindings: media: mediatek,jpeg: Relax IOMMU max item count
>   dt-bindings: media: mediatek,vcodec: Revise description

and these two ^ have not been picked up, and now v6.13-rc1 has DT
validation errors for MT8188:

/ssd1/wenst/linux/mtk/arch/arm64/boot/dts/mediatek/mt8188-evb.dtb:
syscon@10006000:
power-controller:power-domain@15:power-domain@16:power-domain@29:power-doma=
in@30:
Unevaluated properties are not allowed ('power-domain@31',
'power-domain@32' were unexpected)
    from schema $id:
http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
/ssd1/wenst/linux/mtk/arch/arm64/boot/dts/mediatek/mt8188-evb.dtb:
power-controller:
power-domain@15:power-domain@16:power-domain@29:power-domain@30:
Unevaluated properties are not allowed ('power-domain@31',
'power-domain@32' were unexpected)
    from schema $id:
http://devicetree.org/schemas/power/mediatek,power-controller.yaml#

/ssd1/wenst/linux/mtk/arch/arm64/boot/dts/mediatek/mt8188-evb.dtb:
jpeg-decoder@1a040000: iommus: [[101, 685], [101, 686], [101, 690],
[101, 691], [101, 692], [101, 693]] is too long
    from schema $id:
http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#


Is there any way we can get them into v6.13 as well?

ChenYu

>   arm64: dts: mediatek: mt8188: Add missing dma-ranges to soc node
>   arm64: dts: mediatek: mt8188: Update vppsys node names to syscon
>   arm64: dts: mediatek: mt8188: Move vdec1 power domain under vdec0
>   arm64: dts: mediatek: mt8188: Move SPI NOR *-cells properties
>
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 100 +++++++++++-------
>  .../bindings/media/mediatek-jpeg-decoder.yaml |   3 +-
>  .../bindings/media/mediatek-jpeg-encoder.yaml |   2 +-
>  .../bindings/pci/mediatek-pcie-gen3.yaml      |   5 +-
>  .../power/mediatek,power-controller.yaml      |   4 +
>  arch/arm64/boot/dts/mediatek/mt8188-evb.dts   |   2 -
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi      |  33 +++---
>  7 files changed, 88 insertions(+), 61 deletions(-)
>
> --
> 2.46.1.824.gd892dcdcdd-goog
>
>

