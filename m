Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A35C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 21:36:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C38120684
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 21:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C38120684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wypz8hZzFmizwsZ5TA4rnLk9wVAYG1znIXF8PAxI3ko=; b=z8FDSe9c9Y7Xo5pv3jiuxoXqX
	MKvTECf1OFU8wQjZ2cZmNglgdi3r9CQr86rrnU3dwsm9jE4BE/MXVDoN14kJvJpzjXyCV14tS3JBP
	RjZehqZKC6Ie5TFCmzqhg6fiIVD7JvqBFOdGJQPL0Vsi66HCFRW/x/fsy+koOQGXFPMUmdoOFbUKi
	FBfSrBBvSmntDd00KmS59ilcA3TdjMCJlnd87DUjfNLq/2ZIfFOXwnwp4UBr7Y94GRAIGBkuobF0t
	n1vLBIZG6R7118VCajtdtcqG4GZL3rlXNWJMWxTybmogyec5qItTYsu5dlujnytlk2nDAkUuBR9cZ
	WJBpvZuZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3467-0004z5-LG; Fri, 22 Jan 2021 21:36:03 +0000
Received: from mail-ed1-f48.google.com ([209.85.208.48])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3466-0004yS-01; Fri, 22 Jan 2021 21:36:02 +0000
Received: by mail-ed1-f48.google.com with SMTP id dj23so8151278edb.13;
 Fri, 22 Jan 2021 13:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SkMtSllHFpUQ8QORRPXzW7+ePTF0623ZPgLmVHJs6Fo=;
 b=f32Qp2xqUu1KNZACo/grkmAMQE7ziJvtrvwZhC9aRCXn9msJjadwyMpRu2JoIIgy4K
 /n4fiu8ZR0X8QO4l9n5UNGECeryZI3UcaInzfvrsQ3cehEb4RJpseHRF96Exto5+wFbF
 NbYmLlBlJgxkTD0LryfZkPoSqBkLcZ8uCcZ3wa1rdAS4ZwXH59/plW99atg2k3arf9RZ
 cCO9nhEQDMJqXeR1Ml9RsiGMz1QQeA8slu6yTS72Wx4LZN2t7uTx5dwrsJUwlQDOCNT3
 nzh7IMUqBqRjtvXo7SbDHjDQzCxUDaGirNNQIeCWWs+agzZDkr+4zoxy2vlrjNk5H7eX
 BHsw==
X-Gm-Message-State: AOAM530AtiUEKe2Zke5xLF5bsVYsbeiIBvTHfkxh+q8N8PYco/s9/XhP
 0UHjY7SbxRJz6mL9VtLsidc=
X-Google-Smtp-Source: ABdhPJzyOg235kQhejoZjjhHYiWr6Bp7npq1HcrfeqLsMBqDf51BuMXEE+Y4urYHbsd/eXktSLe02A==
X-Received: by 2002:a05:6402:1ad0:: with SMTP id
 ba16mr7963edb.287.1611351360723; 
 Fri, 22 Jan 2021 13:36:00 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id z1sm6442231edm.89.2021.01.22.13.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 13:35:59 -0800 (PST)
Date: Fri, 22 Jan 2021 22:35:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 3/3] memory: mtk-smi: Switch MTK_SMI to tristate
Message-ID: <20210122213558.qnboqc4obdmipxs4@kozik-lap>
References: <20210121062429.26504-1-yong.wu@mediatek.com>
 <20210121062429.26504-4-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121062429.26504-4-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_163602_067180_A2DAC4DD 
X-CRM114-Status: GOOD (  21.55  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, yi.kuo@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 21, 2021 at 02:24:29PM +0800, Yong Wu wrote:
> This patch switches MTK_SMI to tristate. Support it could be 'm'.
> 
> Meanwhile, Fix a build issue while MTK_SMI is built as module.

s/Fix/fix.

What error is being fixed here? How can I reproduce it? Aren't you just
adjusting it to being buildable by module?

Best regards,
Krzysztof


> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> This patch has a little conflict with the mt8192 iommu patch which
> delete the MTK_LARB_NR_MAX in smi.h(It's still reviewing).
> This patch rebase on the clean v5.11-rc1.
> ---
>  drivers/memory/Kconfig     | 2 +-
>  include/soc/mediatek/smi.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> index 3ea6913df176..d5f0f4680880 100644
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -173,7 +173,7 @@ config JZ4780_NEMC
>  	  memory devices such as NAND and SRAM.
>  
>  config MTK_SMI
> -	bool "Mediatek SoC Memory Controller driver" if COMPILE_TEST
> +	tristate "Mediatek SoC Memory Controller driver" if COMPILE_TEST
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	help
>  	  This driver is for the Memory Controller module in MediaTek SoCs,
> diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
> index 5a34b87d89e3..29e2fb8f33d6 100644
> --- a/include/soc/mediatek/smi.h
> +++ b/include/soc/mediatek/smi.h
> @@ -9,7 +9,7 @@
>  #include <linux/bitops.h>
>  #include <linux/device.h>
>  
> -#ifdef CONFIG_MTK_SMI
> +#if IS_ENABLED(CONFIG_MTK_SMI)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
