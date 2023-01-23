Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9ABC54EB4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 09:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuXZQMy38dxJzxnNCdfLw8e5vHUpYS+tMM71yTbNyVw=; b=JdJXvxvZYKbc1LgpqJnEtcVg/X
	yny+7y5Kp9XB95Dj5/9VWEBqUU09U9YGlzzcZXZKoE8CgJ30KsMFyE+w7UGGYbuP3sAG8HBZ15CYi
	0HWQuPrbj1uJLnXJ1iD2ta36vxXzfz6+3T9cDHUA+XIg0t7Emm1IsR7vFo3TGe/Gb/tCsQQpSDxkX
	iZSYXRLtSD+vD40o6qfLux6Z+mb3NfdoGluwrRckrnTCkh69fm5lZ8v1JdkL30SnnI8tT0t7d5Eu0
	ArxlvgimN9wdLDw4+0wQgqgHI6Jz1tyE5ZNs4Lsjyf0dJ16psj9zxF85bFC5Oy3IccoH1edfvemSg
	nRchVo8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsse-00GTAy-WE; Mon, 23 Jan 2023 09:12:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJssT-00GT7A-Ox; Mon, 23 Jan 2023 09:12:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 40F6A6600358;
	Mon, 23 Jan 2023 09:12:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674465152;
	bh=NKU6t8HcH9rH9F4n2Zm3DpMsp3V22KgmXLEd+oE/hSw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R3cYpWtxswXcKjEA01/ButcGSrS+UWrcQuw3uWZb9v6M/n4tVJXyUZkyNI2D1vU+3
	 q+KsPxr1Rwi29pfM43oSe2hD8Cmpenm3GAWFga8ikkScbloV35X1XDr4R9PoiCHm1K
	 EHaCBfe147IGyHVNDoZsC1OP+vYGEV9fT9fB4Mp62Im/9d+uFShUs+gK90Z9pfFZYz
	 5viPXdD6rriRWXGesFhqoDs17Ne1JoIKmyEsdT47Pk4i/RnkeQ71AKOtbYtrWuaPGe
	 NdahQgddqCHrQv/AtHTfCenGVz0B+blOf1QeJeyPhDDKO5wUTfP8Meob9OPLNe6iRM
	 MKHaJXI4jGhGQ==
Message-ID: <4e70624e-870e-5222-5f08-58786dc97447@collabora.com>
Date: Mon, 23 Jan 2023 10:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 2/3] dt-bindings: clock: mediatek: add mt7981 clock IDs
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Sam Shih
 <sam.shih@mediatek.com>, Jianhui Zhao <zhaojh329@gmail.com>
References: <cover.1674401764.git.daniel@makrotopia.org>
 <367c21c111458abf35170b37d51d023a04a04510.1674401764.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <367c21c111458abf35170b37d51d023a04a04510.1674401764.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_011233_980850_1A27DED4 
X-CRM114-Status: UNSURE (   7.52  )
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

Il 22/01/23 16:43, Daniel Golle ha scritto:
> Add MT7981 clock dt-bindings, include topckgen, apmixedsys,
> infracfg, and ethernet subsystem clocks.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



