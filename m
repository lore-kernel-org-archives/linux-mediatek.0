Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741F1C54E94
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 15:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYORUDlrW3eCdz48TvQ7nc4tj/VoD9bDyDKFjsjEb2M=; b=KwlJ7xf0pdVMW2MugZBC2E2rDL
	ak2I/RejyXfP4UMRwyy2iveLYUEKOMBxwVhc/z6wNulIgbaJ/sYcZ45OeQ4JEyoxykiZI3tRKaRTM
	UI3w1x4Qi/TSnaC/Q60tztIwqtMHDAq1SbifyZ7qYbEXhb5xAYufhkyBWgGOqgLhbLbdh35kWyPaD
	Bezq6zccHVQEC1l0ZfulQJ7jQJOERCN2c/oolHAbsE3pksdCtGQ9lbVm8fgb44+c1OImwTsNBLN1I
	8k11yi5aW7cipfbB5b/D3vgtJsd28U/tjovR5t3zXY3vw5KkuQkVvQ90bRxtRAWXUNTZMj5dCXWwh
	7RWv36IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKLMM-004Y1d-IN; Tue, 24 Jan 2023 15:37:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKLM9-004Xxm-8P; Tue, 24 Jan 2023 15:37:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B14996602E26;
	Tue, 24 Jan 2023 15:37:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674574624;
	bh=Sbagj/2ywhL0xjl99DNt7MthmCjBe7nT34X+hJH8Tyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CZKyUC4g7T+UGAfyRIlrIyLoXcSqP/fwCYpQtFWz1bg42bPzpM97kUFMSWxcZ0J+E
	 9ERXJ3BLsVaz6hZ6LphJQdd4Fk6Ac7Yf9qizO6kQ5XPTYsljS8NIyRPsFuvLzs21zP
	 c7ZTDc4tt8BCZV2+Xpvy0MkcFPjb4EbP9jFU3wl/kn8N2BQDyPVGMcUqzzcfINxa/D
	 j/flgrEfGM7715+yMSQi5W9QhFTa+mNglSCpeAYd+6wcMvPkQ9wMYEBBSDY2vsf7W+
	 w+2nsgFYiRZ2OSShsJvrY7XIk/hs6JpDHcKGyPH0qUNHsZSgqR4qJ4Uq6YOe8b9OtK
	 DwntItrcEvNhw==
Message-ID: <80ce4ea3-6ebd-c249-45bd-a2f04343690b@collabora.com>
Date: Tue, 24 Jan 2023 16:36:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v11 5/6] arm64/dts/mt8195: Add thermal zones and thermal
 nodes
Content-Language: en-US
To: bchihi@baylibre.com, daniel.lezcano@linaro.org, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230124131717.128660-1-bchihi@baylibre.com>
 <20230124131717.128660-6-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230124131717.128660-6-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_073705_449287_33C6678A 
X-CRM114-Status: UNSURE (   8.34  )
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

Il 24/01/23 14:17, bchihi@baylibre.com ha scritto:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add thermal zones and thermal nodes for the mt8195.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>

You should change the commit title to reflect the same syntax that you can find
in a `git log --oneline arch/arm64/boot/dts/mediatek/`.

arm64: dts: mediatek: mt8195: Add thermal zones and thermal nodes

or

arm64: dts: mt8195: Add thermal zones and thermal nodes


...otherwise:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


