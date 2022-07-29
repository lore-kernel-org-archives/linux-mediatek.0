Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF54C19F2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQcU9kfr50WWidJ649a1f9GE9HVSf0lR9Ynw8xfAFGI=; b=UIvNCgwA1txVa9JY4eqFRXNo7C
	EyzGCm0Xh2UnyorH4LCPwcgSZzRyD37DMSgoG1uoRsLcH7KAWPDmxfWT+Ho5letDyZoV1LEV3XUn5
	/wmv+tSnCs3h1rckz0RM8UmwcbA/SDNhN/zI+ewZTKNopTReTuffWXl4J20o540QvkjJh0ZDpEIaD
	M+tIuC112C6kTRDAxDpC80jSEYHkoCVDFeXhdcXe5etP8nOQLm11b6hLuQJVQv1t/waJ88pFtjFEp
	xbmtnkqpnTvQkmLkeaxNodQkFvsv9BGmgiDxaZmG+iVXDuWrN847kqgY7Eqlu/d7ZcBJtag974jw5
	BpeEAVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLLj-003Epk-Cp; Fri, 29 Jul 2022 08:27:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHL1M-002wGd-CP; Fri, 29 Jul 2022 08:06:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EC4736601B61;
	Fri, 29 Jul 2022 09:06:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659082011;
	bh=qBf1nL9/1kNOEGbo8f3vyRCuICpyYcslgWT71nIlvPI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZaV9TLcaaThuuAB0SMNov2JMhl7zyXPc6hrRQ+lofqvf14UZ1CHM2yfpFvyC2gKRU
	 qTLmpu9dmVLUL46qkclTIDFDPuK0JeqBhy6hspj2liUwRAZeku9K2oIrBRdiI7MuF2
	 iQwuXVNwydv78Slel53tOVxLfK4XDHJWHUTzevdVrL1auWBMUuCTE6zs03dQiu3mx5
	 QtLdyjQoeSjw9eK/aaKUwz/h8npU9GuNHhROuJ9HvUhPt7RjTe5Oq3cC5ZTCBuWjI2
	 nDBGKwGOdBuociNjYRlzxSpuMYIBewlMiy9dGPQQW21NhDVdNW6OeSCAAnlElOby+f
	 ihoJ8ayGtScSw==
Message-ID: <d838b1aa-3921-18dd-6522-09fe73179fa6@collabora.com>
Date: Fri, 29 Jul 2022 10:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 01/20] dt-bindings: iommu: mediatek: Increase max
 interrupt number
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
 <20220729063208.16799-2-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220729063208.16799-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_010656_654834_F08F819E 
X-CRM114-Status: UNSURE (   7.38  )
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
> mt8195 infra iommu uses 5 interrupts.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

