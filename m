Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6952C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 14:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lR8vwo+56cG0SPA3Qj5+Z1q7TKFfKzx5+eBI3u/VDOI=; b=hh7vNRdsyCbRqEbx27PU6jyMjh
	s8psENsVI/NIDB+GqiM9R/FjQQAq9na7v+jf0fX6WNnKL1sHkeYRHe57Ui1yHG6VkwynhUX0iPBiz
	8VbNVLfiSZwaQTycD3Zsx9SJSm04g91VBe/G+kyodYaGkCgoHi6CqzI3vGHjbk8E1XaT9mAtx6k4y
	HSFSYYHhH/qE5Wng+P3sCMcURn1whC7UwL9dvYXRgwkQVtZyAvuyEmuJoof1BiMr9yfeRsgYp63gy
	xN/e3LBZiy4H0e90yCzYGLHG2sYyM5AGVstKrCMrMq7TZvilJVmu5u/pawLb1tTMIZVgMQ2Ov1rXx
	/6y/dSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbDS-0005Z8-7V; Thu, 03 Nov 2022 14:29:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbD5-0005Ol-3V; Thu, 03 Nov 2022 14:28:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 24DEE6602959;
	Thu,  3 Nov 2022 14:28:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667485725;
	bh=b8oSMj3yGGmLDr9TfZfA5XfxYOJnyYMiLdl3fi78Qd8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=djeisnEtlWVdAM4+wcw30lEKMXQ47/OtybhWyHJyjt805gbTvf80rxPhka6O510M+
	 yCXWtCduQ+6hKRGhs/ofI1XRTu2ZVOF5lPdUtwOW+kuHS9CS5d6MriXeAYTIW21sJT
	 D2a/FBw8kdoMCGoNvmUmMIW68VCX9ef0t+Pz+EexYVFCHBjmJv+tpwg/6LTe75XDB2
	 5nh3hgVXyx2euEA7vVedvRkIr3aVIWOHZU08CegpGfT/YzCYYtb6orMi5Q5VZZQJWF
	 456yqFncyxZeAwXB3iI71Tb4QDwYVVsLHhz8/fV4pndNYL19Rx4lpgpBc73sA4cQeN
	 nOrqHw4hpKLPQ==
Message-ID: <31098aba-ef89-d083-d8cd-3553d3cc8cde@collabora.com>
Date: Thu, 3 Nov 2022 15:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/mediatek: Fix return type of
 mtk_hdmi_bridge_mode_valid()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Kees Cook <keescook@chromium.org>, Sami Tolvanen <samitolvanen@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <20221102154712.540548-1-nathan@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221102154712.540548-1-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_072847_361237_A740EE53 
X-CRM114-Status: GOOD (  11.76  )
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

Il 02/11/22 16:47, Nathan Chancellor ha scritto:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
>    drivers/gpu/drm/mediatek/mtk_hdmi.c:1407:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' with an expression of type 'int (struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>            .mode_valid = mtk_hdmi_bridge_mode_valid,
>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 error generated.
> 
> ->mode_valid() in 'struct drm_bridge_funcs' expects a return type of
> 'enum drm_mode_status', not 'int'. Adjust the return type of
> mtk_hdmi_bridge_mode_valid() to match the prototype's to resolve the
> warning and CFI failure.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Reported-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


