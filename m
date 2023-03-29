Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5B1C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/K34f98iAwEKj2yHtfB5m2oS5kj2SbbeQ8qTrj7DEgk=; b=S3fab1JFV93F9vpa8r4FWO0JUe
	o1m0Hg5mNyJA0kmTyb3vxdGvrjILpwWmFWP9maVU4aVWd3k8C5NXKNJ09gf9jsK6m9D878z3KJc2b
	nIhCsq9YiUc7Vnm2L+Prav4ZgnK+Xzzzs12pIjWHMOMyCGzQk0gyrocLc+y9CXqzHoxopCfCxQz6n
	dX6syLF8I4NKrJHcN8JPUD6IFiCdwMNiEnjRwkiLRWhtTpjPTXCB3T38tZM3Dd87e+UzysEZFP2ly
	8j2+NyHYpHXvsC8JZYjsGDdAL9Iapm45w+gOFnoXr17S7ntR3vONCAMPIpL9auvIWU0fRExgbRBzl
	sC3E/nHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVz2-000QkZ-1U;
	Wed, 29 Mar 2023 13:37:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVyy-000QiP-1j;
	Wed, 29 Mar 2023 13:36:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A670A6602EDC;
	Wed, 29 Mar 2023 14:36:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680097015;
	bh=7jiQMzP/m4JjnZTPfL9dVb5A2MzU0R1L41dhstba18Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GJYK0UQHD/W+L5SDD9MwzFt3Sk2VfSK+EjnxPoPNamuN6uVTXYzBWu0QBHXIEynLz
	 x9pwb2M+xndTou3CWo5Ws38dGrtNvebwB5z1CL9j4bQQBPSclk2TfFYmopuGWUf8iv
	 XSyB2PN/iNF1+owr1crOwymzwTrqVFKuxA8rzO26PUw7A7e8IVD0Dd/ZU+nwxs8CtU
	 qVKXq/aLwn3WuRnQCGsJV7D6VPOKoPdSoDRZXVDA9g/s03C50vVPGkHNN0d26sPwSH
	 l4NSP1mffGJJA2+niazxJqrDJowbf5OXIEgw24ALWWbfv4Qf/o806BCuz5Fb1N4pqu
	 CSseY2kVUv48w==
Message-ID: <223cd4b9-839c-afef-f84b-5ca6753f2631@collabora.com>
Date: Wed, 29 Mar 2023 15:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND 4/6] arm64: dts: mediatek: add smi support for
 mt8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v1-0-4a902f9aa412@baylibre.com>
 <20230207-iommu-support-v1-4-4a902f9aa412@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230207-iommu-support-v1-4-4a902f9aa412@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_063656_707455_0D93BB6B 
X-CRM114-Status: UNSURE (   9.00  )
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

Il 29/03/23 11:52, Alexandre Mergnat ha scritto:
> Smart Multimedia Interface (SMI) local arbiter does the arbitration for
> memory requests from multi-media engines. Add SMI in the MT8365 DTS will allow
> to add local ARBiter (LARB), use by IOMMU.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



