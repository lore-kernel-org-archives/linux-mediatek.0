Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBD4C54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 16:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRKMuVkneFvREnyu1Vl23u59Xa9YuhrxlvR3auAjLW8=; b=w+u20bsyOek06RMR+LuPrx5BBi
	Go/czT0l/SOkfrt/4kF1YKX6Gn97GNAJVW4+zmtZKKxGRR9FBKneVnLB9mCz10mcURBWWsOiNYkEL
	oqZWIXOVM/CrRXnk7SkGhpIeIOsIRPRqg8clBp6nYqNjeeDX+tY/p80h4NcU1F1P6jieq9iNVrBRf
	7fcdT8i5qpSgGBNcvkPw0kAoQeIfnSEastZ2P0M+gCQMOyiEjVm+cVHlQxgcUiHm7iTeNh3X1uer7
	DYo563VqT0xdurWk2r3jA/eEjCc+tPV2/b2CUoM11EO6Sj4seeQJwW/pPOLF5rLCrq3L/M3hCNFh1
	/1KVxU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuh2-002UCN-9Z; Mon, 09 Jan 2023 16:08:12 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEugq-002U7d-9E; Mon, 09 Jan 2023 16:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673280480; x=1704816480;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=U2wZo7YImjw8iGThsIb1GjeZZAAZ6xxiPbQ0GHK+dAU=;
  b=Jmy/vqfXwnBIBROC7yu/jR0+Qj10t8Honl5gzlrMqTQ81UvCJ/IscDkI
   Ts7+ElNvOWz9+l3p01o9dE9GmYrEHqyiRA1i8z8klDTc6JK06rM8EEK6Y
   fDjbiKI2QIZk7nq9HXHn9ZCeLSBTHXx44yByADOkAw+YOwzF2QLqMNIU3
   vyRNvhj/RHvxz+RTPnsFMnuv0b1g8JvhEuk4vbpHcu+g+tZU2rcM3eh4D
   sQpsdp4SQc9beqqmD82DNygbN2kpv8Rj0Ub+bEXXWIcRJMLljmK596gfq
   gXmNblUA7Z1iVcaHoeQGka48s5qruc9/yzCo0AWa/610Z36Yt1NX3/kl0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="306424951"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="306424951"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 08:07:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="658646531"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="658646531"
Received: from mckumar-mobl2.gar.corp.intel.com (HELO [10.215.194.243]) ([10.215.194.243])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 08:07:33 -0800
Message-ID: <c7bd8511-7d4f-526a-28b9-215edc6e7c7f@linux.intel.com>
Date: Mon, 9 Jan 2023 21:37:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 net-next 5/5] net: wwan: t7xx: Devlink documentation
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>, netdev@vger.kernel.org
Cc: kuba@kernel.org, davem@davemloft.net, johannes@sipsolutions.net,
 ryazanov.s.a@gmail.com, loic.poulain@linaro.org,
 ilpo.jarvinen@linux.intel.com, ricardo.martinez@linux.intel.com,
 chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
 edumazet@google.com, pabeni@redhat.com, linuxwwan@intel.com,
 linuxwwan_5g@intel.com, chandrashekar.devegowda@intel.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org,
 jiri@nvidia.com, corbet@lwn.net
References: <cover.1673016069.git.m.chetan.kumar@linux.intel.com>
 <500a41cb400b4cdedd6df414b40200a5211965f5.1673016069.git.m.chetan.kumar@linux.intel.com>
 <Y7uOcBRN0Awn5xAb@debian.me>
From: "Kumar, M Chetan" <m.chetan.kumar@linux.intel.com>
In-Reply-To: <Y7uOcBRN0Awn5xAb@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_080800_426131_715F67F5 
X-CRM114-Status: GOOD (  23.97  )
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

Hi Bagas,
Thank you for the feedback.

On 1/9/2023 9:18 AM, Bagas Sanjaya wrote:
> On Fri, Jan 06, 2023 at 09:58:06PM +0530, m.chetan.kumar@linux.intel.com wrote:
>> Refer to t7xx.rst file for details.
> 
> Above line is unnecessary.

Ok. Will drop it.

> 
>> +The wwan device is put into fastboot mode via devlink reload command, by
>> +passing "driver_reinit" action.
>> +
>> +$ devlink dev reload pci/0000:$bdf action driver_reinit
>> +
>> +Upon completion of fw flashing or coredump collection the wwan device is
>> +reset to normal mode using devlink reload command, by passing "fw_activate"
>> +action.
>> +
>> +$ devlink dev reload pci/0000:$bdf action fw_activate
> 
> Personally I prefer to put command-line explanations below the actual
> command:

Sure. Will keep explanation under the command.

> 
> ---- >8 ----
> 
> diff --git a/Documentation/networking/devlink/t7xx.rst b/Documentation/networking/devlink/t7xx.rst
> index de220878ad7649..24f9e0ee69bffb 100644
> --- a/Documentation/networking/devlink/t7xx.rst
> +++ b/Documentation/networking/devlink/t7xx.rst
> @@ -74,17 +74,21 @@ The supported list of firmware image types is described below.
>   procedure, fastboot command & response are exchanged between driver and wwan
>   device.
>   
> +::
> +
> +  $ devlink dev reload pci/0000:$bdf action driver_reinit
> +
>   The wwan device is put into fastboot mode via devlink reload command, by
>   passing "driver_reinit" action.
>   
> -$ devlink dev reload pci/0000:$bdf action driver_reinit
> +::
> +
> +  $ devlink dev reload pci/0000:$bdf action fw_activate
>   
>   Upon completion of fw flashing or coredump collection the wwan device is
>   reset to normal mode using devlink reload command, by passing "fw_activate"
>   action.
>   
> -$ devlink dev reload pci/0000:$bdf action fw_activate
> -
>   Flash Commands:
>   ===============
>   
> 
> However, I find it's odd to jump from firmware image type list directly to
> devlink usage. Perhaps the latter should be put into the following section
> below?

Ok. Will move image type list under Flash Commands.

> 
> I also find that there is minor inconsistency of keyword formatting, so I
> have to inline-code the uninlined remainings:

Ok. Will correct it.

> 
> ---- >8 ----
> 
> diff --git a/Documentation/networking/devlink/t7xx.rst b/Documentation/networking/devlink/t7xx.rst
> index 24f9e0ee69bffb..d8feefe116c978 100644
> --- a/Documentation/networking/devlink/t7xx.rst
> +++ b/Documentation/networking/devlink/t7xx.rst
> @@ -29,7 +29,7 @@ Flash Update
>   The ``t7xx`` driver implements the flash update using the ``devlink-flash``
>   interface.
>   
> -The driver uses DEVLINK_SUPPORT_FLASH_UPDATE_COMPONENT to identify the type of
> +The driver uses ``DEVLINK_SUPPORT_FLASH_UPDATE_COMPONENT`` to identify the type of
>   firmware image that need to be programmed upon the request by user space application.
>   
>   The supported list of firmware image types is described below.
> @@ -79,14 +79,14 @@ device.
>     $ devlink dev reload pci/0000:$bdf action driver_reinit
>   
>   The wwan device is put into fastboot mode via devlink reload command, by
> -passing "driver_reinit" action.
> +passing ``driver_reinit`` action.
>   
>   ::
>   
>     $ devlink dev reload pci/0000:$bdf action fw_activate
>   
>   Upon completion of fw flashing or coredump collection the wwan device is
> -reset to normal mode using devlink reload command, by passing "fw_activate"
> +reset to normal mode using devlink reload command, by passing ``fw_activate``
>   action.
>   
>   Flash Commands:
>   
>> +
>> +Flash Commands:
>> +===============
> 
> Trim the unneeded trailing colon on the section title.

Ok. will drop it.

> 
>> +
>> +$ devlink dev flash pci/0000:$bdf file preloader_k6880v1_mdot2_datacard.bin component "preloader"
>> +
>> +$ devlink dev flash pci/0000:$bdf file loader_ext-verified.img component "loader_ext1"
>> +
>> +$ devlink dev flash pci/0000:$bdf file tee-verified.img component "tee1"
>> +
>> +$ devlink dev flash pci/0000:$bdf file lk-verified.img component "lk"
>> +
>> +$ devlink dev flash pci/0000:$bdf file spmfw-verified.img component "spmfw"
>> +
>> +$ devlink dev flash pci/0000:$bdf file sspm-verified.img component "sspm_1"
>> +
>> +$ devlink dev flash pci/0000:$bdf file mcupm-verified.img component "mcupm_1"
>> +
>> +$ devlink dev flash pci/0000:$bdf file dpm-verified.img component "dpm_1"
>> +
>> +$ devlink dev flash pci/0000:$bdf file boot-verified.img component "boot"
>> +
>> +$ devlink dev flash pci/0000:$bdf file root.squashfs component "rootfs"
>> +
>> +$ devlink dev flash pci/0000:$bdf file modem-verified.img component "md1img"
>> +
>> +$ devlink dev flash pci/0000:$bdf file dsp-verified.bin component "md1dsp"
>> +
>> +$ devlink dev flash pci/0000:$bdf file OP_OTA.img component "mcf1"
>> +
>> +$ devlink dev flash pci/0000:$bdf file OEM_OTA.img component "mcf2"
>> +
>> +$ devlink dev flash pci/0000:$bdf file DEV_OTA.img component "mcf3"
>> +
>> <snipped>...
>> +Region commands
>> +===============
>> +
>> +$ devlink region show
>> +
>> +
>> +$ devlink region new mr_dump
>> +
>> +$ devlink region read mr_dump snapshot 0 address 0 length $len
>> +
>> +$ devlink region del mr_dump snapshot 0
>> +
>> +$ devlink region new lk_dump
>> +
>> +$ devlink region read lk_dump snapshot 0 address 0 length $len
>> +
>> +$ devlink region del lk_dump snapshot 0
>> +
>> +Note: $len is actual len to be dumped.
> 
> Please briefly describe these devlink commands.

Ok. Will add some explanations.

> 
> Also, wrap them in literal code blocks:
> 
> ---- >8 ----
> 
> diff --git a/Documentation/networking/devlink/t7xx.rst b/Documentation/networking/devlink/t7xx.rst
> index d8feefe116c978..1ba3ba4680e721 100644
> --- a/Documentation/networking/devlink/t7xx.rst
> +++ b/Documentation/networking/devlink/t7xx.rst
> @@ -92,35 +92,65 @@ action.
>   Flash Commands:
>   ===============
>   
> -$ devlink dev flash pci/0000:$bdf file preloader_k6880v1_mdot2_datacard.bin component "preloader"
> +::
>   
> -$ devlink dev flash pci/0000:$bdf file loader_ext-verified.img component "loader_ext1"
> +  $ devlink dev flash pci/0000:$bdf file preloader_k6880v1_mdot2_datacard.bin component "preloader"
>   
> -$ devlink dev flash pci/0000:$bdf file tee-verified.img component "tee1"
> +::
>   
> -$ devlink dev flash pci/0000:$bdf file lk-verified.img component "lk"
> +  $ devlink dev flash pci/0000:$bdf file loader_ext-verified.img component "loader_ext1"
>   
> -$ devlink dev flash pci/0000:$bdf file spmfw-verified.img component "spmfw"
> +::
>   
> -$ devlink dev flash pci/0000:$bdf file sspm-verified.img component "sspm_1"
> +  $ devlink dev flash pci/0000:$bdf file tee-verified.img component "tee1"
>   
> -$ devlink dev flash pci/0000:$bdf file mcupm-verified.img component "mcupm_1"
> +::
>   
> -$ devlink dev flash pci/0000:$bdf file dpm-verified.img component "dpm_1"
> +  $ devlink dev flash pci/0000:$bdf file lk-verified.img component "lk"
>   
> -$ devlink dev flash pci/0000:$bdf file boot-verified.img component "boot"
> +::
>   
> -$ devlink dev flash pci/0000:$bdf file root.squashfs component "rootfs"
> +  $ devlink dev flash pci/0000:$bdf file spmfw-verified.img component "spmfw"
>   
> -$ devlink dev flash pci/0000:$bdf file modem-verified.img component "md1img"
> +::
>   
> -$ devlink dev flash pci/0000:$bdf file dsp-verified.bin component "md1dsp"
> +  $ devlink dev flash pci/0000:$bdf file sspm-verified.img component "sspm_1"
>   
> -$ devlink dev flash pci/0000:$bdf file OP_OTA.img component "mcf1"
> +::
>   
> -$ devlink dev flash pci/0000:$bdf file OEM_OTA.img component "mcf2"
> +  $ devlink dev flash pci/0000:$bdf file mcupm-verified.img component "mcupm_1"
>   
> -$ devlink dev flash pci/0000:$bdf file DEV_OTA.img component "mcf3"
> +::
> +
> +  $ devlink dev flash pci/0000:$bdf file dpm-verified.img component "dpm_1"
> +
> +::
> +
> +  $ devlink dev flash pci/0000:$bdf file boot-verified.img component "boot"
> +
> +::
> +
> +  $ devlink dev flash pci/0000:$bdf file root.squashfs component "rootfs"
> +
> +::
> +
> +  $ devlink dev flash pci/0000:$bdf file modem-verified.img component "md1img"
> +
> +::
> +
> +  $ devlink dev flash pci/0000:$bdf file dsp-verified.bin component "md1dsp"
> +
> +::
> +
> +  $ devlink dev flash pci/0000:$bdf file OP_OTA.img component "mcf1"
> +
> +::
> +
> +  $ devlink dev flash pci/0000:$bdf file OEM_OTA.img component "mcf2"
> +
> +::
> +
> +  $ devlink dev flash pci/0000:$bdf file DEV_OTA.img component "mcf3"
>   
>   Note: Component selects the partition type to be programmed.
>   
> @@ -147,19 +177,31 @@ Following regions are accessed for device internal data.
>   Region commands
>   ===============
>   
> -$ devlink region show
> +::
> +  $ devlink region show
>   
> +::
>   
> -$ devlink region new mr_dump
> +  $ devlink region new mr_dump
>   
> -$ devlink region read mr_dump snapshot 0 address 0 length $len
> +::
>   
> -$ devlink region del mr_dump snapshot 0
> +  $ devlink region read mr_dump snapshot 0 address 0 length $len
>   
> -$ devlink region new lk_dump
> +::
>   
> -$ devlink region read lk_dump snapshot 0 address 0 length $len
> +  $ devlink region del mr_dump snapshot 0
>   
> -$ devlink region del lk_dump snapshot 0
> +::
> +
> +  $ devlink region new lk_dump
> +
> +::
> +
> +  $ devlink region read lk_dump snapshot 0 address 0 length $len
> +
> +::
> +
> +  $ devlink region del lk_dump snapshot 0
>   
>   Note: $len is actual len to be dumped.
> 
> Thanks.
> 

Thanks for the inline-code. Will follow the suggested format for 
documentation.

-- 
Chetan

