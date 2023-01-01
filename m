Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBC1C4167B
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Jan 2023 21:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itENd4bv7sUz5J3kCLw+9gAbPG9mWjjKo0129xbt1AQ=; b=y2l2LtbOXrdeFoGr9wZb5TQpfk
	E+l0DVfe/AZGwk3s4Q/jn6I6O9Jjzphm7ypd9iBxifLaN+iyxKfugXhsPpNQaGn27K4q0Aov42kNo
	g/+tOReq6zW0nqLS+jHe44TLz8wXNOJ0o+w+ax3t2sxTsT7cxyiWdGITcMNcF5Uo/10Xo+2oZj6Cf
	GDKPCINlxO+pH2wErQio3+RF20F97EbEPkWs0STa+l2FeO6KIgaSKR2Bc6ZclwOEcnI7TS5BCE5QS
	gefBl7orhGeUAFp5YhjmBiktWG3tdH8QKJNLKiim49BgWVvq74lbXxnZQ8FXXHj+Lcq9QmTHJ4gj9
	+bN89t4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6Mb-005dsI-Ks; Sun, 01 Jan 2023 21:59:29 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6LL-005cpc-LO
	for linux-mediatek@lists.infradead.org; Sun, 01 Jan 2023 21:58:14 +0000
Received: by mail-ot1-x333.google.com with SMTP id j16-20020a056830271000b0067202045ee9so16414568otu.7
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Jan 2023 13:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=itENd4bv7sUz5J3kCLw+9gAbPG9mWjjKo0129xbt1AQ=;
        b=fb3LXnCyZ/kIWmb8tqNRWca8LIYBDCd5S3QU9qS017ZBuOHwJAjp+7E2RHKrwghQXA
         F89bQEWQvafxF0QTsYtfvmnT9B9ObbMuXSZLZ0Z4iu25Wi4QZ9pm31JRiQb1DGxqM8kg
         bKaa/o1DTP9MJKqpZI3nwwYjJLm3JLVzu1pgpf+AkBkWfuGJ2W6iKguyxa1s7VtCEuuX
         xrVeEaiCOnUiewnJ/MAySvKL/TNapMzc1RnofDNBVdu+OSqhQf5wHlzjOyNX+S1tMnnR
         GwHW7xQnDN6N6yg8yH6mUKhHkQDQyTf9KgtT9ISuGGkQ2ysnrKYx6sSPM2Ba/RG4ipgc
         l57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itENd4bv7sUz5J3kCLw+9gAbPG9mWjjKo0129xbt1AQ=;
        b=PwgAgEiSftiaElaxjk3IWdXv6slMEME2OtA52dkD/D7hLZNfLHLgRTpO7ZLcac/ch5
         tlfXzeIuoA+J2Qx2OwSBrbioMVAiPnu8UGbCh0W/rpLmMw8VP7Rhe7olo4TYifcCOr75
         7myXVbyXfKZv/1vC6UiQM98iN1BpUAFveMID8qtmeCuAdNYLcaNLUfMuIJdibGft8EY0
         GC1NkxPzMv2tNBlkuGRD0SVtFp5PveebhD75yXKmIr7GUKblqcP03VJJy46I2G3ztDB7
         Aiuo8jNx87xqlrS3Lpx0znkshyCF5i6RypBT2ZHcNi5n8/+/lFdrjrlEh1CaYbrA2ah+
         4PRw==
X-Gm-Message-State: AFqh2krNNd/AaIoX/cfOmUeWoLoDCKBuUIZDQkCCAhS9b+wUiZeovgY/
	bRm2y4qGTTL0t7pM+XPWvpsTzlhED3j7bwk6sXiG+Q==
X-Google-Smtp-Source: AMrXdXvYUSzWN57SlzCh3DW6LHX/uMQkh78bq7FU+RCyZ2XJRZPNKpSvrWCsru+LAl/TArGUqJFdjZTYm0mHsKAx6SI=
X-Received: by 2002:a05:6830:1dac:b0:670:99fe:2dc5 with SMTP id
 z12-20020a0568301dac00b0067099fe2dc5mr1566669oti.137.1672610289731; Sun, 01
 Jan 2023 13:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20221230203541.146807-1-bero@baylibre.com> <20221230203541.146807-8-bero@baylibre.com>
 <87v8lsect3.wl-maz@kernel.org>
In-Reply-To: <87v8lsect3.wl-maz@kernel.org>
From: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Date: Sun, 1 Jan 2023 22:57:58 +0100
Message-ID: <CAP2ifjMkKJbE_+B=XaxzXoALrc5+FUb7TKpPJQBLV3-3xqVh=g@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] arm64: dts: mediatek: Initial mt8365-evk support
To: Marc Zyngier <maz@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, matthias.bgg@gmail.com, 
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, 
	gregkh@linuxfoundation.org, chunfeng.yun@mediatek.com, 
	linus.walleij@linaro.org, lee@kernel.org, tglx@linutronix.de, 
	angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230101_135811_946044_A1883039 
X-CRM114-Status: GOOD (  12.73  )
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

On Fri, Dec 30, 2022 at 11:41 PM Marc Zyngier <maz@kernel.org> wrote:
> > +             gic: interrupt-controller@c000000 {
> > +                     compatible = "arm,gic-v3";
> > +                     #interrupt-cells = <4>;
>
> Why 4 cells? All the SPIs routed via sysirq are perfectly happy with 3
> cells, and all the PPIs have 0 for the 4th cell (none of them use any
> form of partitioning that'd require 4 cells). So where is this coming
> from?

It's coming from the SoC vendor kernel (and went unnoticed because it
happens to work).
Will send an updated version that does the right thing instead. I've
been running it most of the day, so far looking good.

> > +                     interrupt-parent = <&gic>;
> > +                     interrupt-controller;
> > +                     reg = <0 0x0c000000 0 0x80000>, <0 0x0c080000 0 0x80000>;
> > +
>
> The first region is obviously wrong (512kB for the distributor?
> that's... most generous, but the architecture states that it is 64kB,
> and that's wasteful enough).
>
> This is also missing the GICC/GICH/GICV regions that Cortex-A53
> implements, and that must be provided as per the binding.

This was also taken from the vendor kernel; unfortunately neiter the
datasheet for the SoC not the vendor kernel specifies the addresses
for GICC/GICH/GICV.
I've "guessed" based on what's in similar SoCs (MT8183, MT7986a) in
v7; this seems to work (boots, kvm initializes hyp mode properly).

ttyl
bero

