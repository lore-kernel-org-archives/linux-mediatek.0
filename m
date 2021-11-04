Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE336C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 01:01:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76B5F61051
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 01:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76B5F61051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OePfdCWykQsbvWCdpc8NIR0MdYIpAeU/opOsJGetBCM=; b=KLADm0WnROAckHzEZ4AivEgiMF
	pSkuhaoBIekE5dTuVxOXvPXbPjSU3x7VnTGvMjD8iM0DQhiAqwpb0Tg6tqB1EA9kvoqpBpr5vhiG4
	CnpqUMmhDhxwrPn96tqtC0+or6NbgHYLxryFqDx0v6s4eqgyYo+7nAdbu6QXj5NG4wUFWY3FG5ccZ
	4+n+9cUif70U5yY6oK6mFhBEhS2p8Z3W+y1+oM+U0FSzpTEZ0Pig6+h2KSAgwAwVlEedry5RnJ7P3
	21rHSMySN3dJmJY09tBOEA3iPsAwS++Akm+egFfjg7bbfiRv87foZ7hSUJZvpNyxJt/0mTXytqwnv
	wh6qvVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miR8J-007QuR-2Q; Thu, 04 Nov 2021 01:01:35 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQhJ-007GWs-4W
 for linux-mediatek@lists.infradead.org; Thu, 04 Nov 2021 00:33:42 +0000
Received: by mail-oi1-x236.google.com with SMTP id y11so6439325oih.7
 for <linux-mediatek@lists.infradead.org>; Wed, 03 Nov 2021 17:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V213yynwIxju7l3q8g0MgtsXu2d7h87vyCf36TZFlqs=;
 b=PrpMHkrvenNfhrdEz1KKjNM/RFbi0sE9kHYHEJcEmZwLPeIIH9P5xBhYaQAv0iSawk
 8BW76pRAjUq17KgEWmUKi8rxcHwNlhrOkmCCU0cpXwHAvgNa6v2Zy526L3v5ImeXEuTi
 YGATS4n5LFSXiV0ELBgR0JIoO4JCfOJFQi/qmvYu9IQORP5OSu6dCFj+F4UfDnsjvvwL
 H0E0ChuYBwCqnH53fYRFofgNe+GQ3FNpSjFiQu6UL4vCL8TsQK6mZFic4glCDgB0iBZr
 GBOhPydpD0hOmd0mkcU1fIQPl9kwzhEOU9mXE07TKKjMdPPdkn/NWPkp3RONweqvHXNu
 gojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V213yynwIxju7l3q8g0MgtsXu2d7h87vyCf36TZFlqs=;
 b=rql4MX60xjWgx0N48rbN2mv5URpXvY/tnyJ6b57qEY1O/vj8chJDWw/WLxbZ+xTufh
 EB/plOjUet6JQHvVeyFUohVwxQDDgzTGBztsVrRMw0f/WgUBMr7e39U7LWVtAY00JaPY
 oJTpiTG0e0SQWGsZAirR3FsYiYI0o4mJ7OcwfS5n9Uxhy5zvq9gGWvKkJ6T519G/bPLG
 iVqeD2v1o9a+ZIxkTtJsYN0mHqEy0CbmsllIsfixfrcf5k/waiwfmvUdK8rI7JjjGfd3
 rg1jzl1O63WYNvYN/hz7oLRLGOEfdGQYGc0GDWky7W/qQ7rik8wc+7viSZ+Cuu+jFKh2
 ENVg==
X-Gm-Message-State: AOAM533eHKtvCKY5m82pUKnPi68PTL+M6Thc9c6LrUbOLxKdrHwyPbu0
 ZzENSdGOrmdlw07VsJQIJN/4XdIq+6Q=
X-Google-Smtp-Source: ABdhPJzdgacPXftu/R6dwrdkM/3Ju3cAtk67FoEaiVAG22wqfWUC8GRXLT16+yld4B3HfQGKHGBEqQ==
X-Received: by 2002:a05:6808:f92:: with SMTP id
 o18mr11594807oiw.46.1635986019434; 
 Wed, 03 Nov 2021 17:33:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q33sm935221ooh.16.2021.11.03.17.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 17:33:38 -0700 (PDT)
Subject: Re: [PATCH] watchdog: Kconfig: enable MTK watchdog
To: Kevin Hilman <khilman@baylibre.com>, linux-watchdog@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Cc: Fabien Parent <fparent@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20211103230354.915658-1-khilman@baylibre.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <fa77f716-a7c4-5926-3f21-418dc4c37fc5@roeck-us.net>
Date: Wed, 3 Nov 2021 17:33:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211103230354.915658-1-khilman@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_173341_250538_7E31D155 
X-CRM114-Status: GOOD (  16.02  )
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

On 11/3/21 4:03 PM, Kevin Hilman wrote:
> Enable CONFIG_MEDIATEK_WATCHDOG when ARCH_MEDIATEK is enabled.
> 
> On some platforms (e.g. mt8183-pumpkin), watchdog is enabled by
> bootloader, so kernel driver needs to be enabled to avoid watchdog
> firing and causing reboot part way through kernel boot.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index bf59faeb3de1..00bebbb8f877 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -836,6 +836,7 @@ config MESON_WATCHDOG
>   config MEDIATEK_WATCHDOG
>   	tristate "Mediatek SoCs watchdog support"
>   	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	default ARCH_MEDIATEK
>   	select WATCHDOG_CORE
>   	select RESET_CONTROLLER
>   	help
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
