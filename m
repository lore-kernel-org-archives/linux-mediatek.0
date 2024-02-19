Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DDFC48BC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 12:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIz9dcvuJG13ynOF4YVRNjYsHyJheyOvISobmSng0J8=; b=K0fub4sLY1fI0oS54j7W0WDS9K
	+yEJ9ZRx3EDhh7KQndi5AAdN2yVY+YSL9aWRuy/H87eyScabbTIrXWbSVmRQafq37ZCoqSK6IsDF9
	b0j4t6y0IvZzBhs2wV+CZFTe5ju6CzBYEqFHYmfO30qkcsAdzXVqFqmeOzQrAHgTjt02rxc4WJqcX
	D6lFT69XIZsmSiWC99SuJbi/7eZy2p4RepCKbcnt9/wNfbqM1ewngOGddLXnrcFUF7LEnTJefhw8i
	WcQmjQ52rclEG1l91I/Os/p3zEJ+tRZg0i9DmJmVkypfWYW1wy/Z+jCZjlBXCZ18OOsl6Ot1cc3D2
	x++mpHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc2px-0000000APlG-0vZw;
	Mon, 19 Feb 2024 12:33:33 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc2pu-0000000APkL-0dwS;
	Mon, 19 Feb 2024 12:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708346008;
	bh=xwUbvQQzwKR0HkhBjmcu7L7bevII6H8fbUCpXghrq20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lsfUKLy1VGDwkUu+GyF5x2nSG0Jc+HBUbCHlks/+DsxcUhns942nF/Sbz/O47/ZfY
	 iisdTnRTZJNDcr7mTgNe92U9iAXbEESSDlGkYKUjtgHet2QpVPpuTlz9pqJvJN+8Kl
	 D/ZxJ+/OWxEnF5fgk9kxLBXtOV0uS5bO8/MM4OEdC94s6ysKsIsuqPFSKBKJS81VEo
	 cS0zIh+UE3NheXoPyk/iZQgUJeUh3eKv9rdmnqhSJAG5Tm4Vw27wqDRq+eFvJm+hiP
	 6SjqO9O1hb2AZWeWOeAYSjDZqxrLncAQKbU15Mil2QCDWnFu604t1L99JgDNUEFLpB
	 NB0UKtLm7BFqA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 64D723780BFE;
	Mon, 19 Feb 2024 12:33:27 +0000 (UTC)
Message-ID: <94919703-18b5-477c-8dc4-9a359129284d@collabora.com>
Date: Mon, 19 Feb 2024 13:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: mt7981-topckgen: flag SGM_REG_SEL as
 critical
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Jianhui Zhao <zhaojh329@gmail.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: John Crispin <john@phrozen.org>, Steven Liu <steven.liu@mediatek.com>
References: <fc157139e6b7f8dfb6430ac7191ba754027705e8.1708221995.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <fc157139e6b7f8dfb6430ac7191ba754027705e8.1708221995.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_043330_358826_2EEC4153 
X-CRM114-Status: UNSURE (   8.95  )
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

Il 18/02/24 04:11, Daniel Golle ha scritto:
> Without the SGM_REG_SEL clock enabled the cpu freezes if trying to
> access registers used by MT7981 clock drivers itself.
> Mark SGM_REG_SEL as critical to make sure it is always enabled to
> prevent freezes on boot even if the Ethernet driver which prepares
> and enables the clock is not loaded or probed at a later point.
> 
> Fixes: 813c3b53b55b ("clk: mediatek: add MT7981 clock support")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



