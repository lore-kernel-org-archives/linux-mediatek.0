Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D25AC4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 10:55:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 835B02224A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 10:55:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vCy51+tY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 835B02224A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kjbuOEe968/JTnDPslC5f5zP4XY9mp4Ex8aX9xyTbkc=; b=vCy51+tY6AudD0u0hsWMnKBEW
	l0K2fGNZlbc102KTdn00rCU6u6wkmvcEX81tr1/cP6S2FIDk7rSNiaCBsTgWRtVWvcY6U2d59aMOG
	bLiR52e6/IVPCP1JzA6gOzaiYd261HVYmDDQKl+i7tVBXEb+fdb5yrGSM/PWf6dDVTH14pknl8Q2b
	h4RbRGIkQBzU6BwdzEoV7BFYuZi2P0fw3o9MZhyLHuiMXV01AUy3gOfrTTyz0vXyrW0dAMjuXaNJo
	JFmDpKskQAlMLROBVY5JViEE3pR8PzmDziVfeb4f0E9levqoCc+ekYNtaSqeRKOEz1BEJh/frgHVr
	szEkGmh9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYS3b-0002ih-Nw; Fri, 30 Oct 2020 10:54:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYS3W-0002hL-3Z; Fri, 30 Oct 2020 10:54:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 839C11F4509A
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v3 02/16] soc: mediatek: Add MediaTek SCPSYS power domains
To: Nicolas Boichat <drinkcat@chromium.org>
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
 <20201026175526.2915399-3-enric.balletbo@collabora.com>
 <CANMq1KCe-QtQWXpmwFiCt4vcy0MG==L-C9cSU=o4W4OC5tyWgA@mail.gmail.com>
Message-ID: <c40054aa-212a-7e55-6437-4706e91bedaa@collabora.com>
Date: Fri, 30 Oct 2020 11:54:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CANMq1KCe-QtQWXpmwFiCt4vcy0MG==L-C9cSU=o4W4OC5tyWgA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_065450_391079_D0E91734 
X-CRM114-Status: GOOD (  30.19  )
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
Cc: Matthias Brugger <mbrugger@suse.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Nicolas,

Thank you for your comments.

On 27/10/20 1:55, Nicolas Boichat wrote:
> On Tue, Oct 27, 2020 at 1:55 AM Enric Balletbo i Serra
> <enric.balletbo@collabora.com> wrote:
>>
>> The System Control Processor System (SCPSYS) has several power management
>> related tasks in the system. This driver implements support to handle
>> the different power domains supported in order to meet high performance
>> and low power requirements.
>>
>> Co-developed-by: Matthias Brugger <mbrugger@suse.com>
>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>> Changes in v3:
>> - Return only a boolean for scpsys_domain_is_on()
>> - Use regmap_update_bits API when possible.
>> - Add some logic to make sure scpsys->domains[id] == NULL or != NULL
>>   when needed.
>> - Return the child node for scpsys_add_one_domain() call.
>> - Remove unneded zeroing num_clks variable.
>> - Move the soc specific data to separate include files.
>>
>> Changes in v2:
>> - Get base address from parent syscon. We have now a scpsys syscon node
>>   and a child for the SPM (System Power Manager).
>> - Use regmap API to acces de base address.
>>
>>  drivers/soc/mediatek/Kconfig             |  13 +
>>  drivers/soc/mediatek/Makefile            |   1 +
>>  drivers/soc/mediatek/mt8173-pm-domains.h |  96 +++++
>>  drivers/soc/mediatek/mtk-pm-domains.c    | 455 +++++++++++++++++++++++
>>  drivers/soc/mediatek/mtk-pm-domains.h    |  65 ++++
>>  5 files changed, 630 insertions(+)
>>  create mode 100644 drivers/soc/mediatek/mt8173-pm-domains.h
>>  create mode 100644 drivers/soc/mediatek/mtk-pm-domains.c
>>  create mode 100644 drivers/soc/mediatek/mtk-pm-domains.h
> [snip]
>> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
>> new file mode 100644
>> index 000000000000..16503d6db6a8
>> --- /dev/null
>> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
>> @@ -0,0 +1,455 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2020 Collabora Ltd.
>> + */
>> +#include <linux/clk.h>
>> +#include <linux/init.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/of_clk.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_domain.h>
>> +#include <linux/regmap.h>
>> +#include <linux/soc/mediatek/infracfg.h>
>> +
>> +#include "mt8173-pm-domains.h"
>> +
>> +#define MTK_POLL_DELAY_US              10
>> +#define MTK_POLL_TIMEOUT               USEC_PER_SEC
>> +
>> +#define PWR_RST_B_BIT                  BIT(0)
>> +#define PWR_ISO_BIT                    BIT(1)
>> +#define PWR_ON_BIT                     BIT(2)
>> +#define PWR_ON_2ND_BIT                 BIT(3)
>> +#define PWR_CLK_DIS_BIT                        BIT(4)
>> +
>> +struct scpsys_domain {
>> +       struct generic_pm_domain genpd;
>> +       const struct scpsys_domain_data *data;
>> +       struct scpsys *scpsys;
>> +       int num_clks;
>> +       struct clk_bulk_data *clks;
>> +       struct regmap *infracfg;
>> +};
>> +
>> +struct scpsys {
>> +       struct device *dev;
>> +       struct regmap *base;
>> +       const struct scpsys_soc_data *soc_data;
>> +       struct genpd_onecell_data pd_data;
>> +       struct generic_pm_domain *domains[];
>> +};
>> +
>> +#define to_scpsys_domain(gpd) container_of(gpd, struct scpsys_domain, genpd)
>> +
>> +static int scpsys_domain_is_on(struct scpsys_domain *pd)
> 
> static bool?
> 

Done in next version.

>> +{
>> +       struct scpsys *scpsys = pd->scpsys;
>> +       u32 status, status2;
>> +
>> +       regmap_read(scpsys->base, scpsys->soc_data->pwr_sta_offs, &status);
>> +       status &= pd->data->sta_mask;
>> +
>> +       regmap_read(scpsys->base, scpsys->soc_data->pwr_sta2nd_offs, &status2);
>> +       status2 &= pd->data->sta_mask;
>> +
>> +       /* A domain is on when both status bits are set. */
>> +       return status && status2;
>> +}
>> +
>> +static int scpsys_sram_enable(struct scpsys_domain *pd)
>> +{
>> +       u32 pdn_ack = pd->data->sram_pdn_ack_bits;
>> +       struct scpsys *scpsys = pd->scpsys;
>> +       unsigned int tmp;
>> +
>> +       regmap_update_bits(scpsys->base, pd->data->ctl_offs, pd->data->sram_pdn_bits, 0);
>> +
>> +       /* Either wait until SRAM_PDN_ACK all 1 or 0 */
>> +       return regmap_read_poll_timeout(scpsys->base, pd->data->ctl_offs, tmp,
>> +                                       (tmp & pdn_ack) == 0, MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
>> +}
>> +
>> +static int scpsys_sram_disable(struct scpsys_domain *pd)
>> +{
>> +       u32 pdn_ack = pd->data->sram_pdn_ack_bits;
>> +       struct scpsys *scpsys = pd->scpsys;
>> +       unsigned int tmp;
>> +
>> +       regmap_update_bits(scpsys->base, pd->data->ctl_offs, pd->data->sram_pdn_bits,
>> +                          pd->data->sram_pdn_bits);
>> +
>> +       /* Either wait until SRAM_PDN_ACK all 1 or 0 */
>> +       return regmap_read_poll_timeout(scpsys->base, pd->data->ctl_offs, tmp,
>> +                                       (tmp & pdn_ack) == pdn_ack, MTK_POLL_DELAY_US,
>> +                                       MTK_POLL_TIMEOUT);
>> +}
>> +
>> +static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
>> +{
>> +       const struct scpsys_bus_prot_data *bp_data = &pd->data->bp_infracfg;
>> +
>> +       if (!bp_data->bus_prot_mask)
>> +               return 0;
>> +
>> +       return mtk_infracfg_set_bus_protection(pd->infracfg, bp_data->bus_prot_mask,
>> +                                              bp_data->bus_prot_reg_update);
>> +}
>> +
>> +static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
>> +{
>> +       const struct scpsys_bus_prot_data *bp_data = &pd->data->bp_infracfg;
>> +
>> +       if (!bp_data->bus_prot_mask)
>> +               return 0;
>> +
>> +       return mtk_infracfg_clear_bus_protection(pd->infracfg, bp_data->bus_prot_mask,
>> +                                                bp_data->bus_prot_reg_update);
>> +}
>> +
>> +static int scpsys_power_on(struct generic_pm_domain *genpd)
>> +{
>> +       struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
>> +       struct scpsys *scpsys = pd->scpsys;
>> +       unsigned int tmp;
> 
> bool tmp?
> 

Ack

>> +       int ret;
>> +
>> +       ret = clk_bulk_enable(pd->num_clks, pd->clks);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* subsys power on */
>> +       regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT, PWR_ON_BIT);
>> +       regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT, PWR_ON_2ND_BIT);
>> +
>> +       /* wait until PWR_ACK = 1 */
>> +       ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, tmp > 0, MTK_POLL_DELAY_US,
> 
> `tmp > 0` is a little weird now that scpsys_domain_is_on returns a
> boolean. Just use `tmp`.
> 

Right, done in next version

>> +                                MTK_POLL_TIMEOUT);
>> +       if (ret < 0)
>> +               goto err_pwr_ack;
>> +
>> +       regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT, 0);
>> +       regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT, 0);
>> +       regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT, PWR_RST_B_BIT);
>> +
>> +       ret = scpsys_sram_enable(pd);
>> +       if (ret < 0)
>> +               goto err_pwr_ack;
>> +
>> +       ret = scpsys_bus_protect_disable(pd);
>> +       if (ret < 0)
>> +               goto err_pwr_ack;
> 
> Do we need to disable the SRAM in this error path?
> 

Yes, added in next version.

>> +
>> +       return 0;
>> +
>> +err_pwr_ack:
>> +       clk_bulk_disable(pd->num_clks, pd->clks);
>> +       return ret;
>> +}
>> +
>> +static int scpsys_power_off(struct generic_pm_domain *genpd)
>> +{
>> +       struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
>> +       struct scpsys *scpsys = pd->scpsys;
>> +       unsigned int tmp;
>> +       int ret;
>> +
>> +       ret = scpsys_bus_protect_enable(pd);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       ret = scpsys_sram_disable(pd);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       /* subsys power off */
>> +       regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT, 0);
>> +       regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT, PWR_ISO_BIT);
>> +       regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT, PWR_CLK_DIS_BIT);
>> +       regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT, 0);
>> +       regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT, 0);
>> +
>> +       /* wait until PWR_ACK = 0 */
>> +       ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, tmp == 0, MTK_POLL_DELAY_US,
> 
> `!tmp` as condition.
> 

Ack

>> +                                MTK_POLL_TIMEOUT);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       clk_bulk_disable(pd->num_clks, pd->clks);
>> +
>> +       return 0;
>> +}
>> +
>> +static struct
>> +generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node)
>> +{
>> +       const struct scpsys_domain_data *domain_data;
>> +       struct scpsys_domain *pd;
>> +       int i, ret;
>> +       u32 id;
>> +
>> +       ret = of_property_read_u32(node, "reg", &id);
>> +       if (ret) {
>> +               dev_err(scpsys->dev, "%pOF: failed to retrieve domain id from reg: %d\n",
>> +                       node, ret);
>> +               return ERR_PTR(-EINVAL);
>> +       }
>> +
>> +       if (id >= scpsys->soc_data->num_domains) {
>> +               dev_err(scpsys->dev, "%pOF: invalid domain id %d\n", node, id);
>> +               return ERR_PTR(-EINVAL);
>> +       }
>> +
>> +       domain_data = &scpsys->soc_data->domains[id];
> 
> See my comment on v2. domain_data = scpsys->soc_data->domains[id]; is
> probably what you want (unless I got it completely wrong...)
> 

Answered there :-). I think the purpose of the check is still valid, but, yes,
checking now if sta_mask mask is set. Thank you!

>> +       if (!domain_data) {
>> +               dev_err(scpsys->dev, "%pOF: undefined domain id %d\n", node, id);
>> +               return ERR_PTR(-EINVAL);
>> +       }
>> +
>> +       pd = devm_kzalloc(scpsys->dev, sizeof(*pd), GFP_KERNEL);
>> +       if (!pd)
>> +               return ERR_PTR(-ENOMEM);
>> +
>> +       pd->data = domain_data;
>> +       pd->scpsys = scpsys;
>> +
>> +       pd->infracfg = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg");
>> +       if (IS_ERR(pd->infracfg))
>> +               pd->infracfg = NULL;
>> +
>> +       pd->num_clks = of_clk_get_parent_count(node);
>> +       if (pd->num_clks > 0) {
>> +               pd->clks = devm_kcalloc(scpsys->dev, pd->num_clks, sizeof(*pd->clks), GFP_KERNEL);
>> +               if (!pd->clks)
>> +                       return ERR_PTR(-ENOMEM);
>> +       }
> [snip]
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
