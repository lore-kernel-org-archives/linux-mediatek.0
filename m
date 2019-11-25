Return-Path: <SRS0=x9ei=ZR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586CEC432C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2019 06:00:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2955F20722
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2019 06:00:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R26dC3Cb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMUCkUkI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2955F20722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/L+zp5bgRYb2pCPzN2THHUFJv+1vKr8VI4s7BgRwMiE=; b=R26dC3Cb0YQXiq
	awuZKojbKBaKZvOZmSCDRr1V9r7ihVQCHi6Sqmzkgn4vyKXw3fN90Sc+m7eNN7GzcNWEki9AmPQYH
	oYzHTLAfq8yBgOBrgurATo/wx8p9btitG7vpHkQqh6sDGY5cwtS8TzwNkFlsJYA9Q9+W3c0rpXifJ
	oo+rMg9UOIxko8jUCiZzUyxYWwRTFV8lyLb4UJxNvA9BPSS+RsE2HMhs6Qxl1Z8afD5N36A75rJb3
	Wdd/0EB8Eutp6cicrTeovxc+MLNnMGq+TBr22qkNO3aJZd5bfZjR9cTNF1CXKKG3GrDAhbfNAincp
	rNsrBmEK747+WxtOZKBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZ7Pp-0005VI-NW; Mon, 25 Nov 2019 06:00:05 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZ7Pn-00052d-7Y; Mon, 25 Nov 2019 06:00:05 +0000
Received: by mail-oi1-x241.google.com with SMTP id x21so4936429oic.0;
 Sun, 24 Nov 2019 22:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eQSarq49DnVw0rcWLXiTYEIu9cTGbAYlx/j0JgRqweY=;
 b=lMUCkUkIx6zDyfj+LRSdHcnBrXHmd7LOs8TV5s0ik4lMR4GRqIkkYCaFkWYk3ja8GJ
 3wr8spZ5sBsgMXOvP/8mpXW9+7YVjYx9JmcqZTSIqB1aukvWhftunZtOPHw/qGuFYDrl
 ByqXNKjKAuPdLrFiBvylCvZOFtgyUPU7lMiLBp3frRuaS0yKw41e8QQK1FcFA98Z9XOz
 xNrDXG4FfSULpnyUvHcRjCpceu2V/YR/erqUQk3jpvBxxdlQngO8fJrt/pPGm3e+X8GC
 089+fj5kQGO70Uxx6wtmMXcZuUsIA0MppdL2FTgg9jqeRm/dbId+usuJXQHfwJ9T3+z3
 bAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=eQSarq49DnVw0rcWLXiTYEIu9cTGbAYlx/j0JgRqweY=;
 b=nSS+rhkHmGMfopvSxkHaE18Amq04k4VaSEbK5I4VZlAzEjd7F8F5r35DDAH8G+2Vwo
 deRDNgF+9TasHklRkkwVvpXn0dNn1xSeK6KCFSmCWo/ERHFmEQYdUhWs0HWqf17KhrOV
 3g9MnzpuzkSAKrA8J5vrju+uRLG9qYVlz+LMbLZ/xLtE1YLJbby1JX7tI/YoBRUCdN+Y
 KdSZ6eyBoXtX5DbUrDfR08Ej8jLhM1tER19AkyjHJHDKGRVG7w0wZxqWqzkcvrDXRmlS
 dqffSxdG0NUzM2Qe78y3A85uS23nMMJq7lzm1dQhzrFV2Qa/Rf8rKfzYYmVEJL0kzZuh
 hRqQ==
X-Gm-Message-State: APjAAAXPjmmOAuEdogia7U6ytrXavlxlEGG3+/n9PE1m/aQzDq2eJ/+C
 yqOH5D3A9JMzKau4dW/Fexo=
X-Google-Smtp-Source: APXvYqwCt0pUp/5ulJPVJkFBTwEMCdOrZj32Tq6wBeqxy3b7qSTAS+1dBmRCxNXy1JlJOaeQ7a/AFQ==
X-Received: by 2002:a05:6808:4c3:: with SMTP id
 a3mr22503775oie.40.1574661601984; 
 Sun, 24 Nov 2019 22:00:01 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id c1sm2101171otn.44.2019.11.24.22.00.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 24 Nov 2019 22:00:01 -0800 (PST)
Date: Sun, 24 Nov 2019 21:59:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
Message-ID: <20191125055959.GB5636@roeck-us.net>
References: <1574651030-29519-1-git-send-email-jiaxin.yu@mediatek.com>
 <1574651030-29519-2-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574651030-29519-2-git-send-email-jiaxin.yu@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191124_220003_302348_936C203D 
X-CRM114-Status: GOOD (  18.76  )
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
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, yong.liang@mediatek.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 eason.yen@mediatek.com, yingjoe.chen@mediatek.com, wim@linux-watchdog.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 25, 2019 at 11:03:49AM +0800, Jiaxin Yu wrote:
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> Add #reset-cells property and update example
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: jiaxin.yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

I keep wondering why your series does not show up in the watchdog patchwork.
Turns out that is not surprising, since you don't copy the watchdog mailing
list. That all but guarantees that it gets lost from my workflow. That is
kind of interesting - there are lots of lists in Cc:, but the two lists
that matter because maintainers need to review it (watchdog and devicetree)
are missing.

Anyway, comment and question below.

> ---
>  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 10 ++++++---
>  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
>  .../reset-controller/mt8183-resets.h          | 15 +++++++++++++
>  3 files changed, 44 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 3ee625d0812f..4dd36bd3f1ad 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -4,6 +4,7 @@ Required properties:
>  
>  - compatible should contain:
>  	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
> +	"mediatek,mt2712-wdt", "mediatek,mt6589-wdt": for MT2712

Is that (still) correct ? After all, behavior is different for those two now.
Just wondering.

Guenter

>  	"mediatek,mt6589-wdt": for MT6589
>  	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
>  	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
> @@ -16,11 +17,14 @@ Required properties:
>  
>  Optional properties:
>  - timeout-sec: contains the watchdog timeout in seconds.
> +- #reset-cells: Should be 1.
>  
>  Example:
>  
> -wdt: watchdog@10000000 {
> -	compatible = "mediatek,mt6589-wdt";
> -	reg = <0x10000000 0x18>;
> +watchdog: watchdog@10007000 {
> +	compatible = "mediatek,mt8183-wdt",
> +		     "mediatek,mt6589-wdt";
> +	reg = <0 0x10007000 0 0x100>;
>  	timeout-sec = <10>;
> +	#reset-cells = <1>;
>  };
> diff --git a/include/dt-bindings/reset-controller/mt2712-resets.h b/include/dt-bindings/reset-controller/mt2712-resets.h
> new file mode 100644
> index 000000000000..e81c8bb311b7
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
> +#define MT2712_TOPRGU_SW_RST_NUM				10
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT2712 */
> diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset-controller/mt8183-resets.h
> index 8804e34ebdd4..d582da6bedae 100644
> --- a/include/dt-bindings/reset-controller/mt8183-resets.h
> +++ b/include/dt-bindings/reset-controller/mt8183-resets.h
> @@ -78,4 +78,19 @@
>  #define MT8183_INFRACFG_AO_I2C7_SW_RST				126
>  #define MT8183_INFRACFG_AO_I2C8_SW_RST				127
>  
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
> +#define MT8183_TOPRGU_SW_RST_NUM				18
> +
>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8183 */
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
