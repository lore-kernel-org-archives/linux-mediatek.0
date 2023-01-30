Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F6DC54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+pItarPgfmoHngvNF9y49F+j/aJRIEzosv3oEEFNGw=; b=xa5dwzDbVzHu0Ksa9uxzJUNN4u
	mQmNIVtYma8ysxxgl4wiEhXSNeSUzcuqOSgJfVDeOhTkkrWMqvieZNhKNalft/B8ddhOjfYnC2J1j
	AfyC88cb4qlipiHPhjGhrnpw62gqfGP47R/6+f614NVeCytK37b13VMjoT/NXclTQQXudSLFzu5dt
	MMdGe8+OQjUCar/bnSTA6AuSYJD0Ux21NYkemlvJMqaNGvhEDipNlpROs4WPf2pdXUxOyODJ7mOiP
	LkgbZMyUZ3CCqxdg+oOSLTrQukuWMf3Z41rqKePzjIlNdax6NaC/QyHDC41jNg2Ms5dioSU/giI3w
	YKSSo6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYPy-004m5d-W7; Mon, 30 Jan 2023 17:58:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYNm-004kux-Jw; Mon, 30 Jan 2023 17:55:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B027816F3;
	Mon, 30 Jan 2023 03:59:26 -0800 (PST)
Received: from [10.57.89.162] (unknown [10.57.89.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF7853F71E;
	Mon, 30 Jan 2023 03:58:42 -0800 (PST)
Message-ID: <52254849-96fa-2882-d81d-d22fe3948405@arm.com>
Date: Mon, 30 Jan 2023 11:58:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] dt-bindings: memory: mediatek: Add support of
 unmanaged iommu domain
Content-Language: en-GB
To: Alexandre Bailon <abailon@baylibre.com>, yong.wu@mediatek.com,
 joro@8bytes.org, will@kernel.org
Cc: matthias.bgg@gmail.com, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230130102722.133271-1-abailon@baylibre.com>
 <20230130102722.133271-2-abailon@baylibre.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230130102722.133271-2-abailon@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_095554_732799_8EBD6F94 
X-CRM114-Status: GOOD (  13.81  )
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

On 2023-01-30 10:27, Alexandre Bailon wrote:
> Currently, the only way to have an unmanaged domain for a device
> is having a dedicated iova region or bank.
> This adds a new bit to MTK_M4U_ID that allows defining devices
> that needs unmanaged iommu domain.

These are details of Linux-specific usage policy, so don't belong in DT 
bindings. I believe the driver already has some internal data to make 
its own assignment of particular devices into particular groups, so 
please just add to that.

Thanks,
Robin.

> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>   include/dt-bindings/memory/mtk-memory-port.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/memory/mtk-memory-port.h b/include/dt-bindings/memory/mtk-memory-port.h
> index 2f68a0511a257..86896c776691a 100644
> --- a/include/dt-bindings/memory/mtk-memory-port.h
> +++ b/include/dt-bindings/memory/mtk-memory-port.h
> @@ -7,11 +7,14 @@
>   #define __DT_BINDINGS_MEMORY_MTK_MEMORY_PORT_H_
>   
>   #define MTK_LARB_NR_MAX			32
> +#define MTK_UNMANAGED_DEVICE            (1 << 31)
>   
>   #define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
>   #define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0x1f)
>   #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
> +#define MTK_M4U_UNMANAGED(id)		((id) & MTK_UNMANAGED_DEVICE)
>   
>   #define MTK_IFAIOMMU_PERI_ID(port)	MTK_M4U_ID(0, port)
> +#define MTK_M4U_UNMANAGED_ID(larb, port) (MTK_M4U_ID(larb, port) | MTK_UNMANAGED_DEVICE)
>   
>   #endif

