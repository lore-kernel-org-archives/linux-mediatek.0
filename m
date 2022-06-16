Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E56FC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 08:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ziujsNQpVi2ItgNilXMba0cEPnr+1m9qdLH0H1yURqE=; b=CaLZncKIEDd+Re3QICWgsHwy1/
	zeBFxQaJ76otCztkc9sqdbeHtXgAeB79zskU/6bdZRz3to/cC67QeZp3yxOwvJNF02kthn9EC3Hrr
	IFkmuXQDhPl8q18DOs0bMq78DAGPlevTEWVDF8fBp3qrB0NDOfpYgMOf35CqpRkAfrm7cUrc9RAGY
	8TelyKwDF0F/1jN72iVYS7NhMnd43aEUv78uc6hPKMwk8VPtVSJK6Ch2OP29hsqUfvdklkCHrbEOd
	Al9cVJB8Qh2emFZP+JX9WJIyckZI54XU+HNu2PejHdRnxdFZ6qZP575/JLCnuroxFtWLLBXO/r6PW
	66YHwmMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1l8e-001Rkx-Nn; Thu, 16 Jun 2022 08:46:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1l8S-001Ret-K9; Thu, 16 Jun 2022 08:45:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 44EA16601745;
	Thu, 16 Jun 2022 09:45:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655369151;
	bh=3V8ML5nble416YqEnklIe2qV+U/q3IDZwUrctK/WtyU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jQrHrvQuytaaFWaSqxSHYM0vSS05al78apQ2LJHpDN0hf2dloTBuGpNpWqYBWmsy3
	 tyRtoMdES5KqdD1iIQG+xYHTYbN0FGyVjvR4JqmU0olldQRi5BmIAn1CyH8fEFvDQH
	 SWB7PyRiC7TiLacNPQhqQ5CIQMP5MO7WYVjfxdztcd3jdY9jmnf9TDAfELy2oE9K4t
	 rVbzOokhsQRWjeSq9hl6KWTLDUofWN8quKmI0vWq3LWmVylaz9yAuMk6zxZCYM5rNJ
	 fv6bBWLzZ9sAiIFo/uRoG6/qWLVSg1AWwo3rtwOKiPq8Ze0UlJ2cMR+IQtTeKplz1u
	 BR2QhjXvcrSnA==
Message-ID: <5bc0a278-6a78-efec-f07b-a990830253f8@collabora.com>
Date: Thu, 16 Jun 2022 10:45:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 6/6] iommu: mtk_iommu: Lookup phandle to retrieve
 syscon to pericfg
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org
References: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
 <20220609100802.54513-7-angelogioacchino.delregno@collabora.com>
 <db422fe4d0b5391ee2aacae989d7e48209e1095f.camel@mediatek.com>
 <80c7fa61-e25a-fc45-bdcb-60ac3796b96e@collabora.com>
 <2d0f49294a8bac34dd5dd1ce4201f009a207b7a7.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2d0f49294a8bac34dd5dd1ce4201f009a207b7a7.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_014552_844751_7E7AE2C2 
X-CRM114-Status: GOOD (  16.48  )
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

Il 16/06/22 08:30, Yong Wu ha scritto:
> On Mon, 2022-06-13 at 10:13 +0200, AngeloGioacchino Del Regno wrote:
>> Il 13/06/22 07:32, Yong Wu ha scritto:
>>> On Thu, 2022-06-09 at 12:08 +0200, AngeloGioacchino Del Regno
>>> wrote:
>>>> On some SoCs (of which only MT8195 is supported at the time of
>>>> writing),
>>>> the "R" and "W" (I/O) enable bits for the IOMMUs are in the
>>>> pericfg_ao
>>>> register space and not in the IOMMU space: as it happened already
>>>> with
>>>> infracfg, it is expected that this list will grow.
>>>
>>> Currently I don't see the list will grow. As commented before, In
>>> the
>>> lastest SoC, The IOMMU enable bits for IOMMU will be in ATF, rather
>>> than in this pericfg register region. In this case, Is this patch
>>> unnecessary? or we could add this patch when there are 2 SoCs use
>>> this
>>> setting at least?  what's your opinion?
>>>
>>
>> Perhaps I've misunderstood... besides, can you please check if
>> there's any
>> other SoC (not just chromebooks, also smartphone SoCs) that need this
>> logic?
> 
> As far as I know, SmartPhone SoCs don't enable the infra iommu until
> now. they don't have this logic. I don't object this patch, I think we
> could add it when at least 2 SoCs need this.
> 
> Thanks very much for help improving here.
> 

Many thanks for checking that! Now that everything is clear, I can safely
go on with pushing a v4 of this series.

Thanks again!
Angelo

