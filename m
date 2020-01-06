Return-Path: <SRS0=+t0h=23=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D2DC00523
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 02:22:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB60521582
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 02:22:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QoyC8ljO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPDci3wO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB60521582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=miarDbgGerBmhUYk2ivohtRZnAfQUpAkddj18tkL6Z0=; b=QoyC8ljOiZJJzijrpY40AQU7T
	1XT3qDlZ/H2Qp3vts2wH3rNuQkDrsz+NyRnUMhSQIl6C5vkOKM1QpZMOTuBT8at5XWV/6gNlzheZx
	W42BmfZPKmK9uZheHIqXLh8mPc+ZrefLjUwbhBI+krQmjqHx/Eyi+ayjsrs9NTK4PKkPJru/Hzyok
	2+9JcyrTmjJwEnN9qLwslwc5mq+wNviiLgX7K6L0dcAfGnu5IN50J3AOU8xvotaBbDspq7t7XOh4q
	8cEjwmwioQfUFOawnf3pYWO4lPNjKz4XJPGbpehPz3OtpSNzVM/q6NkBWPCUf1LeVOQXQMbGsb7J5
	MN+qvnFYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioI2V-0005Ho-Es; Mon, 06 Jan 2020 02:22:43 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioI2S-0005Gx-7p; Mon, 06 Jan 2020 02:22:42 +0000
Received: by mail-pg1-x542.google.com with SMTP id z124so26135266pgb.13;
 Sun, 05 Jan 2020 18:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ipcsI+jZ4hrMnV7t9N2jVs66amx0u2G0uIwSlpjDd4Y=;
 b=lPDci3wOl0yBaSZhnSt8JF1e1tCFoPAb4SE1gSvn6yb8TH4Qf2eBJIevhzA4jJ9kQT
 jXw8T+0T3DMv9vCc2d3KtMCh0cO0Fh3AtQ1mQp9HnN/WUU9k/IdOqfebWK3ki2Q8kU9A
 0vSiiZnGpAU22FAwvbSz30yaL+XhXV/sC2lPOgMXd/5FUrKk2Rv2WM/IE6luBBwj6F/Z
 7T7Q8MrIX9nWS6DUTuRfhnWMeVdWUdb8jFSOYhvdy+lFddRukrLhwFNVoj+Cbm+s5OSp
 8RzUEI23DO/jQmdHBuFs7xSyPCkTupn1Z1TeuBWqkz7VO3ghWsUkOECPzQHZlnUQi9cb
 Ar6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ipcsI+jZ4hrMnV7t9N2jVs66amx0u2G0uIwSlpjDd4Y=;
 b=JbUbD9bRYubjYsbGtxMVxfy37laHEu7ntdBUxUcNZeO5V2U3mxH+UNYGen2wNgp6eU
 ol4/H37wt7i2XLLiXqFhXDXefPVsqRJNSTqTap3gW3TaroyzURwJ+OSt3qNZmUKUx3g+
 9Td+vGlcDDKkWR47PW+2sAG7V4QoPunwvefrVfs6SLQqXv1Zn3paiHM0Fg/YxTDVL4c/
 5YcfUlayrjmahsgN0cbylQ2IypyDyG/b1dLl/R1ufIEc9Zl+/mm1cGf+smjcU9D0LcrA
 5gVyL4qajGnoq5dp7zRBb8tpa5ztZH31/qVQcwrqPFQKCA5uuGrDuAXc75QRyC7T++3d
 2eVw==
X-Gm-Message-State: APjAAAVjsahHr8UwE8zi8pnhrN4U2kLaM5OrEBz2C/kReKowujalKnV/
 w/oJQhImJejHqniJ+VkmVoc=
X-Google-Smtp-Source: APXvYqz1BDCSkSXVrUu4zC2a82wSvLK/YKFS/9RPAe5p+u2Z0wTdw9lddOQIFWy8lwM33vK+qK2FoA==
X-Received: by 2002:a62:e509:: with SMTP id n9mr4122196pff.159.1578277358154; 
 Sun, 05 Jan 2020 18:22:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q22sm77320323pfg.170.2020.01.05.18.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jan 2020 18:22:37 -0800 (PST)
Subject: Re: [PATCH v9 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, yong.liang@mediatek.com,
 wim@linux-watchdog.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, chang-an.chen@mediatek.com,
 freddy.hsin@mediatek.com
References: <1578241301-14618-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578241301-14618-2-git-send-email-jiaxin.yu@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <04f9dbd7-4d96-cdbf-0bb2-9c34e8d84dc9@roeck-us.net>
Date: Sun, 5 Jan 2020 18:22:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1578241301-14618-2-git-send-email-jiaxin.yu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_182240_312161_CD0F0B21 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: sboyd@kernel.org, yingjoe.chen@mediatek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 1/5/20 8:21 AM, Jiaxin Yu wrote:
> Add #reset-cells property and update example
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
>   .../reset-controller/mt8183-resets.h          | 17 ++++++++++++++
>   2 files changed, 39 insertions(+)
>   create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
> 

Repeating Rob's question from v8: What happened to the bindings document ?

Guenter

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
> +#define MT2712_TOPRGU_INFRA_SW_RST				0
> +#define MT2712_TOPRGU_MM_SW_RST					1
> +#define MT2712_TOPRGU_MFG_SW_RST				2
> +#define MT2712_TOPRGU_VENC_SW_RST				3
> +#define MT2712_TOPRGU_VDEC_SW_RST				4
> +#define MT2712_TOPRGU_IMG_SW_RST				5
> +#define MT2712_TOPRGU_INFRA_AO_SW_RST				8
> +#define MT2712_TOPRGU_USB_SW_RST				9
> +#define MT2712_TOPRGU_APMIXED_SW_RST				10
> +
> +#define MT2712_TOPRGU_SW_RST_NUM				11
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT2712 */
> diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset-controller/mt8183-resets.h
> index 8804e34ebdd4..a1bbd41e0d12 100644
> --- a/include/dt-bindings/reset-controller/mt8183-resets.h
> +++ b/include/dt-bindings/reset-controller/mt8183-resets.h
> @@ -78,4 +78,21 @@
>   #define MT8183_INFRACFG_AO_I2C7_SW_RST				126
>   #define MT8183_INFRACFG_AO_I2C8_SW_RST				127
>   
> +#define MT8183_INFRACFG_SW_RST_NUM				128
> +
> +#define MT8183_TOPRGU_MM_SW_RST					1
> +#define MT8183_TOPRGU_MFG_SW_RST				2
> +#define MT8183_TOPRGU_VENC_SW_RST				3
> +#define MT8183_TOPRGU_VDEC_SW_RST				4
> +#define MT8183_TOPRGU_IMG_SW_RST				5
> +#define MT8183_TOPRGU_MD_SW_RST					7
> +#define MT8183_TOPRGU_CONN_SW_RST				9
> +#define MT8183_TOPRGU_CONN_MCU_SW_RST				12
> +#define MT8183_TOPRGU_IPU0_SW_RST				14
> +#define MT8183_TOPRGU_IPU1_SW_RST				15
> +#define MT8183_TOPRGU_AUDIO_SW_RST				17
> +#define MT8183_TOPRGU_CAMSYS_SW_RST				18
> +
> +#define MT8183_TOPRGU_SW_RST_NUM				19
> +
>   #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8183 */
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
