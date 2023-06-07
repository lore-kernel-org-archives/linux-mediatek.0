Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44252C7EE25
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 17:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFPGwpCQpZDlbK+2dcezD0d5mxiO5AMq/+/AN27SQOM=; b=e/eUlngT0Yh3lXHTj8s9zpp3Y/
	TbatqEsBknc03XcFlKHDD+ofiF1lTyR2Z8HuLwk5Kavrnmwc8CJScmXnOtPT6kdzwq5UTFeirC4jo
	6mTGAjvSs24N/ErUhGIwU1bjMq7FeJS0BDcj9WxFAxSogdYP6v77Jl7qm3USez/HLvVytmk/4whIr
	6gq9zUlEGi1ZQSCaDiFjMTJ/vJWrRAPiAy6pd7u80LB021ulz8CwIeuB0dPRvxGUtJ8AE88981+th
	P0gz/85SduS/jkAeHaZDvzgu+XzUS6TcYCkzqS2GVC3l1eCDHDXrJcHB9wU5qUF9qK9s9Cn9oLqwW
	SO5m/7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6wmm-006gIR-37;
	Wed, 07 Jun 2023 17:17:28 +0000
Received: from mail-pf1-f170.google.com ([209.85.210.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6wmi-006gGW-2v;
	Wed, 07 Jun 2023 17:17:27 +0000
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-652426346bbso3795136b3a.3;
        Wed, 07 Jun 2023 10:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686158244; x=1688750244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFPGwpCQpZDlbK+2dcezD0d5mxiO5AMq/+/AN27SQOM=;
        b=lr9POzfSfSPC7PebaPEmhuy4yme6O0BH5uudLnhleVf8rQcodku2VKmxIVTbmJmJ/a
         Dy1Yrxegu2RiI4l9rR/M5KunGFIp3G3yO0zTw0EZRl8F+SuooXGnAIy1WsLJLdP8hUMi
         sXA+UdHQZrLmBzl8Zc9tcWLi14soaWDSBAkGbzIhBF+ANp3kwTJslUqb4OOOl91bonFg
         zsYZckR4cP7oHxR/Vhzo+PLpMSZTxma7x/zSZcUk8w//wNtZgKafnnpOmS1/pL5XizMl
         3CdR5oKshEdYrDll6eP+GROL9+3YwQ6Pympz3l1JUkHsL3U6Pl8NG9DcVCF5szHRa90n
         NWlA==
X-Gm-Message-State: AC+VfDxLw4Fn7YFEFh7/gtcMyxREBzDWWvYas/zk98r313HV6xo6DrJO
	vBoVFriSkd///ADTsXgONJ8=
X-Google-Smtp-Source: ACHHUZ7v8zzX5zKgbuGtCNfhzwZXUtn5YrrNGyBjX3Hfyxj9y8BR90kt2+NZlmgBHihAc8RVnQ2zPg==
X-Received: by 2002:a05:6a20:7293:b0:10f:13bb:5d4f with SMTP id o19-20020a056a20729300b0010f13bb5d4fmr2039900pzk.2.1686158243558;
        Wed, 07 Jun 2023 10:17:23 -0700 (PDT)
Received: from [192.168.3.219] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id d10-20020a631d0a000000b0051b36aee4f6sm9349487pgd.83.2023.06.07.10.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 10:17:23 -0700 (PDT)
Message-ID: <ed3cad40-5634-ffff-aa29-c14f91c7f8a4@acm.org>
Date: Wed, 7 Jun 2023 10:17:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] scsi: ufs-mediatek: add dependency for RESET_CONTROLLER
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>, Stanley Chu
 <stanley.chu@mediatek.com>, Peter Wang <peter.wang@mediatek.com>,
 Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>, linux-scsi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20230602023957.9187-1-rdunlap@infradead.org>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230602023957.9187-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_101724_945365_A330C2E3 
X-CRM114-Status: GOOD (  17.31  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 6/1/23 19:39, Randy Dunlap wrote:
> When RESET_CONTROLLER is not set, kconfig complains about missing
> dependencies for RESET_TI_SYSCON, so add the missing dependency
> just as is done above for SCSI_UFS_QCOM.
> 
> Silences this kconfig warning:
> 
> WARNING: unmet direct dependencies detected for RESET_TI_SYSCON
>    Depends on [n]: RESET_CONTROLLER [=n] && HAS_IOMEM [=y]
>    Selected by [m]:
>    - SCSI_UFS_MEDIATEK [=m] && SCSI_UFSHCD [=y] && SCSI_UFSHCD_PLATFORM [=y] && ARCH_MEDIATEK [=y]
> 
> Fixes: de48898d0cb6 ("scsi: ufs-mediatek: Create reset control device_link")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: lore.kernel.org/r/202306020859.1wHg9AaT-lkp@intel.com
> Cc: Stanley Chu <stanley.chu@mediatek.com>
> Cc: Peter Wang <peter.wang@mediatek.com>
> Cc: Paul Gazzillo <paul@pgazz.com>
> Cc: Necip Fazil Yildiran <fazilyildiran@gmail.com>
> Cc: linux-scsi@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> ---
>   drivers/ufs/host/Kconfig |    1 +
>   1 file changed, 1 insertion(+)
> 
> diff -- a/drivers/ufs/host/Kconfig b/drivers/ufs/host/Kconfig
> --- a/drivers/ufs/host/Kconfig
> +++ b/drivers/ufs/host/Kconfig
> @@ -72,6 +72,7 @@ config SCSI_UFS_QCOM
>   config SCSI_UFS_MEDIATEK
>   	tristate "Mediatek specific hooks to UFS controller platform driver"
>   	depends on SCSI_UFSHCD_PLATFORM && ARCH_MEDIATEK
> +	depends on RESET_CONTROLLER
>   	select PHY_MTK_UFS
>   	select RESET_TI_SYSCON
>   	help

Hmm ... is the above patch complete? Shouldn't a similar dependency be
added to the ufs-hisi and ufs-sprd drivers? See also the following git
grep output:

$ git grep -nH 'include.*linux/reset.h' */ufs
drivers/ufs/host/ufs-hisi.c:16:#include <linux/reset.h>
drivers/ufs/host/ufs-mediatek.c:21:#include <linux/reset.h>
drivers/ufs/host/ufs-qcom.h:9:#include <linux/reset.h>
drivers/ufs/host/ufs-sprd.c:14:#include <linux/reset.h>

Thanks,

Bart.

