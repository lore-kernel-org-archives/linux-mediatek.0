Return-Path: <SRS0=X6pk=PL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A42C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 15:50:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81F5860FE8
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 15:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81F5860FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJGrFIUj2veIP2CYGsvQSxsqx9LdxFbovsolbVqkSwk=; b=NNN33+pBrTbxhRnUtUqAMFHT1b
	FatmNKesNVEuwtC5Drfm7al83/h+GEXQAC8pQrfIGYLE7A5V0bMVId2LQBT8C4BwSmvNcCCNmCENk
	x7gmKZXJmNP/gt1fBCwVtLJgZNOD33a4O+816Vk1nVpDsM90nqCJ0zgQS/pE07SXWrplaKZ3C8vNf
	M8iCZpEBt1ok+QuoZwaa19CNElc2klDXtQDKYFDT6h563fUWCeKk/iVcNDBPZbArnyy3Xav+KdaPW
	UczA24LNtMIS7tTGmCvqqjtikBTf5Lmwzr8u2viWm2kWUTPwgTa/hkxET9Kurx9lxgEk9Uynchg0m
	Wh3ITLEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meJHP-00CuBb-DM; Sat, 23 Oct 2021 15:49:55 +0000
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meJHM-00CuB8-W3; Sat, 23 Oct 2021 15:49:53 +0000
Subject: Re: [RFC 06/13] soc: mediatek: apu: Add apu core driver
To: Flora Fu <flora.fu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
 <20211023111409.30463-7-flora.fu@mediatek.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <35b6b7af-87f1-4390-faf8-9f44c192aedd@infradead.org>
Date: Sat, 23 Oct 2021 08:49:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023111409.30463-7-flora.fu@mediatek.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 10/23/21 4:14 AM, Flora Fu wrote:
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index d9bac2710494..074b0cf24c44 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -24,6 +24,24 @@ config MTK_APU_PM
>   	  APU power domain shall be enabled before accessing the
>   	  internal sub modules.
>   
> +config MTK_APU
> +	tristate "MediaTek APUSYS Support"
> +	select REGMAP
> +	select MTK_APU_PM
> +	select MTK_SCP
> +	help
> +	  Say yes here to add support for the APU tinysys. The tinsys is

	                                                       tinysys runs on

> +	  running on a micro processor in APU.

	  a microprocessor in the APU.

> +	  Its firmware is load and boot from Kernel side. Kernel and tinysys use

	               is loaded and booted

> +	  IPI to tx/rx messages.

	      to send/receive messages.

> +
> +config MTK_APU_DEBUG
> +	tristate "MediaTek APUSYS debug functions"
> +	depends on MTK_APU
> +	help
> +	  Say yes here to enalbe debug on APUSYS.

	                  enable

> +	  Disable it if you don't need them.


-- 
~Randy

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
