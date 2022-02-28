Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08031C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIOF3O9meVIhTGmlX8O/mXXB6/M6pJqpeDy3bOW1Ls8=; b=iXH+OzrgFxxh8p
	9pjMiHtkgiwaldRg0dSCLFUQ0FvmE/ZYI+/fWrHU2qj8LLX3x21KwV85cYB6ZXXwjrIrCGw/+pBut
	5VovkJJ334B4xclQiEOrEjf7uO9z7CBVFZJVspV4ImHT8mqKvVzey6zVsS24mbWg+FXSBEycENDVn
	GPxWsLbJ5QywVpBbNyE7ilixxfQDvDe6MdsBNyeHjxHCSJh7LciAIlkzVX5pcfOHWFEnJEhYtgslf
	FBD/6KlG+7D6fFufBT2c82QXkvRZ2TPgrW0+PNhSJeq7BZg2206oHUpjzsTMH6k5hyODSXl2R+XZz
	VnnvQnTvewtkTIQI9kUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOgVP-00CiI3-BM; Mon, 28 Feb 2022 13:56:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOgQF-00CgdO-Vc; Mon, 28 Feb 2022 13:50:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C45121F438C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646056242;
 bh=01LHGkJJ+DpNYyT1azd35ZIb6hFj6cZ6HVkPFWhLSpg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EVphFN2nlSfP7QnVMQPprWeHY3LGcr4CNLIyJwc93JAON0XRrHPUEBxJtTps4YWN/
 teZLX3YIek+zUtUDvBSoQrBSI/MMaewUqah04AgMl1Q2EoUcX49lKK3o3X3lDFTBeQ
 Ciwc4QZJbinmesi65g4Cksnl/DPy8HmKBYR1dBf3CG73Y2GP3KeK5HTIkqXRSKZgHR
 6g7KLIla/2XXP7PKHafiVilugVgEELIR4r3POzlUd375pz3+5AaS+yT3BOAkd7enBY
 wLsHX+VBenM5SuXKynOeeyhdGojSDhCTFd+XPt7gt+38YBVce7LBPgpfWq7bQghohU
 ob9f2ZHuNUTSg==
Message-ID: <7ba0ee87-c193-9834-d0b4-ff3e06ced82b@collabora.com>
Date: Mon, 28 Feb 2022 14:50:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 00/34] MT8195 IOMMU SUPPORT
Content-Language: en-US
To: Joerg Roedel <joro@8bytes.org>, Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com, mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
 libo.kang@mediatek.com, chengci.xu@mediatek.com
References: <20220217113453.13658-1-yong.wu@mediatek.com>
 <YhzBSsn/zUlGg5JE@8bytes.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YhzBSsn/zUlGg5JE@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_055044_249894_CCCD3682 
X-CRM114-Status: GOOD (  14.51  )
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

Il 28/02/22 13:34, Joerg Roedel ha scritto:
> Hi Yong Wu,
> 
> On Thu, Feb 17, 2022 at 07:34:19PM +0800, Yong Wu wrote:
>> Yong Wu (34):
>>    dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
>>    dt-bindings: mediatek: mt8195: Add binding for infra IOMMU
>>    iommu/mediatek: Fix 2 HW sharing pgtable issue
>>    iommu/mediatek: Add list_del in mtk_iommu_remove
>>    iommu/mediatek: Remove clk_disable in mtk_iommu_remove
>>    iommu/mediatek: Add mutex for m4u_group and m4u_dom in data
>>    iommu/mediatek: Add mutex for data in the mtk_iommu_domain
>>    iommu/mediatek: Adapt sharing and non-sharing pgtable case
>>    iommu/mediatek: Add 12G~16G support for multi domains
>>    iommu/mediatek: Add a flag DCM_DISABLE
>>    iommu/mediatek: Add a flag NON_STD_AXI
>>    iommu/mediatek: Remove the granule in the tlb flush
>>    iommu/mediatek: Always enable output PA over 32bits in isr
>>    iommu/mediatek: Add SUB_COMMON_3BITS flag
>>    iommu/mediatek: Add IOMMU_TYPE flag
>>    iommu/mediatek: Contain MM IOMMU flow with the MM TYPE
>>    iommu/mediatek: Adjust device link when it is sub-common
>>    iommu/mediatek: Allow IOMMU_DOMAIN_UNMANAGED for PCIe VFIO
>>    iommu/mediatek: Add a PM_CLK_AO flag for infra iommu
>>    iommu/mediatek: Add infra iommu support
>>    iommu/mediatek: Add PCIe support
>>    iommu/mediatek: Add mt8195 support
>>    iommu/mediatek: Only adjust code about register base
>>    iommu/mediatek: Just move code position in hw_init
>>    iommu/mediatek: Separate mtk_iommu_data for v1 and v2
>>    iommu/mediatek: Remove mtk_iommu.h
>>    iommu/mediatek-v1: Just rename mtk_iommu to mtk_iommu_v1
>>    iommu/mediatek: Add mtk_iommu_bank_data structure
>>    iommu/mediatek: Initialise bank HW for each a bank
>>    iommu/mediatek: Change the domid to iova_region_id
>>    iommu/mediatek: Get the proper bankid for multi banks
>>    iommu/mediatek: Initialise/Remove for multi bank dev
>>    iommu/mediatek: Backup/restore regsiters for multi banks
>>    iommu/mediatek: mt8195: Enable multi banks for infra iommu
> 
> This doesn't apply cleanly, can you please send a version rebased to
> v5.17-rc4?
> 
> Thanks,
> 
> 	Joerg

Hello Joerg,

this series depends on the following series:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=592275

...which is also well tested and ready to be merged in.

Applying Yong's series without the mentioned series from Dafna would not work.


Thanks,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
