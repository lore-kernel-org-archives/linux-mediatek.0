Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8671FC54EED
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 12:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4+5yR9+IAz7qz15UTN0030EMifhzvCdhsQ5eH3Tmbw=; b=AZ43FWEnX7L0CTxQznXs+JM/R+
	/9Kji3u5OPx9KK2LH/XWdCta/p8IFs5hkd3xKE6t03aSKR4OCWbZp5fggtWA7NI4v5nxScnSVAxVr
	appTd2sT9vadp/rwHHsAGiJjMorbQb5Alf7IFRAFNERnXspHs+W9qY0aQOp35/89/pH6rnTmLQ0B6
	uZCzVPSDaKaxLq7RnrXfm8IBOXnLbUX4qw7SYTDc6SIIY8cD1urhW5RGMafbFLpbvEqHK6lvV3A5H
	tiGRxwKNOGXrVorKjei9kxWHTeXHlJvZZszhDVL9F9eLaxmRhZVeeKz4aEDnBoxDYUju2YsGxbv3x
	wghIzYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKID5-003gvu-4q; Tue, 24 Jan 2023 12:15:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKH9M-003LKE-3a; Tue, 24 Jan 2023 11:07:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 602E46602E2B;
	Tue, 24 Jan 2023 11:07:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674558454;
	bh=IZwhsbQ5GD3ihX14tcd6MNd9q9/L2zvjtRnQeYk5Sfc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=JWSPojvr5SjQwXkdAcW3tS95UTK8zskvn3EmLXFFR/Aq2SnTlA+av8pYYz6FNFs7C
	 XyO6A4mKt+JE4/4TUH1eHQAuMI3lseWtKceT9V8+cmuBxJXPZ6OlvsFP5N5fsRbvGg
	 BwAP0xmqlWqt/sQ3bwtlP5N+qPtgsGVJF9fPUiXefQtefePzGZqsXswDGSKUEWyRJR
	 +ViXdNL6MdijVX5kNtEFK/7uL8VDc2jOZ1J8iUsh8QGnozNjvOEkusDLYeqwDwI7UX
	 NTQ2mdjo9n4tR3SzpzE0v5jDresIPGmz4JLuZJ1olKilSkxZHY+hyDLfujLScNi9x7
	 S3yNn4zQDAy0Q==
Message-ID: <4b959762-f33f-73b0-8b2b-930eabccca22@collabora.com>
Date: Tue, 24 Jan 2023 12:07:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8183: drop double interrupts
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230123151634.370011-1-krzysztof.kozlowski@linaro.org>
 <20230123151634.370011-2-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230123151634.370011-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_030736_322369_ECDDE79E 
X-CRM114-Status: UNSURE (   8.62  )
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

Il 23/01/23 16:16, Krzysztof Kozlowski ha scritto:
> The DTSI comes with interrupts property, so it must be removed if
> interrupts-extended are used:
> 
>    mt8183-kukui-jacuzzi-cozmo.dtb: serial@11003000: More than one condition true in oneOf schema:
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



