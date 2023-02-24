Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD21C61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/7IE3JWHJRTNTnzdoavFidJ6LPEaM9q4fZmYFGLA1Q=; b=4VtPP0ztfBMgdIFS6a8YoHTBkv
	L1QMgM/VQJQGMrBcZpyl6Lz5JCJ8AmBgmUkq+ZnPs1+UUUA1NTxH7vAmJtoq6z3HpKmqbanG7FtEg
	Q6E/+DIPf6/ALTWUiL2JrHGY5Dtfk+u0E5dCCubAgBgGdyhFcOymt3E1qFi1CjOzJVh8Le0JkYDzU
	SRyqosnDJCg2OLb5dkp5GFiAagpv4C5obiAw73H1J0zvwNZD/wL1pLq2kEdpRmOCuD9P6Q4eUhciM
	BCTh5br5ZyPqH1WqyWQGSFko1gYIG6vLgtKILSXk38iqOM1NBHu/1vK/cURqZQmePkX2M20w8vi6W
	uWu1J3Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV44-001vJy-Fv; Fri, 24 Feb 2023 10:12:32 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV0h-001tYt-W3
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:09:05 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id j14so20817659vse.3
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K/7IE3JWHJRTNTnzdoavFidJ6LPEaM9q4fZmYFGLA1Q=;
        b=DuSvUG9OycXrW6z26E5ntJAC8P8Z21ffrQQ0zKldE29yAbLukcTLMCOsd6/Y26MnPR
         3GYz1sfaAjSIQLylvfFxGJHQNWEV4LgX5DU6LGkI+rtH3I3Z8d6jtb/ap6AWzM4viiWv
         8WEUFbO14adJhjvJF/ctsGWNloY4St5A5SwoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/7IE3JWHJRTNTnzdoavFidJ6LPEaM9q4fZmYFGLA1Q=;
        b=cO9NLrABcgBoZWi0viLJSKDJWJ4fOtIIFO4TaDT2DwjU4zW4ubTDEO0RZidnUuKC0v
         QFGDbFgy1Asp3VHBT8UTIyqMmuzuHkMq6bil1fJIn3rTvlymvIEOdhwPlbAum0TQkYSc
         bGvUwcdDhc/h1MtGreghI3h5jXe+jFBQ3bBMwXfxApqs7TwbZgvsRfmYfJMTVoY4Q+46
         hd1RCo0hurN2//NTijMjWKCmxwVSYsYmQO3n4TIkAhi02cskN7h/yTtOfQ6fAhtPXXwi
         9eBf9m+6/JpmHEd/ERdOd9YkvzOn9AlqyifJpGAJlBsz/KcY4jdtsS9iFbHLJT8q/JOW
         Og+A==
X-Gm-Message-State: AO0yUKXvkO7zdIblFxEvEuwbKSNsEPKF/yJGBIBoYSYrQU9pOiPnJcMC
	J0SxU0chq7iOCU5jaUdKqQG8FHR2U1XScMUE+T2WkA==
X-Google-Smtp-Source: AK7set/RvpYiZdz2LIP4LHIvV09xgbjakyZphGlBWRIs/ctqNr1a9OJ7MquZUocfHsTdE0KvpE3jj3Ssiny0LCbsUw4=
X-Received: by 2002:a67:ec11:0:b0:411:c62b:6bf0 with SMTP id
 d17-20020a67ec11000000b00411c62b6bf0mr2076104vso.3.1677233343067; Fri, 24 Feb
 2023 02:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com> <20230223133440.80941-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:08:52 +0800
Message-ID: <CAGXv+5FK8BjSgwS5276FJj4zG_3STMbQwQWdyn3LjOvQ=108RQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] dt-bindings: gpu: mali-bifrost: Split out
 MediaTek power-domains variation
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_020904_065226_63671806 
X-CRM114-Status: GOOD (  11.40  )
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

On Thu, Feb 23, 2023 at 9:34 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for adding new bindings for new MediaTek SoCs, split out
> the power-domain-names and power-domainsvariation from the `else` in
> the current mediatek,mt8183-mali conditional.
>
> The sram-supply part is left in place to be disallowed for anything
> that is not compatible with "mediatek,mt8183-mali" as this regulator
> is MediaTek-specific and it is, and will ever be, used only for this
> specific string due to the addition of the mediatek-regulator-coupler
> driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

