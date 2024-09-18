Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40075CCD18E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Sep 2024 08:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoR6YeCwUGpAGYsuOfkfi/xx9+D5gEiZHIQQiZW0O8U=; b=W/sHxCNRQ2ZW39FJ1I0xTJT+F2
	sCgFpi856ilVELuBXwmJcgM4rms/BfCokZWiIjR9E5iOZr3MtfWkkkXUhxj/paIM4KyW+6kju50OF
	i2zjzBJaCUa4mQYEWXTMxWcqFq/eKH8pXNInxBN9n2v7npt3pUIpPymxXlzR0LJYtU93/bq29ePIe
	bbD/mOXpEmyc2tf0BgDlMccU6STvDoWRdQXpbcTqCSpvZBNmF8VlB1am3ycTYcC16IbB6uHEmYwyX
	T6EUu7Urh9BhX14ArJAt/bt9yAINiLWxediY2FSpzsmxaanZ3nY4KFpG6k9zED5V4YMEha9sanodA
	IzbmKCFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqpkR-00000007kMA-0W4b;
	Wed, 18 Sep 2024 08:09:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqpjJ-00000007kCo-0bJ2;
	Wed, 18 Sep 2024 08:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726646883;
	bh=ng5Lj/WapRf5wiGtbGUreHOyO8PcjhuIkJMfcNbzMvM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ijDTiHnNDsmYkHvbMLSVl1kMwUPuGyKeQ1drdgROrfUmC2+VBfE4cG2wtzIR+KFzQ
	 srPGeYamWqKpOTSso2UttdPrSy9tZrD9JVYH1Er3S8CSyTtQbSh0SbxAC2GIhOUkoy
	 Zf96lcbiKNezaEcY68j/8eO3CxV6pvFJ4diyPx9Ur15UUYg6IicYDCha5hNi3rmXHj
	 UvGMX/OLgorkKeYwRCuSN/sd1EcDpJOJiNbgro5QLcg5Gpoi63TzGckgH9Xz+1gj4W
	 N50wM2h0VwlBFZgA+MJ5gSutb1lPCxtWGNJ2/noCsuhQe/XlKo1pnxDzmS/dvnKayJ
	 WzvEycHiYeMOQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B846C17E0FD9;
	Wed, 18 Sep 2024 10:08:02 +0200 (CEST)
Message-ID: <8186d78e-2aa8-436e-be76-412860a3105a@collabora.com>
Date: Wed, 18 Sep 2024 10:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI: mediatek-gen3: Add support for setting
 max-link-speed limit
To: Fei Shao <fshao@chromium.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com,
 robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240917091132.286582-1-angelogioacchino.delregno@collabora.com>
 <20240917091132.286582-2-angelogioacchino.delregno@collabora.com>
 <CAC=S1nhp_3EfG7g7GyLHQGPk_2mrfzj3Kqgi4u_gsA7-Wq8Zgg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAC=S1nhp_3EfG7g7GyLHQGPk_2mrfzj3Kqgi4u_gsA7-Wq8Zgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_010805_359239_AA247E8C 
X-CRM114-Status: GOOD (  27.43  )
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

Il 17/09/24 18:15, Fei Shao ha scritto:
> On Tue, Sep 17, 2024 at 5:13 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add support for respecting the max-link-speed devicetree property,
>> forcing a maximum speed (Gen) for a PCI-Express port.
>>
>> Since the MediaTek PCIe Gen3 controllers also expose the maximum
>> supported link speed in the PCIE_BASE_CFG register, if property
>> max-link-speed is specified in devicetree, validate it against the
>> controller capabilities and proceed setting the limitations only
>> if the wanted Gen is lower than the maximum one that is supported
>> by the controller itself (otherwise it makes no sense!).
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/pci/controller/pcie-mediatek-gen3.c | 55 ++++++++++++++++++++-
>>   1 file changed, 53 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
>> index 66ce4b5d309b..e1d1fb39d5c6 100644
>> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
>> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
>> @@ -28,7 +28,11 @@
>>
>>   #include "../pci.h"
>>
>> +#define PCIE_BASE_CFG_REG              0x14
>> +#define PCIE_BASE_CFG_SPEED_MASK       GENMASK(15, 8)
>> +
>>   #define PCIE_SETTING_REG               0x80
>> +#define PCIE_SETTING_GEN_SUPPORT_MASK  GENMASK(14, 12)
>>   #define PCIE_PCI_IDS_1                 0x9c
>>   #define PCI_CLASS(class)               (class << 8)
>>   #define PCIE_RC_MODE                   BIT(0)
>> @@ -125,6 +129,9 @@
>>
>>   struct mtk_gen3_pcie;
>>
>> +#define PCIE_CONF_LINK2_CTL_STS                0x10b0
>> +#define PCIE_CONF_LINK2_LCR2_LINK_SPEED        GENMASK(3, 0)
>> +
>>   /**
>>    * struct mtk_gen3_pcie_pdata - differentiate between host generations
>>    * @power_up: pcie power_up callback
>> @@ -160,6 +167,7 @@ struct mtk_msi_set {
>>    * @phy: PHY controller block
>>    * @clks: PCIe clocks
>>    * @num_clks: PCIe clocks count for this port
>> + * @max_link_speed: Maximum link speed (PCIe Gen) for this port
>>    * @irq: PCIe controller interrupt number
>>    * @saved_irq_state: IRQ enable state saved at suspend time
>>    * @irq_lock: lock protecting IRQ register access
>> @@ -180,6 +188,7 @@ struct mtk_gen3_pcie {
>>          struct phy *phy;
>>          struct clk_bulk_data *clks;
>>          int num_clks;
>> +       u8 max_link_speed;
>>
>>          int irq;
>>          u32 saved_irq_state;
>> @@ -381,11 +390,27 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>>          int err;
>>          u32 val;
>>
>> -       /* Set as RC mode */
>> +       /* Set as RC mode and set controller PCIe Gen speed restriction, if any*/
> 
> NIt: one space before ending the comment.
> 

Yep. :-)

>>          val = readl_relaxed(pcie->base + PCIE_SETTING_REG);
>>          val |= PCIE_RC_MODE;
>> +       if (pcie->max_link_speed) {
>> +               val &= ~PCIE_SETTING_GEN_SUPPORT_MASK;
>> +
>> +               /* Can enable link speed support only from Gen2 onwards */
>> +               if (pcie->max_link_speed >= 2)
>> +                       val |= FIELD_PREP(PCIE_SETTING_GEN_SUPPORT_MASK,
>> +                                         GENMASK(pcie->max_link_speed - 2, 0));
>> +       }
>>          writel_relaxed(val, pcie->base + PCIE_SETTING_REG);
>>
>> +       /* Set Link Control 2 (LNKCTL2) speed restriction, if any */
>> +       if (pcie->max_link_speed) {
>> +               val = readl_relaxed(pcie->base + PCIE_CONF_LINK2_CTL_STS);
>> +               val &= PCIE_CONF_LINK2_LCR2_LINK_SPEED;
> 
> I guess it needs a bitwise NOT operator over the mask.
>      val &= ~PCIE_CONF_LINK2_LCR2_LINK_SPEED;
> 

I have no idea how the NOT disappeared from this line :o
Nice catch.

> Apart from that, I think appending _MASK to the name makes its usage
> clearer and consistent with other masks.
> (although the name gets even more lengthy...)

Actually, the only other ones that say _MASK are the ones that I am introducing
in this commit, other than PCIE_LTSSM_STATE_MASK... all of the others do *not*
have the _MASK suffix.

At this point, for consistency, I should rather drop the _MASK suffix from the
PCIE_BASE_CFG_SPEED and PCIE_SETTING_GEN_SUPPORT definitions that I introduce
here, so I'll do exactly that for v3.

> 
>> +               val |= FIELD_PREP(PCIE_CONF_LINK2_LCR2_LINK_SPEED, pcie->max_link_speed);
>> +               writel_relaxed(val, pcie->base + PCIE_CONF_LINK2_CTL_STS);
>> +       }
>> +
>>          /* Set class code */
>>          val = readl_relaxed(pcie->base + PCIE_PCI_IDS_1);
>>          val &= ~GENMASK(31, 8);
>> @@ -1004,9 +1029,21 @@ static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
>>          reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
>>   }
>>
>> +static int mtk_pcie_get_controller_max_link_speed(struct mtk_gen3_pcie *pcie)
>> +{
>> +       u32 val;
>> +       int ret;
>> +
>> +       val = readl_relaxed(pcie->base + PCIE_BASE_CFG_REG);
>> +       val = FIELD_GET(PCIE_BASE_CFG_SPEED_MASK, val);
>> +       ret = fls(val);
>> +
>> +       return ret > 0 ? ret : -EINVAL;
>> +}
>> +
>>   static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>>   {
>> -       int err;
>> +       int max_speed, err;

Self-review: reorder this, e comes before m. Oops!

>>
>>          err = mtk_pcie_parse_port(pcie);
>>          if (err)
>> @@ -1031,6 +1068,20 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>>          if (err)
>>                  return err;
>>
>> +       err = of_pci_get_max_link_speed(pcie->dev->of_node);
>> +       if (err > 0) {
>> +               /* Get the maximum speed supported by the controller */
>> +               max_speed = mtk_pcie_get_controller_max_link_speed(pcie);
>> +
>> +               /* Set max_link_speed only if the controller supports it */
>> +               if (max_speed >= 0 && max_speed <= err) {
>> +                       pcie->max_link_speed = err;
>> +                       dev_dbg(pcie->dev,
>> +                               "Max controller link speed Gen%u, override to Gen%u",
>> +                               max_speed, pcie->max_link_speed);
> 
> Convert max_speed to an unsigned type to avoid potential typecheck warnings?
> 

I'll just change that to "[...] Gen%d, override to Gen%u", looks simply
cleaner, in the end...

Thanks!
Angelo

> Regards,
> Fei
> 
> 
>> +               }
>> +       }
>> +
>>          /* Try link up */
>>          err = mtk_pcie_startup_port(pcie);
>>          if (err)
>> --
>> 2.46.0
>>
>>



