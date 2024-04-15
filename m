Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D586C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 10:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NlrbBEGXaXL5w/F3ohFZjEdADEXoy2Vx3NGGtBqcFFk=; b=uceYgCQ97BlJeOJ6nxfA0Dap1w
	89p7lWFYlSEtQxi9UPYiIzsvJIU5Mcq8lEgLOK+TrWVwhutUEKCiHJLYk6Z2t0M1oIW3GP/h7aeZv
	mGnNzl91IBYZSJkZ8A4jEFXmAcXA54oTVKCZKpPYD5ivDhzrs/jX7cEbkkYmk6m5oi4CdqDdQbux1
	f1+rEQs7IXzwD4oalkaTwpWNC+FuElI8gS5wUDVX9ibrM5TVIq9PArrQphgayPUw/ZfudZ92ZEO2Z
	zYVJvqw8OH1ORJUkxQiN5moCVQ3vzzcg/Y8lZyhzlPSGn2eHesLURkVI9TyOs0lSvBUK3+cOui8o8
	pAb4LX3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJea-00000007sfC-42w9;
	Mon, 15 Apr 2024 10:33:36 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJeX-00000007se1-0phg;
	Mon, 15 Apr 2024 10:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713177210;
	bh=W2hn6oSy7NPPiYXX+nat04fULWlvxHEI0Yi3NxOxZXc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CkssawNC3pd5GY1wqRRvzB7farQ11Z1gI760kXcNFTT0vUPS/I/GNSJq+9VwvlF8E
	 28DHDATLAMbc6qC0k77dWf4FbpwBQo5yKYf3Smi656iwZVau7HC9tEWA+KipV89O0S
	 vLg7cBgrAqrD6rk+BjmX2oLiyLoEnZSQeslAnfXxUOzR5YO1X7O8ZbGrbbXfSBPll6
	 TDmYkzZwEX18qxO845f0b3QfR05aCjGvVBMJvwKi5vt37TWcX2BOEukuRwG92DX+NV
	 Q2VyoNRuMZgsgjmjHSwcVhW3JNIKA/q++1prxp5nja/9i+nYdEyfHfU2QkNdbah6TK
	 kjBOY9Wr7/HCw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8D790378000E;
	Mon, 15 Apr 2024 10:33:29 +0000 (UTC)
Message-ID: <f3deadf1-8bb1-422d-a7b6-d0e0de98484f@collabora.com>
Date: Mon, 15 Apr 2024 12:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-kukui: Drop bogus
 output-enable property
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240412075613.1200048-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240412075613.1200048-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_033333_476803_42450E5D 
X-CRM114-Status: GOOD (  10.20  )
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

Il 12/04/24 09:56, Chen-Yu Tsai ha scritto:
> The "output-enable" property is set on uart1's RTS pin. This is bogus
> because the hardware does not actually have a controllable output
> buffer. Secondly, the implementation incorrectly treats this property
> as a request to switch the pin to GPIO output. This does not fit the
> intended semantic of "output-enable" and it does not have any affect
> either because the pin is muxed to the UART function, not the GPIO
> function.
> 
> Drop the property.
> 
> Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



