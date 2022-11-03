Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA87C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnxRUBYUPHBm3FkHh8P0IdfQWvuWRd/vn154obnqE44=; b=kU7WR+0vZG7YtLZRDPpsRfAXHA
	SKnMsFFEuPEHr3u/b8JMsyDwwA9uXns8JIwhRNE/aVAsS7nqf5lHt2e1I2OZ/R8giBcqJd7XwuL2X
	Dix2oI/Bn+uD8KzRVV7wz8Pc+u08HJDnL1Jg5jxPYSMeWDYqEpMTXkNr9aK400ZMuac9/0Lgq9ec0
	Y+ayRVPaqb0n1Xk1yu4C3kzor9CwX1J9hhdCC8BxUXDfQb8WbgXNhjeT6siaiZIY3vKP4fhSzkf0d
	dUG5y0YeqAGnhvzahICm/yUJvGUshZDZjmPs3xHqx6PJNbyu6ZvCj0ZdJZCNbyUS7uJxQWN66Dkpg
	WCTht+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqayR-0002xv-7B; Thu, 03 Nov 2022 14:13:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqayN-0002wJ-Rf
	for linux-mediatek@lists.infradead.org; Thu, 03 Nov 2022 14:13:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 63F156600371;
	Thu,  3 Nov 2022 14:13:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667484813;
	bh=YMDhUlxAMoErZnevFRjtflBeFHbeFJyuQG5fGsxeGjU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=carv6v1UqdiDgoqsuWL22pY1kUvuJsxrgk8qTDZ+C6kuQ1qfAPxBPVIPxF+iqhkue
	 UJ9jOaHf4rK5kG6e5wGwak13uscIVpVNvxwi/KN7BEOc1qieEVM50xtZeDskrnWu/i
	 OvCT91g3/MWGeXArj24tr+8vV5Vpezs0Y0aRm3x4uF65ZrlsYzXWBK5wC44+5yNOrK
	 DNeIgAdrhA9BLwavhxNWIBrbsg4lUVfr7jfWKIRVrXS2/qlAdp7eT8Zyf+Hi69kEZQ
	 DxpRHbTNsjigCFi9SvkZZJ0OlVtrkcu/l9utQleQ+gsNGMnFAVL5bCw0iXul0Wkahk
	 /LHChCd6BcPrQ==
Message-ID: <3046551a-62d7-2990-afb6-75fe2e20d8cb@collabora.com>
Date: Thu, 3 Nov 2022 15:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 net-next 1/8] arm64: dts: mediatek: mt7986: add support
 for RX Wireless Ethernet Dispatch
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com, ryder.Lee@mediatek.com,
 evelyn.tsai@mediatek.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 daniel@makrotopia.org, krzysztof.kozlowski+dt@linaro.org
References: <cover.1667466887.git.lorenzo@kernel.org>
 <4bd5f6626174ac042c0e9b9f2ffff40c3c72b88a.1667466887.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <4bd5f6626174ac042c0e9b9f2ffff40c3c72b88a.1667466887.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_071336_169287_A82AB3F7 
X-CRM114-Status: GOOD (  14.39  )
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

Il 03/11/22 10:28, Lorenzo Bianconi ha scritto:
> Similar to TX Wireless Ethernet Dispatch, introduce RX Wireless Ethernet
> Dispatch to offload traffic received by the wlan interface to lan/wan
> one.
> 
> Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Hello Lorenzo,
thanks for the patch! However, there's something to improve...

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 75 +++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index 72e0d9722e07..b0a593c6020e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi

..snip..

> @@ -226,6 +252,12 @@ ethsys: syscon@15000000 {
>   			 reg = <0 0x15000000 0 0x1000>;
>   			 #clock-cells = <1>;
>   			 #reset-cells = <1>;
> +
> +			ethsysrst: reset-controller {

That's not right. It works, yes, but your ethsys rightfully declares #reset-cells,
because it is supposed to also be a reset controller (even though I don't see any
reset controller registering action in clk-mt7986-eth.c).

Please document the ethernet reset in the appropriate dt-bindings header and
register the reset controller in clk-mt7986-eth.c.

Finally, you won't need any "ti,syscon-reset" node, and resets will look like

	resets = <&ethsys MT7986_ETHSYS_SOMETHING_SWRST>;

If you need any hint about how to do that, please check clk-mt8195-infra_ao.c.

Regards,
Angelo


