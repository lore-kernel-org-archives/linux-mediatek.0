Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D91C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 10:18:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 413EC20658
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 10:18:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="27UTE0Kh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUCUJvfr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 413EC20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BS3lNcl6f10YTtbZi4OOkin4x5BKlmtT4ng2riKsTIs=; b=27UTE0KhQgoDF6rumwf+H95Kr
	Cu0IE2tVqtLTT8wvWaFG7P9bD72ltcCr/i+h360G9G2gn//D8yLCdo4QBJVDz25yJGDYGXqfYkKrF
	kDbZ2N+z5l0Bbe9pPBfg2Fd00X3ByxgHn4y397DoEdCr9W56WGWpXnxTZ1AM/j70TvcO5J0PC4ZHa
	jhBjnkmK++STTXjdx/0CAxDNP+d+BNyte4P8wrvvn8jYKJBhd2fHJPTq5Do0mdgEpUfgYZjQyaT39
	c/+VVJr3JGeaaiX4A1UyoTeSwx+etTGtmj8M2cRP0bR7T45vZ8OXJAwx7Q7p4A+xuPNqU4ScEFt9E
	Wb7l+/2aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8hdz-00085o-Uv; Thu, 20 Aug 2020 10:18:03 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8hdx-00084D-8E; Thu, 20 Aug 2020 10:18:02 +0000
Received: by mail-lj1-x243.google.com with SMTP id y2so1483774ljc.1;
 Thu, 20 Aug 2020 03:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kYwjflgRQVoui32eapBhBFxV9IoHyH7UykeWpPqQmtM=;
 b=YUCUJvfrTEooGe2XmrcE5ooa0JrwV+Mh0xPCIgP0m4H3+6vDf4NkhTLQmKh322gIa7
 y5EdIV0jnmdsV/BsN9zhxZBk2UnrRxTTKYU5Fg6pOXUGkEceJt3FK1uBmEPe0O6EZD4m
 jxVmBi6A2rR492QA2Kdce72+QUA0XLeh3l8kHpIMy7NZqGq4p/CkGsw5SyRqov6ydrgh
 26i3+kV0DS2CEoMpWYwj/l48eLpF6QMwCJXFt0nknR51Kf3yLPmkDbXbrC8/wSDimJ0R
 pzOk4cjzaQzSm1E68kujkeGofsy0Z0JFM490+h698hLK6ZQznCqJzw7XTZwvqEig0QG1
 gQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kYwjflgRQVoui32eapBhBFxV9IoHyH7UykeWpPqQmtM=;
 b=RS0apAv6VZnci62NzlzDdUqBExEF7kcT1jR9Fi8fO1UrW26pSlInNbBmuHyIoOCpV8
 UbEskr4/y9JY/LAdqB9Me+vsIhQKn48ZDHVgtuRvHw4UOsEh1nZq2nVgNz90czIjg9nW
 hxo6fCaqA/kf2hKlvj50ttnju6lyOuWe0RpTmYRHjSNlfhtih4HanRxyfSw/XZMzyIwa
 Dji3la5+XkMNrkke3GQDsEBhmKkp+yp9Kjf7lf+ZKlu7EcPxnbetPyOsFO20Ax0+B9rf
 y91qZBN7EU8qCPc2JvHKhsJReSu5vFjAc7sPtGz0d0s8Lpf+YZmn9+YI19mDEV9wqzDG
 EOAQ==
X-Gm-Message-State: AOAM533+VrbUSmfzWF/CKOeaNe+97aJXQUdJxUYegyP3Y17T7Za2VBbO
 fH2iLKiualK40LyoW4P+wd8=
X-Google-Smtp-Source: ABdhPJwjqkY0cuKDRZWTWyb21YTWtVQeguRgHHXFYAGtSOBhfdTWpQwdx2DJIDTAdHIjmI9++VNqjw==
X-Received: by 2002:a2e:9d17:: with SMTP id t23mr1247335lji.456.1597918679697; 
 Thu, 20 Aug 2020 03:17:59 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:42ab:a165:4cb2:5f04:a1e8:63b?
 ([2a00:1fa0:42ab:a165:4cb2:5f04:a1e8:63b])
 by smtp.gmail.com with ESMTPSA id p8sm403098lfh.64.2020.08.20.03.17.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 03:17:59 -0700 (PDT)
Subject: Re: [PATCH v2 09/11] usb: phy: phy-mv-usb: convert to
 readl_poll_timeout_atomic()
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <1597902349-8998-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597902349-8998-9-git-send-email-chunfeng.yun@mediatek.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <c28a906c-ed1a-8884-3016-b8664a313331@gmail.com>
Date: Thu, 20 Aug 2020 13:17:49 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597902349-8998-9-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_061801_341223_F9932B7E 
X-CRM114-Status: GOOD (  20.66  )
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20.08.2020 8:45, Chunfeng Yun wrote:

> Use readl_poll_timeout_atomic() to simplify code
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: udelay 10us instead of 20us according to kerneldoc
> ---
>   drivers/usb/phy/phy-mv-usb.c | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mv-usb.c b/drivers/usb/phy/phy-mv-usb.c
> index ce767ec..e801569 100644
> --- a/drivers/usb/phy/phy-mv-usb.c
> +++ b/drivers/usb/phy/phy-mv-usb.c
> @@ -8,6 +8,7 @@
>   #include <linux/module.h>
>   #include <linux/kernel.h>
>   #include <linux/io.h>
> +#include <linux/iopoll.h>
>   #include <linux/uaccess.h>
>   #include <linux/device.h>
>   #include <linux/proc_fs.h>
> @@ -135,8 +136,8 @@ static int mv_otg_set_timer(struct mv_otg *mvotg, unsigned int id,
>   
>   static int mv_otg_reset(struct mv_otg *mvotg)
>   {
> -	unsigned int loops;
>   	u32 tmp;
> +	int ret;
>   
>   	/* Stop the controller */
>   	tmp = readl(&mvotg->op_regs->usbcmd);
> @@ -146,15 +147,12 @@ static int mv_otg_reset(struct mv_otg *mvotg)
>   	/* Reset the controller to get default values */
>   	writel(USBCMD_CTRL_RESET, &mvotg->op_regs->usbcmd);
>   
> -	loops = 500;
> -	while (readl(&mvotg->op_regs->usbcmd) & USBCMD_CTRL_RESET) {
> -		if (loops == 0) {
> -			dev_err(&mvotg->pdev->dev,
> +	ret = readl_poll_timeout_atomic(&mvotg->op_regs->usbcmd, tmp,
> +				(tmp & USBCMD_CTRL_RESET), 10, 10000);
> +	if (ret < 0) {
> +		dev_err(&mvotg->pdev->dev,
>   				"Wait for RESET completed TIMEOUT\n");

    You forgot to re-align this argument, it should start under & on the 
previous line...

[...]

MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
