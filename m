Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F3AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 15:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HoxuHoXViyXRrxz1ByiFgcUfpCAzHQhztF2AcBx72cU=; b=L/wz31dH/C0t7f
	KQ6l6pWRp90xvozWAH3/SCJq4qkymFSzKocAS1j+aoGK59faDAomFZeX2ubFYsKQHtgWIjt6d+I+j
	ebNMsxG6TbEkMhLfkQnlgApkztozIMQgZmJ9G1Hs5N2VZkeQFzC/lDBbM5dbNBnhNsmaElVP4rqjg
	8eTufmCAJEeB+5V0WBfG6QyPXZNzfuTwZm2Y26/tctXr5wp+C8I/mz5li6UKdhVTAzXCnF43CWhiy
	FKuB4oueTJYMNWfdtccVggPxkWtdr0zBG72Dw/fTDpYdViC+EBC27FHt/cXJcT0IgsqkcROaPsANX
	Oc7FhNbkCaJ3+j7MmLdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJdCs-00Fph4-BW; Mon, 14 Feb 2022 15:24:02 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJdCf-00Fpch-4q
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 15:23:55 +0000
Received: by mail-lj1-x236.google.com with SMTP id e17so22745828ljk.5
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 07:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2Wzb73CCNJjymF4wVIRvovDIYwgk4oVDBjnM/KPNjs=;
 b=elp+5cTpAjU+1/ip79o/mzc94QPWcQLdADxYuHtbbb35WzwfcPePrjIkqA6nuvK8xr
 BlOV7/fKbg5q5P9bz1KGyaJV/tyQmgBVmkZV6IF4hLzxK/M/yGuI4KFp45wWoNuOU6i+
 glNkY+TH9jAi2XDKFPtdZNEXktN0yfyVN6LxczV5G2xn4w0voWRmzdUNDm3gYWGNh/po
 qp+PgBVIPqPEVbsxoB4OXVtFlH21t4pxQaCpVbsDuB++qcxTQ9nl8g8Fxy+AiSgYn63p
 agFwAWRXcAeQNjE2W5r47S8l4JFw7/FhVRMzFrFto1pRWpdlWen+Rq8WTSI64k4A6UfU
 MRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2Wzb73CCNJjymF4wVIRvovDIYwgk4oVDBjnM/KPNjs=;
 b=DpXpaAVXZDk9X181f+xMB1GlanosxSfqo+nGEj/8WWtvhopuNzboR4CSXJ6tHlg+7/
 HSJw/PiDM64vHa4PqA4gKzhU4TUdfnyEI8p0emNMOxJ0dpOBJDra2ICGTGt/a/AyjtWY
 sHWKwUZDtpk7dZtgIzpaNMJUmafBsz4qyRQ1HSK1DyHnDfoZ/47DkYzu74UOE5vxlmUN
 efhC2oPREbKT3BfIWz+ILkkSc87fGuUEsouNn5cqnS6jU57JLW7FGJOQLCjfyMY7lUmn
 hPG4JTqHCXKPyOITbqfmAHgMhjT6UendfcYB2BsEcscYSOKG6RotONOPIn4Et1mVcxTq
 6rag==
X-Gm-Message-State: AOAM533nXArLg+1zd1rg4lYs/JA2fK4/LgRJmBzBWsfwCvjlsFGbhRpN
 BLoT5U5foXH+L8uptfPJwhFe1V+1vUvKFmvyTy1b6Q==
X-Google-Smtp-Source: ABdhPJzfciI7TngcTILpWVQuCNuuqqSMq2cqqqebQNnx9wghhN7LjSSWuFvn2nKCKlLwBdlHEDzZrWnTrQa46CaiDAA=
X-Received: by 2002:a05:651c:179c:: with SMTP id
 bn28mr188158ljb.4.1644852226434; 
 Mon, 14 Feb 2022 07:23:46 -0800 (PST)
MIME-Version: 1.0
References: <20220119103212.13158-1-axe.yang@mediatek.com>
 <20220119103212.13158-2-axe.yang@mediatek.com>
In-Reply-To: <20220119103212.13158-2-axe.yang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 14 Feb 2022 16:23:10 +0100
Message-ID: <CAPDyKFr8bV+1uTbuhMObvORLGJHsvZHUONJkdY54MXPPRWL5Qw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: mmc: add cap-sdio-async-irq flag
To: Axe Yang <axe.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, 
 Eric Biggers <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Yue Hu <huyue2@yulong.com>, 
 Tian Tao <tiantao6@hisilicon.com>, angelogioacchino.delregno@collabora.com, 
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_072349_217991_ADB5DB3F 
X-CRM114-Status: GOOD (  18.86  )
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

On Wed, 19 Jan 2022 at 11:32, Axe Yang <axe.yang@mediatek.com> wrote:
>
> Asynchronous interrupt is a mechanism that allow SDIO devices alarm
> interrupt when host stop providing clock to card. Add a DT flag to
> enable this feature if it is supported by SDIO card.
>
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> index 513f3c8758aa..16fb06f88471 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> @@ -165,6 +165,11 @@ properties:
>      description:
>        eMMC hardware reset is supported
>
> +  cap-sdio-async-irq:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      SDIO async interrupt is supported.

We already have a DT property for this, I believe.

"wakeup-source" is probably what you want, but we have additional
properties that are related to this too. See more below.

> +
>    cap-sdio-irq:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:

The above, "cap-sdio-irq", informs whether the SDIO IRQs can be
supported at all, by the host controller.

The property "keep-power-in-suspend" informs whether we can preserve
the power to the card during a suspend/resume cycle. This should be
needed in your case too, I think.

In other words, you may need to combine "cap-sdio-irq",
"wakeup-source" and "keep-power-in-suspend" to describe your HW.

However, what perhaps is missing, is a common MMC/SDIO binding that
let us describe an optional irq-line, which sometimes is being used
for the wakeup irq. In the sdhci-omap case, we look for an irq mapping
towards "wakeup" if specified in the "interrupt-names" property.

In some case, when the SDIO card supports an out-of-band IRQ line, the
similar should be specified in the child-node corresponding to the
SDIO card.

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
