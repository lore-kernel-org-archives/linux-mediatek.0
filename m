Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBB4C54EBD
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Jan 2023 14:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kor8vjbO+pVPjaL4sOSXBHOj4LS1IrZKL2nfYQ+wdE0=; b=A2ekp9Jv4zqH4FUa+qH4uNBLiY
	eeQKtPTiTusCKhzEtpqKRhrSAuvL2Zp0W7l3ccD50KI3Bd4WJ4+A+Jw7nnsf5eD+7fkVVbvmAnIDY
	CtX06F0MrQzB3lyfxU7oThtK3iByPd4zKBOIB8IT8eHuQwom8M0Z6uTFbAP7Mbpt2zzQTqApMbDmz
	YP6A4eArfDos1fBzMVtnUA5KF6VcFZhhJqrlfS5HESJCDx7ABNZ6Px9p6O2pgApbjg076IhAPg4cX
	TbEewmnC7rUC0gbH6cRTWOaCeMtfo+HFTevxbOvmi7zd6VdNO+u+nk6pmUxDcbC1RTW20xVSPDszM
	7SN1qC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEWXK-00E0GN-9W; Sun, 08 Jan 2023 14:20:34 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEWX9-00E0Do-9c; Sun, 08 Jan 2023 14:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673187623; x=1704723623;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uhwP33k79WfVOAOHMUzfxXOTAP/es5YajUb9QxIA5qs=;
  b=jbgKHJQti5fPoExJNUcCS3IN87+TfmqjZ22NhAb2ZxD4zXuOqjk0GK0T
   U06KBiS0fSdtFvGPXLiRZtqFcZ082T6wXrYgh6+QUwejgYnFGBz15GSxd
   qGXgGQQFsRELRugGTdO/FWU4oRQAE0833bRP1cpAgr7bXXYvsXIB0PQ6U
   APMhHW4WcQVIXzL7o5mpHpR0ERWBvN+2NKLTHCW6CwksTWnm50P0XEUBa
   FRORcIy+gP0wb1gyYmVF9LStUeWTDryKkuNUjGLIrgMF8JqwyK5v3Ddss
   /Jegm2t6c6b7nXwGCFzEAfk/FJGco8SZ3zcZfyz8dWcbsFz2CPWBOGwdi
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="303082427"
X-IronPort-AV: E=Sophos;i="5.96,310,1665471600"; 
   d="scan'208";a="303082427"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2023 06:20:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="606354019"
X-IronPort-AV: E=Sophos;i="5.96,310,1665471600"; 
   d="scan'208";a="606354019"
Received: from mckumar-mobl2.gar.corp.intel.com (HELO [10.213.110.20]) ([10.213.110.20])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2023 06:20:14 -0800
Message-ID: <38d010a2-17db-f752-6027-20520ade11bb@linux.intel.com>
Date: Sun, 8 Jan 2023 19:50:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 net-next 5/5] net: wwan: t7xx: Devlink documentation
Content-Language: en-US
To: Jesse Brandeburg <jesse.brandeburg@intel.com>, netdev@vger.kernel.org
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
 <270ae807-6842-b5c9-0b14-fbc1b768fa79@intel.com>
From: "Kumar, M Chetan" <m.chetan.kumar@linux.intel.com>
In-Reply-To: <270ae807-6842-b5c9-0b14-fbc1b768fa79@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_062023_370272_E7701C1A 
X-CRM114-Status: GOOD (  18.74  )
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

On 1/7/2023 12:07 AM, Jesse Brandeburg wrote:
> On 1/6/2023 8:28 AM, m.chetan.kumar@linux.intel.com wrote:
>> From: M Chetan Kumar <m.chetan.kumar@linux.intel.com>
>>
>> Document the t7xx devlink commands usage for fw flashing &
> 
> it would make the documentation easier and faster to read if you just 
> spelled out fw as firmware.

Sure. Will correct all such instances.

> 
>> coredump collection.
>>
>> Refer to t7xx.rst file for details.
>>
>> Signed-off-by: M Chetan Kumar <m.chetan.kumar@linux.intel.com>
>> Signed-off-by: Devegowda Chandrashekar 
>> <chandrashekar.devegowda@intel.com>
>> -- 
>> v3:
>>   * No Change.
>> v2:
>>   * Documentation correction.
>>   * Add param details.
>> ---
>>   Documentation/networking/devlink/index.rst |   1 +
>>   Documentation/networking/devlink/t7xx.rst  | 161 +++++++++++++++++++++
>>   2 files changed, 162 insertions(+)
>>   create mode 100644 Documentation/networking/devlink/t7xx.rst
>>
>> diff --git a/Documentation/networking/devlink/index.rst 
>> b/Documentation/networking/devlink/index.rst
>> index fee4d3968309..0c4f5961e78f 100644
>> --- a/Documentation/networking/devlink/index.rst
>> +++ b/Documentation/networking/devlink/index.rst
>> @@ -66,3 +66,4 @@ parameters, info versions, and other features it 
>> supports.
>>      prestera
>>      iosm
>>      octeontx2
>> +   t7xx
>> diff --git a/Documentation/networking/devlink/t7xx.rst 
>> b/Documentation/networking/devlink/t7xx.rst
>> new file mode 100644
>> index 000000000000..de220878ad76
>> --- /dev/null
>> +++ b/Documentation/networking/devlink/t7xx.rst
>> @@ -0,0 +1,161 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +====================
>> +t7xx devlink support
>> +====================
>> +
>> +This document describes the devlink features implemented by the ``t7xx``
>> +device driver.
>> +
>> +Parameters
>> +==========
>> +The ``t7xx_driver`` driver implements the following driver-specific 
>> parameters.
>> +
>> +.. list-table:: Driver-specific parameters implemented
>> +   :widths: 5 5 5 85
>> +
>> +   * - Name
>> +     - Type
>> +     - Mode
>> +     - Description
>> +   * - ``fastboot``
>> +     - boolean
>> +     - driverinit
>> +     - Set this param to enter fastboot mode.
>> +
>> +Flash Update
>> +============
>> +
>> +The ``t7xx`` driver implements the flash update using the 
>> ``devlink-flash``
>> +interface.
>> +
>> +The driver uses DEVLINK_SUPPORT_FLASH_UPDATE_COMPONENT to identify 
>> the type of
>> +firmware image that need to be programmed upon the request by user 
>> space application.
>> +
>> +The supported list of firmware image types is described below.
>> +
>> +.. list-table:: Firmware Image types
>> +    :widths: 15 85
>> +
>> +    * - Name
>> +      - Description
>> +    * - ``preloader``
>> +      - The first-stage bootloader image
>> +    * - ``loader_ext1``
>> +      - Preloader extension image
>> +    * - ``tee1``
>> +      - ARM trusted firmware and TEE (Trusted Execution Environment) 
>> image
>> +    * - ``lk``
>> +      - The second-stage bootloader image
>> +    * - ``spmfw``
>> +      - MediaTek in-house ASIC for power management image
>> +    * - ``sspm_1``
>> +      - MediaTek in-house ASIC for power management under secure 
>> world image
>> +    * - ``mcupm_1``
>> +      - MediaTek in-house ASIC for cpu power management image
>> +    * - ``dpm_1``
>> +      - MediaTek in-house ASIC for dram power management image
>> +    * - ``boot``
>> +      - The kernel and dtb image
>> +    * - ``rootfs``
>> +      - Root filesystem image
>> +    * - ``md1img``
>> +      - Modem image
>> +    * - ``md1dsp``
>> +      - Modem DSP image
>> +    * - ``mcf1``
>> +      - Modem OTA image (Modem Configuration Framework) for operators
>> +    * - ``mcf2``
>> +      - Modem OTA image (Modem Configuration Framework) for OEM vendors
>> +    * - ``mcf3``
>> +      - Modem OTA image (other usage) for OEM configurations
>> +
>> +``t7xx`` driver uses fastboot protocol for fw flashing. In the fw 
>> flashing
> 
> it would make the documentation easier and faster to read if you just 
> spelled out fw as firmware.
> 
>> +procedure, fastboot command & response are exchanged between driver 
>> and wwan
>> +device.
>> +
>> +The wwan device is put into fastboot mode via devlink reload command, by
>> +passing "driver_reinit" action.
>> +
>> +$ devlink dev reload pci/0000:$bdf action driver_reinit
>> +
>> +Upon completion of fw flashing or coredump collection the wwan device is
>> +reset to normal mode using devlink reload command, by passing 
>> "fw_activate"
>> +action.
>> +
>> +$ devlink dev reload pci/0000:$bdf action fw_activate
>> +
>> +Flash Commands:
>> +===============
>> +
>> +$ devlink dev flash pci/0000:$bdf file 
>> preloader_k6880v1_mdot2_datacard.bin component "preloader"
>> +
>> +$ devlink dev flash pci/0000:$bdf file loader_ext-verified.img 
>> component "loader_ext1"
>> +
>> +$ devlink dev flash pci/0000:$bdf file tee-verified.img component "tee1"
>> +
>> +$ devlink dev flash pci/0000:$bdf file lk-verified.img component "lk"
>> +
>> +$ devlink dev flash pci/0000:$bdf file spmfw-verified.img component 
>> "spmfw"
>> +
>> +$ devlink dev flash pci/0000:$bdf file sspm-verified.img component 
>> "sspm_1"
>> +
>> +$ devlink dev flash pci/0000:$bdf file mcupm-verified.img component 
>> "mcupm_1"
>> +
>> +$ devlink dev flash pci/0000:$bdf file dpm-verified.img component 
>> "dpm_1"
>> +
>> +$ devlink dev flash pci/0000:$bdf file boot-verified.img component 
>> "boot"
>> +
>> +$ devlink dev flash pci/0000:$bdf file root.squashfs component "rootfs"
>> +
>> +$ devlink dev flash pci/0000:$bdf file modem-verified.img component 
>> "md1img"
>> +
>> +$ devlink dev flash pci/0000:$bdf file dsp-verified.bin component 
>> "md1dsp"
>> +
>> +$ devlink dev flash pci/0000:$bdf file OP_OTA.img component "mcf1"
>> +
>> +$ devlink dev flash pci/0000:$bdf file OEM_OTA.img component "mcf2"
>> +
>> +$ devlink dev flash pci/0000:$bdf file DEV_OTA.img component "mcf3"
>> +
>> +Note: Component selects the partition type to be programmed.
>> +
>> +Regions
>> +=======
>> +
>> +The ``t7xx`` driver supports core dump collection when device encounters
>> +an exception. When wwan device encounters an exception, a snapshot of 
>> device
>> +internal data will be taken by the driver using fastboot commands.
>> +
>> +Following regions are accessed for device internal data.
>> +
>> +.. list-table:: Regions implemented
>> +    :widths: 15 85
>> +
>> +    * - Name
>> +      - Description
>> +    * - ``mr_dump``
>> +      - The detailed modem component logs are captured in this region
>> +    * - ``lk_dump``
>> +      - This region dumps the current snapshot of lk
>> +
>> +
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

-- 
Chetan

