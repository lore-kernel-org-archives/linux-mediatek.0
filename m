Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E36C46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 10:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YmitH2AbOdtPlhmUItU20KiGice6thkrEfwSSKzG0E=; b=l0c5YWsEuIwrN4PQ5E9LWdDK08
	3g4QUMACqi1m/5pSB7fn6QQuD6fzfejRSwHxXRSby76cEj9eD7fQaRE3iy35Z4RJIVAJ8EmwLDBS7
	TVTkH2wbrc2Vw4u+0akPW33BfSssLtRThXl4BNCsWnEMAexaXVBUbEhBOTYpc2PYfqyKRXX48hVkX
	/QZlmNtiVCMWxjHiZPpFxufHOzZGTTdcqxHzbY+XJhzoNbzLA5+vsrk/+oUTH0E6aAfrq1mL+HxsC
	oxRI9dFLkhR5eC1ipZrZwEd5ZJRD3NOeJvJqIqNB14F4z+e/sN+p0t22pGQHS/yHXVedKubkucPY0
	4JOvEjGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCecW-000jbS-CT; Tue, 03 Jan 2023 10:34:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCeIC-000eUy-7J; Tue, 03 Jan 2023 10:13:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6C8266602CE7;
	Tue,  3 Jan 2023 10:13:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672740791;
	bh=QsMKSuCMNRc0w6rxRvC+kd/rsdom8NHqxy8WIlBiMuE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L4Jis3R0LJyGQ30eI7uz2JKSd5PZC7MUOKWwSgFDMv+xoTLDjfW5UOBLH0P1OXnAx
	 lwALYvlFSYyACTiHPFHa/H9RWFK5NN7/IHsexwiiWcr1Z9YTH/B7juqYHqWgJNky/7
	 /Eh60l1wSYngqRNKWm9bxGZbasID9Urbj4fdJJgdQJEjGGHNdQtlqXue5wGDkD1xkL
	 As6LauFJWBkNRTH5zCJ8QNUp/vsbig602UnWxoBcIfshGMykdqv4lWSAUbbYs6nRsE
	 BYQI0lOYqe+eioO7pJ7IQtu9pPjN4fhHtPVjX4fhQYwAm43aW6U3msv4oKMcQkfNR3
	 gPS5dUxqQcycA==
Message-ID: <166ce944-0702-2e38-d6ac-51dd479b8b8d@collabora.com>
Date: Tue, 3 Jan 2023 11:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8 5/6] arm64: dts: mt8173: change node name
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Mark Brown
 <broonie@kernel.org>, Tianping Fang <tianping.fang@mediatek.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Fabien Parent <fabien.parent@linaro.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Flora Fu <flora.fu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-rtc@vger.kernel.org, linux-leds@vger.kernel.org,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221005-mt6357-support-v8-0-560caaafee53@baylibre.com>
 <20221005-mt6357-support-v8-5-560caaafee53@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221005-mt6357-support-v8-5-560caaafee53@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_021312_452547_65DB778F 
X-CRM114-Status: UNSURE (   9.18  )
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

Il 02/01/23 17:06, Alexandre Mergnat ha scritto:
> - Change the node name from "mt6397" to "pmic" to be consistent
> with the generic names recommendation.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



