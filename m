Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D1DC07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 16:26:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61EEE613CF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 16:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61EEE613CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MENj1ASqafjUdz070f4hnKHVl8WltSew3zQA+V9elB4=; b=GguJQ6njrMIaLUuWP3SWpjDJ2H
	6mb5k1ussG8YE9oMoltGp98Q9li7Fho1XzRQ/rBUdizsAZ8v5+2MsmridFQgH6Qy0YOloWqwNCsFR
	tXpbC1Kpv36sIOBwtS1QKVqarPbLcxwFhap2bB4KpROgCcEFw9lbuFDz2T24Toj0qG+4YBnAHBgPM
	6ATbyjaqlyb+3NShIM4sbXU78WSWOWeK5GCLSyXXesy5lH/+AbbCPJxSfHIU5hrlBhv219NjeKNgw
	pNvJWuj2W7PBi4Y+v6KzZXgNPyroWO120X0u6SBazdcM2P7QzJkN8rPuD1OZT587VG64si9oq3Q6B
	dJArAISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4QfO-004rBD-SQ; Fri, 16 Jul 2021 16:26:22 +0000
Received: from [2601:1c0:6280:3f0::aefb]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4QfM-004rAm-6x; Fri, 16 Jul 2021 16:26:20 +0000
Subject: Re: [PATCH v6 3/3] power: supply: mt6360_charger: add MT6360 charger
 support
To: Gene Chen <gene.chen.richtek@gmail.com>, sre@kernel.org,
 matthias.bgg@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 inux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 gene_chen@richtek.com, Wilma.Wu@mediatek.com, cy_huang@richtek.com,
 benjamin.chao@mediatek.com
References: <20210716094353.140536-1-gene.chen.richtek@gmail.com>
 <20210716094353.140536-4-gene.chen.richtek@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c636cac0-defe-7bed-8428-818a52040d1b@infradead.org>
Date: Fri, 16 Jul 2021 09:26:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716094353.140536-4-gene.chen.richtek@gmail.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi--

On 7/16/21 2:43 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add basic support for the battery charger for MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  drivers/power/supply/Kconfig          |  11 +
>  drivers/power/supply/Makefile         |   1 +
>  drivers/power/supply/mt6360_charger.c | 867 ++++++++++++++++++++++++++
>  3 files changed, 879 insertions(+)
>  create mode 100644 drivers/power/supply/mt6360_charger.c
> 
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index 11f5368e810e..81f02f8d4377 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -577,6 +577,17 @@ config CHARGER_MP2629
>  	  Battery charger. This driver provides Battery charger power management
>  	  functions on the systems.
>  
> +config CHARGER_MT6360
> +	tristate "Mediatek MT6360 Charger Driver"
> +	depends on MFD_MT6360
> +	depends on REGULATOR
> +	select LINEAR_RANGES
> +	help
> +	  Say Y here to enable MT6360 Charger Part.
> +	  The device supports High-Accuracy Voltage/Current Regulation,
> +	  Average Input Current Regulation, Battery Tempature Sensing,

	                                            Temperature

> +	  Over-Temperature Protection, DPDM Detection for BC1.2
> +
>  config CHARGER_QCOM_SMBB
>  	tristate "Qualcomm Switch-Mode Battery Charger and Boost"
>  	depends on MFD_SPMI_PMIC || COMPILE_TEST


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
