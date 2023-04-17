Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A41C77B70
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 09:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ugn0tF7BDKzSh48Bi2FzY0cxR1IhIvrfHVPHfcTin10=; b=kNnbslohha4S3imlAdz7uMCEke
	hpdDgEEt9kTDux9NA1+asr8v12AZMwxs8NyXhNy2FIc1NRUii9CIF3EvPFfLAeUMVw9ZKKmXD72TT
	L7ExRpZ70T8fj30qp3ppcqTE8vCcQHWgZL5Zr2ng1mlV9fgHt8uftGVSaiQqRo2HdGcECjJKbtqGh
	N/5aJIRz1l3kT6NweDjMi3VuLGUXH+YMEiSuZMXtFd3613RTvD4s6h2GQNmdK3I6HOwbFIipw1sFS
	xD/dzDuObCiTAlU9uAJT3xH/z7oEAL4Ypg5tSbgupMbKrvaK3eDb6fIFmHro8g1hbao0naMsfIPam
	qB9jcr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poKv6-00FU8v-2P;
	Mon, 17 Apr 2023 09:13:08 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poKv2-00FU7G-34;
	Mon, 17 Apr 2023 09:13:06 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-187bee46f9dso8149553fac.11;
        Mon, 17 Apr 2023 02:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681722782; x=1684314782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ugn0tF7BDKzSh48Bi2FzY0cxR1IhIvrfHVPHfcTin10=;
        b=gZ3Z+olH7XVbjvcpFO70J8Rz2KDzfJrJKP3OxkDjpuXw4vjLqYZ1BA4C07IUjludjL
         fxqZUkL5h5u8wha1gh4XNj6zj3+z9zPOYjIxXFWqLe75gxd1VrJSvyTiUEuyCit6MVjt
         x/+czm2EIT4BZguGDdK9Ajw9UBy5jOqz2yxbaaYqOXG+kh89oYhfDTxofKjRs7JFWc2F
         8I2ofHh34TQzv3X4fF0tQRYBVkvocVGCi9ngoglUuRMLMG2rBX80ndT6hW1tLDITBdai
         bBbSOMmgzQwFqqrNikv47WHsEFDaAfO351ADR5KTrwUDH87HIZS5QCk0q8wHoNE8SJ6+
         ZG2A==
X-Gm-Message-State: AAQBX9eTvY/mgc3rp6ruM/CCactDwCGziR9JKH5QOg+jmnQLU7LkvpHm
	Uhry8o1D1Z/GENWYqPvmKmwTCmsnMR1lkQ==
X-Google-Smtp-Source: AKy350beZQdOIZLn5yDA2L1VEHzuBpfNxmgXQkQfO43MN5PCLs3BIUAi24OuBW3kUeHqEfV/M9ktGA==
X-Received: by 2002:a05:6870:658f:b0:187:c066:a39a with SMTP id fp15-20020a056870658f00b00187c066a39amr4666123oab.16.1681722781819;
        Mon, 17 Apr 2023 02:13:01 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id o1-20020a05687072c100b0018456166c7asm4318117oak.39.2023.04.17.02.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 02:13:01 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id p133so6407957oih.2;
        Mon, 17 Apr 2023 02:13:01 -0700 (PDT)
X-Received: by 2002:a25:d057:0:b0:b8f:5c64:cc2e with SMTP id
 h84-20020a25d057000000b00b8f5c64cc2emr6890649ybg.12.1681722760298; Mon, 17
 Apr 2023 02:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org> <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Apr 2023 11:12:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=H_ypo82C4G8e_ytS9R6GNwnvVD_0L2GzPQdyaUHhdw@mail.gmail.com>
Message-ID: <CAMuHMdX=H_ypo82C4G8e_ytS9R6GNwnvVD_0L2GzPQdyaUHhdw@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: watchdog: indentation, quotes and
 white-space cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Julius Werner <jwerner@chromium.org>, 
	Evan Benn <evanbenn@chromium.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sander Vanheule <sander@svanheule.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Fu Wei <fu.wei@linaro.org>, Viresh Kumar <vireshk@kernel.org>, 
	Eugen Hristev <eugen.hristev@collabora.com>, Justin Chen <justinpopo6@gmail.com>, 
	=?UTF-8?B?4oCaZWNraQ==?= <rafal@milecki.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, Corentin Labbe <clabbe@baylibre.com>, 
	Anson Huang <Anson.Huang@nxp.com>, Robert Marko <robert.marko@sartura.hr>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jamie Iles <jamie@jamieiles.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Srinivas Neeli <srinivas.neeli@xilinx.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_021304_988443_BFB8BA67 
X-CRM114-Status: GOOD (  14.70  )
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

On Sat, Apr 15, 2023 at 11:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Minor cleanup without functional impact:
> 1. Indent DTS examples to preferred four-spaces (more readable for DTS),
> 2. Drop unneeded quotes,
> 3. Add/drop blank lines to make the code readable.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  .../bindings/watchdog/renesas,wdt.yaml        | 14 ++++----

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

