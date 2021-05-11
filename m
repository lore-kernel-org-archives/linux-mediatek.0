Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AA4C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 10:17:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CE1761925
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 10:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CE1761925
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Oyiw/40M6HyRVIfP2MvIH1gGgn2e5JrQQlU9Y5d/Wd0=; b=TKUo9sCQdklMbvmJPZpGDech+
	tOTgIxRxW+lj94slX/KTSPqlpGlOTOCLV8ETjTvmy6rDOgQ4sUbcfiP+DOio4HKEXC/3kJ14uAv8c
	sXcWQ4T2d0DY7rfh8NBTXIiOPz+hGXIY8lYKbI1NU9i2CxWO90Li3CjStb5rGdsx4vPRffre2fos7
	GuVqygAxqMFfHEwzceXOgpKsq4a00nuzNlpxmH3OPXWwdP+9VlfZvgUvizedlqIzDxQuQmVIWfY3/
	kcBEsREiPqnSJUp4IA4a5iBE9hBHlz1XvtjOjp7UNskyYeFugXpDdutBbRYJPyyXN3EmPUIMrEFq8
	0he4DSkAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgPSS-00GsiZ-Td; Tue, 11 May 2021 10:17:45 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgIuh-00GAV2-8T
 for linux-mediatek@desiato.infradead.org; Tue, 11 May 2021 03:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OkHDlYFluPki2ZdUn0/eNDhFO7FqUp9u17CiwZh22fI=; b=Nc7ukSEu8uCGbAVRigumZAWukR
 R4DzKZFXqlQH2unldUY7UA3vtNfYjzQoafOXIPGzWpbsXll+LmVN1BMneudlWyo7VrCoA6BBTCTHC
 2NqvJhJX4Zt+CpocZ3+Dkbmyg/6EPdDM1EmgfnjjJTq15VVyDPGTKzA0Fpl2aEOM5dX9ExQEvzryS
 0F2PaVUGjj916MoNQ5TbOp9MsF640ei7Ns0JG2yRt/xpB0zAhje9BY9APW8L+KzATeAeTQgRS3GdW
 s1+fjHcbZoOo9vXW9jFoUi7irW3fM2x/w3l5NFW9TQw+AZVLTJEOKDztxbwl1gGWFedbiDTdEdu8Y
 KlqCUxQA==;
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgIud-009H8V-FS
 for linux-mediatek@lists.infradead.org; Tue, 11 May 2021 03:18:24 +0000
Received: by mail-io1-xd32.google.com with SMTP id z24so16842624ioj.7
 for <linux-mediatek@lists.infradead.org>; Mon, 10 May 2021 20:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OkHDlYFluPki2ZdUn0/eNDhFO7FqUp9u17CiwZh22fI=;
 b=mTFWoS6vW84BXMZlAa+QisfevYOw9aQGHn03C7IpjFYVCHUvAFmLmfRnnKOMgnch6A
 F5tqeukS8/OV4hrfyHJcyO7fsYN/V9XaVD6Uf7xie0bG9KgBlDHH9bmSxm+HrNDvDgSB
 TMl+2Ng1YPohPWBnJyb7kB3XZJYx2xWNO85r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OkHDlYFluPki2ZdUn0/eNDhFO7FqUp9u17CiwZh22fI=;
 b=ZOCeclMOtVRncLMA3rBykxJjiYqyBP6Ue9z7uiGvzpNmTd3YzvvlKuAuXxvrREKvt6
 r+nGGiDU0f4Ik9LvIMpePmc9HxLWvtZ2RtJ2eMmXRLL0zWO8NBJ4oz39WyEMsf3nGReZ
 DHrkYIj4Eczx/Y1svbBcDjiBoZ3AWGaOPvo08jsELEtHErjcHZn5ulqhVKpKvvnRBa5U
 wDmSwKvdcLSz10OMsWvJNcZ59kMktTFeKr+MCstIUdnOrEnYJiMbzFxyaVDQaZnNjA0m
 1B8yBlyglLVHtP7KWRlRUu5CsuSnr8EUFdMkmg8oUQTxTgZSn6B0e/TdLhb34wyuasm7
 t7zg==
X-Gm-Message-State: AOAM533+dYplbuTomeT1vQsxwDsTBnyCOli3h4tC/WRKHRRS8MyQzeSr
 maKTZlmAZFa989F2Z1NF2IF6niePJOky5StywwBV3Q==
X-Google-Smtp-Source: ABdhPJyrD8bDd6jE5FS8jaJSkAfnWnTZbGMj2SNEByq0yqDn2YByH4a4ZLSTNDq73en4LDotx14twU2BKaNZJ46rNQ8=
X-Received: by 2002:a5d:9694:: with SMTP id m20mr20648173ion.40.1620703101484; 
 Mon, 10 May 2021 20:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210421090601.730744-1-hsinyi@chromium.org>
In-Reply-To: <20210421090601.730744-1-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 11 May 2021 11:17:55 +0800
Message-ID: <CAJMQK-jxUwoz_zP-PgoEhnjqxzFC965csj0tNjuTxUT7Rg7Cmg@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] Add several jacuzzi boards
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, Ben Ho <Ben.Ho@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_201823_525305_2975BFC2 
X-CRM114-Status: GOOD (  12.34  )
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_201823_525305_2975BFC2 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

On Wed, Apr 21, 2021 at 5:06 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Add several jacuzzi follower devices: kappa, willo, burnet, kenzo, and
> fennel.
>

Hi Matthias,

Can you help pick this series? thanks.


> Change log:
> v2 -> v3:
>  - remove unused property in i2c2 in willow and burnet.
>  - add fennel.
>
> Hsin-Yi Wang (10):
>   dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-kappa
>   dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-willow
>   dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-burnet
>   dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-kenzo
>   dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-fennel
>   arm64: dts: mt8183: Add kukui-jacuzzi-kappa board
>   arm64: dts: mt8183: Add kukui-jacuzzi-willow board
>   arm64: dts: mt8183: Add kukui-jacuzzi-burnet board
>   arm64: dts: mt8183: Add kukui-jacuzzi-kenzo board
>   arm64: dts: mt8183: Add kukui-jacuzzi-fennel board
>
>  .../devicetree/bindings/arm/mediatek.yaml     | 29 +++++++++++-
>  arch/arm64/boot/dts/mediatek/Makefile         |  8 ++++
>  .../mediatek/mt8183-kukui-jacuzzi-burnet.dts  | 30 +++++++++++++
>  .../mt8183-kukui-jacuzzi-fennel-sku1.dts      | 44 +++++++++++++++++++
>  .../mt8183-kukui-jacuzzi-fennel-sku6.dts      | 32 ++++++++++++++
>  .../mediatek/mt8183-kukui-jacuzzi-fennel.dtsi | 27 ++++++++++++
>  .../mt8183-kukui-jacuzzi-fennel14.dts         | 16 +++++++
>  .../mediatek/mt8183-kukui-jacuzzi-kappa.dts   | 16 +++++++
>  .../mediatek/mt8183-kukui-jacuzzi-kenzo.dts   | 12 +++++
>  .../mt8183-kukui-jacuzzi-willow-sku0.dts      | 13 ++++++
>  .../mt8183-kukui-jacuzzi-willow-sku1.dts      | 12 +++++
>  .../mediatek/mt8183-kukui-jacuzzi-willow.dtsi | 26 +++++++++++
>  .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  8 ++++
>  13 files changed, 271 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
>
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
