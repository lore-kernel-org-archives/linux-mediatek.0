Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00DEC19F2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 08:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APehGwsZ857nIS4y8fzTUxoQJBhup/YUyB8KH4lQEYo=; b=f4KG+R3Ed+zAiXHYTHfHURCEMq
	H2EWERQVJoRT03NGckDsOXVMJGQYbtgZYvgMGqbNITVE00tFkq1fQMBbxg6g2VOTuKYRtmI7cP59p
	J3QZshhWk8uXOPLUS8szYdaTxdQry3zR4JDEkI40k/oOmRqdAqcHXozI2VPh4xbTUeDy8R9coBRmZ
	dmARjyKVXYP3AhdEl8dBLC5xioS/GSAnk2FUn8IZghM3ErPRyhca7PCfMgDCclPdzlnMgNHuE5BpM
	pWKUgdtbEbEnk8w3UhYbaA/AYMhlm8kcHwAGJl/D6KgpnzfXRM8zwDzAU/rqxC4GrNh9BMLkTuagN
	gZ5GPSnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLKR-003Dz1-C9; Fri, 29 Jul 2022 08:26:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHL1F-002wD1-FV; Fri, 29 Jul 2022 08:06:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 183C166015BD;
	Fri, 29 Jul 2022 09:06:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659082008;
	bh=30poyXZDYHoOi7yo8Mx/13fpvXrbxzbgyPizx79sv7E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BArT00uCFpADlywHesn6+GFQVFZfyRmo+/xYXjJjqNsp07rspLkFAwQXNxQC39o8Q
	 m5bDCELgsZrlBQsuXFpovQz4i/YR4jAJX/uj6nmr1ri5/X8GiHQe6Qi9i57v/g7c3F
	 F1kosTbo5sEzshJe6MeV2wbxA1ez0XNQvHmeDcLcHZZ4r97dRMljMfXGEkBX3nbKVi
	 RwRfF6N66RCaPqoPb96VNcQ1odqqIyJCk6/KilsgLn9mPX6McAcd2JDUoYUAFQjiOu
	 j4v3ioD7yvS+YqtZ7a1REy1rQmv9pNmFgPNTZAPXMcQQQUr/tIMpghO2dOUyzDltuL
	 dBJrRdaPqZTPA==
Message-ID: <41c74c43-296d-1c27-450d-c108674451b4@collabora.com>
Date: Fri, 29 Jul 2022 10:06:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 04/20] dt-bindings: power: mediatek: Support naming
 power controller node with unit address
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220729063208.16799-1-tinghan.shen@mediatek.com>
 <20220729063208.16799-5-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220729063208.16799-5-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_010649_701153_51E647D8 
X-CRM114-Status: UNSURE (   7.37  )
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

Il 29/07/22 08:31, Tinghan Shen ha scritto:
> Support naming power controller node with unit address, also compatible
> with node names without unit address.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

