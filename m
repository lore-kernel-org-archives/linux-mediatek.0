Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1ADC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 08:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1o8VQjlU6SG/f28X6S4JyOUr6qOtW407zPUE0wIpVwg=; b=hrJxBE6P6aj0BTt/4688XHaSkA
	ViXmDQq3P/m8M1l9+KiJGvDvxYjif4zjCSrYKRMEwlBbjwQTwPgs/egCVnJZSfYfNWIBrAGaRaZYD
	xkdBPugCpYxNbQNV3A2gZgjYbRfxPeHuBcljT1VZ4tzOq0RtxZfbsycqCUBFdRtxehoQbmql1KA6X
	YlGvd/2VKNg2HT1vT+9tQUs64nds3PHIV/zSlYwJCGr2T/dTwWlChYKJvENfCZkxrh4sT1Hux2j0k
	7yAAnEr1xrIhwTJ61HbBQMRgIM5XchCpPA7M5LvO/ZWfizW+aDe5JgqsGTWOFLxKSmQu7sgKElsBi
	DPYJ7CQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLlR-003WWf-AU; Fri, 29 Jul 2022 08:54:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLUJ-003M1B-Pq; Fri, 29 Jul 2022 08:36:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 96A9E6601B3E;
	Fri, 29 Jul 2022 09:36:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659083810;
	bh=E+J4ZQLAfZnJ/hOyKXBDqkSw25fcCpHV7oqmKwt4gPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ViGmF/4qrWVzRtacm9u7huN9NbQz6TuQ1qOqMdgfd54uTJ6s5TonGlb+5/996UBDH
	 1YUOXbZoQzlNtjyKx1t6ion+/ey67KjxUzRQhpwUk8c/6IivlfzQ11TAl8caBKBfMH
	 SNrUlM7a4RkQ2KpCpBXZTcL7ijrUR0VFzzJQFs7Zc+gcFcCkr1h0uMnecwG64/jiZU
	 Yu7MSe7vV6zusJ6G1C5/ysM2VN1gsd1RyUp4vQlJxX5t+82Y4+++sU+DWrP3PP2d34
	 P++qFaq/S8CXMA3nrKkVo2AywYfCUtuFUdQE94Rc3jH/jvBZY9vd1x8SbFL+3+//ix
	 tdSnbW9Fn0Tsw==
Message-ID: <9d1d8831-844f-f30f-6c8a-fac052f8699b@collabora.com>
Date: Fri, 29 Jul 2022 10:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5] arm64: dts: mt8173-elm: Switch to SMC watchdog
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Evan Benn <evanbenn@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220729053254.220585-1-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220729053254.220585-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_013652_034428_7E1B5421 
X-CRM114-Status: UNSURE (   7.65  )
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

Il 29/07/22 07:32, Pin-yen Lin ha scritto:
> Switch to SMC watchdog because we need direct control of HW watchdog
> registers from kernel. The corresponding firmware was uploaded in
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

