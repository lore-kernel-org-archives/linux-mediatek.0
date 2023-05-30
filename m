Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C426C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 07:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7OPQnm1ULYOa/mJ5r0kHXEF374CNtbI6WMlPON+jX0=; b=RBWM4KJ1n4/mAtNXpuME1AtR0n
	6tqd9GdQB5ab0s9pC1sztO+enJqVBklzuCGE71rH7YeGubgnZ0YEWy2zjay3gi9z/zIJZU3/eh2ti
	O2ABY7/CPuFbshzm2tP7Bbkyf3IUtwHIIseNkY/aRO6bhbFYcgBpeu5CJk1RTmev2A5QL/zVVVNcE
	L/qsKL9/kxd+B7TvEvYejCCaBWDkLNKHAXmj0AiGLLd3kFbg+q/J7sDnMeu7Uxpeg7VWwL43TjofJ
	e95FX2LlvNUkgSUXj2VoL2WL5lZ9vS2mVqMrRy2+VE/qO9FWcmv8b0BUPmVPCaWZ5pIzOHO5p4YGE
	PbYJbNqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tL7-00CeAE-28;
	Tue, 30 May 2023 07:00:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tL4-00Ce8I-0I;
	Tue, 30 May 2023 07:00:15 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8AEE46602121;
	Tue, 30 May 2023 08:00:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685430012;
	bh=uPtJg6nqm4Lw8wV2bKPrxiAPNJYjVzZMLC32zuK6p9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Szh76ihHnRtd2J7IcygN+Ti5oNlYlRjT11COGT0RqRkzNvSfkGUnS/7WwBzmNHGW8
	 waxik+DDyQA1CZaf6K9Klo35YRYCtHJ+ArJyagrm8gDY18Xandzt26PRQIcLtAIKap
	 c0wJKpj0E9ucK9WdhRxnjTHN+dOnKeZ+niNTHQThXhzjcsVBR9j6nrU9eLkusGyexW
	 mUPOBDloZq2eFtujX+X1rb6HuDd5q2b4LQ3x0TedNVrCkK+ZG+q9hyxVOuJOlvwRYh
	 ngF3FAMl1MYYmL/ZZLvONM//t0DbjuKa247HfF5HSA0pJwIYtjR+styCiRzmdIFfo6
	 xJ4EYhTk7CKmA==
Message-ID: <f0d1b9d5-5db4-136a-5ca3-ec74f5f341cc@collabora.com>
Date: Tue, 30 May 2023 09:00:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 5/5] thermal/drivers/mediatek/lvts_thermal: Update
 calibration data documentation
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org,
 rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wenst@chromium.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com, nfraprado@collabora.com, abailon@baylibre.com,
 amergnat@baylibre.com, khilman@baylibre.com
References: <20230529164605.3552619-1-bero@baylibre.com>
 <20230529164605.3552619-6-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230529164605.3552619-6-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_000014_259254_7C7083D1 
X-CRM114-Status: UNSURE (   6.83  )
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

Il 29/05/23 18:46, Bernhard Rosenkränzer ha scritto:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Update LVTS calibration data documentation for mt8192 and mt8195.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> [bero@baylibre.com: Fix issues pointed out by Nícolas F. R. A. Prado <nfraprado@collabora.com>]
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



