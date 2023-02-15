Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC41C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPyopgV2L7Bjty0TUV5DnAip/mJ2p+UOvlImCrzACC0=; b=Yz1ShiTiNMgyBj7QoEgWoAgK8U
	cPJu55fgFv4+81qyxVV7kaL4Y38z9/5TJIoAhBh8P8iin76ld8YJzEvKNbkuTcEdzyUkcUroPfKdy
	V77rUqB/jNavOFb2vikOvd9MM/dGbIF3/FfoXPsYl4j6jlqBEm44P5lbqXfvCnX9Qn1CocgM6eClb
	ehBH6xPIcb8vnCg0C7jNJn1CjF3FFRbuApA7t7WrUV/VTTKZoyDJ3/OFFVPuT1N2caIUrW33HXIGp
	ELVJv1YPLxUBIUxYY1YNlgj+ZF/6zpOmaWLLHx4QKYfVKtScz/yaaQBK0A6wI+0VGzLSymvQpin1P
	md7ywWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSGyV-005m4z-Li; Wed, 15 Feb 2023 12:33:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSGyK-005m1n-1r; Wed, 15 Feb 2023 12:33:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 70FE866020BD;
	Wed, 15 Feb 2023 12:33:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676464394;
	bh=yM8UZlP7PgHoRsCkVSZFSvADbuNBTD+p54p7NQUgWe8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nG6lJqnHl3vZ6i+3L/PYbOPZ4sAjtdsH4v+WXVEuuRE+m0RN4zl9217DF61IlWFYC
	 b8RejFETSD13EwtHmVtsUl02hZAG2XsJT+tv6vgPjrWVtKUJc0zpzsweqXHyvo1q66
	 4HbtRFtTHiNZwB2A6UGSu1ZkdaYpTaOOCC6N/TLaEqnxkBo2fUwdQibVtB/RlL8F15
	 xgBbzjvClleBYyp1vue7PyBU0ljn7INDulSjG+KL6E/UYbPQTZEDahHYu8ieBYNK6y
	 RqakM5skMwo+egwZRuwz/jhj1N5pow3oirOnxvuSmamC9mnRu/WxtfIlgl1owne62+
	 Gu3n66P/ZjNOg==
Message-ID: <5701f81a-07c2-e3d5-d2fc-92c7fe4df58e@collabora.com>
Date: Wed, 15 Feb 2023 13:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4 05/11] iommu/mediatek: mt8192: Add iova_region_larb_msk
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, nfraprado@collabora.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, jianjiao.zeng@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com
References: <20230215062544.8677-1-yong.wu@mediatek.com>
 <20230215062544.8677-6-yong.wu@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230215062544.8677-6-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_043316_252753_746FA8B1 
X-CRM114-Status: GOOD (  11.89  )
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

Il 15/02/23 07:25, Yong Wu ha scritto:
> Add iova_region_larb_msk for mt8192. We separate the 16GB iova regions
> by each device's larbid/portid.
> Note: larb3/6/8/10/12/15 connect nothing in this SoC.
> Refer to the comment in include/dt-bindings/memory/mt8192-larb-port.h
> 
> Define a new macro MT8192_MULTI_REGION_NR_MAX to indicate
> the index of mt8xxx_larb_region_msk and
> "struct mtk_iommu_iova_region mt8192_multi_dom"
> are the same.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

P.S.: I'm sorry for the step-by-step review and making you send multiple versions,
       I feel this can be tedious sometimes but - at times - this is the only way
       to make sure that the code is as "beautiful" and bug-free as possible!

Cheers!

