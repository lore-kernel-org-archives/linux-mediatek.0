Return-Path: <SRS0=JELp=2Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D70C2D0C2
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jan 2020 16:56:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9669522B48
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jan 2020 16:56:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JBEMC9NC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfPnMBLK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9669522B48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BG3dKQZpcixeFmNNKxIl5kcXHoBNdmc+WM4NBMKhdY0=; b=JBEMC9NCvPD+39F8FA1SFOFTc
	WgkknewE5f/MeIAHYNossjt4hyhij+56yr0PB6fLluF9cRkP/YRPMfYvsm5gkJY49AxHECtSXQjoy
	8V2OUAFzmbDTRixkn+ZwLo5dHkfLFjvv0HlRm8INy2oV8hGAO2hNUiR+aGzNgOnovNJY5Ryph2M+P
	WlOTkBVbLM3JY6qmUQFWLXHJHPTA6BIUR/GpwXQT5FClGh6/2wUSGhEY8Y0GmgI87F8+GBGmuDmlX
	/2Ez4atNP83H9jrCaBcRlJREqFN1Nl4tYkFURHjYqNgaU0FGMWWt4VfdNQU18+Ob4rMtM9BmZMjnI
	Jg41Bsvkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inmjQ-0002Bu-U7; Sat, 04 Jan 2020 16:56:56 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inmjM-0002BN-Mf; Sat, 04 Jan 2020 16:56:55 +0000
Received: by mail-pj1-x1041.google.com with SMTP id n59so5968128pjb.1;
 Sat, 04 Jan 2020 08:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9Y8nVeWGgj2uUKifSXncV7kkGBqBgYJeiJmGWBRSYbQ=;
 b=cfPnMBLK1wOt5+DsZJASYMhu232nGiIYRrX75rh23EBpvzERRLn3ouMulKdjJmpot5
 0H2a/saVe4VJ7vfWY80ApCYpAPAxpbmi4LqKRbUYtb71dvJxtRIHCNWLnFQzKvGNdF8l
 7h9F7rN506+wtIBOOA8UtR78HufdklH7n3vMV7Vy2s++qFZlF9KJQHtu9TLMkKvOdpsW
 6pvTFwQgHFHv0EfPKnUa/4O3sY7CRPmFVU3BGXtyChDgkLTZbwKvhCsF2hegr+H3lIez
 yg9AnPQz0BL4DuyulOYIV5DBRXyKj3rdkkANCFO7IyBT0BQbXTMYYShc0hr3/o4+hhpf
 2MHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Y8nVeWGgj2uUKifSXncV7kkGBqBgYJeiJmGWBRSYbQ=;
 b=kt5c80WJaq5VxguWfvqvYxjQi7qDEoLwMP0CRxx8VRJvvFSBpNnX31ejEBWFHHyDM6
 PPzYna2TiHXCZiBElTkcsCwGIL443uzl5jrnZz2SFBxsXKtbc+ecdxPGYxMw9yi9qJTo
 kqcOpBmoi7lCJSPXOa5VMWcCYvd0IU/7jtB2E9FTC4NoX5EDE7Oeaypn8OnBZDVZxGf0
 W3KKJ7Sz2jZIjiZtRzOSK0eJ7MQtgwaBwHRS7J7eO5pqnP5E0co93lQVxDlzcfDM5JeR
 eW7yJTsZBQXJAP2/CFYebzZTKXESNlIOdn8lLVUpdKeOpRqQb43fGC+HDQFmoxqaQjWi
 A/0Q==
X-Gm-Message-State: APjAAAVnRENGNoOdKAlsCOxx1cTjHdK3pA5FaIRaO3AOhS+CsmA7rq3Q
 fvLlHBb0Kgq0mEvRha73+jKb7Ms5
X-Google-Smtp-Source: APXvYqypji4ySRrO2P1UJKiwiNe24+N7reVangsvdU/0ECpr7r7RQGeh7TYaOphnoWP5PiBsEp8cjQ==
X-Received: by 2002:a17:90a:26ab:: with SMTP id
 m40mr34056119pje.42.1578157012007; 
 Sat, 04 Jan 2020 08:56:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g67sm70518134pfb.66.2020.01.04.08.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jan 2020 08:56:51 -0800 (PST)
Subject: Re: [PATCH 1/2] [PATCH v8 1/2] dt-bindings: mediatek: mt8183: Add
 #reset-cells
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, yong.liang@mediatek.com,
 wim@linux-watchdog.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, chang-an.chen@mediatek.com,
 freddy.hsin@mediatek.com
References: <1578044245-26939-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578044245-26939-2-git-send-email-jiaxin.yu@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <8bed8f3e-7a20-2d34-9a33-805c707ff410@roeck-us.net>
Date: Sat, 4 Jan 2020 08:56:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1578044245-26939-2-git-send-email-jiaxin.yu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200104_085652_767522_838E12A0 
X-CRM114-Status: GOOD (  15.42  )
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

On 1/3/20 1:37 AM, Jiaxin Yu wrote:
> Add #reset-cells property and update example
> 
> Change-Id: If3f4f0170d417819facff1fd0a0e5e3c6cc9944d

No Change-Id in upstream kernel code, please.

Guenter

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
