Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4684C3064D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1vduvO79FjVMME9mO/cPYO2MHX/zPV2hATJEans3gA=; b=wIFC/RYjX31BA+M4VEaSgtQ0D2
	06KUIaIBcFOoH4Abnj7ZPtKDae1l8h+syXzng4s9rXsLpI5u+z0C41xGC8SVj0wJHP7lttN2yuv7x
	IrvgqzV8EKoq6IvHHn+0gsJ63I75j+ZWHnHRJTzmgRqTAEQKsghJ1A557n3gKyp0AWdMC5CQnTXXK
	45puQJ2SDwKYLFLM13c5leOtpSrRSMn9yyFm70oIQbS1aN7lAOkMD/szLoGYYx6FshBeJT5jC5aNb
	OFezCSJVI0VopQZMD4POgK2SCalbcsfOdlIdV5WWkLzIwUIfgdKhtdLFOpEmk5wnyttqj5pV1Yqjh
	/LgV/Igw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmYf-0000000A0Z6-1V7s;
	Thu, 27 Jun 2024 10:40:53 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmXi-0000000A06p-01Rn;
	Thu, 27 Jun 2024 10:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719484779;
	bh=1VPF/YzboKYqX8bLJxoG0opm44sq0rmDZqjgaBL4l1s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QDAkt0AMBCV0fcJoXfoz4DoqVHH5hP16/piSVS/CPZKtRGUJT0mg7mWoQXIgjEFlz
	 /x4z4Vgx2wgQfSLyETU1nEKVj+Hd/ErWcUy66QmmuY6ZCit99+skhBLZMYNS/Xb3m6
	 KIUge3anDIPf9Zy5wsCsXvV/eKJt4pSBV//SQtyrASHkwMBLAzfhfpl3rVQvrDWWzw
	 J074x4DDINc6xxyj+6mvVqiVNQf1J/EAvwVeoHbctDwjnvQ/maco7pzLxijKvi4aVn
	 QJavJykwgHgziMBECh7s782cGnMjO1IvjySjxrni3sV0Md4Dsw6yQRBmM8qjKAacTG
	 i5UdZ9+M/icag==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6C4AD3782181;
	Thu, 27 Jun 2024 10:39:38 +0000 (UTC)
Message-ID: <3eb69629-888a-4a37-ac65-3aca07188cdd@collabora.com>
Date: Thu, 27 Jun 2024 12:39:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] dt-bindings: mfd: syscon: Drop hwlocks
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chuanhua Lei <lchuanhua@maxlinear.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240627-dt-bindings-mfd-syscon-split-v4-0-dc6699a9f3e4@linaro.org>
 <20240627-dt-bindings-mfd-syscon-split-v4-1-dc6699a9f3e4@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240627-dt-bindings-mfd-syscon-split-v4-1-dc6699a9f3e4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_033954_983639_CEF4BF19 
X-CRM114-Status: GOOD (  10.69  )
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

Il 27/06/24 12:32, Krzysztof Kozlowski ha scritto:
> Apparently there is no in-tree DTS syscon node having hwlocks, so drop
> the property to simplify the binding.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/mfd/syscon.yaml | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 993460c3cfe1..cc1e9fec5cc7 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -143,11 +143,6 @@ properties:
>     resets:
>       maxItems: 1
>   
> -  hwlocks:
> -    maxItems: 1
> -    description:
> -      Reference to a phandle of a hardware spinlock provider node.
> -
>   required:
>     - compatible
>     - reg
> 



