Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC26C4320A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 07:59:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2AE460F13
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 07:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2AE460F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ihr9zOIMd81Cr6iWv553sNoqKgCES9aYTEisDxXaFbQ=; b=kDFwVINkRe7zBm
	IOZ8RinK8E0H8XaKmisvJPHzIlnrHkriqNLOWcNADCSI5x5MPSY2ekdiXx5AFcO8DNH/spbSr8qZN
	rpuDFeZnEcW8Mw6I+w4gr2gdRlQb5gxv471cZC9KO0++d9BGxHNSEiKhlClB4DxOnbSwBQJby+zBM
	0eTZILT+QA9o1Kz4mcwhQlyjzCw3QW6MCsSXm7S3XM8vpsSVKE5IYeqWx01cU0H9vI89/s7EgINtY
	8vq5LxMe6Z9hp3mLbdNbG3u4q9cDv74bmk7GElkkJTC2dELjsIsRMTtfRCbPVPBso24hsJksJfs8M
	vwZgsyynd05FxiEDPrjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMf6-002qb0-4I; Tue, 10 Aug 2021 07:59:00 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMeX-002qNU-Jl
 for linux-mediatek@lists.infradead.org; Tue, 10 Aug 2021 07:58:29 +0000
Received: by mail-il1-x131.google.com with SMTP id v16so5014281ilj.7
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Aug 2021 00:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7mVZPY0yEuCZiQ/XlSPysqwgMRwGoFuxw2FRcr2Upjw=;
 b=n87+ADn6REp26HOZSbgheW02IxMmJA8AAkDFK6Q/uYlhjzlGTRkR0IAiO73oTPy5fD
 rZF+QUT4Q10j9gDx0pEIdthmY+ZZbvtAi1UPYm3aiVIMxwpsCJQAD4rV3eDVGBRM+Q/w
 XDZqhHNKWsqmjb0OHHZZgJZV0Jc7UItPnncoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7mVZPY0yEuCZiQ/XlSPysqwgMRwGoFuxw2FRcr2Upjw=;
 b=RM+pwFKQIgAKwqxu/4zrbv6Wv+c/j8j860fyPi5SGh/vjh48e2vhAPIPpNVoi0+0Q/
 n8xisdu8hxg+x3iwpZ3ScM8hCTtic2J9Q47Y4X9TO7yFExDOGhN/GqNfxI3/6NytDBzz
 2G3qsylJbGRWdHBrOuYtE0W06BKYhoYo+ry5LGeaPY0zYBIC5ql+ukiqGlZzjv/hyXQp
 ZfjfZRR0N5QKwBTKUagLvMQAMQIWxzM2BuUb1G6UCEircOpHeXnQyrIPcgmJoS862jrp
 bVB+14vy2LlESQpUIvz9u8eKgT4SDZbZ5imTemuwi6FkD9ZcVkPyMZq4bef73aBv9V3k
 r+tA==
X-Gm-Message-State: AOAM531wD5CuczvejThTX8Yi1rfAIimTyBNUl5fmSZGSm7uNqGSxKZCZ
 8Vgx01JuixCKDa4b/2GsVnpkMphPKlprt5hvOH1H9g==
X-Google-Smtp-Source: ABdhPJwouKs9MwjKH8QkjNK9MKYf33eJcgU78hqkYm2mQqdDRvL2nmAMyQpE+9sZLxPMGr7FsbpDt8gM2iMNa4f3a5s=
X-Received: by 2002:a05:6e02:1a83:: with SMTP id
 k3mr347831ilv.150.1628582303722; 
 Tue, 10 Aug 2021 00:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210706100136.1205047-1-kansho@chromium.org>
In-Reply-To: <20210706100136.1205047-1-kansho@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 10 Aug 2021 15:57:57 +0800
Message-ID: <CAJMQK-jDNcDYcMY8tTxyVhbEP0g8z5E+cWc3Cu_gqr4fQaUmoQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: mt8183: Add kukui platform audio node
 to the device tree
To: Kansho Nishida <kansho@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Shunli Wang <shunli.wang@mediatek.com>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_005825_756619_A5DFE982 
X-CRM114-Status: GOOD (  16.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 6, 2021 at 6:01 PM Kansho Nishida <kansho@chromium.org> wrote:
>
>
> Hi Matthias,
>
> This patchset is the v3 patch!
>
> Regards,
> Kansho
>

Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

Tested on several mt8183 models

>
> Changes in v3:
> - Use audio-controller as the audio node instead.
>
> Changes in v2:
> - Changed to the dual license GPL + MIT.
>
> Kansho Nishida (2):
>   arm64: dts: mt8183: add audio node
>   arm64: dts: mt8183: add kukui platform audio node
>
>  arch/arm64/boot/dts/mediatek/mt6358.dtsi      |  1 +
>  .../mt8183-kukui-audio-da7219-max98357a.dtsi  | 13 +++
>  .../mt8183-kukui-audio-da7219-rt1015p.dtsi    | 13 +++
>  .../mediatek/mt8183-kukui-audio-da7219.dtsi   | 54 +++++++++++
>  .../mt8183-kukui-audio-max98357a.dtsi         | 13 +++
>  .../mediatek/mt8183-kukui-audio-rt1015p.dtsi  | 13 +++
>  ...mt8183-kukui-audio-ts3a227e-max98357a.dtsi | 13 +++
>  .../mt8183-kukui-audio-ts3a227e-rt1015p.dtsi  | 13 +++
>  .../mediatek/mt8183-kukui-audio-ts3a227e.dtsi | 32 +++++++
>  .../mediatek/mt8183-kukui-jacuzzi-burnet.dts  |  1 +
>  .../mediatek/mt8183-kukui-jacuzzi-damu.dts    |  1 +
>  .../mediatek/mt8183-kukui-jacuzzi-fennel.dtsi |  1 +
>  .../mt8183-kukui-jacuzzi-juniper-sku16.dts    |  1 +
>  .../mediatek/mt8183-kukui-jacuzzi-kappa.dts   |  1 +
>  .../mediatek/mt8183-kukui-jacuzzi-kenzo.dts   |  1 +
>  .../mt8183-kukui-jacuzzi-willow-sku0.dts      |  1 +
>  .../mt8183-kukui-jacuzzi-willow-sku1.dts      |  1 +
>  .../boot/dts/mediatek/mt8183-kukui-kakadu.dts |  1 +
>  .../dts/mediatek/mt8183-kukui-kodama.dtsi     |  1 +
>  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi |  5 +
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 67 ++++++++++++-
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 94 ++++++++++++++++++-
>  22 files changed, 336 insertions(+), 5 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219-max98357a.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219-rt1015p.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-max98357a.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-rt1015p.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e-max98357a.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e-rt1015p.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
>
> --
> 2.32.0.93.g670b81a890-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
