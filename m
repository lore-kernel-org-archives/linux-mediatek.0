Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E9DC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 10:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uWDf/44/RMZTtac0NI5nftbA5GN+oigohJ8CPt+ZRM=; b=KdUDsBiU8q1aGjRSGFlIV3S45k
	eRSeAvtFJvYDqaoW+/ScXfiiCS+RjtEd2OFHFQUTij9Qz2X9ncHUynuLFQF99tB8o5RZ1iI8NJyA0
	aUOvOk3f/g1o7X1PW6odzAyBNZwI1bBVTiqHsJ85+9dRO3Ow3tAq6g82oF4yEyAa1fl1jqeSoDkU5
	w3tsCITqL2W2na0hi+b7yK3M/CXx2TdAsRcNF8bsxySbn/DIxLwsAcxPdeRz1N3AkEdDxTFE5ieR8
	eW4kijw5YBVUkIQ5MhlkByInKtbBC2NymTYkjjbEOv4uz9MBBN+yPGxFgFYMYB8Ady5uNKtWi6Idv
	x/wZdCSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZV29-00HO5a-N1; Tue, 07 Mar 2023 10:59:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZV1z-00HO1T-5T; Tue, 07 Mar 2023 10:58:56 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EDB346602081;
	Tue,  7 Mar 2023 10:58:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678186731;
	bh=Ck1cmr3V4MIdHWHjn15OPkA+GXk0Ufq03PURMw4YhVU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ev4yYdeFaLYFHUAJbWaGT+Z2UhHzNzWsXbWDGif2MYRnkCc1F+5p5xATTyov62D1Q
	 eF4l8k+ZMIu6MSUP6OihpfAinKOD7BkMRAVvKhBTryn6cKxHU7nWcnTz+3YcqgbG1F
	 96pA8Ogn7oh82qBRmR6w5ZKiNODdSj0+flTb1Rtvg3wwc+LMB0UE3OSrjEuZ6hVy0l
	 QP0Nk0JjLqxrzgTgNHuQbMp5CmtOHCIwwlvizAQs6/jpF/O8E8B154JcwdJ9GbLXSG
	 yHbWSXvNRaWEliVnorx6qoU4dw8oT/wy1hFPCKPcqUNdt59388t0+B4pvp45OEdWgW
	 xfdKGeN+kvPUQ==
Message-ID: <a8116598-f4ca-5bc3-5c9c-c96d9e1c9836@collabora.com>
Date: Tue, 7 Mar 2023 11:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] dt-bindings: display: mediatek: clean unnecessary item
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230306-ccorr-binding-fix-v4-0-117daea88efb@baylibre.com>
 <25019fb1-87f7-b863-48e8-a164d0e08265@collabora.com>
 <CAFGrd9qV40Re=bJY-kToAcYcv+d3nBje-zxxKcsvwfiE1a9OjQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAFGrd9qV40Re=bJY-kToAcYcv+d3nBje-zxxKcsvwfiE1a9OjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_025855_444242_37FAEDE0 
X-CRM114-Status: GOOD (  11.94  )
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

Il 07/03/23 11:50, Alexandre Mergnat ha scritto:
> Hi Angelo
> 
> Le mar. 7 mars 2023 à 11:17, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> a écrit :
>>
>> Il 07/03/23 11:07, Alexandre Mergnat ha scritto:
>>> The item which have the mediatek,mt8192-disp-ccorr as const compatible
>>> already exist above. Merge all compatibles which have the same fallback
>>> under the same item.
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>
>> Alexandre, the Acked-by tag from Krzysztof goes *after* your S-o-b :-)
> 
> This is managed by the B4 tools.
> Also, I know this is an unsolved topic in the community, but I agree
> with people thinking the last trailer must be the guy in charge of the
> commit.

I was told so multiple times, hence my reply.

I personally do not care much where the tags are put, as long as they are
consistently put in a specific order; if I had strong opinions, I wouldn't
have given you a R-b tag preventively... so... whatever! :-)

Angelo

