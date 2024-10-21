Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E28D15D98
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/uIMHqcejLpbbCy2GYqcYQAIzvEJRVuNb0hhvZqDfA=; b=zBxkrrxepdtE/XqwrkNU9DLQSh
	vr6N9QlORePW7hDPIlXadofdBokbYl27ePcRkc4+UvyFBNH8wNsjgXnF1MSV9rQpN00o3yoekKK5k
	PRiT6r56lkdsjFh57RLtjKrXN9LhL+mfI5hJygTMNRkb5nXdpS9w28BP7rjeOTjO6EFczSdzI+VFI
	6LW/NYIbm+orbg4pGb63agff3DBNWy5QAldqQyDsR/WNq9flUPf0SopalaBfthuoIPca9Y3fnMyhr
	/3czSYTII7nM4P6efVzBd5uZOb8A5nTDrIaOfSAlBBv4pnNrIzFbjJvNX1TXsEs7zSx0h6IhMBXON
	5kN/4xRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2t62-00000007Z6p-47VE;
	Mon, 21 Oct 2024 14:09:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sgN-00000007Smb-416q;
	Mon, 21 Oct 2024 13:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729518170;
	bh=zASdF1eo7QN55lG2Cxck3mYfIlw6fWVKv5h50/EaGTo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FBeIW3QrPRYxqJrcqj1hPP3B0erKcfIT7he6Y0+IyoGbIE8FM5fKPWNFHM7GVuqFt
	 GHaT4Nd6kiri/hWK+E5Znb4GrCbEN2j0aH4Df5jL2yFwsYThaTa10ZSYbr5MUx4bsi
	 fuip6tvtU3Ng+C6tBLNgJcnLFkb135VuVH/P9xFQBBjfSdepYNNY7CU4Lb/0QBQ0/o
	 aQqyrdZMbz5IstH+uTYPhJDUp2054U1F39V2lHi81HuQtCfLKXlTokj0Kqm63vHUtH
	 rPnkB2nmRaR+rX5HPSq9p1HwBbmnJRFUhn8Wr4mThd4ie6NaPvdfSEEXeQnifuxZDa
	 1iOH3Xf0FtwtA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E193017E361B;
	Mon, 21 Oct 2024 15:42:49 +0200 (CEST)
Message-ID: <8dc6f6b1-54db-443f-a2ef-bcce43b49846@collabora.com>
Date: Mon, 21 Oct 2024 15:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/6] dt-bindings: arm: airoha: Add the chip-scu node
 for EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com,
 linux-pwm@vger.kernel.org
References: <20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org>
 <20241018-en7581-pinctrl-v8-1-b676b966a1d1@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241018-en7581-pinctrl-v8-1-b676b966a1d1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_064252_174817_95644F34 
X-CRM114-Status: UNSURE (   7.56  )
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

Il 18/10/24 15:19, Lorenzo Bianconi ha scritto:
> This patch adds the chip-scu document bindings for EN7581 SoC.
> The airoha chip-scu block provides a configuration interface for clock,
> io-muxing and other functionalities used by multiple controllers (e.g.
> clock, pinctrl, ecc.) on EN7581 SoC.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


