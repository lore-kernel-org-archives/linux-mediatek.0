Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D3CEB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 09:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a91hvs42nD4/IQDVSuBwdpbzqOt01YNCD37Qhuo/pkQ=; b=BH5zVw8k4BPagfXl13kwj8U1CM
	X277As0YPIMnDpx5l8olKVvf/6onHW+i/i+HDgbUyWERumxHAsj4Kzzy0pgqG8FhtJH5FzXpYGiRG
	l/1ZwiHCCQKjwq2mLNPowULZjsNOq9PMkJynlWyncw/hLpgLwv3q7JDRzBQD6zKmM5/HDUniFh8Gq
	YR+9UkX/mBJipuyENu7bII1BcDbd+Hz0odgLkQKgiJWMOdmKjv6Y36SS/HRl3WQu3hZEaHm3Wrn0t
	0bm3T3tUENILHKUMGel+kwgshedOzj5g5gtt9YocMqgqlkGRXiU1mb6waUku+Y8e45Bk07j+eUWnw
	EHtvyXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGAn-00A02A-1t;
	Mon, 03 Jul 2023 09:48:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGAk-00A00v-3C;
	Mon, 03 Jul 2023 09:48:44 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 157D26602329;
	Mon,  3 Jul 2023 10:48:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688377721;
	bh=3nr4rR/iu3oTG2ydNtl+jv3WxDV732H20lVTt5rYlz4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=AQNDlTnQo8nv0kUnxdjxYToKoHgGozT+EMXldZry8KOzjL30vXLsHmy0ewo7GNfwA
	 gAApfkepZBP1N8qucblQmVQZKsgIHc2ojR8WhGOqdczn0xbNdzEOllf5C3k3AkMKF2
	 z29wPgNGrX4gaba6bUKDB5pnUO2md/YMWkFeSMI2Y1ZnbsgHMQtUGT7jz5ZjFWcvKT
	 QnHgDDbUimyUfXJn5DhMgF8cDqop1f0Vm11//nP9dKPOPcw4zGgEt6Z91pIx2SVu2u
	 HPzWDx8Qxn9FYiSoT4KK9fzyzftutlTN8bqEFznw3zU4kqHbnQcj/45aSoHy3KUvSw
	 +BvRia539wk3A==
Message-ID: <b4a8b79c-a237-b320-c88d-292fb0788fcf@collabora.com>
Date: Mon, 3 Jul 2023 11:48:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] ARM: dts: mediatek: minor whitespace cleanup around
 '='
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230702185128.44052-1-krzysztof.kozlowski@linaro.org>
 <20230702185128.44052-2-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230702185128.44052-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_024843_156061_17F6902D 
X-CRM114-Status: UNSURE (   7.48  )
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

Il 02/07/23 20:51, Krzysztof Kozlowski ha scritto:
> The DTS code coding style expects exactly one space before and after '='
> sign.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



