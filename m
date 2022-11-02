Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08863C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 19:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EDI3vYbHaaiAQeZuuGzJ5Pv1WpOR32gAtsS0QDWLuw=; b=q6tYIFspbUoi/l/fsRrjf9GOHi
	WKReGVIvSm/iVN2+hB3sBb7EhlqDJq6Ji1/dpibSk8NT/luhTonKsGU7dCNf2A2YgR4dO1mnxuURf
	l2qK3vKkOuufapXR4ovb8uVjEvdMzFe5wbGNIqfCkZD0aL6/Za+oWh8ctAr6Y89iBLmy8YcW8UV6T
	pO96kQ1mUtjzIwA1z4ZzVYveMWgYLUt0FcQOqdRjoPrwHkqy3AP+V1eixUy0iMPBF4uzUJobtZRxD
	YJpo8m95QaBmqXPBGmhwYypU8NHgaB/qX8GLMXtwdyUiRIMSS2i0TFSQINLIVLh0wyM/SthSlmc4+
	Hf0T0HYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqJJw-00Di4Y-Bd; Wed, 02 Nov 2022 19:22:40 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqJJW-00Dhcg-9j
	for linux-mediatek@lists.infradead.org; Wed, 02 Nov 2022 19:22:16 +0000
Received: by mail-pf1-x42a.google.com with SMTP id b185so17280107pfb.9
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Nov 2022 12:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4EDI3vYbHaaiAQeZuuGzJ5Pv1WpOR32gAtsS0QDWLuw=;
        b=cf2nTr5YnckoTzWzbGWmtwmcSXrd8AamU45cN4BkmLr5woysN2W1kdbIKrPwII4PVI
         ce8I7YTY4uSDnL6ZPBTz94gxiF8GCs7pA974P296j4z8qCIMA1+np81HnE/zTRa6yv+M
         k3Z8gi82o4u4QsaXVn9ASZodldSA4+ubXIZL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EDI3vYbHaaiAQeZuuGzJ5Pv1WpOR32gAtsS0QDWLuw=;
        b=GLlPCy2K4ZeHiWu2mwm61wzx3B7EvhSfzN16wRuKexVHbAG1bzBrF3Ai41vYAox/H2
         n5kJ9zqNdmBBTpxDVjAN8e/GcLRQOonBUSwDkv/PKjlrHe4MId4ZLGB5LLZRoYZ4nPJV
         SjwHcC+cA/HTp0reMvZE1jfVN/iDwgL17eG091HPXTZjksnRiOuJSGvgyk8AfnSal+ZP
         8iiWAwxPbo0NN2+kdLDCee6Xh5vt9ejodQsTDgBmDsuoCBkp7r1HzGen3Z2/ynH37gz7
         g6dR+kI3Ic1hLMnNDcDNpSItN6jnc7hJsCoYOI50WSifNgI3Ahwmb+vMdlT1BNaR9vce
         J/+A==
X-Gm-Message-State: ACrzQf0UJNgHIdEEEarA9ycsuWivDrBrYd1lvyBEw7RtaOl1FjaSxuzi
	RY7wABbd5t8k9TJxixn1Shk1ZQ==
X-Google-Smtp-Source: AMsMyM6VtLTeGYSXsL6Ro3gC8gkszOK2+Cjl0KViNXychOWaLiDIqn26ITH/JYsmSRn3aX4X3qwIeQ==
X-Received: by 2002:a05:6a00:1391:b0:56d:2b6f:57b3 with SMTP id t17-20020a056a00139100b0056d2b6f57b3mr23293181pfg.56.1667416932256;
        Wed, 02 Nov 2022 12:22:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 85-20020a621658000000b005609d3d3008sm9054723pfw.171.2022.11.02.12.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 12:22:11 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:22:11 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Sami Tolvanen <samitolvanen@google.com>,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [PATCH] drm/mediatek: Fix return type of
 mtk_hdmi_bridge_mode_valid()
Message-ID: <202211021222.1E8A8BCB43@keescook>
References: <20221102154712.540548-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102154712.540548-1-nathan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_122214_372352_8EC19CEB 
X-CRM114-Status: GOOD (  14.03  )
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

On Wed, Nov 02, 2022 at 08:47:12AM -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
>   drivers/gpu/drm/mediatek/mtk_hdmi.c:1407:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' with an expression of type 'int (struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>           .mode_valid = mtk_hdmi_bridge_mode_valid,
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
> 
> ->mode_valid() in 'struct drm_bridge_funcs' expects a return type of
> 'enum drm_mode_status', not 'int'. Adjust the return type of
> mtk_hdmi_bridge_mode_valid() to match the prototype's to resolve the
> warning and CFI failure.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Reported-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

