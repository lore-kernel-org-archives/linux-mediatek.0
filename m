Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF451C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 10:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hIpK5QqJ17c80Xs+9GONw6j/L5qYe+VEm+Z4PFsIY3M=; b=tBbpKtnA0uaUH/
	mbLtTFAyzBZTwwpR2XCogASsx8lZWYSxIRgYIQ1HX2D5nCD0Xosht4j/QPiNv4GoFVO0Sz68TUf2Z
	wqyO9Df3UAvd+yHYLPECu7SXNk0xAlV9yVUHPcKIge9lujRYmLXDAV5/xaWZyfq08Px0G0viF8Q6t
	oDUzA45Gs+64gZUVOSF79Ey5ZEO6iUbzCz4EeW2iZmDmGVruwtj6wksdSGMCThdFnzvG8Hrf3+MJ/
	ndeSrpGhTeBSyycFKB5N3U420TN5wKaDtNeoik2owVEzqLharMeKshLjcvhuv9Ra+pZfMXd2CRqnH
	Vjs/qckkTzgyXZF2yQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzc91-007f6m-2A; Fri, 10 Jun 2022 10:45:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzc7X-007eOg-Ub; Fri, 10 Jun 2022 10:44:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 422356601739;
	Fri, 10 Jun 2022 11:44:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654857840;
	bh=lj3xJzmaDU78TbJW5AGp9pDhMJpFS3zOXR4DFORJC/o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UMQAlCbCfhbIPqzRMhPGJb1SqrWj3HOitsoqbGqHp3nWiByj6+axMzjkvhn9DE70d
	 heZPb7PukrKwW5NBWaygsK0BdSoOR9yX9tni8Ek66w1WTl+sdJl/xrGurQJc18y9aS
	 iQnb57xgmNqjOV5VqN1sAIzZgVZVazwwCDgGnWzPjxM9tm3ATp6OLhPt9zT+PYMKmi
	 KHGL0a7QgGfEgeflmKV3J9VzkGa4hV65jcX46MTG53lzAnY0LG/+/QeAcfWsMjy0p+
	 Yo3oLCErdkycCv2DqaHRzhKQ0ciJbwomwwuzcfAVK/Xub8CYznloaXRYCaKextDKcg
	 TGS2Sc+Urijpw==
Message-ID: <4e452af8-e96d-fb06-7800-707f3bf75155@collabora.com>
Date: Fri, 10 Jun 2022 12:43:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 1/2] dt-bindings: interconnect: Add MediaTek CCI
 dt-bindings
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: khilman@kernel.org, djakov@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220607140556.6278-1-johnson.wang@mediatek.com>
 <20220607140556.6278-2-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220607140556.6278-2-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_034404_184588_7FAE13F0 
X-CRM114-Status: GOOD (  11.22  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/06/22 16:05, Johnson Wang ha scritto:
> Add devicetree binding of MediaTek CCI on MT8183 and MT8186.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Georgi Djakov <djakov@kernel.org>
> ---
>   .../bindings/interconnect/mediatek,cci.yaml   | 141 ++++++++++++++++++

Uhm, I've just noticed that this is being put in the bindings/interconnect folder.
The mediatek,cci is *not* an interconnect driver, but a devfreq one and is not
using any ICC APIs.

Shouldn't this go to bindings/devfreq/ instead?!

>   MAINTAINERS                                   |   1 +
>   2 files changed, 142 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
