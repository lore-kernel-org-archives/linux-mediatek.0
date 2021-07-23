Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7269EC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 11:14:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3408860EE2
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 11:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3408860EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEFQE4wEmSAibeDGcGJamJHOY7sq/WLrB6NP8F+UlLg=; b=tOykNSPo/B4w2Y
	d3NQvS/NHVP5ReVnOy+X0SqrDUV7RSGJ94xmJTOCg36RbSLqCLouPUxWt47h8brEnpCV5HxO9Be6I
	ehyqYB1dZGAng4z1EvRAjTKgeGk/HMm+CiiHJgivj+wRQFirlXfh4pu9QANzgqxi2uPpIGtDS4IJT
	jtlDCvVxmiL8C0Ms63+mURUOgvuCU53VuJQ2OXzvrc4dJr3rNGjcgJTCuQHqJAyLv0aAbeGqNoi6d
	U/vJbw1YR20zBVwDjUgdGIpDjtHueO8vIUaozVEnaSO6wRn4le7P6izj+mdIs4zBM7DLyZBeWBP66
	JLxAUtt2EF4XtVh+C8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6t7x-004Try-Qr; Fri, 23 Jul 2021 11:14:01 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6t7v-004TrD-IK; Fri, 23 Jul 2021 11:14:01 +0000
Received: by mail-oo1-xc36.google.com with SMTP id
 s21-20020a4ae5550000b02902667598672bso288521oot.12; 
 Fri, 23 Jul 2021 04:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Nwk9qPAQEz7a/8yg7VWdxwdIwFtkYHBh+612HjXFR8=;
 b=ed8KUGsfCqWAQcQfBhF88Y9OVbMf4kku9i0iSmPQyK4UKJA8IW5SwF4EiYlGu5gvXZ
 9zOtQB+o4iAK73tSfN3TlCHiB0dOF9wOXyxpoQ3Hk3aw/Iwif3d9xeq0OWQ06Mo0P9Vk
 5d//f/EJQcO/kNZCkh/zg9Z6DEE9RnSunxT6W/jy9Fa9XF/EaGVTWFs1uda5bTvuHhhm
 pCjHFdJfBbdSyBt2DY/Cv5PKRLsF6cHoKCJe7/sxvC7sZlEHwS016uiJb36x3RQoTKc5
 lL1D5HjuBEmQXMoBhVXoTfAg09+M0tKn2jLDax6QxhSO7OiFYp7fSUwUFTJAKhCi3dc2
 R8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Nwk9qPAQEz7a/8yg7VWdxwdIwFtkYHBh+612HjXFR8=;
 b=HDkjbZ0i3vOOFI0sgZBPuKjSKltiHxni/x33mfptbTt7cxHrpge5Et3SZyLDWl05mo
 y8d9QoHAQqgLuAAEUNgCenAouqiGxGVaFVo1eCHhqVpjaL2QLm3HyUR8KqDSbQpRreVl
 P1HX/oB6Vs+gDYivqwjZwUBEv/geWFYWW2MKF5p222+UargMLGQOWr4u/VqqvoVF5Kvv
 4SY2mxYDJLUbIgsSWvsSSgGTn/kieHKseXhHUQ2tWBliwvVxtaGXTyv6uCuIzGi/4r/0
 THmms67b56+c78NwzZELKri6jfSkKUcSIGt6yBtE3YKzW1g0vcmH6sKb1G8ZLkBbjZZ0
 NheA==
X-Gm-Message-State: AOAM532RCS7WfiJ8FdpFTE2MJdtAze4WXBid1Xy8p+LInB5QR1qvowPM
 /XWerI2Gx1nFxh4mRxwoHTdxZ5NQX3YK5r8lisU=
X-Google-Smtp-Source: ABdhPJzNCCp8fTtO0kzSFLOUM+lawDoT2CfKUL3Rr/JKyIfNM4DwmUjfKyJ5eSEbSZzASHckgWxaWjAwJmhGfdvT0m0=
X-Received: by 2002:a05:6820:444:: with SMTP id
 p4mr2336576oou.75.1627038838422; 
 Fri, 23 Jul 2021 04:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210722092624.14401-1-jason-jh.lin@mediatek.com>
 <20210722092624.14401-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20210722092624.14401-2-jason-jh.lin@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 23 Jul 2021 13:13:46 +0200
Message-ID: <CAFqH_51qKkxMit5fkSh_AyeNAYwKnoPe09nwJLKaKez26+HUew@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC
 binding
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree <devicetree@vger.kernel.org>, 
 Jitao shi <jitao.shi@mediatek.com>, fshao@chromium.org, 
 David Airlie <airlied@linux.ie>, singo.chang@mediatek.com, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Fabien Parent <fparent@baylibre.com>, "Nancy.Lin" <nancy.lin@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_041359_656655_E2B052B6 
X-CRM114-Status: GOOD (  16.92  )
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

Hi Jason,

Thank you for your patch.

Missatge de jason-jh.lin <jason-jh.lin@mediatek.com> del dia dj., 22
de jul. 2021 a les 11:26:
>
> There are 2 display hardware path in mt8195, namely vdosys0 and
> vdosys1, so add their definition in mtk-mmsys documentation.
>

Just having 2 display hardware paths is not a reason to have two
compatibles, isn't the IP block the same? Why do you need to introduce
the two compatibles?

Thanks,
  Enric

> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> this patch is base on [1][2]
>
> [1] dt-bindings: arm: mediatek: mmsys: convert to YAML format
> - https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-1-fparent@baylibre.com/
> [2] dt-bindings: arm: mediatek: mmsys: add MT8365 SoC binding
> - https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-2-fparent@baylibre.com/
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 2d4ff0ce387b..0789a9614f12 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -30,6 +30,8 @@ properties:
>                - mediatek,mt8173-mmsys
>                - mediatek,mt8183-mmsys
>                - mediatek,mt8365-mmsys
> +              - mediatek,mt8195-vdosys0
> +              - mediatek,mt8195-vdosys1
>            - const: syscon
>        - items:
>            - const: mediatek,mt7623-mmsys
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
