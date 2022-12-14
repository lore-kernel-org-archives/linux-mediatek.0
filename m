Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E95C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 11:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jRs0AwiQEwc93el+JJ5qrMwQ4Myr97dO+qZxNAAqr8=; b=LHvUpUbc7J58JG62/uzpRfywhA
	9ArWthn3tB2Cn58Qb694JBHKVHodCP+fDO/0JlV2JhY2gxbOAPMS3JKCsjg5ktYLcD8H4c4vLAGwl
	iaJJnNSh1VVWIWm4pnQzxcPh7rTEvrTKeDHKS728I0WaPz+7jU8GiCgiimvbvhjFX6GZMLUo3Ij7D
	1zgUwLLbp16Lwt7zZxoBK/L8/BkAbzq9DW+X3HAlMzt66Mk7kzbIu+V1uroSNO+hfUsltkVWzldl1
	pwHqqxm5w6z7y1g+48HcAZWS3AMoQHtLlRV/6K7hv/RFsO3gY/0p3UrJH0sHz8uiuX5f+kUCRDMj2
	BgLGflgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5PsU-00Fupr-DG; Wed, 14 Dec 2022 11:24:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Pry-00FuZj-OE; Wed, 14 Dec 2022 11:24:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6EF2E6602C53;
	Wed, 14 Dec 2022 11:24:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671017049;
	bh=gg6zTQZ+Wi0xiSg51eioScS2xVUBJWKGYfm1RSWHeXs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=NDlJzGqw2QPGfMIkBrWuuFs/b98sGjVM4nIp79Sjr46FyDxgm7030BSy+pTeymoe0
	 xDCPhp01Rfl2YKgBFIiVKctlmVRcMEm8Qgm1W48DZ2sWDx/xNdtYicg5unYsw2G5kW
	 g0gEBizaYtTdyCSrrq1sgsQ8aCK4HAdIGWt1a0jcp3/nHFjz4J684xMXLePpQCZTAQ
	 IP2afLWLhJoJ9lYYwagB/JgN08bl5WukyeriSZg/JUirsPLMRZyBbhVUapyIj1TatL
	 pD0sFYGNFONmu/RZS7lggvsz5Nm7wK7OkcY8cxGAW771aClhi3eV72uimASjgubKTS
	 AZ2bPE2FU5ZpQ==
Message-ID: <643621c4-5ec5-a643-d43b-825edd481d7d@collabora.com>
Date: Wed, 14 Dec 2022 12:24:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 6/7] dt-bindings: usb: mediatek,mtk-xhci: add MT8365
 SoC bindings
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, khilman@baylibre.com
References: <20221213234346.2868828-1-bero@baylibre.com>
 <20221213234346.2868828-7-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221213234346.2868828-7-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_032415_035434_15F97316 
X-CRM114-Status: UNSURE (   6.77  )
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

Il 14/12/22 00:43, Bernhard Rosenkränzer ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



