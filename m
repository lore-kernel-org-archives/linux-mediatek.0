Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7421FC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 16:58:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 399F82072D
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 16:58:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EWIR0uZC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 399F82072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fPbjjkecepkd9QwcVvaxGBFQ11iva8TKe/5jb1jnWdM=; b=EWIR0uZCSUfN6PkUT6C8RXsxH
	JExjh/Dk5LCJQwogYgCiP8Ml6UN1z/frU35/KwBCpPlxHrLxd7sm+JQOtou7jmlhpRXR0+OUuxoxE
	ywlLvJIBjOEJERYGp23i5dx3x6qK5uMoPNWkBjSRdkooaeBLRCFEstQStSDg4SOIaCVW5hHzAI2IZ
	vuXiWHgTCIlNmY0i3cYq/E0W1NseSZAkdy/1ljvJ7tf/1od8CV08szqizN1LSixDElfn02krFEvMh
	Y8Ptdb2F22R+SSlM/kMcAalswjps+t58+64omWgNEmpBwd9Yi0qxIErwKvrZ9YcW0KbU/IWYG07HY
	ZerKCbcJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8nta-00047M-Jv; Thu, 20 Aug 2020 16:58:34 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8ntW-00045O-4f; Thu, 20 Aug 2020 16:58:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF2C030E;
 Thu, 20 Aug 2020 09:58:19 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 410683F66B;
 Thu, 20 Aug 2020 09:58:15 -0700 (PDT)
Subject: Re: [PATCH 10/18] iommu/msm: Add IOMMU_DOMAIN_DMA support
To: Rob Clark <robdclark@gmail.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <93d7de3533cfd952aecd6198b9221d7a58c0e521.1597931876.git.robin.murphy@arm.com>
 <CAF6AEGuKa4P=gfus08CdfT2H5pG6a2PBumGb=Pw3qvD=NWueig@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b5aa001f-6a1c-af0b-1526-c5b7a2e29ef7@arm.com>
Date: Thu, 20 Aug 2020 17:58:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGuKa4P=gfus08CdfT2H5pG6a2PBumGb=Pw3qvD=NWueig@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_125830_661139_7D7A1AB8 
X-CRM114-Status: GOOD (  27.82  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, digetx@gmail.com,
 Suman Anna <s-anna@ti.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Magnus Damm <magnus.damm@gmail.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 iommu@lists.linux-foundation.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Krishna Reddy <vdumpa@nvidia.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, t-kristo@ti.com,
 Kyungmin Park <kyungmin.park@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-20 16:55, Rob Clark wrote:
> Side note, I suspect we'll end up needing something like
> 0e764a01015dfebff8a8ffd297d74663772e248a .. if someone can dig a 32b
> device out of the closet and dust it off, the fix is easy enough.
> Just wanted to mention that here so anyone with a 32b device could
> find what is needed.

FWIW there shouldn't be any material change here - the generic default 
domain is installed under the same circumstances as the Arm 
dma_iommu_mapping was, so if any platform does have an issue, then it 
should already have started 4 years with f78ebca8ff3d ("iommu/msm: Add 
support for generic master bindings").

Robin.

> 
> BR,
> -R
> 
> On Thu, Aug 20, 2020 at 8:09 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> Now that arch/arm is wired up for default domains and iommu-dma,
>> implement the corresponding driver-side support for DMA domains.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/iommu/msm_iommu.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
>> index 3615cd6241c4..f34efcbb0b2b 100644
>> --- a/drivers/iommu/msm_iommu.c
>> +++ b/drivers/iommu/msm_iommu.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/init.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/dma-iommu.h>
>>   #include <linux/errno.h>
>>   #include <linux/io.h>
>>   #include <linux/io-pgtable.h>
>> @@ -314,13 +315,16 @@ static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
>>   {
>>          struct msm_priv *priv;
>>
>> -       if (type != IOMMU_DOMAIN_UNMANAGED)
>> +       if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
>>                  return NULL;
>>
>>          priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>>          if (!priv)
>>                  goto fail_nomem;
>>
>> +       if (type == IOMMU_DOMAIN_DMA && iommu_get_dma_cookie(&priv->domain))
>> +               goto fail_nomem;
>> +
>>          INIT_LIST_HEAD(&priv->list_attached);
>>
>>          priv->domain.geometry.aperture_start = 0;
>> @@ -339,6 +343,7 @@ static void msm_iommu_domain_free(struct iommu_domain *domain)
>>          struct msm_priv *priv;
>>          unsigned long flags;
>>
>> +       iommu_put_dma_cookie(domain);
>>          spin_lock_irqsave(&msm_iommu_lock, flags);
>>          priv = to_msm_priv(domain);
>>          kfree(priv);
>> --
>> 2.28.0.dirty
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
