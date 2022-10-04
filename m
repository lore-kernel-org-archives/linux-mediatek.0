Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B4CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 12:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qoPKJOsTszZP6fH2Uhly+Uw14+LvrLbGOLyK2/VTtw=; b=dGcdi+Q78xE0BC+GFs4tMre35n
	SDc9AIEpu0+Gy+NdAyGnhHdpaEn1hbqHV5JipdX02oT+btfoxKcGCNcno5r283RBcnquLWSdJdHyJ
	TDfGpkBtxtqVQNFWCtgW0sCWhn8RdS8uOdKv8HzGiiLy5NBULI0z13jz/iJIV4C45a5MgNHG2O501
	jo+reFRglW2ipBxygTIwQlkM87AysLhurTkgiOiH2vVlEDNplBWUjie8p3tG4JE9OCwyTpS7wt8/T
	wSef7eaIQ0zqLc9ebcJmWxVOY8sypMYOYLcldHXFYycyWeh0Td/HB/OpO+J5JVZkgpfdaexDi5eyl
	upnqqgYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofgbN-009ZOx-EG; Tue, 04 Oct 2022 12:00:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofgbD-009ZLR-DB; Tue, 04 Oct 2022 12:00:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 135B666022A5;
	Tue,  4 Oct 2022 13:00:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664884829;
	bh=hwEkVOk0X19wQSHQyqvhxpH6Vu8Q0/uLhGNdi1t1cak=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZroDbJrtHtyngKMsLyHHm+HjShAVMQqhP5Pe6s9Qd+Ep7K2yZEinLLif5oGlYO9el
	 YlNzZLDLnEilpi5wJs3lBQ32zzUKikXpuqD/0Eyy5lVxZpEGlaXwCfmGgSr0c56ccn
	 h195gH50EUIN7mnc/nCi1CqQmPXNX52F5smf2WDe3lJNks+qBd7xk9yDqDHLQOFfWX
	 OcSfxnO0VVvih5QaQl4tL63/nfeldzMDG5T2bFTrVw8KWi/XSYsM+rtXnBrZv++ave
	 +Jcim0pEPSi2zZJDjwCVEbGhU5MdMsVwcdxTMMsi9aQYP8hpsVaR344ZeH+Sq0yC/D
	 N4FtoXbs7uxBQ==
Message-ID: <d8a16caf-103b-55ea-c0a3-71013b7fba7f@collabora.com>
Date: Tue, 4 Oct 2022 14:00:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 3/3] iommu/mediatek: add support for MT8365 SoC
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
 <20221001-iommu-support-v2-3-dbfef2eeebc9@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221001-iommu-support-v2-3-dbfef2eeebc9@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_050035_602326_958A44FA 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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
> Add IOMMU support for MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Tested-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



