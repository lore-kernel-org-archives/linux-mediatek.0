Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACA8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nPf7uaPe/Ru5kjAGraHVr3aXjZ7avm6WNOpRyV48SM=; b=riITIAkWUvvxxSDy7/RZrcIgmQ
	65H/NF+qQc0XZlq9T1yG+YrRhyYIbVSIK/cZK9qiqIFlG2Gaps+aFx4aPvOG5QbFAmQkxBgWIAiRe
	DqVFxzVARuksHkVUHdMWcVBSEoNP4zFSujpDnBiCh4731Hhta0sznLqzeq49N2pHbYId8b5+ayLAa
	OBBQavoK31/gV2j9tsG/7DvXkxWEZqAKsIYEwaQIb/f36Ia/w4QpUR/7Y9wLRCNkrdYbFqSTlesy5
	poGoDcAiaZ9ovfcsOSatgR6bDSnshaM8O86MKC2cEcNk3yaMdzzHz6KLY8CZL016sWauFt7kt+5UO
	0zN0aREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiByp-003tdf-8B; Tue, 11 Oct 2022 09:55:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiByd-003tan-SZ; Tue, 11 Oct 2022 09:55:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C395E6602356;
	Tue, 11 Oct 2022 10:55:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665482106;
	bh=zzsgbQRjWMGmMw0Zwxx8nmOt4OzG96FB3zeBCswPAU4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k9zNn0cDHZf9/3U+Osh0Wvyqrhe8wq3LHEF3HdzAY7N9+4zdFxmEGc1vmnlERpLdf
	 g8x9lJlZ4yVJcvwx4Fgu1D66k5OWszccrggKryMmRQM2Fy881D1W9kjjF0SWfVaN5l
	 b3v+66UkaoYsfjPUA8SMyqcg42ciZsz4psVPIE+LdLIaCq1Q1rYNAqfafZpmnCAppl
	 gfNFppESg0v303wVuW3pCSN2oPkeXJ1kbX7344XWajKv5um+sNacVl1dKoylCcbQHE
	 gOxFWrtXQtH79STLYUc3x81qx3wXz89fxc/AiUUwEFr2AeXjtxD2URCtn7jYRgTsFP
	 POsLfOvUJ5eew==
Message-ID: <54d3b706-6f5b-d5ec-82ca-45b9f4995d13@collabora.com>
Date: Tue, 11 Oct 2022 11:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 2/3] iommu/mediatek: add support for 6-bit encoded port
 IDs
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Fabien Parent <fparent@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 linux-mediatek@lists.infradead.org
References: <20221001-iommu-support-v3-0-c7b3059b0d16@baylibre.com>
 <20221001-iommu-support-v3-2-c7b3059b0d16@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221001-iommu-support-v3-2-c7b3059b0d16@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_025508_078612_01C5130D 
X-CRM114-Status: GOOD (  14.88  )
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

Il 10/10/22 14:54, Alexandre Mergnat ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Until now the port ID was always encoded as a 5-bit data. On MT8365,
> the port ID is encoded as a 6-bit data. This requires to add extra
> macro F_MMU_INT_ID_LARB_ID_EXT, and F_MMU_INT_ID_PORT_ID_EXT in order
> to support 6-bit encoded port IDs.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   drivers/iommu/mtk_iommu.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 5a4e00e4bbbc..35e9731c3441 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -108,8 +108,12 @@
>   #define F_MMU_INT_ID_SUB_COMM_ID(a)		(((a) >> 7) & 0x3)
>   #define F_MMU_INT_ID_COMM_ID_EXT(a)		(((a) >> 10) & 0x7)
>   #define F_MMU_INT_ID_SUB_COMM_ID_EXT(a)		(((a) >> 7) & 0x7)
> +/* Macro for 5 bits lenght port ID field (default) */

Typo: s/lenght/length/g

>   #define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) & 0x7)
>   #define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
> +/* Macro for 6 bits lenght port ID field */

Same here.

After fixing that:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



