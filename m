Return-Path: <SRS0=zzne=KF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E92C43462
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 13:22:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2244C6121E
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 13:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2244C6121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rCpN+jse6ec3DCQyXi2yoFkvoz1L6NP1D2t1/rCVQQk=; b=O95OneOV9V93uL4jwrmAAG1I0
	Wk2bgrfpjN+zTHa2nNqMJk2wtszU8j7plZe+YERc3Zf4diEBgqXrmYv943T5Mwi+SbW85tyqLcz2z
	C/0WNf0xhmi1/amf7JaK8M7zr5IpLCuXK1UtX9QdspyjqQvnsLU1rw9znzmKvy36dZ+92BDYwgZzd
	tr8PRL3D7wzK0T1mvKRM5L3CIcGSmGTZ+1bvAjMK9VMOzZYeKlUMiVw1Kb2guBEBsPxqmrgLI5lKz
	SvbStv4CY6scm1x6aQvyfOmKURTr2mfXbkqLgTzp+lZ1K18/d8wW34POEuGFdRMjlar7JMIL43xDL
	gr8XnDrqw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg5rV-00ERLk-HQ; Mon, 10 May 2021 13:22:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg5rG-00ERIR-3G
 for linux-mediatek@desiato.infradead.org; Mon, 10 May 2021 13:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=+jxkwaOUOJ3jFOmcNvz3Tue0IZGQ5BF7JUsr74h1aJw=; b=oBO67UaCIG/GYsSGEEv+Dis+Kp
 nx8kxQ3+yamux1yHSdJ5OAmjqy+RFih82Ej29I64kWNguHI0p9FyL+r83XZX+86xZ68egVZsY9U0w
 +eC+/Z2CZqi9KEzugm6n7xKehUj50BABAP6cEokuGOqoLlPwmdP70vLRVYxnPYvxn5CcM+1hCbkq6
 +o+A2+yjDReku2QSJvMI51M2ljpYFwWk5fzUuHGeNFFA6sUrDQlMcRKGzPxMVVKftDV1wXOkDY+vE
 f5H787PwGryJxVgSskdXifbduNBEqkqOKJbrBHuK7PzZ0m/bUdOLcyyzB4UzO6z5Pd8Y3CZk2wbGq
 ewP8xweQ==;
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg5rD-008kE5-6C
 for linux-mediatek@lists.infradead.org; Mon, 10 May 2021 13:22:00 +0000
Received: by mail-oi1-x22b.google.com with SMTP id b25so10520420oic.0
 for <linux-mediatek@lists.infradead.org>; Mon, 10 May 2021 06:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+jxkwaOUOJ3jFOmcNvz3Tue0IZGQ5BF7JUsr74h1aJw=;
 b=RDP3aUcQ3kfWJ2qNsoh+IhGWdL0LuMa+Msfecy1hzGlXdu2bJDPgswWy3KCwJZlNsZ
 bAsc+xlFYhZwQPB5yW9mBLSEkciE60xZIceBINttFLL6brqq7SU/AGT+wFJKoA6c/JV9
 mNZTwH9/XOl5eYDCTMrTvCXpZJK+SVjYNmpMQTc/g/7iI03K2S7VtAVlD7WSJBLM/rsC
 FwOlnPwf0RPbxDMZoLq9xaMbSLfHCkZCxGQaXMNBk5D0cU7pdZ99OC+b7Tb+/9ON3Xpe
 pvWY1uGjSQ3Qrthyl1Ty/1JycRK2CkC5JAptvd5EGCb/CKjGTC32uGe7dgltbqjScrBe
 Ialg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+jxkwaOUOJ3jFOmcNvz3Tue0IZGQ5BF7JUsr74h1aJw=;
 b=XJFDp6HS6FDEKgQGnqnxauJ4NUKVaPb0RhfiwgFt4ikytsI70cvIbZF0g5HqL+a4xz
 o+vl8DK5uvGMgqT2Cb+fQ1rRHmh7Wk3wW7DBcKZKTdFFYQ4ShiGKv64oXhUknH8Jg2im
 yrxOQtMNFg0qQhgg7uEYvXCx5EeREvG9bE5aAb0FqvF/9WzNNXi8iBor9tOumTfz9aSj
 ONvVsrm5FLJsOY0LWOxaR/B7o8Wix07gTGMP+ubDZAmYpJ+GKb0n7y0d3QUzJOX1jg06
 XYcJD9lNqs7KL1d93yQ6/V4350d4d65bE0VkUbWGMZxRYeeWy5gg5/mTW+G4CH6ukyNJ
 /B6g==
X-Gm-Message-State: AOAM532FJFhg4WfhoaGKA1vIY51X/HmAqnq/GgehnlWWP52RkT0XOD/D
 CSykS65xM1maCP0m+Ugoc+8DsueusFE=
X-Google-Smtp-Source: ABdhPJy6MymDO0PEDyxboMgM9f8P8uVZk6fkPf+AT8vff060kvAGClf/HK1lRNlxk11rM2Jjyczt1Q==
X-Received: by 2002:aca:2402:: with SMTP id n2mr11119448oic.113.1620652916908; 
 Mon, 10 May 2021 06:21:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 r2sm3128956otq.28.2021.05.10.06.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 06:21:56 -0700 (PDT)
To: Boris Lysov <arzamas-16@mail.ee>, matthias.bgg@gmail.com,
 robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20210131234425.9773-1-arzamas-16@mail.ee>
 <20210509211702.549-1-arzamas-16@mail.ee>
 <20210509211702.549-2-arzamas-16@mail.ee>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/3] watchdog: mtk_wdt: Refactor code to support more
 SoCs
Message-ID: <efdce3a5-e5b4-19a8-35f1-8a536220bb3f@roeck-us.net>
Date: Mon, 10 May 2021 06:21:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210509211702.549-2-arzamas-16@mail.ee>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_062159_256844_EBE25627 
X-CRM114-Status: GOOD (  24.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 5/9/21 2:17 PM, Boris Lysov wrote:
> This patch makes some constants SoC-dependent to support more watchdogs
> in the future. It adds shifts of WDT_MODE_KEY and SWSYSRST_KEY to
> mtk_wdt_data struct. This is done to bring support for various Mediatek
> watchdogs which use same register structure but slightly different field
> offsets in the UNLOCK_KEY registers. For example, mt6577 watchdog has
> WDT_MODE_KEY and SWSYSRST_KEY at [15:8] instead of currently (and only)
> supported [31:24].
> Moreover, this patch adds SWSYSRST_KEY value to mtk_wdt_data because this
> value also depends on specific SoC watchdog, for example mt6577 uses 0x15
> instead of 0x88.
> 
> Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
> ---
>   drivers/watchdog/mtk_wdt.c | 76 ++++++++++++++++++++++++++++----------
>   1 file changed, 57 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 97ca993bd009..9d3091b12c06 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -44,13 +44,27 @@
>   #define WDT_MODE_IRQ_EN		(1 << 3)
>   #define WDT_MODE_AUTO_START	(1 << 4)
>   #define WDT_MODE_DUAL_EN	(1 << 6)
> -#define WDT_MODE_KEY		0x22000000
> +#define WDT_MODE_KEY		0x22
>   
>   #define WDT_SWRST		0x14
>   #define WDT_SWRST_KEY		0x1209
> -
>   #define WDT_SWSYSRST		0x18U
> -#define WDT_SWSYS_RST_KEY	0x88000000
> +
> +#define MT2712_WDT_MODE_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT2712_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT2712_SWSYSRST_KEY		0x88
> +
> +#define MT6589_WDT_MODE_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT6589_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT6589_SWSYSRST_KEY		0x88
> +
> +#define MT8183_WDT_MODE_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT8183_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT8183_SWSYSRST_KEY		0x88
> +
> +#define MT8192_WDT_MODE_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT8192_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT8192_SWSYSRST_KEY		0x88
>   
>   #define DRV_NAME		"mtk-wdt"
>   #define DRV_VERSION		"1.0"
> @@ -60,6 +74,7 @@ static unsigned int timeout;
>   
>   struct mtk_wdt_dev {
>   	struct watchdog_device wdt_dev;
> +	const struct mtk_wdt_data *data;
>   	void __iomem *wdt_base;
>   	spinlock_t lock; /* protects WDT_SWSYSRST reg */
>   	struct reset_controller_dev rcdev;
> @@ -67,18 +82,37 @@ struct mtk_wdt_dev {
>   
>   struct mtk_wdt_data {
>   	int toprgu_sw_rst_num;
> +	u8 wdt_mode_key_shift;
> +	u8 wdt_swsys_rst_key;
> +	u8 wdt_swsys_rst_key_shift;
>   };
>   
>   static const struct mtk_wdt_data mt2712_data = {
> -	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
> +	.toprgu_sw_rst_num =		MT2712_TOPRGU_SW_RST_NUM,
> +	.wdt_mode_key_shift =		MT2712_WDT_MODE_KEY_SHIFT,
> +	.wdt_swsys_rst_key_shift =	MT2712_SWSYSRST_KEY_SHIFT,
> +	.wdt_swsys_rst_key =		MT2712_SWSYSRST_KEY,
> +};
> +
> +static const struct mtk_wdt_data mt6589_data = {
> +	.toprgu_sw_rst_num =		-1,
> +	.wdt_mode_key_shift =		MT6589_WDT_MODE_KEY_SHIFT,
> +	.wdt_swsys_rst_key_shift =	MT6589_SWSYSRST_KEY_SHIFT,
> +	.wdt_swsys_rst_key =		MT6589_SWSYSRST_KEY,
>   };
>   
>   static const struct mtk_wdt_data mt8183_data = {
> -	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
> +	.toprgu_sw_rst_num =		MT8183_TOPRGU_SW_RST_NUM,
> +	.wdt_mode_key_shift =		MT8183_WDT_MODE_KEY_SHIFT,
> +	.wdt_swsys_rst_key_shift =	MT8183_SWSYSRST_KEY_SHIFT,
> +	.wdt_swsys_rst_key =		MT8183_SWSYSRST_KEY,
>   };
>   
>   static const struct mtk_wdt_data mt8192_data = {
> -	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
> +	.toprgu_sw_rst_num =		MT8192_TOPRGU_SW_RST_NUM,
> +	.wdt_mode_key_shift =		MT8192_WDT_MODE_KEY_SHIFT,
> +	.wdt_swsys_rst_key_shift =	MT8192_SWSYSRST_KEY_SHIFT,
> +	.wdt_swsys_rst_key =		MT8192_SWSYSRST_KEY,
>   };
>   
>   static int toprgu_reset_update(struct reset_controller_dev *rcdev,
> @@ -86,20 +120,20 @@ static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>   {
>   	unsigned int tmp;
>   	unsigned long flags;
> -	struct mtk_wdt_dev *data =
> +	struct mtk_wdt_dev *wdev =

Please do not rename variables. If you dislike that the name matches the name
of the newly introduced structure element, find a different name for that.

Thanks,
Guenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
