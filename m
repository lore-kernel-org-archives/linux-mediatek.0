Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20E2C7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2LUpd1ShEDkP8CxxjKODFmXxczpxGXQR/flSSmLeAU=; b=ehbjL4FjA+9QIH17uHRd+Ie4TR
	8AiI1CjwCJ1a5oq81E7bwDGOPJjo3zlIdF/IPntv1NLKVen4N/l1IkCFy5wXaU801qcHQxviLBqjZ
	dRhRx3+4k29t7lw33ee4QWlm9+ZdLdXCIeUP+rXrTf1eEjUDN09FXmjNlyXQvXqCoNJjqm5S0g3db
	rpcjELlcvMmqt6Ku7Vyul7AnbC4Fpz2MIhwfQJKSxbrQauka07q4jmZiFePpfuzYOvItgG9y08xnO
	aNf0pNvHfvU10lWXaSboVGbjnIgXgkUp4jC204J7tovQt5UaUYClIkwsBFPLwKsyfMU88VMW8aWNN
	qdmgaNog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2YMv-002mdi-02;
	Fri, 26 May 2023 14:24:37 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2YMr-002mcb-1b
	for linux-mediatek@lists.infradead.org;
	Fri, 26 May 2023 14:24:35 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-775ebe161c5so76081439f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 26 May 2023 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685111070; x=1687703070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2LUpd1ShEDkP8CxxjKODFmXxczpxGXQR/flSSmLeAU=;
        b=RUNnPXW1kCTIpEs2CB3cMSdXrxLwRIg6VWW4uCczXrg4OCNvR6jhroogy78nusjL2X
         lrQI4DMCE4D4G7KkXyC30uoROdZ2ow8gnNcz4ds5WhfE5ZupKiQLZB+orIyQcoXO3F5K
         r8ZBB+Rs0GCAuG6psAbCzvJ34cHNq/zQ0P2mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685111070; x=1687703070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2LUpd1ShEDkP8CxxjKODFmXxczpxGXQR/flSSmLeAU=;
        b=D57UGN0aFJ0wl7ifVIl1g9EOiovxdrn7Po1gqDlprD1z5so6IyFRIfTjcxVA3zi1/1
         yqU6GnmAFdSiF7Yaf9QI0CKGY/YWOh0lbPCQ1fdSOuFYKKMzmZ97zcwIlpWzFsLjz9oA
         2cBYMvD7xg4yEV46dNdFQcgkMGDfLSIHWe8pt9fZf+NBQ5RaeyHKaUy3e76tmYvlmz3o
         DAxAGc0K9NMeRKLZLJazjIzssMIrtlJocq218cswEK9HC7l97HB282EDmC0XoOBYxtg1
         Ir8iEY8yfWn7U9oT1wJp9dN1N/IVIgSjDObdwB/29waAhnVD+XjAbJTD2L0OPMLFQzaM
         QeZg==
X-Gm-Message-State: AC+VfDznMS7gfyx1QicOLqkEif7YTA42d6XgMll6TxNRczVWllJGnS30
	y5UsMLtkKhcGS27uecHeE/DkkVxQhpAwUgup+rs=
X-Google-Smtp-Source: ACHHUZ6Zpnxi9hNggTnYKZfYviWzjTn5ErN3zZ73Z8dG1HR5oacmgp1w5D2wjRWUPZXL55vjBplrYA==
X-Received: by 2002:a92:d692:0:b0:339:f011:77f5 with SMTP id p18-20020a92d692000000b00339f01177f5mr1795052iln.12.1685111069771;
        Fri, 26 May 2023 07:24:29 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id c16-20020a92d3d0000000b0032afe23820bsm3384ilh.17.2023.05.26.07.24.27
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 07:24:28 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-33164ec77ccso152935ab.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 May 2023 07:24:27 -0700 (PDT)
X-Received: by 2002:a92:cdaa:0:b0:320:9759:bf6b with SMTP id
 g10-20020a92cdaa000000b003209759bf6bmr79542ild.3.1685111067417; Fri, 26 May
 2023 07:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230526100801.16310-1-uwu@icenowy.me>
In-Reply-To: <20230526100801.16310-1-uwu@icenowy.me>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 May 2023 07:24:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UxrFVZXn+dtgamttTVopWMSVbxYsHCGG_tS+3OTXbHiw@mail.gmail.com>
Message-ID: <CAD=FV=UxrFVZXn+dtgamttTVopWMSVbxYsHCGG_tS+3OTXbHiw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-elm: remove panel model
 number in DT
To: Icenowy Zheng <uwu@icenowy.me>, Pin-yen Lin <treapking@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_072434_469217_12D1FD2C 
X-CRM114-Status: GOOD (  20.02  )
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

Hi,

On Fri, May 26, 2023 at 3:09=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> Currently a specific panel number is used in the Elm DTSI, which is
> corresponded to a 12" panel. However, according to the official Chrome
> OS devices document, Elm refers to Acer Chromebook R13, which, as the
> name specifies, uses a 13.3" panel, which comes with EDID information.
>
> As the kernel currently prioritizes the hardcoded timing parameters
> matched with the panel number compatible, a wrong timing will be applied
> to the 13.3" panel on Acer Chromebook R13, which leads to blank display.
>
> Because the Elm DTSI is shared with Hana board, and Hana corresponds to
> multiple devices from 11" to 14", a certain panel model number shouldn't
> be present, and driving the panel according to its EDID information is
> necessary.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

We went through a bunch of back-and-forth here but in the end in the
ChromeOS tree we have "edp-panel" as the "compatible" here in the
ChromeOS 5.15 tree and this makes sense.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...in theory one would wish for a "Fixes" tag, but I think in previous
discussions it was decided that it was too complicated. Hardcoding the
other compatible string has always been technically wrong, but I guess
it worked at some point in time. The more correct way (as you're doing
here) needs the DP AUX bus support and the generic eDP panels, both of
which are significantly newer than the elm dts. So I guess leaving no
"Fixes" tag is OK, or perhaps you could do the somewhat weak:

Fixes: c2d94f72140a ("arm64: dts: mediatek: mt8173-elm: Move display
to ps8640 auxiliary bus")

