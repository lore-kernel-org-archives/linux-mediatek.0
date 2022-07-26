Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA45C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 08:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eR2bajGRP/sgNFoTl95SKN8UfWncJyTcpIwCg8mZac=; b=wZn6hJywzL4DZcIwK5IaZ14K7d
	6LRnLfwa/9q5nj80Qhk8M+o/wfOFLgyu5NpqhE2rC+iUPHNlzjNVisBLkDQS0CBxJT/IM2ztyHkYA
	9y3fHNYsj377+pPlKS24RNMSaRwt9rkG54N8TG0Wc6dfROaWdii/QGWTxqnqLzlSEwmKPouMCUhPD
	UtaKM6qYcstQs2ZysUf3gXKz+0veKPczZXNVwy8tt7lhv42vQSVK4pDtUo/9IkiclvC25TZi8+Hyx
	5cpzBQWL6DxTlX81A3JLsjzGiT/AeI8olQs1pyi6jJDDQZWU2Xa19xZnc+pSmXzsO+0ckNbjNEeyC
	FPeUJzjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFsR-00A8MD-QR; Tue, 26 Jul 2022 08:25:15 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFs2-00A82w-CL
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 08:24:51 +0000
Received: by mail-ed1-x52f.google.com with SMTP id z22so16831628edd.6
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 01:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2eR2bajGRP/sgNFoTl95SKN8UfWncJyTcpIwCg8mZac=;
        b=oOPs8L9PuW7OKOkDNzZYO1z+kaxW19SG4MupZMavHPwr6wEwC5Pkc+a3zCWnbp37gB
         Q/XMOdE8bkMm20N5pufa1A7ii53GVMD+uoA6jY0MaPs/Mz3pXGymLuyqhabVcfCBVdNG
         FZKT+MEl5xFBxseEjwndE1xYUEu+A4yYJMxdrijrGgYMrqOgTib+1V3AwKxFYa0Q1Yv3
         lsKS/G21RNxtTJ160BPYSlnp7cgPcAMUXrSkZQHkwV5knNUojtbyLS9Lm//Lys8qBwvo
         MvYj4n8+5MWt1T59klH/XTflGtix7ZAMhi5ycY1UPpY2nrYkEFLEkCvdxZrYePspDuGY
         4aDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2eR2bajGRP/sgNFoTl95SKN8UfWncJyTcpIwCg8mZac=;
        b=roEnNxc8V8OiONYiYJ+ovuPp6qNcIVwi8L1QErLrcwBb1x2HQoaa4uOPVlMbYENv54
         fUZefjmHBTDT6kuyP2zjebEJQaEOSBGZaz/xW9yg98qvErIHvb8PsVxex+iMDHVi9GEM
         Y7cjPBQLisJguTiFZ2t2gSksWaIMFeG2qm8yE4IyQPaYsFnv95xQxoyIAhKxIWdSXOC6
         Y910YrNyPqDy2xCMq96B7LeNDJ0mzRcrYyU5IWY7C7jxDOZ4l++chwkXB9pQOOAhoGr5
         R9lbojZ4iNVv78ArNFZ2LXz/jPHI3hQnpEua1lYP5JQeZ0y6etPNMqfcVA///AzUViTy
         LsDA==
X-Gm-Message-State: AJIora8Hf+1qAnfxZM0X8ogWSv1kfGOv3W7L3cM9E9TmQ10Dj2PeFwNZ
	4tux2+/5qSx9rEbz8iws276+kHUuG+6WsSLn7+VRGg==
X-Google-Smtp-Source: AGRyM1tstrOXHY8xgRH3GyE5OsoHHbrAl6kqR23c9IfUWFc8GJUD8u2uEM2ekizLdZ6HC2sstvliH1Jpc4Nk7Ibfn7A=
X-Received: by 2002:a05:6402:2696:b0:43b:eb8b:d0da with SMTP id
 w22-20020a056402269600b0043beb8bd0damr10851495edd.158.1658823887600; Tue, 26
 Jul 2022 01:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220725110702.11362-1-allen-kh.cheng@mediatek.com> <20220725110702.11362-2-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220725110702.11362-2-allen-kh.cheng@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Jul 2022 10:24:36 +0200
Message-ID: <CACRpkdbJai1X1iwY+qEGH_NwwsSWk=Ap6goZEat6o4Wb5E_FXw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: mt8186: Add gpio-line-names property
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	angelogioacchino.delregno@collabora.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_012450_459695_600A49BA 
X-CRM114-Status: UNSURE (   9.14  )
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

On Mon, Jul 25, 2022 at 1:07 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:

> Add the 'gpio-line-names' property to mt8186-pinctrl, as this will be
> used in devicetrees to describe pin names.
>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Patch applied.

Yours,
Linus Walleij

