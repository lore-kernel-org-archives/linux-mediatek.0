Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04187C54E69
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 10:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boStEBxYLzG+BAE7/w3xFyV9O+TcPCLRCxVmQuHf2wY=; b=fNR/L17jc/V5tD4vn/rXBrw4Ym
	y6kVL2pnXJFNDzndcfCwVCkwvXu6gK52X6fwm5EdbWZaHV8sKiLBAjuR+FR48V+qsg0hfO6OZ2Qt0
	EhCMGyxwUL6pr9IaIB3vHrrNJI2p+hULs934EYCDXS29mBkyCxAbrAwyh5ZeXyUnbfQB4L8yNaSL0
	4jsfT/RWIdN/zncC2F0kZUie9CsBCCygwydc15A5Li+mOucaWija9Sj5ge7hbgEqpo8ThZXAjwMhG
	qMblWZ5PZnCn6nuPqHU0T8PO1CX6p1KRLlNDQ3GSiwmGXMIYjla3kmpcwDNcp/pijv/47Gmxd+AQi
	kFDIhqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAA9-000000088Yu-2SPx;
	Mon, 18 Mar 2024 10:24:13 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA9z-000000088TL-3BDU;
	Mon, 18 Mar 2024 10:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757442;
	bh=hNpLFt8GxecUESbc49ly/PcpGkpFphO8cqf5mABNGZs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RnV6nsUUsgKCxPjetCnisWhXn2lFSsvUwOwxOrlEwSfdm63DKXmi5na1L2dZKwjRq
	 MlpIIFOoPhskrLCPSn0dYXqlU9j53luKhKUfcw9OMrflAiAwbjHMoIT7o1QH066wCz
	 77VWLDsPDMqJwZ3uoIpwhQ0j9kUGFEL7DXp/k5U8QcjFGKCwIE6KYPQ41HooT96Ypy
	 ymdTq8PmFp/qhh6XJNxv6tppHgEWmAdK6Q/GT29Bb+d8SHFMkf6Q+17VgEbTzygD1T
	 DtS6hSYa10XHHrFfLJUykgswjHc8569GFs96dXHqUJg06tQI8bHa9YKuuUvkvHGZRO
	 39sokNIQvI6wA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BDCCD378205B;
	Mon, 18 Mar 2024 10:24:01 +0000 (UTC)
Message-ID: <847e1c25-d28c-4616-88fb-b1d3d8f60f7b@collabora.com>
Date: Mon, 18 Mar 2024 11:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/4] arm64: dts: mediatek: mt7622: fix clock
 controllers
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240317221050.18595-1-zajec5@gmail.com>
 <20240317221050.18595-2-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240317221050.18595-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_032403_963019_4176D0D8 
X-CRM114-Status: UNSURE (   6.29  )
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

Il 17/03/24 23:10, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> 1. Drop unneeded "syscon"s (bindings were updated recently)
> 2. Use "clock-controller" in nodenames
> 3. Add missing "#clock-cells"
> 
> Fixes: d7167881e03e ("arm64: dts: mt7622: add clock controller device nodes")
> Fixes: e9b65ecb7c30 ("arm64: dts: mediatek: mt7622: introduce nodes for Wireless Ethernet Dispatch")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



