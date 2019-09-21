From: Satendra Singh Thakur <sst2005@gmail.com>
Subject: Re: Re: [PATCH 0/9] added helper macros to remove duplicate code from probe functions of the platform drivers
Date: Sat, 21 Sep 2019 20:27:26 +0530
Message-ID: <2356e29bca5bdfa901534bb32a2782185eb0415f.1568909689.git.sst2005@gmail.com>
References: <20190918102715.GO4392@vkoul-mobl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918102715.GO4392@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: dan.j.williams@intel.com, vkoul@kernel.org, jun.nie@linaro.org, shawnguo@kernel.org, agross@kernel.org, sean.wang@mediatek.com, matthias.bgg@gmail.com, maxime.ripard@bootlin.com, wens@csie.org, lars@metafoo.de, afaerber@suse.de, manivannan.sadhasivam@linaro.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, satendrasingh.thakur@hcl.com, Satendra Singh Thakur <sst2005@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

On Wed, Sep 18, 2019 at 3:57 PM, Vinod Koul wrote:
> On 15-09-19, 12:30, Satendra Singh Thakur wrote:
> > 1. For most of the platform drivers's probe include following steps
> > 
> > -memory allocation for driver's private structure
> > -getting io resources
> > -io remapping resources
> > -getting irq number
> > -registering irq
> > -setting driver's private data
> > -getting clock
> > -preparing and enabling clock
>
> And we have perfect set of APIs for these tasks!
Hi Vinod,
Thanks for the comments.
You are right, we already have set of APIs for these tasks.
The proposed macros combine the very same APIs to remove 
duplicate/redundant code.
A new driver author can use these macros to easily write probe 
function without having to worry about signatures of internal APIs.
In the past, people have combined some of them e.g.
a) clk_prepare_enable combines clk_prepare and clk_enable
b) devm_platform_ioremap_resource combines
platform_get_resource (for type IORESOURCE_MEM)
and devm_ioremap_resource
c) module_platform_driver macro encompasses module_init/exit 
and driver_register/unregister functions.
The basic idea is to simplyfy coding.
> > 2. We have defined a set of macros to combine some or all of
> > the above mentioned steps. This will remove redundant/duplicate
> > code in drivers' probe functions of platform drivers.
> 
> Why, how does it help and you do realize it also introduces bugs
This will make probe function shorter by removing repeated code.
This will also reduce bugs caused due to improper handling
of failure cases because of these reasons:
a) If the developer calls each API individualy one might miss
proper handling of the failure for some API; Whereas the macro
properly handles failure of each API.
b) Macros are devres compatible which leaves less room for
memory leaks.

Yes, the macros which enable clock and request irqs
might cause bugs if they are not used carefully.
For instance, enabling the clock or requesting the irq
earlier than actually required. So, the macros with _clk
and _irq, _all suffix should be used carefully.

Please let me know if I miss any specific type of bug
here.
> 
> > devm_platform_probe_helper(pdev, priv, clk_name);
> > devm_platform_probe_helper_clk(pdev, priv, clk_name);
> > devm_platform_probe_helper_irq(pdev, priv, clk_name,
> > irq_hndlr, irq_flags, irq_name, irq_devid);
> > devm_platform_probe_helper_all(pdev, priv, clk_name,
> > irq_hndlr, irq_flags, irq_name, irq_devid);
> > devm_platform_probe_helper_all_data(pdev, priv, clk_name,
> > irq_hndlr, irq_flags, irq_name, irq_devid);
> > 
> > 3. Code is made devres compatible (wherever required)
> > The functions: clk_get, request_irq, kzalloc, platform_get_resource
> > are replaced with their devm_* counterparts.
> 
> We already have devres APIs for people to use!
Yes, we have devres APIs and many drivers do use them.
But still there are many which don't use them.
The proposed macros provides just another way to use devres APIs.
> > 
> > 4. Few bugs are also fixed.
> 
> Which ones..?
The bug is that the failure of request_irq 
is not handled properly in mtk-hsdma.c. This is fixed in patch [5/9].
https://lkml.org/lkml/2019/9/15/35

Please let me know if I am missing something here.
Thanks
-Satendra 
