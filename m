Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C6ED78336
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g65m5wLGmeNM0imaWPfjDT5gKeN2tJjUFhX3nreziMM=; b=pvTXkHFpxB9yRg
	I/CE0Aqm3OS12oC8kZG95QP1zALewS1RDKGgGGCBwfxsKCInIq1TuT/DxE6jZ1lvYP6H5ftztAg9M
	dp5uB7qewVJeMKIgTJT9UJxcBQVbedTqA5mJH53V6jMRTlBJYptJMFfDbDmhzkUQS1n/HN9dJXEBR
	kQzQIUK/ZCi4aSv4PyVEzDdvrTeWxdFh8UtwmmNk13GVo5CHmVlOYYJlrwkWuVTJ9dlql+i7Py2Fu
	WvPnrDA3ruH0kKpNStMqzgvg1TPAxET3LvsdutChOiGaZcw0ICSO9ONEZB3FOkOo2bd0hIoOYygUQ
	U58QErVO/l6MNcNLwwow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9FE-00000006qCM-0e6g;
	Mon, 02 Dec 2024 16:25:56 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8yM-00000006mgs-0n9w
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 16:08:31 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7b15d7b7a32so362676385a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2024 08:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733155709; x=1733760509; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g65m5wLGmeNM0imaWPfjDT5gKeN2tJjUFhX3nreziMM=;
        b=T3kgsCg6QDahtCSItonpPS6bTEZk68G1lXPttvjYN+WNX+NFs+RXMxvmmW3wCIplRk
         9C6VgStJyYbaUPsPJegSKQjgUCpPl8k1K1eYCuZZB32jcLPulz/vlYyyTcVMuSYdwidc
         TTY64Ii7Z/yqYiZ4w08c10OXcf0faGKM/aV9A8YXa0ursnIsYKaPrDE0tPpXPLDiwym2
         7iYg7GzSGhw6XUDna98OFcTh5MfmRrAwsXkhugrPiHL4dJZqZVyKhHLAmg7i4Ddg9jjG
         zr0dE8ZAV2x4H47y0OdnweerPxwcJe7y2Wre1kOejf4w+Ievs1ioPe7jMprV6JpTBrFo
         c0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733155709; x=1733760509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g65m5wLGmeNM0imaWPfjDT5gKeN2tJjUFhX3nreziMM=;
        b=cAiGJzdzQFinCyP0X7xMLoMYTDwe9WzhAGgdiprzWqufA0thDEv7Nifmu7xT8Q87hn
         IyXOYPCBo3NlWIgKse/y5CC/RejpS641Ijve4XtacdjjO2FiW4Ae2d78RYJ8zpbEhVfn
         7DDgBbrDvktGkd+rg1vJrfZ1LyTlCdwCz/0yu3oFez4CDhg7ieoeZgjVkrlcAMfleTuZ
         uC+OUwM3Ky/HruP8Uz2FHZmVqOdONHWMn8aFNTrsyPPuzpuHX8OqeUcADMNdYiaVW66g
         01/EA9iJ27zwRTREnWDE9syqZns2/7m/OAHkk2+i3ojlTD2PuVZFl8Nmyw1hlHp9qxxg
         4Gvw==
X-Forwarded-Encrypted: i=1; AJvYcCUsbmTIMiCNP6DictOGJNgztXH35lmsqgLHwZT87+2KwrJYtB4aHab5QrINs15OGw7MCTvKrPu+1CAvIUYxeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj8xPwZtRU7jpPlStUzzwiPVaWhdkg40Xxr+7/0wZyjKupiG6w
	lDgbi7zoVniiHrUVivfkgzvjNsQ3Db2id3icAQfa96OaxpVT416B+2qSNHCM46FPUAQ8z1cW3xT
	NXhYnzbf+34K56wSvUH+zlVKxVEbKKzxY2sQQKI3XGuCJWbpv
X-Gm-Gg: ASbGncvT24NgBBZlwklcluj0eUUOdAAgk45Y3MdE6Xj4TMGkRsRUqhgmrWn8XLj1Lde
	FOXZX1gcAwAbHNjOTvJKOcDyxvuaaLxqG
X-Google-Smtp-Source: AGHT+IFz8rX9DRRJ5onEJ67Od7I+D7KR9TNvA59oNfUh6oW0pwLXWng/zcOviJd4aYPyq52DFvFRuuqZBB6m7oAYo2M=
X-Received: by 2002:a05:6902:2b07:b0:e2b:e0ba:d50 with SMTP id
 3f1490d57ef6-e395b870e93mr21476694276.5.1733155698386; Mon, 02 Dec 2024
 08:08:18 -0800 (PST)
MIME-Version: 1.0
References: <20241001113052.3124869-1-fshao@chromium.org> <CAGXv+5E4=dKkUo73x5vCMHawcr9AUd71LyLmDbdyOdJZv0ZBaQ@mail.gmail.com>
In-Reply-To: <CAGXv+5E4=dKkUo73x5vCMHawcr9AUd71LyLmDbdyOdJZv0ZBaQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Dec 2024 17:07:42 +0100
Message-ID: <CAPDyKFor=KyPEfrfLWct0dLa03hj6uawM-R3z4rOEzHSrNCWCg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] MT8188 DT and binding fixes
To: Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_080830_221587_20230928 
X-CRM114-Status: GOOD (  22.65  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2 Dec 2024 at 05:24, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Hi,
>
> On Tue, Oct 1, 2024 at 7:31=E2=80=AFPM Fei Shao <fshao@chromium.org> wrot=
e:
> >
> > Hi,
> >
> > This series is split from a previous series[*] to focus on few fixes an=
d
> > improvements around MediaTek MT8188 device tree and associated bindings=
,
> > and addressed comments and carried tags from the previous series.
> >
> > [*]: https://lore.kernel.org/all/20240909111535.528624-1-fshao@chromium=
.org/
> > [v1]: https://lore.kernel.org/all/20240925110044.3678055-1-fshao@chromi=
um.org/
> >
> > Regards,
> > Fei
> >
> > Changes in v2:
> > - new patch to MediaTek jpeg and vcodec bindings
> > - new patch to move MT8188 SPI NOR cell properties
> > - revise commit message of vdec power domain changes
> >
> > Fei Shao (8):
>
> >   dt-bindings: power: mediatek: Add another nested power-domain layer
>
> This one ^
>
> >   dt-bindings: PCI: mediatek-gen3: Allow exact number of clocks only
>
> >   dt-bindings: media: mediatek,jpeg: Relax IOMMU max item count
> >   dt-bindings: media: mediatek,vcodec: Revise description
>
> and these two ^ have not been picked up, and now v6.13-rc1 has DT
> validation errors for MT8188:
>
> /ssd1/wenst/linux/mtk/arch/arm64/boot/dts/mediatek/mt8188-evb.dtb:
> syscon@10006000:
> power-controller:power-domain@15:power-domain@16:power-domain@29:power-do=
main@30:
> Unevaluated properties are not allowed ('power-domain@31',
> 'power-domain@32' were unexpected)
>     from schema $id:
> http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
> /ssd1/wenst/linux/mtk/arch/arm64/boot/dts/mediatek/mt8188-evb.dtb:
> power-controller:
> power-domain@15:power-domain@16:power-domain@29:power-domain@30:
> Unevaluated properties are not allowed ('power-domain@31',
> 'power-domain@32' were unexpected)
>     from schema $id:
> http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
>
> /ssd1/wenst/linux/mtk/arch/arm64/boot/dts/mediatek/mt8188-evb.dtb:
> jpeg-decoder@1a040000: iommus: [[101, 685], [101, 686], [101, 690],
> [101, 691], [101, 692], [101, 693]] is too long
>     from schema $id:
> http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>
>
> Is there any way we can get them into v6.13 as well?

I don't know why I missed picking up the DT power-domain patch for
v6.13. Sorry for the delay. Anyway, I have taken it now and applied it
as a fix for v6.13-rc[n], thanks!

I assume someone else can help to take the DT media patches.

Kind regards
Uffe


>
> ChenYu
>
> >   arm64: dts: mediatek: mt8188: Add missing dma-ranges to soc node
> >   arm64: dts: mediatek: mt8188: Update vppsys node names to syscon
> >   arm64: dts: mediatek: mt8188: Move vdec1 power domain under vdec0
> >   arm64: dts: mediatek: mt8188: Move SPI NOR *-cells properties
> >
> >  .../media/mediatek,vcodec-subdev-decoder.yaml | 100 +++++++++++-------
> >  .../bindings/media/mediatek-jpeg-decoder.yaml |   3 +-
> >  .../bindings/media/mediatek-jpeg-encoder.yaml |   2 +-
> >  .../bindings/pci/mediatek-pcie-gen3.yaml      |   5 +-
> >  .../power/mediatek,power-controller.yaml      |   4 +
> >  arch/arm64/boot/dts/mediatek/mt8188-evb.dts   |   2 -
> >  arch/arm64/boot/dts/mediatek/mt8188.dtsi      |  33 +++---
> >  7 files changed, 88 insertions(+), 61 deletions(-)
> >
> > --
> > 2.46.1.824.gd892dcdcdd-goog
> >
> >

