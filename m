Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A505BC25B4E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F85UA9xcN/KsuXB+COke0NC0qsDpK4aJwRHfaziZeF8=; b=opV1eQknRbf53U/YpWhwlPGR1q
	hQt1fq9ZDgC2y7sLNtxWRN5UZtKSkqRrJu/CYI/m7OLuwGBiPIxSkzZsqTlANCSxvU+9ck74tDsb7
	dRjKBN0HsG0HPd0dufy6J2ZjxHMF1Zwvq2JjMMNpIaf4mgB861pPDLyqoqRQZbyLePYAa3pP6aAYv
	3kxjoHb6o/xQyo1kTfiv/W5iBoEq7LaZ5gvvXRGfhLHQsNSITq21OH1ddU0sy4iMMo8Jnlz9sX1I0
	21bebOKDEgi8GfB91q2gxgNrEVTyzsSRD+yHJscd9noSe3tYIzTKQ2F8lcaVrWeVU61A90GJyEF1C
	7a/sxBVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKLNE-004YQq-1k; Tue, 24 Jan 2023 15:38:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKLMW-004Y4w-JF; Tue, 24 Jan 2023 15:37:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7EBA96602E31;
	Tue, 24 Jan 2023 15:37:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674574647;
	bh=6o2Viye9YQhlWUr1v1m4HSU+/9UO2qVzEYBso3DcU74=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EcfMMKRrFJ+ZmF4kvLS3arY6Ebrqq007CmGaHy4ghYSORuNKDs/FaqDZdz9Svndho
	 WemQr658azNuU+A/bpt//twLudF7E9dIqLwjkxlK/u44KPJN9cv2nhKrTeOl2JGt8k
	 Ea/zFkOgWa+5nCkrvhlt9adSY2Ambx2t67Z5GnRlJoHMNBlLyldGJljfFCeRH2hjiA
	 /9VXQAKKvWqoSgfzr6dw16ArwG68QPCSUHSSmthfLZIUMl6r9eruPFWiXmYWtRDIvH
	 9ad99HMS9cA0vI6/gZyXGECKDUM0AkfZRkdmtp3vuJuXa6EbHCgncd9nHZQaybcu6V
	 EFbbBC0PVeEFw==
Message-ID: <976628a6-58c8-3298-3777-97aaddf53bc1@collabora.com>
Date: Tue, 24 Jan 2023 16:37:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v11 1/6] thermal/drivers/mediatek: Relocate driver to
 mediatek folder
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
 <20230124131717.128660-2-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230124131717.128660-2-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_073728_813001_BB4E54C4 
X-CRM114-Status: UNSURE (   7.82  )
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
> Add MediaTek proprietary folder to upstream more thermal zone and cooler
> drivers, relocate the original thermal controller driver to it, and rename it
> as "auxadc_thermal.c" to show its purpose more clearly.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



