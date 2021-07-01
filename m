Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E42C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 07:00:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E91B461490
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 07:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E91B461490
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUqDcKS66CTJgzVq8IJFskYO9WYA9Tljm7A7hYr8SAU=; b=tzNcj8NF3kZjDN
	xxNMmw7XCM0D1aNUZF1eeYrl67CV+JHNhOaEswAOVTDXWmOIGXgJN8WiFX/Hv6Sodm23geBveU9tI
	MAnSIiM921Cq0/5dXOeqlZ3Ll63h7BvXYEs/e+5X/Jg2QMGfKXl2POdx47RakJLGUWfojmfPk7hzh
	8K8/hDVcBaACEVekmp5skVAHn0tNCQD2v7sYm8adjZzg0M0a3hLMcmJMjABhjModlLHLM86fpp1vW
	wor7uT1QxFffFVtRNCLxPjnOpfmfUn2chKtgFI0uJ7bnXmIYL6cXCFSdNtvxHDvxynnMmulelm7Fa
	ci5baPbn9+l1qGf+nczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyqg1-00GJWR-CH; Thu, 01 Jul 2021 06:59:57 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyqfy-00GJUu-1v
 for linux-mediatek@lists.infradead.org; Thu, 01 Jul 2021 06:59:55 +0000
Received: by mail-io1-xd33.google.com with SMTP id f21so6234117ioh.13
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Jun 2021 23:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6WT0ggnc6y+zkQZpmAfY5vcqw6YGgCRdcKPkikOc0Nw=;
 b=JJDyWO50TjD2JKx8VvF5pj14yk3j1SIQkpONmRgMEcD0EJGWVUrmG2gmr8IKqEaK77
 HctyKwx9tJK6K+lShpZfc0rFQfwWxrbKyEa0Ljd1itQdHqZFoTvp7/kg4mWRCs2Xy3+7
 h7sYv7+E2AOnPRJPoEuk7AdQcp6OVlDVnTpf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6WT0ggnc6y+zkQZpmAfY5vcqw6YGgCRdcKPkikOc0Nw=;
 b=ofdG/gxnReRgFwqXniRDzgRFLd4Vn8O1GwLYrKvAzS7zrY3Bm/KnE10KdqgGKrCvID
 o8/8crbXyN6qIw3elfpeC9zV+f7bhs80zM9+G6h51UFjbTu4VqhnBMu8P2lHbsSofXrO
 VTP2KlDwIeB6KOoWVKZPJC477/pYVq5a/4RxzVr1tfoQB7Xk5NmecdUdQhiSkQkXwS42
 CRRRzmqn1Dj7C1JoRdffrYf1yrlmtbqke0XitH7ka0PzkFC99qdNZLdeGHL02ZQxx3qO
 XWRCXQNaG0Fz6NoDaWsAhshP6wugc0jBzkX8yNQS5jUFgDqUEJ7pPZPLdIK3pxMCjtSw
 JRDw==
X-Gm-Message-State: AOAM532ILhc7t4tsRFSBsVzJUeizcHjXhw8TVUeAxiwbfYo6jvwyG4pU
 nra+Ob5vLOapdooskA7tRA9l0x+y3PmPylpyamzCGA==
X-Google-Smtp-Source: ABdhPJzHGyqZefwsLiquuhbKyd8kroyqF4uiqAGrTewcKDSPvfkci20FHon3xrv4G+J8c6C5Ms+h7k4fzdXVCt8vD/8=
X-Received: by 2002:a05:6602:1c4:: with SMTP id
 w4mr10899930iot.44.1625122793122; 
 Wed, 30 Jun 2021 23:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210630073311.2177374-1-hsinyi@chromium.org>
In-Reply-To: <20210630073311.2177374-1-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 1 Jul 2021 14:59:27 +0800
Message-ID: <CAJMQK-gPeepDhNVc0S1Z_FxyDgiSuZZ4We6k8oWbQ_BbLJZxsw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mt8183: kukui: use generic pin configs for
 i2c pins
To: Matthias Brugger <matthias.bgg@gmail.com>, zhiyong.tao@mediatek.com
Cc: Rob Herring <robh+dt@kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_235954_167090_43182D88 
X-CRM114-Status: GOOD (  16.26  )
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

On Wed, Jun 30, 2021 at 3:33 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> mt8183 i2c pins don't support PUPD register, so change to use generic
> pin configs instead of let it fail and fallback.

Though PUPD can be skipped, if we set bias-pull-up, we may miss the r0
r1 set in mtk_pinconf_adv_pull_set().
Sent another fix to replace this patch here:
https://patchwork.kernel.org/project/linux-mediatek/patch/20210701065439.2527790-1-hsinyi@chromium.org/

>
> Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index ae549d55a94fc..69dc04c3f7fff 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -426,7 +426,7 @@ i2c0_pins: i2c0 {
>                 pins_bus {
>                         pinmux = <PINMUX_GPIO82__FUNC_SDA0>,
>                                  <PINMUX_GPIO83__FUNC_SCL0>;
> -                       mediatek,pull-up-adv = <3>;
> +                       bias-pull-up;
>                         mediatek,drive-strength-adv = <00>;
>                 };
>         };
> @@ -435,7 +435,7 @@ i2c1_pins: i2c1 {
>                 pins_bus {
>                         pinmux = <PINMUX_GPIO81__FUNC_SDA1>,
>                                  <PINMUX_GPIO84__FUNC_SCL1>;
> -                       mediatek,pull-up-adv = <3>;
> +                       bias-pull-up;
>                         mediatek,drive-strength-adv = <00>;
>                 };
>         };
> @@ -453,7 +453,7 @@ i2c3_pins: i2c3 {
>                 pins_bus {
>                         pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
>                                  <PINMUX_GPIO51__FUNC_SDA3>;
> -                       mediatek,pull-up-adv = <3>;
> +                       bias-pull-up;
>                         mediatek,drive-strength-adv = <00>;
>                 };
>         };
> @@ -471,7 +471,7 @@ i2c5_pins: i2c5 {
>                 pins_bus {
>                         pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
>                                  <PINMUX_GPIO49__FUNC_SDA5>;
> -                       mediatek,pull-up-adv = <3>;
> +                       bias-pull-up;
>                         mediatek,drive-strength-adv = <00>;
>                 };
>         };
> --
> 2.32.0.93.g670b81a890-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
