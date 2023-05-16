Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3D8C77B7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 13:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRegVeB0zcgwuwwX9yycmB53L1vM4zMnR3ati6DN5Gk=; b=jcbnthTPUhUV3ny8H6mjMmZBfN
	Juf92hbjWKRCWo0M5Z9C7u1L5PRcZr/lBlXJeBr3qcdF+SY2/FuM6APQvq4vIrscKSPI0d82ewf/Y
	+OCWGhPoGnSmMXqbaTqVh/8lCyNJje+UcvgebejW4/MQSur7YbPLtQZzPeLkK6ih5NXn3P7miqU/S
	M0FhB0sJwcQP4gEMwpJLTqI3eU1rGrSKsmU49Cd2hqtcuCwr+K6SBKTyvcbXRu21u/MVq5IWwclpp
	PWAoS2EqMn2cmogHJo83as6JUgu3ap3UO34qCwENilPKjhl41nccuIbaO+pmXaY1X7xQuht4jHx7Z
	Rxl65WyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyuZo-005t66-15;
	Tue, 16 May 2023 13:18:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyuZY-005svD-1C;
	Tue, 16 May 2023 13:18:39 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A6F8066058F2;
	Tue, 16 May 2023 14:18:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684243113;
	bh=Z53vfnjM1pDRjRatK4NL7mBjKR6/M0ZYTm/lrMQj4Hg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R1ZR5LXxd5+KzuDqg3hnNv8LbHRxcReXjHFdO70o87XKc/fbnO6u/2bME8nCFPNZ/
	 p7+/OqAIy7NtZJEu86xDV/m7i7G8rLrWvvNNstrjdDEKsvu6DnYfsk/hIGQw6pFSuY
	 iG9EV/8GE+xg2QLPZewnrt3R9I10uzX6srSp5lKwyLnDxy8zLGbCnf0Ywjij3Dw/KY
	 3P0qzIUjjsU8pRslTmaQdhBv+7JqaIlezAEPMLIwhkqOaHNqVGg1ud2CwIWd1cKixY
	 0zTur5a2NWBJou3dk883a8gjqYzRwJ06qynZi+ha0yyAOVGe7eeBWZR+0FNIbsfFSP
	 3ZSRDRdMAIkkQ==
Message-ID: <3e5c9fd9-ee6b-d903-10d0-0fc663cedd40@collabora.com>
Date: Tue, 16 May 2023 15:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 3/5] arm64: dts: mediatek: mt8183: Add
 mediatek,broken-save-restore-fw to kukui
To: Douglas Anderson <dianders@chromium.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 linux-mediatek@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, wenst@chromium.org,
 yidilin@chromium.org, Tinghan Shen <tinghan.shen@mediatek.com>,
 jwerner@chromium.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>, linux-kernel@vger.kernel.org
References: <20230515131353.v2.cover@dianders>
 <20230515131353.v2.3.I525a2ed4260046d43c885ee1275e91707743df1c@changeid>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230515131353.v2.3.I525a2ed4260046d43c885ee1275e91707743df1c@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_061836_547186_EBCA7453 
X-CRM114-Status: UNSURE (   9.07  )
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

Il 15/05/23 22:13, Douglas Anderson ha scritto:
> Firmware shipped on mt8183 Chromebooks is affected by the GICR
> save/restore issue as described by the patch ("dt-bindings:
> interrupt-controller: arm,gic-v3: Add quirk for Mediatek SoCs w/
> broken FW"). Add the quirk property.
> 
> Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
> Reviewed-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



