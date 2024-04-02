Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597D5C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 10:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heR2AZ16RGjephYYk3nVkJQSU4kssIE/CVztHg4PbLw=; b=Xs4O6wI/7xX84boZTh8sDNEJAw
	9XIcM57pyX8JuB1I/Qi6z8AFd50We1R4SJZw0C+Rd+ljIgCYtl9YOlSz5l9yUs6tMoGKzyrUjO6tG
	CROeYt+gcriefSrsn8o1q100avtBeIlXOGxv4ys4CkkmdRnyCyI4QcXezCixM5lo0oedvWs/Dooor
	FciYkYMYWZ2GslZ/BYRolpePg2gfU0qL1JbzV0XbxcwkY34gHgzUIklC2ngKKGsP1AcTwgPkCm9EJ
	EYVGAILI/jfOiUpjp/367iD+q5z441xxA8NBW5+NmC21uF8CFlMBSUzCLpjjx9yuLsEGgvESojwqo
	DpifVjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrbqa-0000000AlTu-0Cqp;
	Tue, 02 Apr 2024 10:58:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrbqX-0000000AlQs-0chI
	for linux-mediatek@bombadil.infradead.org;
	Tue, 02 Apr 2024 10:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=heR2AZ16RGjephYYk3nVkJQSU4kssIE/CVztHg4PbLw=; b=l/WoCUEsNpqnBZQ8NxuqBBKJT8
	jBatWyz1z8f26H6ZvEsmwlQcJlOlIN6AEzTqpFuFsSIs2TcGSxW3a5j3iPxyeXxzFDaDQZc3kJ0I7
	Ow5os6LCQCJU0HrogDa6mqo3Xi1fQ/rLKqx2lloChoP/pr15jMUYIJxmvOTOkyCZSbqJ6nFyWPfcR
	POJNyUc6vpcGYi3760LQFz84T7hTCa6qVqoNBU99vywnF/m4w41tCfRrw4m+VopojJWXpZQx1Y9Y0
	fjXxg1iLba+nqJL/2Aj5PHeyR8/rFrY0yGdpIZCygxe0hSDWxP1MsJ77LGf6RBAtDTGtFVBvN1fHm
	m35xuXzw==;
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrbpv-00000003ZSp-39ks
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 10:57:56 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-61453963883so39600457b3.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Apr 2024 03:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712055466; x=1712660266; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=heR2AZ16RGjephYYk3nVkJQSU4kssIE/CVztHg4PbLw=;
        b=mXXhsJfaAwto454xs8OQj6J1x8qWT+13ojomR0g9g/HJ0Oa2C/zHxPxDluDQowOzBs
         tzNpxvMK00UsaG6pr5dJvj/p4OErFREQ/F1MTZoh5ld8wE+Uf6f7FZzPOcELBn68hxhG
         22kMWm7gHCbFwzYYooz02TLb/H3hPgqdqSxKptE39er+NBG8Xrb2OgJ7BCoFDHwGSttR
         e3QP3OokvQh+3Q/cJgEVrimVwLM/L7zEx0EIe5lRql/qoUM0UB1Yjtwh6WqOH7Sa/NCx
         +mTN3zgElpStwK0pTM+WtQTOIxpJg6jgW9o9y8KW0V9wKVaA6MD0Fo7deY1C/YCag899
         Dxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712055466; x=1712660266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heR2AZ16RGjephYYk3nVkJQSU4kssIE/CVztHg4PbLw=;
        b=PXSDjnnoHw6Um9LRn31pTYVF+QtIvZEXGIPIuJYGb/G+lSxv3yLudUk+ta8rpf9qRL
         IRlgjzdedGoS6lC89OPVQKhVatHM51dUVCAdBS1hRk3AxQLjFL6PL9csaYMOCLr3hGeT
         k+HkYW74a+HkIIgEXxiQvIZZ0IlR1kuwd34upK4vB3NlQmdsMf1nT2lGgNDu17ldgC9q
         GhTJGJRV9LEfvonvjoouJ41ckrh9J+cajP7BGlilD0huIOK+++bvF40KrxNKeavKoTPa
         pCYE/bHh16KxLXtHWVakMl2Z7hMZDQ6tP7/l7vEEY0eqtyjVOIhzGYp7iDVbbGyAcCcU
         PIrA==
X-Forwarded-Encrypted: i=1; AJvYcCVFWT8vjyDsmnreQAiGpyycW1arMCOOdMXCVBl2iKcWPZ+kZqJGbvvp7/b8/PcOyGYTOUziO4YpYHMVts1BifbKYgXE47ZE1Lz/RuLQKN86nt23
X-Gm-Message-State: AOJu0YwvvOsAfoQCr1LUrA2si4ybH6AMjjb1+MtyG9jaC3quhjoFzizJ
	5Mxlu8ZKGfWMT8Q7dxRiwb4rpue9m4WJc6GWo4uJJpteKeWzeZZMsGd/4rEHAEz/m9++xUfctkk
	xHCjitZWS5E1ra3xkFGkoWxIfZ4jyvVLaA9qRCA==
X-Google-Smtp-Source: AGHT+IG0hl043sikYSStWfJMtXPIZPLFFTefeWAq9LsJotUVsTuh5FFEl/udwTnzeyfi+7Th8cC2dNNikPb4b1WN2ok=
X-Received: by 2002:a81:5d45:0:b0:608:e133:7ece with SMTP id
 r66-20020a815d45000000b00608e1337ecemr11694233ywb.36.1712055465511; Tue, 02
 Apr 2024 03:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
In-Reply-To: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Apr 2024 12:57:09 +0200
Message-ID: <CAPDyKFqct4ZV3UbTzWKO08MzDTm_BX6K02kefV26mEain0SXqA@mail.gmail.com>
Subject: Re: [PATCH 0/7] mmc/wifi/bluetooth: store owner from modules with sdio_register_driver()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Arend van Spriel <arend.vanspriel@broadcom.com>, 
	Brian Norris <briannorris@chromium.org>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_115754_552640_84D16159 
X-CRM114-Status: GOOD (  14.88  )
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

On Fri, 29 Mar 2024 at 18:24, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Merging
> =======
> All further patches depend on the first patch.  Everything could go via
> one tree, e.g. MMC, or the cleanup patches removing owner would wait a
> cycle.

Patch 1 applied for next, thanks!

I can certainly pick the remaining in the series through my mmc tree,
but waiting a bit to queue them up to allow some more acks to be
received.

Kind regards
Uffe


>
> Description
> ===========
> Modules registering driver with sdio_register_driver() might
> forget to set .owner field.
>
> Solve the problem by moving this task away from the drivers to the core
> code, just like we did for platform_driver in commit 9447057eaff8
> ("platform_device: use a macro instead of platform_driver_register").
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (7):
>       mmc: sdio: store owner from modules with sdio_register_driver()
>       bluetooth: btmrvl_sdio: drop driver owner initialization
>       bluetooth: btmtksdio: drop driver owner initialization
>       wifi: ath10k: sdio: drop driver owner initialization
>       wifi: brcm80211: drop driver owner initialization
>       wifi: marvell: mwifiex: drop driver owner initialization
>       wifi: silabs: wfx: drop driver owner initialization
>
>  drivers/bluetooth/btmrvl_sdio.c                           | 1 -
>  drivers/bluetooth/btmtksdio.c                             | 1 -
>  drivers/mmc/core/sdio_bus.c                               | 9 ++++++---
>  drivers/net/wireless/ath/ath10k/sdio.c                    | 1 -
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 1 -
>  drivers/net/wireless/marvell/mwifiex/sdio.c               | 1 -
>  drivers/net/wireless/silabs/wfx/bus_sdio.c                | 1 -
>  include/linux/mmc/sdio_func.h                             | 5 ++++-
>  8 files changed, 10 insertions(+), 10 deletions(-)
> ---
> base-commit: 087c142b2b04898c897aa77938d05a93907150e5
> change-id: 20240329-module-owner-sdio-abd5de3f1d74
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>

