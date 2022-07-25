Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8658FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 07:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7epkIx7Bo7OZyKYOv+XZev2GSnfQLkdGLGiZ0LxZ8c=; b=en0hO0fSEoq6hW6t050qL+35BN
	wCCJRfUfm29ytvoYom54FxLTpDlHPxXrZoEnSLGA2X2bu1DYDzqavz8VBPzlNwDtuIuE/d8D6NqlI
	jj1HAm3JaQV+6apeXY+4UifRTsOtyg13ZRPO9Zf29DSXH8Y9LM3dRmoErFIV+4dshmKemx6KUUnT5
	6Id5bxC81q8+Lk2Mz6Mvsmv8eywVyGC+uMszfyM0nTpkD8DCn/pdr+IV1TABPNyug4vro2mkwAN+Z
	s/nfLtS79rJtcvx4aBqLb7V5tN87FjuceUckm8Sjb4HSrHaXUbMtT1RifsIoP6G88ooz2ot1MTMwa
	zc+A/B+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFsVj-0066d7-Qq; Mon, 25 Jul 2022 07:28:15 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFsVZ-0066Sz-1H
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 07:28:06 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-31e7ca45091so100039427b3.3
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 00:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H7epkIx7Bo7OZyKYOv+XZev2GSnfQLkdGLGiZ0LxZ8c=;
        b=WLJPSC4TMjyg8I8soxTZ5c/HaieMRu0ilw/tYRRT3dW0234hNQCaBNsAMTmimcGDym
         gVcVywpiMWRY/hrWOgk+A1jqyaQK58ADdH6mp8Tdc8eGMhccWCQCpwhj7GoeV3boF7Ka
         8ZkuOxODo52fwq1YDMMA0VNVW2Wh//+YXV39E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H7epkIx7Bo7OZyKYOv+XZev2GSnfQLkdGLGiZ0LxZ8c=;
        b=t3CmUE30v6ggpHNcwMcpnw6yGFpOr9mpXatkpdOtDQEtLiLH+20WL/7t+6e06Cf9yQ
         NUxXebZVfuNkFHnqkv7WYKSbgkbVDapL/4vg0Zji9miJ/dstO5OCcDOorw2k7cwNhAeE
         uUSDWiV8kWXZWmz5dxaShD3L6+Tra1qwcIWJmOIq1SxSwdaXZGG2FHsz9C4+WVOxudhy
         4VPrWFk/i0yYpUZgTREY+kMLlnWGa+vSKXw3g13ixNTGIjpXwF5vDiAt1trFd7A0BLsU
         OrwnnNknKXGBc+Ypjw3sUFOVzSzWzbidnHmdEgcj+p07vXFOjU7hxiu9WpHgEzHCAh+R
         DuAw==
X-Gm-Message-State: AJIora9qtkirJoCVGDb2nAfiO6ilFhKD1OYxci/b5Ya9ND+iLXr9s1zC
	p4XXU+xgkSM7QxO/CYd7g4BuDZ7l938/Nn2leD7HPA==
X-Google-Smtp-Source: AGRyM1sofK+ZbAm2wHz6/PMlObpSJxFDTP5gSmhP92Rp/Kt616QZhHpvv/6xAWxzGOgw9UhR8Behll/ww824d2IHfE0=
X-Received: by 2002:a81:816:0:b0:31e:acde:8726 with SMTP id
 22-20020a810816000000b0031eacde8726mr8600976ywi.195.1658734083888; Mon, 25
 Jul 2022 00:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com> <20220721145017.918102-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220721145017.918102-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Jul 2022 15:27:53 +0800
Message-ID: <CAGXv+5E5+i3eG-04JAqN4wGmSd276FFE5KRDK5hUv+wK5vJT4Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] arm64: dts: mediatek: cherry: Enable Elantech
 eKTH3000 i2c trackpad
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_002805_096216_AC974EEB 
X-CRM114-Status: UNSURE (   7.28  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 21, 2022 at 10:52 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The Cherry platform uses an Elantech touchpad/trackpad: enable
> probing it at address 0x15 on I2C1.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

