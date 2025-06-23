Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5112AC7EE30
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jun 2025 11:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yvxj19SbeNEOO0ywdv6ag+9IhX7YkP9phiR8id2zwyo=; b=HVbNUexLN9s2ge
	d+ObMQmAlFa7pKooyjn12RP2k5CW/4pHajNgRRv/9VIle+3HM5A+eody0W047s06G+dMoO9QO2EDQ
	jWuLjXbGzCgUrSV9YX7mkCNREfdLH78xGhNQynsInW0LztyB81JqXlOjpzBLj36keWqSlJZxHw663
	xiem3r4YsamnVS4XEcCWeO3P0joLiDf5WUzllSZM4vB7rtAO+V7eTlWs0NEBoymmCibd+Jgj9vHvo
	Bh0iTvhoMvggnbNC+BTvsK7xsUMYKnv81jJG4qhG0/oSBwyML8mMDktmzXEfBT2pSS+LqfMwnM013
	HpCCAqU6wdwqzVA5oP1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfb0-00000002XKP-1QPJ;
	Mon, 23 Jun 2025 11:44:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeQd-00000002Ll0-1taU;
	Mon, 23 Jun 2025 10:29:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CF3D6112D;
	Mon, 23 Jun 2025 10:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C3DC4CEF0;
	Mon, 23 Jun 2025 10:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750674570;
	bh=E/V1S8fsQv28bkCAhEQ4ycEwjcFe4GGI4EAwIkH482Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SYaBP2lk0MdWtqUfv/93HDoI9bgXyLZ1tLGUoFvVQn3m/gqL2pzfO8H4ej/tMuOpo
	 IXbbs9NfCHZpJMK0JIbPK/vuggsuzrNRQJBulX9F4h0vF0THpre66D/rUBsy7scHzk
	 QX50s5saUijGk5oN6fRLOScqEUc6zqKa4/zfL2n9JgdYg81DsDyzEtJHiOsL7HFN+R
	 vTqdIAWvpLpm/my4bGLRZp7TV0NO8xnMoqV/nxj2tsq2xkZpHLA3PAmboH6yFxF10J
	 /gau00wQxz5avfk7CdHNGiNOQnlDl9jAqoe2CJjATH80ADl1hqH21K/kcGJhM9PlBl
	 8rZa7P40gbD/w==
Message-ID: <1d622833-d509-4f5b-ba19-b1f30c592d3b@kernel.org>
Date: Mon, 23 Jun 2025 13:29:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] dt-bindings: interconnect: add mt7988-cci
 compatible
To: Frank Wunderlich <linux@fw-web.de>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20250620083555.6886-1-linux@fw-web.de>
 <20250620083555.6886-5-linux@fw-web.de>
Content-Language: en-US
From: Georgi Djakov <djakov@kernel.org>
In-Reply-To: <20250620083555.6886-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-pm@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-mediatek@lists.infradead.org, Jia-Wei Chang <jia-wei.chang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20.06.25 11:35, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible for Mediatek MT7988 SoC with mediatek,mt8183-cci fallback
> which is taken by driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Georgi Djakov <djakov@kernel.org>

This can go with the rest of the patches or please let me know if i should apply it.

BR,
Georgi

> ---
> v2:
> - no RFC
> - drop "items" as sugested by conor
> ---
>   .../bindings/interconnect/mediatek,cci.yaml           | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> index 58611ba2a0f4..4d72525f407e 100644
> --- a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> @@ -17,9 +17,14 @@ description: |
>   
>   properties:
>     compatible:
> -    enum:
> -      - mediatek,mt8183-cci
> -      - mediatek,mt8186-cci
> +    oneOf:
> +      - enum:
> +          - mediatek,mt8183-cci
> +          - mediatek,mt8186-cci
> +      - items:
> +          - enum:
> +              - mediatek,mt7988-cci
> +          - const: mediatek,mt8183-cci
>   
>     clocks:
>       items:


