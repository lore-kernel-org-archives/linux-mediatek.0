Return-Path: <SRS0=M313=EX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C887C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 10:37:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 333E7238E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 10:37:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Osaq7J2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 333E7238E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+eOMcddSKqRz9zFtj1OCpN4Xg0GjwR4UeF1cpkZ0N6o=; b=0Osaq7J2wmOxviO1912K1tbde
	6eRlD75IzlV4MIjOO/FkIaqUo5pdh5RrdEjNif1JphkuECrEE9OXIdI1porg1aVi4DV8bGtlz4CyD
	0YMU4BPdF56LMtxUR2bGeZJWIrn8brsS0wYhqTY3M9VcK8SVIm4SU+8Vm0ZDzBvtqmwSRY2vxCtyu
	uiuWYbYZWitveSVdor0jgLih9UFtecAKZ1atmh0ajyMz3qKe1D6bSBcRs4RgYoWfojuRf6IYyyOlh
	bXgT0LkBwMEay+5mv8TWkIReV0A/cdsct9aTWZNdHLADfKbtHBSbr3YKzyC1FsfgXDwaWJit5qUo3
	fPvxj1bJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keyMr-0000ro-UC; Tue, 17 Nov 2020 10:37:46 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keyMj-0000ok-2J; Tue, 17 Nov 2020 10:37:37 +0000
Received: by mail-ot1-f65.google.com with SMTP id i18so18950234ots.0;
 Tue, 17 Nov 2020 02:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xlpCdbdwdgiAHLJ6o3j80s/A4tWrQRJFEA4CoHh+SMQ=;
 b=FMwFF9mP89EORxc/28ZT8xuYWu585E0fOEQ0L8lDAS2Qz1vhPtBOco2k2UZAZbg3cM
 k9KFujPAOQPZ4GjiGhJ1Bma0F9kS3q6MzNeTl7DjO2UC0ny9p27Gl0Paqijp6YePBeMP
 Glo+xHY/TULAjS2XifuKcnRcppptKYQ3TeiE/iYO3UU+At6WZ1DkN5gLDt9Olx7JU49j
 USROm7FD6zhqGoxdKnQSbaet7ek/Kz1nEroHPsuibaPYJ3zHltWISxJJ7KQc0Rb2SvIU
 +hQblvlkU3u02tf/aEMrDeOO21fXAvxzlpZpZb2hJY4yYVwmBMtcqX5QjzUolfFQfa8Q
 FRnw==
X-Gm-Message-State: AOAM533DzKMZ9K8aTgZOXDXDa6W448Mjq7O9w0pcao27fZ/3/Edmq4/I
 4HapNKn42mZm2L0dxk6EbArily+o+P/An2LpBANv2Kj5e9nSUg==
X-Google-Smtp-Source: ABdhPJwdmx7r6I5zj8jodkYho7XnaytzF+QMp1QBc/itOa9ld+ji3I3oUftzlTM4p0M68kkeI24eiE8vpMn7CYfNO3c=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr2362156oti.107.1605609454288; 
 Tue, 17 Nov 2020 02:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20201117103123.3938-1-chunfeng.yun@mediatek.com>
In-Reply-To: <20201117103123.3938-1-chunfeng.yun@mediatek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2020 11:37:23 +0100
Message-ID: <CAMuHMdXVXqj9k4FMFH5aiqKwNrWocJpjahYKA8k2e3Z2ji2hvQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: add additionalProperties
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_053737_112692_8324E30A 
X-CRM114-Status: GOOD (  14.21  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 linux-realtek-soc@lists.infradead.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chunfeng,

On Tue, Nov 17, 2020 at 11:32 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> Add an explicit "additionalProperties: true" to avoid
> dt_binding_check error caused by:
> 'additionalProperties' is a required property
>
> This will not change function, due to additionalProperties
> is true by default.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/arm/actions.yaml
> +++ b/Documentation/devicetree/bindings/arm/actions.yaml
> @@ -49,3 +49,5 @@ properties:
>            - enum:
>                - ucrobotics,bubblegum-96 # uCRobotics Bubblegum-96
>            - const: actions,s900
> +
> +additionalProperties: true

Looks very similar to commit 62298364bd489b06 ("dt-bindings: Explicitly
allow additional properties in board/SoC schemas") in v5.10-rc2?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
