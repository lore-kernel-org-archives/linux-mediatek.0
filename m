Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745D8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jan 2022 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9SL3GPqgRcaoHYf1vSnU7JUlSdaMf+jxfN6CFLu5fs=; b=ea2522h5dkNn8I
	PJo+X7bYf9ZW2dHr4QHVRDdUTU11e3U7LIT8yCeZG3AFaGGV4sW6l7DaZcuMqX88blq73dskqM1TR
	XVVu7eI9kj96eQ2IO/sFeFZtqgq4QlCOlT3J+AKrPsiUBa1VPG40KZthpzyNw5ewzlxV7rZ7muga/
	w+bwAFdlupCIfS84lNzTyU65+VWxV4tmUkb5GuVpwm4rRCZxVdqGAzanoEh4vLg4oMg7Ms0P1bRO3
	mRXhyz/izUyBc4uWXwpxnXOHFJctc9QKDfjSCQk+/233W26qAJQy4JwMI3bHDVz6YYBIFjX1vv7xT
	mYlxDCwb3EJnZFs1SxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n58c4-00FEeO-US; Wed, 05 Jan 2022 15:54:08 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n58c1-00FEdI-Fq; Wed, 05 Jan 2022 15:54:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id k18so47235610wrg.11;
 Wed, 05 Jan 2022 07:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W1hSBC1/w98Pw768lmJjpnN6pQZfQzImMpHnsNTHwes=;
 b=aAiyTBoLIFSGF30KgT0PoBOWB4sG/qXliIZcz23iLomVGGocLLPuR1fElE6eX0aaxk
 AfXUTEyJztGRVD+nYfZHV2NU1uNLuHTAenWQI1N5S4XkcxtOzcqytWp3XskMVruBxFlx
 +nPKlamtrLk0fHpxCzxeYxI/xs6Y0Gl2cqAVTieXr3VQ55JOsIXzoJzXdz+b7aL5GJdx
 /v7204V4P1OuvP2qpR1Fg20Gi0r8w9NSt+gMN5Ewi6HdCEbmCyr97h6EUV6dv3bBwWWD
 3MgTjziPQYPaTlSpqQKNlv6GJG5zPFiBqiHgRk5Fs/QsaVwbgLgcRzv7LFKC16C7IRWr
 /YvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W1hSBC1/w98Pw768lmJjpnN6pQZfQzImMpHnsNTHwes=;
 b=eEA49QX8vT/5FCX72uTLhDrhe8cLbr65YHaeil/O2VESF8uLKnpslIzT0GKE14JqB9
 nmXwT44V11kEb3cdoxGM9EE4iwME9pmxFz0JsPAxjEkt/77lMYn4fNmgwgWRvQE/ECKk
 XIb88lbzAdMOTfAwtY0zSK1n5+J8JO6/RlmFf5OPirs5fIaZKwLDGs/PlHx57ugqdsXL
 DARYLeKr/fUWqtp9/Akkj1uSZ91mV2XyVgMzYBOKntIk6fD0cDQ1ETX6MTYGUHuKMjBj
 fSlDe4M3UhpY0bHlUDPPPJ8MNKcqeU33pTGXGxDb8e7rb23INNKHYwY9ejt3N7z5bRtH
 1eOw==
X-Gm-Message-State: AOAM5309yCUwj3OuSwy9U/4UNTcwuMy9KETgH8ZWE3RecJnL8ohSYP5o
 H9CU2Dese5jbE/K4YBciWdEzoMvo3X4oC2mgQME=
X-Google-Smtp-Source: ABdhPJywwb5ns/ANiBJIsaCUkgHG7AuBBdGtP/ATxIr7g1Fxp2Z03sxOoIvq9UzjMTvcJuZA3W7w5GMldnEqkblZNPA=
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr47690277wrd.81.1641398042839; 
 Wed, 05 Jan 2022 07:54:02 -0800 (PST)
MIME-Version: 1.0
References: <20220103043202.6524-1-yc.hung@mediatek.com>
In-Reply-To: <20220103043202.6524-1-yc.hung@mediatek.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 5 Jan 2022 17:53:51 +0200
Message-ID: <CAEnQRZBH4uwMmyBLY2bCtY9QZooBiK5PqF3T+4K8WAtQV1QN-Q@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: dsp: mediatek: add mt8195 dsp document
To: YC Hung <yc.hung@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, 
 matthias.bgg@gmail.com, Linux-ALSA <alsa-devel@alsa-project.org>, 
 linux-mediatek@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, 
 Daniel Baluta <daniel.baluta@nxp.com>, trevor.wu@mediatek.com,
 allen-kh.cheng@mediatek.com, Cezary Rojewski <cezary.rojewski@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_075405_556970_E8703859 
X-CRM114-Status: GOOD (  20.25  )
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

On Mon, Jan 3, 2022 at 1:00 PM YC Hung <yc.hung@mediatek.com> wrote:
>
> From: "YC Hung" <yc.hung@mediatek.com>
>
> This patch adds mt8195 dsp document. The dsp is used for Sound Open
> Firmware driver node. It includes registers,  clocks, memory regions,
> and mailbox for dsp.
>
> Signed-off-by: yc.hung <yc.hung@mediatek.com>

The code patch should be created against original source code from
Rob's tree. Here it seems the patch is against v2.

This isn't going to work! Because when Rob will try to apply the patch
it will fail since he doesn't have (and doesnt need to have)
your previous versions.

So, please keep the changes history (that's a good thing!) but always
rebase your patch on maintainer's tree.


> ---
> Changes since v2:
>   Remove useless watchdog interrupt.
>   Add commit message more detail description.
>
> Changes since v1:
>   Rename yaml file name as mediatek,mt8195-dsp.yaml
>   Refine descriptions for mailbox, memory-region and drop unused labels
>   in examples.
> ---
> ---
>  .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> index bde763191d86..779daa786739 100644
> --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> @@ -27,14 +27,6 @@ properties:
>        - const: cfg
>        - const: sram
>
> -  interrupts:
> -    items:
> -      - description: watchdog interrupt
> -
> -  interrupt-names:
> -    items:
> -      - const: wdt
> -
>    clocks:
>      items:
>        - description: mux for audio dsp clock
> @@ -75,8 +67,6 @@ required:
>    - compatible
>    - reg
>    - reg-names
> -  - interrupts
> -  - interrupt-names
>    - clocks
>    - clock-names
>    - memory-region
> @@ -95,8 +85,6 @@ examples:
>         reg = <0x10803000  0x1000>,
>               <0x10840000  0x40000>;
>         reg-names = "cfg", "sram";
> -       interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
> -       interrupt-names = "wdt";
>         clocks = <&topckgen 10>, //CLK_TOP_ADSP
>                  <&clk26m>,
>                  <&topckgen 107>, //CLK_TOP_AUDIO_LOCAL_BUS
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
