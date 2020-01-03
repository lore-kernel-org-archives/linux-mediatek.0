Return-Path: <SRS0=lxIO=2Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0181C00523
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 22:13:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1F8021835
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 22:13:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ciEvkUnH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1F8021835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0bfAhko9LwI/qdMxjEJnCIl2YodFMq3QyHkqEGMomY=; b=ciEvkUnH66YOm8
	SLlwyDdoM93qp2i2uABng/55hbPFzELt2Q61YandaCDK9iLfLRWnnp+YZsqNcGb7pgZtJJfVRk7Ez
	VYBINR9xoTIsdMg4zaq+jStSFUsJ99u2geDjiUzRi8U+MSCfiOCUSxkAuIFg2qy7sqzzrrMsoorJ5
	qJ+wUYfTCRC6lft42G81BDhUzE85NfjfnVR3M49LVnvDALVde713URPdR8JYgv0hA+YJujEeGY1C5
	M1lkzJfadsAEt0kMmBtBzV5I+beXqtqZhz/547C55mGh0QleKhywovjEtgk9EpOcx/OXah6GtLVyg
	+PKeIw49GpImhKUgUhWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inVBn-0002aR-RD; Fri, 03 Jan 2020 22:13:03 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inVBi-0002Um-Jj
 for linux-mediatek@lists.infradead.org; Fri, 03 Jan 2020 22:13:01 +0000
Received: by mail-il1-f195.google.com with SMTP id z12so1337915iln.11
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Jan 2020 14:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DgfHDc2ugqDl3Ojv+ZQfPSfnGXvjjxOAehbizu1AkF0=;
 b=OSJS0w1WRTpNggZ1emFv2x1ugVoE8n2VQzYg8D+cIvT4hdmEundX6HYFJzu7C+v+oy
 6q1M7pOaDIdR8d66NIuXeb0SxcqZOGLyDD7o2kr4BjXLFX5MRa18bnbnI9Kw9QjAYVin
 LJV+ZFn3WMTYBa1jfXwlh3KPitjhZ/SLyds3dcGYyp18mvfYOVEIzwsIBdhx/JWZxhmq
 DSPog4NeP3B2kPWKymnLeNSQGVamSb7h+8EKK5n7QmKkTyipfs4vvRVCBsKjohSBsar3
 G4MeQVi8/DNqCpBv01L8ojq69rp/x1BPBsuEbefqSJXRhWZYAcWpAD3saPXFoyZcMh5V
 GXzA==
X-Gm-Message-State: APjAAAW5WMjnU9r/SiFNMQKQ4jzLOntixKvnv2hW0JQD8xAAknxc7ImX
 bnwBlGlHz1Iz5YpI9CjmM9I6RjY=
X-Google-Smtp-Source: APXvYqxQjiQ4TDpKsUvJDXaZR4Npljz2fELiKAofnme1M+74Sm+D726hlD+5UqNFraQgB/QDVGs8JQ==
X-Received: by 2002:a92:5e46:: with SMTP id s67mr78279787ilb.162.1578089577341; 
 Fri, 03 Jan 2020 14:12:57 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id j26sm15164826iok.3.2020.01.03.14.12.55
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 14:12:56 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2219a5
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Fri, 03 Jan 2020 15:12:55 -0700
Date: Fri, 3 Jan 2020 15:12:55 -0700
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 1/2] [PATCH v8 1/2] dt-bindings: mediatek: mt8183: Add
 #reset-cells
Message-ID: <20200103221255.GA1427@bogus>
References: <1578044245-26939-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578044245-26939-2-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578044245-26939-2-git-send-email-jiaxin.yu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_141258_781102_65101448 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com,
 freddy.hsin@mediatek.com, linux-watchdog@vger.kernel.org, sboyd@kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de,
 yingjoe.chen@mediatek.com, matthias.bgg@gmail.com, chang-an.chen@mediatek.com,
 wim@linux-watchdog.org, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 03, 2020 at 05:37:24PM +0800, Jiaxin Yu wrote:
> Add #reset-cells property and update example
> 
> Change-Id: If3f4f0170d417819facff1fd0a0e5e3c6cc9944d

Drop this.

> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
>  .../reset-controller/mt8183-resets.h          | 17 ++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h

What happened to the binding doc change?

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
>  #define MT8183_INFRACFG_AO_I2C7_SW_RST				126
>  #define MT8183_INFRACFG_AO_I2C8_SW_RST				127
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
>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8183 */
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
