Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC5FC54EBD
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Jan 2023 14:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XkV9CHg3AS2ZiVFld3uCNDABctkUpdSzP+hIdJVA6M=; b=HiZ4AXyN1c8F5T9e0KZDUpb+4+
	ysTOTrEZ/Cdd6WjaUKWO+lqfzclRwEGMbS4kXccqbs6hZYzq/500gZjVSwBUJAutWWt+J1/KthdxD
	mtaPc+eZAouSrN4kx9eBQ2yrgDCQFW/5rVVzR1B7K6LX0FMCva0z5Shau5w6CiamAbBLhPYLO3G3A
	fwa9624pbo5iLiS22osWATq6CyOwDaPPtxyhtgBebk6FOWFGHRqcwPsvr3wQpgQvGnDFjnqGQwGOc
	m4SIsGiuq+Iy52GA4Fxq7FZPbmkh222GzfZGtMq3sZXbsPon5o0iB0kqavVV8MU4plKnqg3kGGZw7
	cgDq++dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEWRe-00Dz7B-Pb; Sun, 08 Jan 2023 14:14:42 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEWRS-00Dz3J-IE; Sun, 08 Jan 2023 14:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673187270; x=1704723270;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SC925gniDEpapFVYL+Ri3iaAESIrleJtaNGf3pJgYD4=;
  b=cC1btS8pYAHvUXILYJD0BRcZqp+1xS6GntAax7nrOVdXMAyEBE94XlA5
   mkSeGarxeq+zDxYJEMgbWPbkBTm3AjeXeGTTkS8knkQpUyThqrK+UgOF3
   IVxds5fXx7HUzwg0IlaEJUsOI25JFtsIgachAb67wW1VyO1uVIo3+DSt2
   lj/uqcWKMqSMtlLDQhOIAaxzCRKI9MynWlj8rRTnOGzzVDAa8bzgB3eE8
   kF+CdjqJpIvQ5jqU7WtrZ5NglRn15CSwyo+MntMSDyM5ksHVtlvDhGPpz
   +eSzWQ79ww1ru0N43ETqInjiReY4W9dy6s5V1Amx9suvKJwp3Zh4TFFfp
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="408974313"
X-IronPort-AV: E=Sophos;i="5.96,310,1665471600"; 
   d="scan'208";a="408974313"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2023 06:14:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="745112079"
X-IronPort-AV: E=Sophos;i="5.96,310,1665471600"; 
   d="scan'208";a="745112079"
Received: from bmothe-mobl.gar.corp.intel.com (HELO [10.213.110.20]) ([10.213.110.20])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2023 06:14:11 -0800
Message-ID: <253f689e-ce60-ee87-6ec9-9efc9b001960@linux.intel.com>
Date: Sun, 8 Jan 2023 19:44:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 net-next 3/5] net: wwan: t7xx: PCIe reset rescan
Content-Language: en-US
To: Jesse Brandeburg <jesse.brandeburg@intel.com>, netdev@vger.kernel.org
Cc: kuba@kernel.org, davem@davemloft.net, johannes@sipsolutions.net,
 ryazanov.s.a@gmail.com, loic.poulain@linaro.org,
 ilpo.jarvinen@linux.intel.com, ricardo.martinez@linux.intel.com,
 chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
 edumazet@google.com, pabeni@redhat.com, linuxwwan@intel.com,
 linuxwwan_5g@intel.com, chandrashekar.devegowda@intel.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Madhusmita Sahu <madhusmita.sahu@intel.com>
References: <cover.1673016069.git.m.chetan.kumar@linux.intel.com>
 <568b6ed1fa2ddf9b8f44980bec9a28df7a24662e.1673016069.git.m.chetan.kumar@linux.intel.com>
 <6a8b7eee-2af9-b953-8431-875ea9701a89@intel.com>
From: "Kumar, M Chetan" <m.chetan.kumar@linux.intel.com>
In-Reply-To: <6a8b7eee-2af9-b953-8431-875ea9701a89@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_061430_668386_D97D5BDA 
X-CRM114-Status: GOOD (  19.66  )
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

On 1/7/2023 12:12 AM, Jesse Brandeburg wrote:
> On 1/6/2023 8:27 AM, m.chetan.kumar@linux.intel.com wrote:
>> From: M Chetan Kumar <m.chetan.kumar@linux.intel.com>
>>
>> PCI rescan module implements "rescan work queue".
>> In firmware flashing or coredump collection procedure
>> WWAN device is programmed to boot in fastboot mode and
>> a work item is scheduled for removal & detection.
>>
>> The WWAN device is reset using APCI call as part driver
>> removal flow. Work queue rescans pci bus at fixed interval
>> for device detection, later when device is detect work queue
>> exits.
>>
>> Signed-off-by: Haijun Liu <haijun.liu@mediatek.com>
>> Co-developed-by: Madhusmita Sahu <madhusmita.sahu@intel.com>
>> Signed-off-by: Madhusmita Sahu <madhusmita.sahu@intel.com>
>> Signed-off-by: Ricardo Martinez <ricardo.martinez@linux.intel.com>
>> Signed-off-by: M Chetan Kumar <m.chetan.kumar@linux.intel.com>
>> Signed-off-by: Devegowda Chandrashekar 
>> <chandrashekar.devegowda@intel.com>
>> -- 
>> v3:
>>   * No Change.
>> v2:
>>   * Drop empty line inside critical sections.
>>   * Correct log message.
>>   * Correct logic inside t7xx_always_match().
>>   * Drop hp_enable changes.
>>   * Drop g_ prefix from t7xx_rescan_ctx.
>>   * Use tab before comment in struct decl.
>>   * Remove extra white space.
>>   * Drop modem exception state check.
>>   * Crit section newlines.
>>   * Remove unnecessary header files inclusion.
>>   * Drop spinlock around reset and rescan flow.
>> ---
>>   drivers/net/wwan/t7xx/Makefile          |  3 +-
>>   drivers/net/wwan/t7xx/t7xx_modem_ops.c  |  3 +
>>   drivers/net/wwan/t7xx/t7xx_pci.c        | 56 ++++++++++++++-
>>   drivers/net/wwan/t7xx/t7xx_pci_rescan.c | 96 +++++++++++++++++++++++++
>>   drivers/net/wwan/t7xx/t7xx_pci_rescan.h | 28 ++++++++
>>   5 files changed, 184 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/net/wwan/t7xx/t7xx_pci_rescan.c
>>   create mode 100644 drivers/net/wwan/t7xx/t7xx_pci_rescan.h
>>
>> diff --git a/drivers/net/wwan/t7xx/Makefile 
>> b/drivers/net/wwan/t7xx/Makefile
>> index 268ff9e87e5b..ba5c607404a4 100644
>> --- a/drivers/net/wwan/t7xx/Makefile
>> +++ b/drivers/net/wwan/t7xx/Makefile
>> @@ -17,7 +17,8 @@ mtk_t7xx-y:=    t7xx_pci.o \
>>           t7xx_hif_dpmaif_tx.o \
>>           t7xx_hif_dpmaif_rx.o  \
>>           t7xx_dpmaif.o \
>> -        t7xx_netdev.o
>> +        t7xx_netdev.o \
>> +        t7xx_pci_rescan.o
>>   mtk_t7xx-$(CONFIG_WWAN_DEBUGFS) += \
>>           t7xx_port_trace.o \
>> diff --git a/drivers/net/wwan/t7xx/t7xx_modem_ops.c 
>> b/drivers/net/wwan/t7xx/t7xx_modem_ops.c
>> index cbd65aa48721..2fcaea4694ba 100644
>> --- a/drivers/net/wwan/t7xx/t7xx_modem_ops.c
>> +++ b/drivers/net/wwan/t7xx/t7xx_modem_ops.c
>> @@ -37,6 +37,7 @@
>>   #include "t7xx_modem_ops.h"
>>   #include "t7xx_netdev.h"
>>   #include "t7xx_pci.h"
>> +#include "t7xx_pci_rescan.h"
>>   #include "t7xx_pcie_mac.h"
>>   #include "t7xx_port.h"
>>   #include "t7xx_port_proxy.h"
>> @@ -194,6 +195,8 @@ static irqreturn_t t7xx_rgu_isr_thread(int irq, 
>> void *data)
>>       msleep(RGU_RESET_DELAY_MS);
>>       t7xx_reset_device_via_pmic(t7xx_dev);
>> +    t7xx_rescan_queue_work(t7xx_dev->pdev);
>> +
>>       return IRQ_HANDLED;
>>   }
>> diff --git a/drivers/net/wwan/t7xx/t7xx_pci.c 
>> b/drivers/net/wwan/t7xx/t7xx_pci.c
>> index 871f2a27a398..1e953ec7dd00 100644
>> --- a/drivers/net/wwan/t7xx/t7xx_pci.c
>> +++ b/drivers/net/wwan/t7xx/t7xx_pci.c
>> @@ -38,6 +38,7 @@
>>   #include "t7xx_mhccif.h"
>>   #include "t7xx_modem_ops.h"
>>   #include "t7xx_pci.h"
>> +#include "t7xx_pci_rescan.h"
>>   #include "t7xx_pcie_mac.h"
>>   #include "t7xx_reg.h"
>>   #include "t7xx_state_monitor.h"
>> @@ -715,6 +716,7 @@ static int t7xx_pci_probe(struct pci_dev *pdev, 
>> const struct pci_device_id *id)
>>           return ret;
>>       }
>> +    t7xx_rescan_done();
>>       t7xx_pcie_mac_set_int(t7xx_dev, MHCCIF_INT);
>>       t7xx_pcie_mac_interrupts_en(t7xx_dev);
>> @@ -754,7 +756,59 @@ static struct pci_driver t7xx_pci_driver = {
>>       .shutdown = t7xx_pci_shutdown,
>>   };
>> -module_pci_driver(t7xx_pci_driver);
>> +static int __init t7xx_pci_init(void)
>> +{
>> +    int ret;
>> +
>> +    t7xx_pci_dev_rescan();
>> +    ret = t7xx_rescan_init();
>> +    if (ret) {
>> +        pr_err("Failed to init t7xx rescan work\n");
>> +        return ret;
>> +    }
>> +
>> +    return pci_register_driver(&t7xx_pci_driver);
>> +}
>> +module_init(t7xx_pci_init);
>> +
>> +static int t7xx_always_match(struct device *dev, const void *data)
>> +{
>> +    struct pci_dev *pdev = to_pci_dev(dev);
>> +    const struct pci_device_id *id = data;
>> +
>> +    if (pci_match_id(id, pdev))
>> +        return 1;
>> +
>> +    return 0;
>> +}
>> +
>> +static void __exit t7xx_pci_cleanup(void)
>> +{
>> +    int remove_flag = 0;
>> +    struct device *dev;
>> +
>> +    dev = driver_find_device(&t7xx_pci_driver.driver, NULL, 
>> &t7xx_pci_table[0],
>> +                 t7xx_always_match);
>> +    if (dev) {
>> +        pr_debug("unregister t7xx PCIe driver while device is still 
>> exist.\n");
> 
> nit: s/is still exist/still exists/

Ok, will correct it.

> 
>> +        put_device(dev);
>> +        remove_flag = 1;
>> +    } else {
>> +        pr_debug("no t7xx PCIe driver found.\n");
>> +    }
>> +
>> +    pci_lock_rescan_remove();
>> +    pci_unregister_driver(&t7xx_pci_driver);
>> +    pci_unlock_rescan_remove();
>> +
>> +    t7xx_rescan_deinit();
>> +    if (remove_flag) {
>> +        pr_debug("remove t7xx PCI device\n");
>> +        pci_stop_and_remove_bus_device_locked(to_pci_dev(dev));
>> +    }
>> +}
>> +
>> +module_exit(t7xx_pci_cleanup);
>>   MODULE_AUTHOR("MediaTek Inc");
>>   MODULE_DESCRIPTION("MediaTek PCIe 5G WWAN modem T7xx driver");
>> diff --git a/drivers/net/wwan/t7xx/t7xx_pci_rescan.c 
>> b/drivers/net/wwan/t7xx/t7xx_pci_rescan.c
>> new file mode 100644
>> index 000000000000..67f13c035846
>> --- /dev/null
>> +++ b/drivers/net/wwan/t7xx/t7xx_pci_rescan.c
>> @@ -0,0 +1,96 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2021, MediaTek Inc.
>> + * Copyright (c) 2021-2023, Intel Corporation.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ":t7xx:%s: " fmt, __func__
>> +#define dev_fmt(fmt) "t7xx: " fmt
>> +
>> +#include <linux/delay.h>
>> +#include <linux/pci.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/workqueue.h>
>> +
>> +#include "t7xx_pci.h"
>> +#include "t7xx_pci_rescan.h"
>> +
>> +static struct remove_rescan_context t7xx_rescan_ctx;
>> +
>> +void t7xx_pci_dev_rescan(void)
>> +{
>> +    struct pci_bus *b = NULL;
>> +
>> +    pci_lock_rescan_remove();
>> +    while ((b = pci_find_next_bus(b)))
>> +        pci_rescan_bus(b);
>> +    pci_unlock_rescan_remove();
>> +}
>> +
>> +void t7xx_rescan_done(void)
>> +{
>> +    if (!atomic_read(&t7xx_rescan_ctx.rescan_done)) {
>> +        atomic_set(&t7xx_rescan_ctx.rescan_done, 1);
>> +        pr_debug("Rescan probe\n");
>> +    } else {
>> +        pr_debug("Init probe\n");
>> +    }
>> +}
>> +
>> +static void t7xx_remove_rescan(struct work_struct *work)
>> +{
>> +    int num_retries = RESCAN_RETRIES;
>> +    struct pci_dev *pdev;
>> +
>> +    atomic_set(&t7xx_rescan_ctx.rescan_done, 0);
>> +    pdev = t7xx_rescan_ctx.dev;
>> +
>> +    if (pdev) {
>> +        pci_stop_and_remove_bus_device_locked(pdev);
>> +        pr_debug("start remove and rescan flow\n");
>> +    }
>> +
>> +    do {
>> +        t7xx_pci_dev_rescan();
>> +
>> +        if (atomic_read(&t7xx_rescan_ctx.rescan_done))
>> +            break;
>> +
>> +        msleep(DELAY_RESCAN_MTIME);
>> +    } while (num_retries--);
>> +}
>> +
>> +void t7xx_rescan_queue_work(struct pci_dev *pdev)
>> +{
>> +    if (!atomic_read(&t7xx_rescan_ctx.rescan_done)) {
>> +        dev_err(&pdev->dev, "Rescan failed\n");
>> +        return;
>> +    }
>> +
>> +    t7xx_rescan_ctx.dev = pdev;
>> +    queue_work(t7xx_rescan_ctx.pcie_rescan_wq, 
>> &t7xx_rescan_ctx.service_task);
>> +}
>> +
>> +int t7xx_rescan_init(void)
>> +{
>> +    atomic_set(&t7xx_rescan_ctx.rescan_done, 1);
>> +    t7xx_rescan_ctx.dev = NULL;
>> +
>> +    t7xx_rescan_ctx.pcie_rescan_wq = 
>> create_singlethread_workqueue(MTK_RESCAN_WQ);
>> +    if (!t7xx_rescan_ctx.pcie_rescan_wq) {
>> +        pr_err("Failed to create workqueue: %s\n", MTK_RESCAN_WQ);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    INIT_WORK(&t7xx_rescan_ctx.service_task, t7xx_remove_rescan);
>> +
>> +    return 0;
>> +}
>> +
>> +void t7xx_rescan_deinit(void)
>> +{
>> +    t7xx_rescan_ctx.dev = NULL;
>> +    atomic_set(&t7xx_rescan_ctx.rescan_done, 0);
>> +    cancel_work_sync(&t7xx_rescan_ctx.service_task);
>> +    destroy_workqueue(t7xx_rescan_ctx.pcie_rescan_wq);
>> +}
>> diff --git a/drivers/net/wwan/t7xx/t7xx_pci_rescan.h 
>> b/drivers/net/wwan/t7xx/t7xx_pci_rescan.h
>> new file mode 100644
>> index 000000000000..80b25c44151c
>> --- /dev/null
>> +++ b/drivers/net/wwan/t7xx/t7xx_pci_rescan.h
>> @@ -0,0 +1,28 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only
>> + *
>> + * Copyright (c) 2021, MediaTek Inc.
>> + * Copyright (c) 2021-2023, Intel Corporation.
>> + */
>> +
>> +#ifndef __T7XX_PCI_RESCAN_H__
>> +#define __T7XX_PCI_RESCAN_H__
>> +
>> +#define MTK_RESCAN_WQ "mtk_rescan_wq"
>> +
>> +#define DELAY_RESCAN_MTIME 1000
>> +#define RESCAN_RETRIES 35
>> +
>> +struct remove_rescan_context {
>> +    struct work_struct service_task;
>> +    struct workqueue_struct *pcie_rescan_wq;
>> +    struct pci_dev *dev;
>> +    atomic_t rescan_done;
>> +};
>> +
>> +void t7xx_pci_dev_rescan(void);
>> +void t7xx_rescan_queue_work(struct pci_dev *pdev);
>> +int t7xx_rescan_init(void);
>> +void t7xx_rescan_deinit(void);
>> +void t7xx_rescan_done(void);
>> +
>> +#endif    /* __T7XX_PCI_RESCAN_H__ */
> 

-- 
Chetan

