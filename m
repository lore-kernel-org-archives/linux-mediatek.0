Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D432AC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 13:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEsDz8JqzcQxEyNloRUuUyODpBrbuLkFE7LQ8IcNZCU=; b=k3m1AXsOGGSAPH2L3kN7HQUGvg
	nsCCVVfboIVEnDKDbQQgdFay15DCGa2rqsYAXbqDWqmOF3HG7Jl6vMgln2dpZsEAlpQQalpeV8/H2
	GWG0NRz23YGGzPaLa+pa2Gu34oAUW+dRnd+iZ5tcxGnBWq4ceURIkRsCCIs+hJ2nB+/ExRQ0N1n1d
	zaOCCecHqZ1P7luNbLIYEv1DfJOpycUZsfaQWKJxYhTx5MsJEmLhx50QZidIFnwFjKTkwRxUtHyNP
	1nGaJD0mJvUjcQVYw2ffYetQaIMuf0zw7+IE6w2GcWKBVhaGGvpJrzxOhEnI+3VY0bE7rGyZ6Ms8X
	z0XJkRnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP1ra-008ffz-JN; Mon, 06 Feb 2023 13:48:54 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP1rX-008feg-Uj
	for linux-mediatek@lists.infradead.org; Mon, 06 Feb 2023 13:48:53 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5254e8994e8so110637237b3.6
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 05:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEsDz8JqzcQxEyNloRUuUyODpBrbuLkFE7LQ8IcNZCU=;
        b=xH87vXgsJaOnGsIGgW9wI+ScZ/GPFObVj+xGFamLZ5jV1vXYWO8tC70Ok2ER3C1KQw
         CUSmdFq+83JrTb47Bz82VjfD1xW3JrzQ+e798Lth3apiZoJy3m6ASKLCEDu0Eg6/D6m/
         yM/1P/hMcCBcZT+5HGd/etmh5fzruFzTO7CwwLHvqctdHDgFVecStviI9NLpCfar1GTz
         6dNUSnBJlYtV80KSre8ecSnkaV5Y4YWOTn8wOLTYeMQDUqOiwaE7lkcBfAjjlxfCpOjv
         k4+AJOjQPblFRsb03Yl4wcFdB6GfPm31x7LiWDOY8EVbXBL6HIzgOuA7QYKzRGM5fEif
         2Yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEsDz8JqzcQxEyNloRUuUyODpBrbuLkFE7LQ8IcNZCU=;
        b=C63sqfIBifQed/0sCmXamQhdjK6R2w5u0I3Dnu1scORlqBZGDrW3Xnl9yc3rKiDOjH
         G8RPSYynRw+MKlivD7Wqa4jP2p8x/Gxf4wMlw8QvTYYGx4M7mXR9AigVTyRGkvaPsjwA
         vQqQ3DLEVaBgfEE+2Lr4i6/QUEd072CuXAbvyxTzvq2Q3kn6mfC9AuD+xlebGeF1ebbt
         2UTKxfATLyIQaAVWIbKoQRqjSZrckw6zHr6Cd6ooO3nliPUa4YLD23UZUcl+nAqjlQd2
         dR8z5O0gI7/V+Ye/7mhIsNL0KXaFr00WqB70UePPoa6Ai210TkRshRKtmIRsNa/nOi7O
         ILRw==
X-Gm-Message-State: AO0yUKUaGQ6U0AeKPHQI60DqvLq/bDxkQjzJclyxJPX0yaXQo8nbhQFS
	viHMWFRrRJtplWEBI4UyLi1AFyJ/zyoykvDZ2aOrLw==
X-Google-Smtp-Source: AK7set844VkS58x6cC0fcxFQwqxyaYdgkpQak+2ac2FW7BseyHk4HLrq21ZpqMEdGgBUr0XOndfQEfyvp/6DduaZnYs=
X-Received: by 2002:a0d:e846:0:b0:52a:8896:6dc7 with SMTP id
 r67-20020a0de846000000b0052a88966dc7mr99301ywe.130.1675691330634; Mon, 06 Feb
 2023 05:48:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674693008.git.daniel@makrotopia.org>
In-Reply-To: <cover.1674693008.git.daniel@makrotopia.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Feb 2023 14:48:39 +0100
Message-ID: <CACRpkdbSyXqe7H43qd-Cx9qGbyW3uHZF_DpXVMKmnZGS7Bx4pg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] add pinctrl driver for MT7981 SoC
To: Daniel Golle <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Miles Chen <miles.chen@mediatek.com>, Edward-JW Yang <edward-jw.yang@mediatek.com>, 
	Johnson Wang <johnson.wang@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
	Sam Shih <sam.shih@mediatek.com>, Jianhui Zhao <zhaojh329@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_054852_005389_A8D9ADAF 
X-CRM114-Status: GOOD (  12.06  )
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

On Thu, Jan 26, 2023 at 1:34 AM Daniel Golle <daniel@makrotopia.org> wrote:

> The MediaTek MT7981 SoC is the smaller sibbling of the MT7986 SoC.
> While MT7986 is already fully supported in vanilla Linux, only few things
> are missing to support also MT7981.
>
> Add pinctrl driver including devicetree bindings for MediaTek MT7981
> which together with the added clock drivers[1] completes support for the
> most basic features of this SoC.

Bindings reviewed, the driver is vert straight-forward and slim, and
no further comments, so patches applied for v6.3.

Yours,
Linus Walleij

