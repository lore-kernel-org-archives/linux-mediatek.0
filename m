Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D79C33CAB
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 06:10:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42BE4214D8
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 06:10:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gltxnVO1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qatwxt+O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42BE4214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+7rtLukCU6hLFt2i7RLQUq092SCkokFVw6T0z+jEoo=; b=gltxnVO16EH8YC
	zAP/aiAbTQAz1uL4gMRmjRV3ww4ScRfPIPQeVagEzGWn9N5A1XVVophHTmaRKVjbTFC9L+Z2lvURU
	wN1CN56AuqpZw+6Ft8A9JzIH9xBTjmb67QSuiDPKisDFjT8aWeTFlEeN5HL9JKvRhIydNNzNVX8gj
	PSBT++o8Nv/5yXNu5/5QOhEdmmN76p77h8U6+uM4lD1pWXz/JUMcSyBZNjmHhbqge5y2kZTNZ+ZSd
	Ci1gLOkiOgyGUh+wtSZORMRBYMkZkz5t7tyhtPePMgprvXMrkjAwdLfwS+49U16XOuT7dgXmQUJ9j
	E2znzsO4/iJJqTKuCt1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqsvz-0000te-TP; Mon, 13 Jan 2020 06:10:43 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqsvv-0000sQ-CX
 for linux-mediatek@lists.infradead.org; Mon, 13 Jan 2020 06:10:41 +0000
Received: by mail-qv1-xf44.google.com with SMTP id l14so3530027qvu.12
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jan 2020 22:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7DfRwJTOPvTtWVkT74WE0+0Wv9fnsKAGouTb1Izq89A=;
 b=Qatwxt+OoQ71OqIjEakHG18BOGUTpja+9P/RSKDnHwYK9mlMKhnsjaJ4Qe78pwcKjA
 EUHvEFOX4TtEYQGZXQ0Nrtq2IaqhIOos4xgXVC9FNe4Vmd1R/eL/TNIr1ZBdkzqw+QC4
 hkfY5cWW6CUPnnIq7Y57SsJYESMlI6UHhEQ5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7DfRwJTOPvTtWVkT74WE0+0Wv9fnsKAGouTb1Izq89A=;
 b=p4cz/POGk+zHprYz5/lnROLHcmUkqO5WVVsGjEiocPIKAd8WPB1kB2taDHj0A8k2yY
 zQMw3epj9YY7qWNbfi/HzIRwPNxBsZDLHt36C5XYBbCWTMgINqoflYE94/yS9Of27ScG
 BqRpOEOJ5T0LcaACocgdA+uGkPz8f5FmwlizMhqi3blJBwxpxEHnTX0lRaBuKRTb5kca
 1w2x+05SdCSYByF4fnh6EgFfKINxd+6D68w+yyng6ZQOCPgtzboCe4ryhZja5cbppBls
 Yd5pUvlpcvRtawNfWk2AcEElQp7dXFjpNzmr09lBNeeW5zXqdXjJalHLBTURReKZrY0n
 4+Gw==
X-Gm-Message-State: APjAAAUifuJamWkaJR71afgfNUYBbTueO5g/lgoCgk+tZgEDjP5Jq+Sl
 oYiZ70OeRsG9Sbu+84FmCriHaRiLoPg22bsnuFDNjA==
X-Google-Smtp-Source: APXvYqzNnf0+5zf15VXfHELZbqC0F4Qy+EwQSLKu7IESG3soghZ70PDiWBmTa+q/Q8H2Xj5h4riou90hhvsdIXG1nTo=
X-Received: by 2002:a0c:f703:: with SMTP id w3mr14287635qvn.6.1578895837978;
 Sun, 12 Jan 2020 22:10:37 -0800 (PST)
MIME-Version: 1.0
References: <1578639862-14480-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578639862-14480-2-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1578639862-14480-2-git-send-email-jiaxin.yu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 13 Jan 2020 14:10:27 +0800
Message-ID: <CANMq1KBNuJDEn57d0ysc2XG0ezWEvJ2Pm88YihDiSZJ=-E=W9g@mail.gmail.com>
Subject: Re: [PATCH v11 1/3] dt-bindings: mediatek: mt8183: Add #reset-cells
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_221039_427181_24F8B280 
X-CRM114-Status: GOOD (  16.30  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Yong Liang <yong.liang@mediatek.com>, freddy.hsin@mediatek.com,
 linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, chang-an.chen@mediatek.com,
 wim@linux-watchdog.org, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Jiaxin,

On Fri, Jan 10, 2020 at 3:04 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> Add #reset-cells property and update example
>
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Guenter Roeck <groeck7@gmail.com>

From previous feedback
(https://patchwork.kernel.org/patch/11318687/#23086211), it seems like
we lost track of which exact version had the Reviewed-By, so I'd just
drop all those tags and let people review again.

> ---

It would have been nice to mention that this patch depends on
https://patchwork.kernel.org/patch/11311241/ (as your example makes
use of it below).

>  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 10 ++++++---
>  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
>  .../reset-controller/mt8183-resets.h          | 17 ++++++++++++++
>  3 files changed, 46 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
>
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 92181b648f52..5a76ac262f8d 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -4,6 +4,7 @@ Required properties:
>
>  - compatible should contain:
>         "mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
> +       "mediatek,mt2712-wdt", "mediatek,mt6589-wdt": for MT2712

Please separate this as another patch.

>         "mediatek,mt6589-wdt": for MT6589
>         "mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
>         "mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
> @@ -14,11 +15,14 @@ Required properties:
>
>  Optional properties:
>  - timeout-sec: contains the watchdog timeout in seconds.
> +- #reset-cells: Should be 1.
>
>  Example:
>
> -wdt: watchdog@10000000 {
> -       compatible = "mediatek,mt6589-wdt";
> -       reg = <0x10000000 0x18>;
> +watchdog: watchdog@10007000 {
> +       compatible = "mediatek,mt8183-wdt",
> +                    "mediatek,mt6589-wdt";
> +       reg = <0 0x10007000 0 0x100>;
>         timeout-sec = <10>;
> +       #reset-cells = <1>;
>  };
> diff --git a/include/dt-bindings/reset-controller/mt2712-resets.h b/include/dt-bindings/reset-controller/mt2712-resets.h
> new file mode 100644
> index 000000000000..9e7ee762f076
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mt2712-resets.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Yong Liang <yong.liang@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT2712
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT2712
> +
> +#define MT2712_TOPRGU_INFRA_SW_RST                             0
> +#define MT2712_TOPRGU_MM_SW_RST                                        1
> +#define MT2712_TOPRGU_MFG_SW_RST                               2
> +#define MT2712_TOPRGU_VENC_SW_RST                              3
> +#define MT2712_TOPRGU_VDEC_SW_RST                              4
> +#define MT2712_TOPRGU_IMG_SW_RST                               5
> +#define MT2712_TOPRGU_INFRA_AO_SW_RST                          8
> +#define MT2712_TOPRGU_USB_SW_RST                               9
> +#define MT2712_TOPRGU_APMIXED_SW_RST                           10
> +
> +#define MT2712_TOPRGU_SW_RST_NUM                               11
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT2712 */
> diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset-controller/mt8183-resets.h
> index 8804e34ebdd4..a1bbd41e0d12 100644
> --- a/include/dt-bindings/reset-controller/mt8183-resets.h
> +++ b/include/dt-bindings/reset-controller/mt8183-resets.h
> @@ -78,4 +78,21 @@
>  #define MT8183_INFRACFG_AO_I2C7_SW_RST                         126
>  #define MT8183_INFRACFG_AO_I2C8_SW_RST                         127
>
> +#define MT8183_INFRACFG_SW_RST_NUM                             128
> +
> +#define MT8183_TOPRGU_MM_SW_RST                                        1
> +#define MT8183_TOPRGU_MFG_SW_RST                               2
> +#define MT8183_TOPRGU_VENC_SW_RST                              3
> +#define MT8183_TOPRGU_VDEC_SW_RST                              4
> +#define MT8183_TOPRGU_IMG_SW_RST                               5
> +#define MT8183_TOPRGU_MD_SW_RST                                        7
> +#define MT8183_TOPRGU_CONN_SW_RST                              9
> +#define MT8183_TOPRGU_CONN_MCU_SW_RST                          12
> +#define MT8183_TOPRGU_IPU0_SW_RST                              14
> +#define MT8183_TOPRGU_IPU1_SW_RST                              15
> +#define MT8183_TOPRGU_AUDIO_SW_RST                             17
> +#define MT8183_TOPRGU_CAMSYS_SW_RST                            18
> +
> +#define MT8183_TOPRGU_SW_RST_NUM                               19
> +
>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8183 */
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
