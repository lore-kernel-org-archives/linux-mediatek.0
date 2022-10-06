Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8653AC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 10:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDdS/WjMZojTgDBUjOUHotMYKDGJnrdmtBIyTpL5dIg=; b=4EQoJ8ravSk/WEtkV+CnsqUC6M
	Ysxc/iMStrY9Sxi56yv+LX4/kYs9RxEUCzo1mpqF32rlHSnkerrRhHogooqPZ2gySz9tmcCeiDxOO
	/sSG/NezX/198rpAIXzUKGnW9on3LsqyyRX0dGr/Rw4qqRUBSyuwQqC+/iEdLe+3nwrcCwOcn910+
	a8WyrHwNuP9p2fD+h4cUNRgBsdOnE0s/EmGNbrZLnRje9l2PrjeYjlX3P2xKaKY1X6NLYC8D+kQC9
	5vFuDAvB4kw8xkzxWzSeCkDwe9fp7eTd4c2Eix6rOz8ftA+uV9wP6XmyzBFcDP+zGgfLD0IDSQt5+
	GuqLV/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogOP5-001cka-S6; Thu, 06 Oct 2022 10:46:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogOOu-001cfm-Ul; Thu, 06 Oct 2022 10:46:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7831ED6E;
	Thu,  6 Oct 2022 03:46:51 -0700 (PDT)
Received: from [10.57.65.170] (unknown [10.57.65.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E771C3F73B;
	Thu,  6 Oct 2022 03:46:42 -0700 (PDT)
Message-ID: <86084a28-be55-1c58-eace-1d73868c33dc@arm.com>
Date: Thu, 6 Oct 2022 11:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/3] iommu/mediatek: add support for 6-bit encoded port
 IDs
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, devicetree@vger.kernel.org,
 iommu@lists.linux.dev
References: <20221001-iommu-support-v2-0-dbfef2eeebc9@baylibre.com>
 <20221001-iommu-support-v2-2-dbfef2eeebc9@baylibre.com>
 <7d37e6ae-0dca-e0ef-2841-298c1ba9784f@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <7d37e6ae-0dca-e0ef-2841-298c1ba9784f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_034649_057527_3D37B3DE 
X-CRM114-Status: GOOD (  14.40  )
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

On 2022-10-04 12:59, AngeloGioacchino Del Regno wrote:
> Il 04/10/22 12:01, Alexandre Mergnat ha scritto:
>> From: Fabien Parent <fparent@baylibre.com>
>>
>> Until now the port ID was always encoded as a 5-bit data. On MT8365,
>> the port ID is encoded as a 6-bit data. This requires to rework the
>> macros F_MMU_INT_ID_LARB_ID, and F_MMU_INT_ID_PORT_ID in order
>> to support 5-bit and 6-bit encoded port IDs.
>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   drivers/iommu/mtk_iommu.c | 24 ++++++++++++++++++++----
>>   1 file changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>> index 5a4e00e4bbbc..a57ce509c8b5 100644
>> --- a/drivers/iommu/mtk_iommu.c
>> +++ b/drivers/iommu/mtk_iommu.c
>> @@ -108,8 +108,10 @@
>>   #define F_MMU_INT_ID_SUB_COMM_ID(a)        (((a) >> 7) & 0x3)
>>   #define F_MMU_INT_ID_COMM_ID_EXT(a)        (((a) >> 10) & 0x7)
>>   #define F_MMU_INT_ID_SUB_COMM_ID_EXT(a)        (((a) >> 7) & 0x7)
>> -#define F_MMU_INT_ID_LARB_ID(a)            (((a) >> 7) & 0x7)
>> -#define F_MMU_INT_ID_PORT_ID(a)            (((a) >> 2) & 0x1f)
>> +#define F_MMU_INT_ID_LARB_ID(a, int_id_port_width)    \
>> +                ((a) >> (((int_id_port_width) + 2) & 0x7))
>> +#define F_MMU_INT_ID_PORT_ID(a, int_id_port_width)    \
>> +                (((a) >> 2) & GENMASK((int_id_port_width) - 1, 0))
> 
> I can't think about any cleaner way than this one, but that's decreasing 
> human
> readability by "quite a bit".

In terms of readability, the best thing to do would be define separate 
macros for each register format and make the choice at the (single) 
callsite rather than hiding it in the macro. In fact we're already doing 
exactly that with the HAS_SUB_COMM_2BITS and HAS_SUB_COMM_3BITS flags 
right at the same point, so please follow that same pattern for consistency.

Thanks,
Robin.

