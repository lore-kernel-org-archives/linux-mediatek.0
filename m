Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C905C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 11:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9Q5YYFl47BA5Pw7MgYbStEqDiTaJxdKrN2FCG3Rg8U=; b=RW8oh0jxPYvGTI0gLi+Tgs8LOV
	LY9hzwcUW7CuKEv++F64j+V7IHD/PihZQPAPyWCptsN5gSvWPfhkaMaVd68iWnqlyEI9SuFD97bBB
	0pmDQDKu3spbnCl+bQipcxta3qRhtA7G4RgIocc22cwNu4yzUYuPZktvkQJHy0Ue0mHguXZVD0vey
	kVKBBsC17PHDwQz6yZ8GBfa33n6lIML8kO+tUZZ6GmugqZuJaHc2DgBv/V9Z/nd62CNV4hfV4dF3l
	hRH+14wk7pyuNOAqR7phjDlR7norHG6/6M4Eoh6OP5px5Bx6HqtuyvurruZMqHgwxgmN56N3JUtso
	ONCth01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofga2-009Z93-Bv; Tue, 04 Oct 2022 11:59:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofgZs-009Z7b-5y; Tue, 04 Oct 2022 11:59:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F4906602295;
	Tue,  4 Oct 2022 12:59:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664884747;
	bh=uWR6mifATwteDavwCYtlxjjRbJpEMopbvXmtwSS2OCQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kq2BHPr/TE+jy8XuU//QuqFoBiSGP8RiW/xByTgtQFcxLoi+FPmUajL9kfUuAl3+1
	 burnOiFauGGEpDWs8p3i3FP2mesx3VBbSJrwzAHQTrLMIQPTwud5Jmi2pvir1o1nQo
	 4H6MZWMqhbHPIStZ4KJCiaaaRdJgwbxGYFbSzd72KHjt461LyuqSXJRMRYk9/zg4Pu
	 nI/sLAlB0ldcJ8BsLQ0fL3OsWtyggrsV8z5y1tzqvXlzXDfEMCEuhFZZ9tiv21CZib
	 1sPKezcJN9qvGO3ImopbxGg5BP+mHCARfzEjNuoQdlN8U8vx8g6agChV4A+o8fnewt
	 f/pNZi2wasI1g==
Message-ID: <7d37e6ae-0dca-e0ef-2841-298c1ba9784f@collabora.com>
Date: Tue, 4 Oct 2022 13:59:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 2/3] iommu/mediatek: add support for 6-bit encoded port
 IDs
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, devicetree@vger.kernel.org,
 iommu@lists.linux.dev
References: <20221001-iommu-support-v2-0-dbfef2eeebc9@baylibre.com>
 <20221001-iommu-support-v2-2-dbfef2eeebc9@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221001-iommu-support-v2-2-dbfef2eeebc9@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_045912_399858_4751FF94 
X-CRM114-Status: GOOD (  16.93  )
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

Il 04/10/22 12:01, Alexandre Mergnat ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Until now the port ID was always encoded as a 5-bit data. On MT8365,
> the port ID is encoded as a 6-bit data. This requires to rework the
> macros F_MMU_INT_ID_LARB_ID, and F_MMU_INT_ID_PORT_ID in order
> to support 5-bit and 6-bit encoded port IDs.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   drivers/iommu/mtk_iommu.c | 24 ++++++++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 5a4e00e4bbbc..a57ce509c8b5 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -108,8 +108,10 @@
>   #define F_MMU_INT_ID_SUB_COMM_ID(a)		(((a) >> 7) & 0x3)
>   #define F_MMU_INT_ID_COMM_ID_EXT(a)		(((a) >> 10) & 0x7)
>   #define F_MMU_INT_ID_SUB_COMM_ID_EXT(a)		(((a) >> 7) & 0x7)
> -#define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) & 0x7)
> -#define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
> +#define F_MMU_INT_ID_LARB_ID(a, int_id_port_width)	\
> +				((a) >> (((int_id_port_width) + 2) & 0x7))
> +#define F_MMU_INT_ID_PORT_ID(a, int_id_port_width)	\
> +				(((a) >> 2) & GENMASK((int_id_port_width) - 1, 0))

I can't think about any cleaner way than this one, but that's decreasing human
readability by "quite a bit".

The only way you can keep it readable is by adding a comment before these macros
that explains the sub-fields of FAULT_ID, located in the INT_ID register: please
add that.

Regards,
Angelo

