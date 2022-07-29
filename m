Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7D1C04A68
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZvzftHGOSZlWACzHq4DxYk3BFMx/oTMHyC4V7+5Mgo=; b=UZjtQ2LqTmP5HwCM5n0tU8XPTY
	cKbObDFxn57yBsB1UFQVYp/7paI4E9c67Ec6Sdp2+FTFxC0inoOUqoQMAoMB6bDOIWwGXi2VWRtyR
	lH9oFtaDcRtHCYDiWPhTsyFWJ36VT0hYMRauXPwVx3SQTKOSjGhA41CdxMCsXNCUnB7v2KLd8y+Wc
	CiG6tq7W55UNmvlP0HsGcHujQ9qbotmB2HR7FgrJubcEknftVGkM2c2KNA5IOQxpbg5eyMOgMMy6E
	/ZkboNutNJP7ZLcttF74v/SkhwFmvSGRQBeFZP8QvGCCt3m7yvpnB/FJMpZGTtMw3GJCbvu9xhSmb
	fQELEFMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLLh-003Ep1-TH; Fri, 29 Jul 2022 08:27:57 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHL1M-002wEe-CQ; Fri, 29 Jul 2022 08:06:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B57726601B60;
	Fri, 29 Jul 2022 09:06:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659082009;
	bh=tYySmgjWp/6y/bcrBAfoaiavL/NRLu2X5y8IVqdmHe0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QjwkqyeRqidTyYkvq1VvUujFlgVHE8C83paxdngMD0USYKmleJyVf8njOFjbheTrd
	 JD9XUxghr1MXHphwmfTGUhpT2Etq0GXGMh9XREelZ5P9VWegn8S9GJu0UiIawf+l3Y
	 gX5E5hs1UmJnz/rWmc/HT0KFqZAXRjPFHIfpDV8yzxDJ4lNdrTCwe3B8w0mxmfAGxr
	 nhowyY89YEDW9L0j/BpsmD0x0DriJQuxdEz4VoUuQWeAfu2+W4XrFWboDIGjvgR5xM
	 FhP4Pc7vz4Ltu7/PRygrW9uOsvqA5HhZhXQv178ZgpX7DV75AmZvg/t2pcTq9Mngmg
	 GaBC+vhItNVjQ==
Message-ID: <0bcc1575-2c43-8843-8edd-8b73ddc4d0fb@collabora.com>
Date: Fri, 29 Jul 2022 10:06:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 03/20] dt-bindings: power: mediatek: Refine multiple
 level power domain nodes
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
 <20220729063208.16799-4-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220729063208.16799-4-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_010656_632430_E399308A 
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

Il 29/07/22 08:31, Tinghan Shen ha scritto:
> Extract duplicated properties and support more levels of power
> domain nodes.
> 
> This change fix following error when do dtbs_check,
>      arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: power-controller: power-domain@15:power-domain@16:power-domain@18: 'power-domain@19', 'power-domain@20', 'power-domain@21' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	 From schema: Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


