Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AFEC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:41:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB36E60F22
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB36E60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5a8h+VBl0CIbHcUPQpriS7AcXTAqP2lmTmh2MLVh/6w=; b=tDEO7VnTaRf/Br
	qgvkTx7hKwUTf7H4MIPnyU/HpOofQu9/CuKpke+LjlvbWHVE3YouBcBF6OJ0uOjE7zEg0uVMGLkbG
	0ZhoLTNhEvuiXN0PmqntmOB9S11i7jqhbA/8OqjGjLiBYrL3E3pqdKmV5RhOzprJJSn19sLIlvFvg
	kNyR1wywArcKgEVFlRAnwVVSGa7g2d/FMffEitT7KJ3JlQWPf+9ei2tyMjYXYKuChvt6ILxdi12+1
	DtAF2rBkFO8bwCKh6oKxkQnDBERpGPc70soXAnuK7y+tO16FbKjrHmtsspKEGfTyaJGUypENgE4so
	w2Qbxc/Hgx5yXCUHhDgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7y2r-00AmSn-IU; Mon, 26 Jul 2021 10:41:13 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7y2e-00AmQS-8H
 for linux-mediatek@lists.infradead.org; Mon, 26 Jul 2021 10:41:01 +0000
Received: by mail-lf1-x12b.google.com with SMTP id r17so14613291lfe.2
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 03:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mp+ljmBlWVJ3FcF8TzFJ/v6DBJnSfIezbeTpHeoDqRs=;
 b=i/IKSBgxKVAztTwiTtgjoROmNn7HkqaBtbAlNMHjALuMoi7YisCKdKhr5rQB7PewHL
 7V3M1dCz2NHL0LkV8ZUW1DZ3fIR4rWqfqYH5HfKC9+/RUbzmJjoGp7dRFdZp6FI8gxIE
 CBmI26l/Z/HgKqXvubpXWEgOh+/Wn+eteioPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mp+ljmBlWVJ3FcF8TzFJ/v6DBJnSfIezbeTpHeoDqRs=;
 b=iqd31wahy6q4oOtr3LfEm9vAQY7mPCKut7iUoQqHJJ304pwEJ7mPHfC8oFJXqDewXM
 KIqGYobutr3tg/ry8UTdSuc0rsaDautOL7FC7hUI8WNXx/qU1xGv1g6vAu7YJgwaUIYF
 olCrcq5Q+uAZgSn7SSKP5EYcHZbmVEdATz1CaAGHEv2lTSDL1uewqztRNlxS8AeSwEoR
 JgKWJXfq24OlG/pcr9sYrNmO9qR4gWpcbcGN9kawSIH/v5aFb528BRLYrY03Ok72xzPK
 rI88hYGpkuk9zWuTWtMcAPKCHBEOqIc+UJCnHlOZAPvJ3ojsonxT+hMCNUeCOnoVswp3
 tmog==
X-Gm-Message-State: AOAM531gxcebTlNfguObRRKgXC3IKyZAyDlwnsk93h5Hx6LlTDQZtWGW
 T2RcqhCl6T5mOC0IpG9PUQsYwMjuvKZidh31YeunWQ==
X-Google-Smtp-Source: ABdhPJybFZceRt4dT8AQ0A07ojtGZyNOuGQJ81eXjR+I+oeShos5q0uB3j62uLw/D28XjBH891o6E+ONKw9ot/Q+4W0=
X-Received: by 2002:a05:6512:3f13:: with SMTP id
 y19mr12407680lfa.444.1627296058376; 
 Mon, 26 Jul 2021 03:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210726102442.2119877-1-hsinyi@chromium.org>
In-Reply-To: <20210726102442.2119877-1-hsinyi@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Jul 2021 18:40:47 +0800
Message-ID: <CAGXv+5FtzyqnHm3sZGQDKPODwcvXafaRO88foBeYnP2Ad7i_4w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mt8173: elm: Use aliases to mmc nodes
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Eizan Miyamoto <eizan@chromium.org>,
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_034100_353968_BD97D04E 
X-CRM114-Status: GOOD (  18.81  )
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

Hi,

On Mon, Jul 26, 2021 at 6:25 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Use aliases to mmc nodes so the partition name for eMMC and SD card will
> be consistent across boots.

To be honest I think this deserves a bit more pretext:

There used to be no way to specify the order of MMC controllers, and
the numbering was based on how the implementations added the devices.
For Linux, this changed when asynchronous probing was enabled for most
drivers, resulting in mmc device numbers jumping around.

With commit 1796164fac7e ("dt-bindings: mmc: document alias support"),
a way to specify fixed index numbers was provided.


Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Same for the mt8183-kukui patch.


> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v1->v2: skip unused mmc2.
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index 21452c51a20a8..d5a2cad39c9c7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -10,6 +10,12 @@
>  #include "mt8173.dtsi"
>
>  / {
> +       aliases {
> +               mmc0 = &mmc0;
> +               mmc1 = &mmc1;
> +               mmc2 = &mmc3;
> +       };
> +
>         memory@40000000 {
>                 device_type = "memory";
>                 reg = <0 0x40000000 0 0x80000000>;
> --
> 2.32.0.432.gabb21c7263-goog
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
