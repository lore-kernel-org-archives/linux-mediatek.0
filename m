Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E63C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 09:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TviLqo/JEj8o8qvmb22ctoV7YbO+z8wdGBLeRVR24S4=; b=xE9AyZR8/RryMlQ34sAIZYTgBE
	lVyu73Mzi+q09eUPzO8nngHvxHw4suCcA5HyKzZfB+SPfPJH5VR8GpdRxgypl8oNTYoqiEBSWsGpq
	OMH+TXZawUuoeCr+D8Mbug0cMeLLAc3GMttDA+sVEmV15/hqZWMJcFi2kSOyDcQO8kAQoTtcIZ8v4
	UF+wZyDu7zbC9ymU1MVM3T9ziL6XxVxfJ6dmt+zyV0ZtFAddMDEDCGO9KBr8RhmEKOvr5ydlw/nGw
	8/640kwe1L4N9V8K/fLvXyeS7xdBJCchwqTuyYTK4FIDM/Odq4s754EA8a9jDVT2/0LSN7UiF7y2D
	9hoSlHgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJssJ-00GT5K-GX; Mon, 23 Jan 2023 09:12:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJss9-00GT2Z-6J; Mon, 23 Jan 2023 09:12:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4234E6600358;
	Mon, 23 Jan 2023 09:12:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674465126;
	bh=8/6ZDQ9b4fX0xEojF/wx773LxZk9VDCnx1/KSD58SV8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BfzX3ZJ6gNIBCXFzE9tnQdQdm46ubsrLxFNmtoGfvbqplMseFjBcl9yCyvJIANxrg
	 3DYA9ZD8TW0/7G5BEufZmH5vclcYaQR5m42TS/rkBxbleBoarUdht44x2xHBKUtbHU
	 tvhL+ksDzgv11dr/PSjdUWvZ/dCtzDWGUWm7wbc2jJuUX+s41ougSLwHiPFXoIqO9Q
	 IU/emSIpyqKe2poS4ij7nRYYfHlFikJWukhLAa+R/lk7GnEU9tQUGKpnYwD528DWEH
	 FPAbZKdErP9PeH+CtJqmoeg2H6JBocJGIhdwJFwCWjmoFFef2jnpiDZ/65OzMTbSH4
	 wTY9z85sGarBw==
Message-ID: <d19f5c48-f1a8-a235-c6e0-db1e10644159@collabora.com>
Date: Mon, 23 Jan 2023 10:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/3] dt-bindings: clock: Add apmixedsys/topckgen
 compatibles for MT7981
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
 <ae9acd210c1566b4bd72b09df4430bcad4a36c9b.1674401764.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ae9acd210c1566b4bd72b09df4430bcad4a36c9b.1674401764.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_011213_432556_942B4B58 
X-CRM114-Status: UNSURE (   8.32  )
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

Il 22/01/23 16:42, Daniel Golle ha scritto:
> Add compatible string for MT7981 to existing bindings
> at mediatek,apmixedsys.yaml and mediatek,topckgen.yaml.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



