Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F0FC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 11:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72ZHdctbMy6BA+TLhG3cn1P0qZ+sj69upcM8i5BaVNE=; b=EDgoMszpOPA0g96rnqXHui67na
	fdA3nSFkXTbzVwmYSbbMYw4cLBcys3u4SNVp7plx9W4xEPVKuLlrGYiO85E4nSdOayeVTIQx5JSVz
	ac026BwSICF1PyBsLQtlUf5Ba5JGyxCbByCJk1rGOcDgEC7CR9ZswEAeUiPcpx92B7Edti70Fapao
	E0FIOgyTaRgu6ewbvdJZa4HtB9QdW+CLAmUhK7AfdT2oQM74JKa/ETaT2D7TfGxGwzEogE4Z6loAy
	ZVtzx1ZbBPVx20ufXaXAseE99r59/cRCND3kABQwbjjDj9w1IR60emTYXiU9H2967ttNRKtzzbeAj
	7vHDEzSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5PsJ-00FukB-Ne; Wed, 14 Dec 2022 11:24:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Pry-00FuaQ-OL; Wed, 14 Dec 2022 11:24:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6FCC06602C54;
	Wed, 14 Dec 2022 11:24:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671017049;
	bh=kKWIY5Dp8xw9op+VGGS36ytI6muF1GJftUqbiGhYXk8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=fptNUS9ANEQeRvSgc5LLanM1HxPFV0+YSg3+9gPLkQdVIo0cmMZ1o+TGC/zUBkFJg
	 PKk6mc7bTiaWua7B7jRJNHuUvNgHMuTHAo8kZ//1eM47Nm0wFFjHr6npR60Aeeq970
	 yNGehQOS14CJ5QjIvRuVLjchA9D3sRR6e9DAW6I1F7y0D4FY2fOrcwAfe479JqnLhc
	 lw37tHa5nJ4gO/klPS63npiALufB/1bbs6MLCaB8VhC1y05cqd2hrRvlcPK41BEr/R
	 eDeeC9/PfOVxABQPsOcmzMWVVYby3ZCwjqAPK7XXO1FEIov/Xc9TGIH6Aqt89jRPzH
	 t5eAZfZmfE/zg==
Message-ID: <15d4f9cd-0141-4e30-c5da-abb8c2ee7306@collabora.com>
Date: Wed, 14 Dec 2022 12:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 2/7] dt-bindings: irq: mtk, sysirq: add support for
 mt8365
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, khilman@baylibre.com
References: <20221213234346.2868828-1-bero@baylibre.com>
 <20221213234346.2868828-3-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221213234346.2868828-3-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_032415_025943_C0897249 
X-CRM114-Status: UNSURE (   6.10  )
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
> Add binding documentation of mediatek,sysirq for mt8365 SoC.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



