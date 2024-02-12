Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3815EC4829E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 20:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bw54feNBMSUAWt9H1kUwQT6TtWMrX6VS0KfO9CyJw9E=; b=HeWSP6a65oPvI7fKEWgTw+7N9T
	Peg7LxnIjSSlcBTDrp8MT7IpOIoDHWtAcrSOvSYzrmZm8pWNm1tapLGozZT+fQF2/zOKVY56BdwbV
	SleJ7QUI72+65UhqUzZ77hrERltSyLF8l9iO5H0niX0GvQCdZdvRap0FHUXg7e0XoxzeUMY1EilT4
	bv3zuDbKfWn6Lt2dqmjI87wq3SN9kdvU1Pw3fPA3xRpTvgKIz8PSwo3/OJXufQGs4ITujnptuCrWS
	j4FfFHtwu/k6V1Hzg45JQ/FTjQuyJ4okekzB1zSQZpA9wS72xXiwNOyRXIxFyU980jATk3mN6ESr8
	c1v3Usow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZd7O-00000006tk4-46yK;
	Mon, 12 Feb 2024 20:41:34 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZd7M-00000006tiM-1Qm8
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Feb 2024 20:41:33 +0000
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
	by cmsmtp with ESMTPS
	id ZYXRrQcjX8uLRZd79rgU18; Mon, 12 Feb 2024 20:41:19 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id Zd78r0V4zFWw5Zd79rN6gg; Mon, 12 Feb 2024 20:41:19 +0000
X-Authority-Analysis: v=2.4 cv=C7tKyhP+ c=1 sm=1 tr=0 ts=65ca826f
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=VhncohosazJxI00KdYJ/5A==:17
 a=IkcTkHD0fZMA:10 a=k7vzHIieQBIA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=7YfXLusrAAAA:8 a=ZyVk2ItIS7mYbqNWDTwA:9 a=QEXdDO2ut3YA:10
 a=9cHFzqQdt-sA:10 a=PUnBvhIW4WwA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=SLz71HocmBbuEhFRYD3r:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bw54feNBMSUAWt9H1kUwQT6TtWMrX6VS0KfO9CyJw9E=; b=XCpJ7ZjCAG/KP/VTwD4kYXi1K6
	/TbC0ueZTpwPte6x1WspBWfomnu9CbJKxBlg8AEJUb6bYruRsKh3OO2vXtRvNlWkDxzDo2VFlYy3f
	qSYbkP4Dq87K/EzMIfjT8nCoZF+MVL6JAojreH7zGZIG0ouO7a0Dcvr/liR1UWwMaOCAoExudUqpA
	THXkXJWEjbVSnKGcXxVcmR6wQkBei74Dpwno4G8U4P1oRPOAZygKG7GlOwYpoL35YVeM6gy8CnNFF
	HFNjBkxUkew9YfwsXFMbDVMdrqTG8mBK/rG56ejxDeAgvDakcbig5I9eWSpbucLebhmNuNIMOlBP+
	cTZ2GOzg==;
Received: from [201.172.172.225] (port=34544 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rZd77-000F5z-0a;
	Mon, 12 Feb 2024 14:41:17 -0600
Message-ID: <0f3213d3-9010-45d5-8852-f0ab3ffc8f8b@embeddedor.com>
Date: Mon, 12 Feb 2024 14:41:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/mtk_iommu: Use devm_kcalloc() instead of
 devm_kzalloc()
Content-Language: en-US
To: Erick Archer <erick.archer@gmx.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hardening@vger.kernel.org
References: <20240211182250.12656-1-erick.archer@gmx.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240211182250.12656-1-erick.archer@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.172.225
X-Source-L: No
X-Exim-ID: 1rZd77-000F5z-0a
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.10]) [201.172.172.225]:34544
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJ1bORvNmGOoX3lZ/blo5OdYytk1mTQHoPDVMMIrkw3M7uEdmrh2pXDVhDTZC8Jg6rnqlrShtPzbjOXwUXcRT7CNpYF+Gb7RdqF/wtz2OrrN7cxk/7uk
 D8aNY3bcleXB49oNotpwtGohUiyq7S3bErUUtd5DCtL/Mt7D/yr7uRsEyNTgAhbzJ6RK0AGvjlBq7MqknwzX9Z9zMNbOmwL8D0ykhuF+xC5ev1nrkEGGNgy1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_124132_478373_9576FB65 
X-CRM114-Status: GOOD (  15.24  )
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



On 2/11/24 12:22, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1].
> 
> Here the multiplication is obviously safe because MTK_PROTECT_PA_ALIGN
> is defined as a literal value of 256 or 128.
> 
> For the "mtk_iommu.c" file: 256
> For the "mtk_iommu_v1.c" file: 128
> 
> However, using devm_kcalloc() is more appropriate [2] and improves
> readability. This patch has no effect on runtime behavior.
> 
> Link: https://github.com/KSPP/linux/issues/162 [1]
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [2]
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

LGTM:

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
-- 
Gustavo

> ---
>   drivers/iommu/mtk_iommu.c    | 2 +-
>   drivers/iommu/mtk_iommu_v1.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 7abe9e85a570..9aae6eb604b1 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1264,7 +1264,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   	data->plat_data = of_device_get_match_data(dev);
> 
>   	/* Protect memory. HW will access here while translation fault.*/
> -	protect = devm_kzalloc(dev, MTK_PROTECT_PA_ALIGN * 2, GFP_KERNEL);
> +	protect = devm_kcalloc(dev, 2, MTK_PROTECT_PA_ALIGN, GFP_KERNEL);
>   	if (!protect)
>   		return -ENOMEM;
>   	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index 25b41222abae..45cd845d153f 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -621,8 +621,8 @@ static int mtk_iommu_v1_probe(struct platform_device *pdev)
>   	data->dev = dev;
> 
>   	/* Protect memory. HW will access here while translation fault.*/
> -	protect = devm_kzalloc(dev, MTK_PROTECT_PA_ALIGN * 2,
> -			GFP_KERNEL | GFP_DMA);
> +	protect = devm_kcalloc(dev, 2, MTK_PROTECT_PA_ALIGN,
> +			       GFP_KERNEL | GFP_DMA);
>   	if (!protect)
>   		return -ENOMEM;
>   	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
> --
> 2.25.1
> 
> 

