Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C6AC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 08:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfiZYlVKq8xZc+lIJHiqWhLcSWJ641BuS31c2sZrKjI=; b=Q9LvGKzIA4dbo4PfOZSkrqJMl0
	1c8eOtgpNhN7oWcyImOFEU8pTg0dzggxl2rwb/TlNYO/ToRqUzPXri4HY0NXFvbCibxeQUemt2qSs
	IlOdP/EB13dQAKeyGV20PPtW/gw3wMlTKJNIbmAtntg4Wn8TTCwRitUfcMASpRmQVnnLpjvS5dbKM
	4IGTZPA4g+MhtcDMJL8VojhltHOFQX0AogyXMqRVpcqS+CxSb/eDeEcVXdKre9SIbBJuDV/0/d5TP
	Evi2Bjg4IvbFxqltkU3IgoVIbAax7RMF5WsNHuo9+6TPHlxKGVqkCgyuuMxqaB00cj0nYl2BjXGG+
	TAXDraFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ourkW-00956q-85; Tue, 15 Nov 2022 08:56:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ourkK-009515-5e; Tue, 15 Nov 2022 08:56:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 36C4C6602A38;
	Tue, 15 Nov 2022 08:56:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668502602;
	bh=+VHts16tHrWXts0G4ZMds8P/sCMwx8bIJBwdcBm++xA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LNgB2Qwae7QJq0WFKJaeWQNfPuFf/77mFMT6/91ZrOVzWZ6eqEs7GEJErPWKnAFRm
	 +WsA5l+0nZ26LCQVEhowJW3N+1pmFedZTydSRWbXYCsGE2ZBFfT3/7mzyVXwVbcbQK
	 2tskvVjC9aHSrCgCaEBplZlCahtfzswHfT4wpb2hUjN9T5mZfqeBDeKOY+3HaEwu5o
	 QRSm1MBRrRp8CXhvVqQdC0xqVUiwUmqWCkY42x+frJsXYoq/yr8GaHvGChcdnjipH8
	 E2CO3VVrMqL1OBFFiLJFI0PPgHY3W8+UOc0Ujf91OaqLPI5GNUI+pUhR1gk3WwleMv
	 nROxWsWtmDbjQ==
Message-ID: <c17fae8e-98a8-44a2-a7df-7f45a6f24baa@collabora.com>
Date: Tue, 15 Nov 2022 09:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 0/2] Convert mtk-timer to YAML
Content-Language: en-US
To: daniel.lezcano@linaro.org
Cc: tglx@linutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220929122901.614315-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220929122901.614315-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_005644_397361_B0E6CFF3 
X-CRM114-Status: GOOD (  10.99  )
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

Il 29/09/22 14:28, AngeloGioacchino Del Regno ha scritto:
> This is a conversion of the mediatek,mtk-timer.txt binding to schema.
> 
> While checking the schema validity, I've seen that mt7629.dtsi was
> declaring two timer interrupts while effectively there's only one:
> removing it was also necessary to be compliant with the new schema.
> 
> AngeloGioacchino Del Regno (2):
>    arm: dts: mt7629: Remove extra interrupt from timer node
>    dt-bindings: timer: mediatek: Convert to json-schema
> 
>   .../bindings/timer/mediatek,mtk-timer.txt     | 47 ----------
>   .../bindings/timer/mediatek,timer.yaml        | 86 +++++++++++++++++++
>   arch/arm/boot/dts/mt7629.dtsi                 |  3 +-
>   3 files changed, 87 insertions(+), 49 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
>   create mode 100644 Documentation/devicetree/bindings/timer/mediatek,timer.yaml
> 

Gentle ping about this one...

Thanks,
Angelo

