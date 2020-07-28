Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C7DC433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 11:43:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4692D206D4
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 11:43:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SLD8LtAG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kg5JIfjZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4692D206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZALhYUTDh5cHL2jBeezV6XthmLFJTdCkPCkUkYjHlTY=; b=SLD8LtAGVB6Ik8g1G8KPcWQRy
	fnhrV/NsB7778KGrXmt6Oe4GhGVA2JEaZ1CL0JebLn0+sKCZjcHNI4EMZFFyBpVS3pK8sfoCLLWCG
	Ky4IvYV/cgPJCmLFvx9t0I45q5XeOtR0lNvPQI/cRKyaKWlraEfC8b047srNGFiiTnqh3ugGpwGso
	XgrP2T2O87/CnfkwbqId9vQHNRTUusNGQ5WWWwor/uWOVgWxONJanOH8f1LdsX1BAWbM1HY94zFKZ
	u1wEIIFCELb0+OKF/7sy2VoqPkmfdSgehQPBiwRwi1KqcG4YV/B1OhMgDyPTZR0r6YfxvznI/GutD
	Hx9ce2ZjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0O1G-0005Om-AQ; Tue, 28 Jul 2020 11:43:42 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0O18-0005Lc-55; Tue, 28 Jul 2020 11:43:35 +0000
Received: by mail-wr1-x443.google.com with SMTP id r2so12889181wrs.8;
 Tue, 28 Jul 2020 04:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YY8pKOcwJD4xG9W6savE5HlL+3GNu21Usj1rV1Jy7eY=;
 b=Kg5JIfjZiTwRt52ZR9xcIlzQP4dbpaiHpxjS5t2LLVa8LCc//EQJR5fWiOSbobaw6f
 RASs0aZDzmLdIg4dnHSw8nxAm38krcFW7omINEnaMSrijSz/FIc/vvRcHULAeHBI947T
 QS+pBwJZtz8QXxXoQwlR80hBAUBblDsDsnq3s66X8guNViocUqYwNW/jCq/y5ejhE7nG
 bIbLZFKYZ3966JO+y/vPaxH32Xn43fYJn7aQX6bTQkFjHwjW+LLgpK96HwD8R1+2XPP5
 9W7XF3fFInPJbl1CfptpMoGBQZLY92tpzYbRFPEllgrHJzHXQJFLD21Li2+xjMPyjext
 Zt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YY8pKOcwJD4xG9W6savE5HlL+3GNu21Usj1rV1Jy7eY=;
 b=ciuVFI4+LEg7dfCqZyViDbYrMg1iene9xygyF7YAFh5hvQ59qhoZlLL2GL+aMZ4vre
 qCyDm8yc8Ap8Dlf/jNJytywl3skhrwteeAnDpsAJX44WhvgPhYGsLtf1PtxAH6BLilBS
 9YXREEzX09wyjdvGNgpU/QAftEY+t0TO56axcFHgBQ+LFZGlNbeEw4IaeShOnOMB4Jof
 NtF0JbIHPpUzog0/WCYO1dB6CYQSVcf5XPauq7+aXhDofXoUEhMyQhDMJptvn7E73P1G
 RL/7wcfqYdN7iwRJpQlkzoTP3UHHtqCsFvnGlikOWUAFC6gRenOmMzy5csaiIvlm3mtS
 +xcg==
X-Gm-Message-State: AOAM530uTpySrQAorfx5YPZKfQp2mNj9iHr6xxtZLdA0UxbvcEWFFvEZ
 T0O3xuWTP0wemcdlX19tze4=
X-Google-Smtp-Source: ABdhPJxwpGy1Qj5Bt8epmU8P3Lo87ZxUfc28bfCO0IJ3PP0BUP4mzW5kO1kVytYnPn6l8PXgOiuGvQ==
X-Received: by 2002:adf:9d85:: with SMTP id p5mr9624993wre.286.1595936611544; 
 Tue, 28 Jul 2020 04:43:31 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id y17sm17639096wrh.63.2020.07.28.04.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 04:43:30 -0700 (PDT)
Subject: Re: [PATCH 1/3] watchdog: mtk_wdt: remove mt8xxx-resets.h
To: Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
 robh+dt@kernel.org
References: <1595932949-7033-1-git-send-email-crystal.guo@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <eb2d8f77-6e4f-9c0d-1556-3db5fa48ada7@gmail.com>
Date: Tue, 28 Jul 2020 13:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595932949-7033-1-git-send-email-crystal.guo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_074334_267274_9CF021CD 
X-CRM114-Status: GOOD (  25.07  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 28/07/2020 12:42, Crystal Guo wrote:
> mt8xxx-resets.h actually just used to define TOPRGU_SW_RST_NUM.
> Instead of resubmit the mt8xxx-reset.h for a new IC, get the number
> of reset bits from dtsi is more easier to maintain.
> 

We want to have all the reset numbers in one header file. It makes no sense to 
pass the reset number in one driver via DTS and in the rest through the header file.

Sorry but from my side this is NACK.

Regards,
Matthias

> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>   drivers/watchdog/mtk_wdt.c | 26 +++++---------------------
>   1 file changed, 5 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index d6a6393..adc88c2 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -9,8 +9,6 @@
>    * Based on sunxi_wdt.c
>    */
>   
> -#include <dt-bindings/reset-controller/mt2712-resets.h>
> -#include <dt-bindings/reset-controller/mt8183-resets.h>
>   #include <linux/delay.h>
>   #include <linux/err.h>
>   #include <linux/init.h>
> @@ -64,18 +62,6 @@ struct mtk_wdt_dev {
>   	struct reset_controller_dev rcdev;
>   };
>   
> -struct mtk_wdt_data {
> -	int toprgu_sw_rst_num;
> -};
> -
> -static const struct mtk_wdt_data mt2712_data = {
> -	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
> -};
> -
> -static const struct mtk_wdt_data mt8183_data = {
> -	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
> -};
> -
>   static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>   			       unsigned long id, bool assert)
>   {
> @@ -248,7 +234,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct mtk_wdt_dev *mtk_wdt;
> -	const struct mtk_wdt_data *wdt_data;
> +	u32 toprgu_sw_rst_num;
>   	int err;
>   
>   	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
> @@ -284,10 +270,10 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>   	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
>   		 mtk_wdt->wdt_dev.timeout, nowayout);
>   
> -	wdt_data = of_device_get_match_data(dev);
> -	if (wdt_data) {
> -		err = toprgu_register_reset_controller(pdev,
> -						       wdt_data->toprgu_sw_rst_num);
> +	err = of_property_read_u32(pdev->dev.of_node, "rst-num",
> +				&toprgu_sw_rst_num);
> +	if (!err) {
> +		err = toprgu_register_reset_controller(pdev, toprgu_sw_rst_num);
>   		if (err)
>   			return err;
>   	}
> @@ -319,9 +305,7 @@ static int mtk_wdt_resume(struct device *dev)
>   #endif
>   
>   static const struct of_device_id mtk_wdt_dt_ids[] = {
> -	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>   	{ .compatible = "mediatek,mt6589-wdt" },
> -	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
