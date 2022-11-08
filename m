Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB99DC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyyODRHXtilG30dzd65m7MqoIR0cCDBRC2Fx24RI5us=; b=KU0uwwH5dJ5O58+yHnDLt9La5C
	/rpi1+FXC9fjlJhfCo+xp1E33wwGiyJdLP10AALk6N0DRhgmaTcwH+o2VTEZw7LKVWpSndQHqrrNI
	zLSt3fIc1cOTWBfbAMS0DVb/c9kdDvhvGNCVICMWOsHFe9r/wxxS2XLHaCwdCaAZul9taxrtK9Rdt
	Lt5mN0Mqr2iAG30f3J9XRNded72OhcUpsBVITM0imofTYR0SSik+MEyJ/hKshbhWbyw2r8GR99JrQ
	MqF+jMrIHmumG1A3t/ZwbSfqE1jBF4OYbyM/UAr5L9m8Ll42a5eqoyuzQLKD35VMhC/e4ArGIoMpG
	41UdPoUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNhN-005DQg-66; Tue, 08 Nov 2022 12:27:25 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNgh-005D9D-PW
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 12:26:45 +0000
Received: by mail-ej1-x630.google.com with SMTP id 13so38226553ejn.3
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 04:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tyyODRHXtilG30dzd65m7MqoIR0cCDBRC2Fx24RI5us=;
        b=NwqsXVnBhJboZ5eY8Xcr2QcAQU3A73tG4C/C3p5ehSjxJZ4ThJ57K0n0cIX/tv2Ybk
         e/aZXkZsV/52EeZ3Le1b63V7g/eNCwIkd0TE/TLJWWeahFa03vuMnSydXOenjn2O+r26
         2b/+7v45FlbfjgjFEiKAW+5AGPVmIMb+x2naOXmRQRPBYZAOl0H/J1XwncIGM27oUW7h
         hwdUK4R8iXXnUYFHq2CJ0iS+KSgnH7rgwtSsFICV9x+QW4KvtpbstlLVmnp8jZn3Hx9j
         iqUALcQYxf7JGjd41US5zsmlUnqFpgwe4nBqHKXNNqmk2K57ezo4Pl9D8wU9l/HVgEGF
         A9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyyODRHXtilG30dzd65m7MqoIR0cCDBRC2Fx24RI5us=;
        b=YspBGyzOfzWgPhEKwiVMfTq4NkmK/B7YuKNfjzUIPYoTlXx7C3mZjTkm9T89jLJuKK
         HbeIt0+9NJjwcs+c2E2SGtzvlH5aV6lX3hlM2q7QQapHvQ0PAZ41fpH2k7PLmvXQKfPz
         hs5mHrNzFXawrU1palMPQSmq+qSh+1UeN4yV1n1eFaXAaASB9LLPAMsxgksQmYar/88l
         fyQGgT/B2PfVLfjSDrDFsOdTULzIIUmB8m46tyvZz/0MZbDKfD9ms5EeHL+pVGIWDIKY
         SSC4mZ6dCxYJmjBVEJVnNUaOfqsHHPNcKKEpdFvZ3U0zFYblq29zRaH464w4Blkfq/fT
         2Yug==
X-Gm-Message-State: ANoB5pnw7FJo47G7K1t82HXDN3WwmVHPuPI1wefKRwBTi0xuv1jEhc+9
	F1CWd6XT6d0XnCU2RLFzEAVc3TZFpfiklIuziHhIZQ==
X-Google-Smtp-Source: AA0mqf7/Kq3Eo4YzTUVxcP/fg8+u1hyvRb5r0lVcTK6pr5Bewd4oHaTol2L4r9Xfdxk26RfW13/NiikTqCw5vcoldf8=
X-Received: by 2002:a17:906:6acc:b0:7ae:658c:ee45 with SMTP id
 q12-20020a1709066acc00b007ae658cee45mr10932109ejs.190.1667910399610; Tue, 08
 Nov 2022 04:26:39 -0800 (PST)
MIME-Version: 1.0
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
In-Reply-To: <20221028153505.23741-1-y.oudjana@protonmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 13:26:28 +0100
Message-ID: <CACRpkdb6FFCtry+93jnXw0f8jeu7yDR7_S2GOKaGYiEGSGc27A@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] MediaTek pinctrl DT binding cleanup and MT6735
 pinctrl support
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	Andy Teng <andy.teng@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_042643_890658_82AB9B94 
X-CRM114-Status: GOOD (  15.77  )
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

Hi Yassine,

On Fri, Oct 28, 2022 at 5:35 PM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:

> This series adds a driver for the pin controller found on the MediaTek MT6735
> and MT6735M SoCs. The two differ in the last 6 physical pins, which are used
> for MSDC2 on MT6735 but don't exist on MT6735M (since MSDC2 doesn't exist on it
> to begin with). In preparation to document DT bindings for this pin controller,
> the existing documents for MT67xx SoCs are combined into one in order to
> eliminate duplicate property definitions and standardize pin configuration node
> names. Necessary cleanup is done along the way.
>
> Changes since v3:
>  - Improve interrupts description to make clear what sysirq means.
>  - Set drive-strength constraints per variant.
>  - Set maxItems for reg in MT6795.
>  - Add blank lines between conditionals.
>  - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
>  - Make pinctrl subnode-related changes in separate patch.
>  - Fix up some pinctrl subnode property descriptions.
>  - Add interrupts items descriptions to MT6765 and MT6735.

I have applied patches 1-6 so you do not need to resend those.
Keep it going with the rest!

Yours,
Linus Walleij

