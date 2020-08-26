Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF3EC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 15:30:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 332662078D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 15:30:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LryDCeZK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 332662078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ji+v+sfb+VUC4or875j4ryIfCiEvq/PBj6BfgMrlA40=; b=LryDCeZKQ783Fhwb8AxEEocUv
	DStMASy7GcNTm5IcHhMCyO3F/4nPFmqH4pebYJD7XfHKQpOAx/yV8AtROIbrUlJoIsIEgw5spz0Re
	LB8AhYlYV1IZ6ph8W0ZuTh2MnsBqfj313hHksF6B4h8unaQbfE9VmIR+Cxg6oVIp0zlTYSBlVclwh
	aTfvwoPC2NuL3hmK3aK42mVdLXkIW1R5XIpXdSjQc9ZYbEh9k9wmbFzCZ0GRaoFVk2QcI+VwkLpS1
	lrzYhBAfpwf9tseZcSDsNuJewKDr4F40uwY4hmYHUH6qcPu4P5Dmh2SE64cy0ruVIu5ErnzWR+b5O
	mgRfTLJ+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAxNw-0004vm-Lu; Wed, 26 Aug 2020 15:30:48 +0000
Received: from [2601:1c0:6280:3f0::19c2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAxNs-0004uD-AB; Wed, 26 Aug 2020 15:30:44 +0000
Subject: Re: [PATCH 1/2] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, matthias.bgg@gmail.com
References: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
 <1598441840-15226-2-git-send-email-gene.chen.richtek@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f35bf9c1-6397-3369-954d-fe05d77438cd@infradead.org>
Date: Wed, 26 Aug 2020 08:30:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598441840-15226-2-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org, dmurphy@ti.com,
 linux-leds@vger.kernel.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 8/26/20 4:37 AM, Gene Chen wrote:
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 1c181df..ce95ead 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -271,6 +271,17 @@ config LEDS_MT6323
>  	  This option enables support for on-chip LED drivers found on
>  	  Mediatek MT6323 PMIC.
>  
> +config LEDS_MT6360
> +	tristate "LED Support for Mediatek MT6360 PMIC"
> +	depends on LEDS_CLASS_FLASH && OF
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> +	depends on MFD_MT6360
> +	help
> +	  This option enables support for dual Flash LED drivers found on
> +	  Mediatek MT6360 PMIC.
> +	  Support Torch and Strobe mode independently current source.

	  Supports                      independently of current source.

I'm guessing on that ending; I wasn't sure what was intended, but it doesn't
make sense as posted.


> +	  Include Low-VF and short protection.

	  Includes

> +
>  config LEDS_S3C24XX
>  	tristate "LED Support for Samsung S3C24XX GPIO LEDs"
>  	depends on LEDS_CLASS


thanks.
-- 
~Randy

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
