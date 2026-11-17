Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794F5606A336
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R89WYuJP;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lv8QReDo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f6uY2JVEGVtzYN21lOZWPDHJr2zwjadsZxpjqzELALE=; b=R89WYuJPMYrSQd2h5K1OO/K9xW
	0g7fhUqLDS6crqXTH5MDZbthWpc26yF/bN5E+z6bzvFLvYIvdq++pKJeC4okS1CLHvixvqc0UPVGt
	oB8mk7okQB2T8IoZA7FvXyPxKXhVc0keladJLq1iMyL4nszT8DmEsIpwZX4ImejIeljk7e6+2iBZv
	aSX50CbWR2dfjCzSYU3DmULcwPSsufwAmSkwXqzQEopW4ksFby/OP5rFCzlLBaiDbPDvMUC/UfwFL
	UGJ3wVFmcN0+7h8PLnbB12U53wB0Y9JtdUeQw2XqgSl+N3vMPOUUA4umAMkDIIFSbUblOuuneFIjM
	3WdUt0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIgB-00000005kWv-3ZS6;
	Tue, 17 Nov 2026 12:52:55 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIg3-00000005kSF-1o12;
	Tue, 17 Nov 2026 12:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794919968; x=1826455968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Q275WPfEwe6W7pcEp+TL6ULow3PdvnztyW6fJYb3THY=;
  b=Lv8QReDo55QecuW63YPccindqIAJ9UUZ6mT/2BIl5WZGcyzoOJPlkEYM
   GQ0tnfPDrtMWI+aLINZ/9fnKHU+FfOXH6/gtVPlWuVlWXWBffbYFIwjd/
   pF3X+C5gSUsl9niFAHJAfdgFVZBQ53pP6ZRc6bl2nw8m5M1pNAvr3M/gE
   hQ03BCEGAHdZ4LOEgrCKvB5BSO1J0LdFQGtC30Kwnz01G52SHeOZWHsu3
   WhZa8miOfOSHKkeC7wq9T2ZJX+p+IybmstIXW30hEqQw/yUtrz/GLToAm
   HbpZhAtKperQR9OPRIO5uzXixeT7HC/4ukybQTTD/VHWZuv5o6J6CVNp1
   w==;
X-CSE-ConnectionGUID: v3Ff7c5ETRu8Y6vn9FqQVA==
X-CSE-MsgGUID: zrKwJ6doRgeCj/wyN02e4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3586368"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3586368"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 04:52:46 -0800
X-CSE-ConnectionGUID: zt3FFLAASBSXX040rUVezA==
X-CSE-MsgGUID: c+7/hjrnTf+VX3mUHBpZ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9768168"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2026 04:52:42 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3EBB499; Tue, 17 Nov 2026 13:52:41 +0100 (CET)
Date: Tue, 17 Nov 2026 13:52:41 +0100
From: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 4/7] thunderbolt: add platform NHI driver
Message-ID: <20261117125241.GA259790@black.igk.intel.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-5-chunfeng.yun@mediatek.com>
 <20261110143758.GC259790@black.igk.intel.com>
 <2807832e631dca98846d201b571f623210820268.camel@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2807832e631dca98846d201b571f623210820268.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_045247_547907_33C76B53 
X-CRM114-Status: GOOD (  41.76  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Tue, Nov 17, 2026 at 12:14:29PM +0000, Chunfeng Yun (云春峰) wrote:
> On 二, 2026-11-10 at 15:37 +0100, Mika Westerberg wrote:
> > On Tue, Nov 10, 2026 at 07:48:52PM +0800, Chunfeng Yun wrote:
> > >  
> > > -void nhi_enable_int_throttling(struct tb_nhi *nhi);
> > >  void nhi_disable_interrupts(struct tb_nhi *nhi);
> > >  irqreturn_t tb_nhi_isr(int irq, void *data);
> > >  irqreturn_t tb_ring_msix(int irq, void *data);
> > > diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> > > index 9379c598a221..698f47ec63da 100644
> > > --- a/drivers/thunderbolt/pci.c
> > > +++ b/drivers/thunderbolt/pci.c
> > > @@ -736,4 +736,5 @@ static struct pci_driver nhi_driver = {
> > >  	.shutdown = nhi_pci_shutdown,
> > >  	.driver.pm = &tb_nhi_pm_ops,
> > >  };
> > > +
> > 
> > I guess this is unintented change?
> > 
> will drop it
> 
> > >  module_pci_driver(nhi_driver);
> > > diff --git a/drivers/thunderbolt/platform.c
> > > b/drivers/thunderbolt/platform.c
> > > new file mode 100644
> > > index 000000000000..3562b6c7ea7d
> > > --- /dev/null
> > > +++ b/drivers/thunderbolt/platform.c
> > > @@ -0,0 +1,172 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Thunderbolt driver - NHI driver (Platform bus specific
> > > implementation)
> > > + *
> > > + * Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > + */
> > > +
> > > +#include <linux/acpi.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/pm_wakeirq.h>
> > > +#include <linux/slab.h>
> > > +
> > > +#include "nhi.h"
> > > +#include "tb.h"
> > > +
> > > +static int nhi_platform_init(struct tb_nhi *nhi)
> > > +{
> > > +	/* avoid device link fail for pcie tunnel */
> > 
> > Do you have the ACPI _DSD there in place? 
> Yes, we use the same uefi as WoA which pass Windows HLK and usb-if
> certitfication
> 
> > Then I don't think you need
> > these. And "pcie" -> "PCIe" everywhere (except in code).
> ACK
> 
> > 
> > > +	pm_runtime_set_active(nhi->dev);
> > > +	pm_runtime_get_noresume(nhi->dev);
> > > +	pm_runtime_enable(nhi->dev);
> > > +
> > > +	device_set_wakeup_capable(nhi->dev, true);
> > > +	device_enable_async_suspend(nhi->dev);
> > 
> > I also suggest not to enable all the fancy power management until you
> > have
> > the basic stuff like tunneling fully functional.
> I'm not sure understand what you mean.
> 
> if you mean the function test:
> I already test usb4net, usb3 tunnel, PCIe tunnel and dp tunnel data
> transfers, and also runtime suspend/resume and system suspend/resume.
> 
> if you mean when to enable pm:
> do you mean enable pm at the enable of tb_nhi_probe()?
> 
> +	pm_runtime_set_active(nhi->dev);
> +	pm_runtime_get_noresume(nhi->dev);
> +	pm_runtime_enable(nhi->dev);
> 
> these three line shall be put before nhi_select_cm(), otherwise, it
> fail to link PCIe devices, and I will check it again.
> 
> +	device_set_wakeup_capable(nhi->dev, true);
> +	device_enable_async_suspend(nhi->dev);
> 
> these two line can be put at the end of probe.

I meant device_enable_async_suspend() it's not stricly required and we
don't do it elsewhere so I would leave it out now and then add it
everywhere later.

> 
> if you have any suggestions, please describe more details, I will try
> it.
> 
> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void nhi_platform_clear_wake_irq(void *dev)
> > > +{
> > > +	dev_pm_clear_wake_irq(dev);
> > > +}
> > > +
> > > +static int nhi_platform_init_irq(struct tb_nhi *nhi)
> > > +{
> > > +	struct device *dev = nhi->dev;
> > > +	int ret;
> > > +
> > > +	ret = devm_request_irq(dev, nhi->irq, tb_nhi_isr,
> > > IRQF_NO_SUSPEND,
> > > +			       dev_name(dev), nhi);
> > > +	if (ret)
> > > +		return dev_err_probe(dev, ret, "request irq
> > > failed\n");
> > 
> > failed to request interrupt
> > 
> > Please be consistent with the rest of the driver.
> ACK
> > 
> > > +
> > > +	if (nhi->wake_irq) {
> > > +		ret = dev_pm_set_dedicated_wake_irq(dev, nhi-
> > > >wake_irq);
> > > +		if (ret) {
> > > +			return dev_err_probe(dev, ret, "set wake
> > > irq %d failed\n", nhi->wake_irq);
> > 
> > Split this into 2 lines.
> ACK
> > 
> > > +		}
> > > +
> > > +		dev_info(dev, "wake irq %d\n", nhi->wake_irq);
> > 
> > Remove this. The driver should be silent when it works. You can add
> > debug
> > but I don't think this is useful.
> ACK
> > 
> > > +
> > > +		ret = devm_add_action_or_reset(dev,
> > > nhi_platform_clear_wake_irq, dev);
> > 
> > Can you pass dev_pm_clear_wake_irq directly here?
> 
> the parameter type do not match which cause build warning
> 
> kernel/mediatek/drivers/thunderbolt/platform.c:8:
> kernel/mediatek/drivers/thunderbolt/platform.c: In function
> 'nhi_platform_init_irq':
> kernel/mediatek/drivers/thunderbolt/platform.c:53:53: error: passing
> argument 2 of '__devm_add_action_or_reset' from incompatible pointer
> type [-Werror=incompatible-pointer-types]
>    53 |                 ret = devm_add_action_or_reset(dev,
> dev_pm_clear_wake_irq, dev);
>       |                                                    
> ^~~~~~~~~~~~~~~~~~~~~
>       |                                                     |
>       |                                                     void
> (*)(struct device *)
> upstream/k7/kernel/mediatek/include/linux/device/devres.h:283:41: note:
> in definition of macro 'devm_add_action_or_reset'
>   283 |         __devm_add_action_or_reset(dev, action, data, #action)
>       |                                         ^~~~~~
> upstream/k7/kernel/mediatek/include/linux/device/devres.h:271:73: note:
> expected 'void (*)(void *)' but argument is of type 'void (*)(struct
> device *)'
>   271 | static inline int __devm_add_action_or_reset(struct device
> *dev, void (*action)(void *),


Oh right it has different prototyp so you need the wrapper. Then it's okay.

