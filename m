Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77212C04FDE
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 11:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4ZM793r99f1SjWa1XQ0yZSFKQ/6rHtdDd9+puEeG/8=; b=ZSYq2X6AHY8UUUek3/1Fqjkxt4
	hi7i2TgHOwV2FW3pS8xaOSy6y5r0pIMznN7sG8yWS8V/68sNqHk1EPhXvausYrCk6+aCcW3AANebt
	t87oJ/X/pmIuOMsT78CXggD3nOreuIk0E7rFqhciRmb4W1beyVbkr7CxGsGKzd9hgE1o6bZNrzcF4
	F+5TO7Kib5ssbd7JocJicl4GA9kRyAoimkZg4D3CYCYJEYrZvGhw50RK5O9pMJQao7i5plQkTPBCL
	Sr7eLtqKT+FtB74Eh5N2e2Yxvcjs7uuP45gJwLrFh36IQkf8qcTFBJ4A7cVeP1gcOki1fdNrlej+5
	L6uACn1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p53QJ-00GMX0-2x; Tue, 13 Dec 2022 11:26:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p53PT-00GM8C-Le; Tue, 13 Dec 2022 11:25:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AE3A2660036A;
	Tue, 13 Dec 2022 11:25:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670930718;
	bh=jGEJaC2HHzi3pPy3yaMxUlfwN0oxrlQhb5r/NizcXZo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nO0m+xHZBDmaCWKxPnPPm9BOanyUTdwPiXhZ6stPQ2SjHsiGPoA1YGpY2HMeio5qQ
	 119yMkqN0eMSgwqPQu+G7DNPNkzu96nipC/xXUdpoAgpgAHTcXQr2hvRdSe1Eey7qh
	 vJbdMjguGdLWlvtpR392ftEErTIRzrGNbsGbroCaEwr56Y/XTMTXvfvLvI4VZN/jn2
	 +16ucP6YtMQnjeVZdqb7cToIS7RPrRSj/6aPncm2sflcCdCz6fNlSXRC1hr+NsPSdX
	 MAQobd3w1silOk2ka/doS0pLzSDsR+gM8Z02XEXwIjfnD2kuTPuydJDKu9W5Ksa6V/
	 S85bU55zdrogA==
Message-ID: <4e73921f-c8c1-7943-72a7-a95b20a68bbf@collabora.com>
Date: Tue, 13 Dec 2022 12:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/4] arm64: dts: mediatek: mt8192: Fix systimer 13 MHz
 clock description
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>
References: <20221201084229.3464449-1-wenst@chromium.org>
 <20221201084229.3464449-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221201084229.3464449-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_032520_004094_B121AEB5 
X-CRM114-Status: UNSURE (   9.66  )
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

Il 01/12/22 09:42, Chen-Yu Tsai ha scritto:
> The systimer block derives its 13 MHz clock by dividing the main 26 MHz
> oscillator clock by 2 internally, not through the TOPCKGEN clock
> controller.
> 
> On the MT8192 this divider is fixed to /2 and is not configurable.
> 
> Making the systimer block take the 26 MHz clock directly requires
> changing the implementations. As an ABI compatible fix, change the
> input clock of the systimer block a fixed factor divide-by-2 clock
> that takes the 26 MHz oscillator as its input.
> 
> Fixes: 48489980e27e ("arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


