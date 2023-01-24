Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557BBC25B4E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AU0unKrM7XAkt6aGqfEoqI7heencmZ41LcJg6z4DkQ=; b=mZ+eMVb4wDQlbHyeLTkACaaMUc
	76e7oe55wbh5o8QCUihAf6HHqbgQoUEJ5Sj159Td18bPJMyVz4neKQxh1akDZ2UJNarfR7L5Y1XOb
	L3q3LDi0tN5/g0gadO2549VBamSejaPD0t1EEOyZQjedkHfZpHxLhWvkkMQrg2cKdiwezwM3HiGqV
	iixBjMW4Z9fgFKvIy2NwWduiNGQpIMJVCuZiIIGSHy/a0jhHcc123WBcXzILGtXtSC6WMk6YlK24c
	agutN2IkT7HRQ+tROfp0Dpct7iM5fdcVa3KQJ59BGjY4jbKzdDc9dWrsB+dGUgbUX1J5F15Ujk5b9
	6DABdTLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKLMa-004Y7m-82; Tue, 24 Jan 2023 15:37:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKLMC-004XwH-6M; Tue, 24 Jan 2023 15:37:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AA527660086F;
	Tue, 24 Jan 2023 15:36:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674574618;
	bh=DAN03XI3Z/7ojtABDu3TB1hWNZMR5YeSDQHCvDRNq80=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GiRx+1YdjIFZg5iyrkKgmtpRWNskZerRRgS9g/OrR+aMjCZCBgkmelY1QWkkKwftu
	 tcharaRfMwvIY4Vx8q6REpt2ByZZQFkMgL6yNsXiJmQcmiWQhzzLuAEe2D2jXkTBQx
	 De8lViH0eDkWE4G8ftFwzLsnfo5m1yruOIhrtXzTizzrWHsxWj1hGzMbwBS33DWkey
	 DgwS7nUyUPLwEZ910/CUf50qVURaphvsnptVZCHaoaqE6nuIwlv6hzgP7Du8RJT4ME
	 lMVkYl6Y4WXgti5pJdTri8n3xb4Tc4qXKUcLxCsMyE3jliI6swhxiRkxl5V6AlNJQz
	 mMtD4+swARNCA==
Message-ID: <948d2c55-872d-ae28-bd94-af56d800e6f7@collabora.com>
Date: Tue, 24 Jan 2023 16:36:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v11 6/6] arm64/dts/mt8195: Add temperature mitigation
 threshold
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
 <20230124131717.128660-7-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230124131717.128660-7-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_073708_387558_78153CFD 
X-CRM114-Status: UNSURE (   7.66  )
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
> The mt8195 SoC has several hotspots around the CPUs. Specify the
> targeted temperature threshold when to apply the mitigation and define
> the associated cooling devices.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>

Commit title prefix
- arm64: dts: mt8195:
or
- arm64: dts: mediatek: mt8195:

otherwise,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


