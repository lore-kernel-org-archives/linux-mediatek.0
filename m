Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8D2EB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AMLUs9zdYkz13PYZ3sZgfaLBUzB3BRb9jZF/zG6Gy4=; b=BGIRJysCfaQbSPxt3jggbgOMLq
	yFsY73G8HKWPCpfB8QlyX3471ifHGsxloXTVEmN8M4J9Hb+GL44Eb8exwPL6vODgHhpKpY3ReEcXm
	dxG5LsaJYaAxq7NzXosyB2bfRZjbKY73/ldmZEOgkQMNGCgVF5r5wyF/j0EbfLZwcHPIIwss5rEhq
	G9Admu0ISEdGoTcylpPcKdC+XViAIAaG0FuLQNAcST8tQPaVsSQ7pdYASF2/6oQLpJFuHptn26Xr/
	F4Y8lCt3EiXToVe3UTOa4YXztipz/3lOouyM3dHjQIk2dLnKQj7CHuoIOYh8E88rPGrkxeUVbT+ZU
	S9gtbVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgLx-00DQnN-2Y;
	Tue, 04 Jul 2023 13:46:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgLv-00DQlm-1C
	for linux-mediatek@bombadil.infradead.org;
	Tue, 04 Jul 2023 13:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4AMLUs9zdYkz13PYZ3sZgfaLBUzB3BRb9jZF/zG6Gy4=; b=bNy3VJYMfsNq5ez6D1DhJIiLMh
	sbKckJKqJzTQ941GhzAFIecDc7iOzyp3HyLyMRJOexRPpS415u6bXbaRV3oumYWY+/Oy0O8NdOmwM
	S9U0PCY+GFY2MrD9qie6F/Jr+dW6snjuvXiP7teoODBw7x19op3qIA7sdpYTppgDiZrWYvzDyNHBr
	skRyMnsi5nAsbkLfdQmPf7hB1TVfveJcOyGWYwu42P/zaYp0BCS2hIHI/17u2iNZjBL/aoPToHjJn
	6Fh1XExnU32mtb5C8w/CjnMxuehLfAwfvo8fqCgHphJVwFK5BLwq5jXF0R2CvrHHxEKlHggzpBQXy
	4Y9rgEfA==;
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgLr-00Aw7w-2l
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jul 2023 13:45:57 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-c5c03379a76so1016968276.1
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jul 2023 06:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688478351; x=1691070351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4AMLUs9zdYkz13PYZ3sZgfaLBUzB3BRb9jZF/zG6Gy4=;
        b=f//c71F+CiiJ0nQYLNnQXUSbAHrEMuUk0nw1wwalcqczyC4cibu2CBc5Bqq1RtJtEK
         FXsYoEaQ7ltPESn8l7IvqYRBWfzWOkclLdWaPGFVrKHk+5accVNfp1ogMQeHL57mySgK
         7REX07YJruKKEqpeJ1dFpEAhuIMJL793hsMehXu3dJIkAXpGsq2VMuqxiKntG4+N+dhi
         m1YwWB8Dp0tYJs5Z1Epaw+dcPiE1gnPCw1dfO9E/U1X/Fe4jvfwhFUGRUdFPE5QKYlk+
         j3l5fF84hhm/UUWt+erN34P6+c7IDsRD/GAzIQeE+5mP6ziVCt7nHB6EakqfCgM6laVa
         8abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688478351; x=1691070351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AMLUs9zdYkz13PYZ3sZgfaLBUzB3BRb9jZF/zG6Gy4=;
        b=T474F8ut7KWGIXEUhE25ZGO50+OxaBqC4MruaE4l3vl6RBjO3R+JbRBw4VR1eUCuoQ
         UeCWsAFqfnNezd9DQ881VNo5JuPy0QiIqe+mTL/RS/DznAzb5DA3iUW2HiqObydzm5HC
         Rfk61571BBP+57ChxVq9ahLj3MRzXsVNZ5l4zNeKsb51XgMt6P9T1Pr4MYSe3PXUzF/s
         0mSSmKZ75Bk9PwQg1zCFHZ/Ir51mN75ztWyeqGl+3AolsBe8Xl1XPjLzNVXhgnZqYTaS
         0iR/iOEJse3YMqWRF68ueWc4uXOxMlgQxyuEl/DdiOZ/R7Du+oKV7U1s5fJ9/a/es7Yr
         MenQ==
X-Gm-Message-State: ABy/qLYM3nibPlx7Ov3VlxComrQtBbQ+hmiFxos9cwwjIU46FVT8vsK2
	v41NYP1I6BLEzb40A3RfXefzLthBgZbRsnXRanQAdw==
X-Google-Smtp-Source: APBJJlEleHWeClZf2D74mZ0WM0CjCPjrraHn2hhQsLjcjs+MPeKaQJowGKx5dWhdHhQ6pcRJZwraIGBorgd0saV7QNw=
X-Received: by 2002:a25:c5c3:0:b0:bc1:dfa5:83a4 with SMTP id
 v186-20020a25c5c3000000b00bc1dfa583a4mr11215700ybe.13.1688478351717; Tue, 04
 Jul 2023 06:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 16:45:40 +0300
Message-ID: <CAA8EJppVOc0_e_o3CX_U9BvDWFKaz2-0FSZsXt11kDg5SXBn5A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: cleanup DTS example whitespaces
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Leo Yan <leo.yan@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_144556_133843_DD7EEFD9 
X-CRM114-Status: GOOD (  10.21  )
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

On Sun, 2 Jul 2023 at 21:23, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The DTS code coding style expects spaces around '=' sign.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Rob,
>
> Maybe this could go via your tree? Rebased on your for-next:
> v6.4-rc2-45-gf0ac35049606
> ---
>  .../bindings/arm/arm,coresight-cti.yaml        | 18 +++++++++---------
>  .../bindings/arm/keystone/ti,sci.yaml          |  8 ++++----
>  .../devicetree/bindings/display/msm/gmu.yaml   |  2 +-

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #display/msm

>  .../display/panel/samsung,s6e8aa0.yaml         |  2 +-
>  .../display/rockchip/rockchip-vop.yaml         |  4 ++--
>  .../bindings/iio/adc/ti,adc108s102.yaml        |  2 +-
>  .../bindings/media/renesas,rzg2l-cru.yaml      |  4 ++--
>  .../devicetree/bindings/media/renesas,vin.yaml |  4 ++--
>  .../devicetree/bindings/mtd/mtd-physmap.yaml   |  2 +-
>  .../bindings/net/mediatek-dwmac.yaml           |  2 +-
>  .../bindings/perf/amlogic,g12-ddr-pmu.yaml     |  4 ++--
>  .../bindings/phy/mediatek,dsi-phy.yaml         |  2 +-
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml    |  2 +-
>  .../devicetree/bindings/usb/mediatek,mtu3.yaml |  2 +-
>  .../devicetree/bindings/usb/ti,am62-usb.yaml   |  2 +-
>  15 files changed, 30 insertions(+), 30 deletions(-)


-- 
With best wishes
Dmitry

