Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8D2C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 11:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miMmv68RJGs6SoxBzVcSGZ1+/zqbj147XT+ivQjZHV0=; b=uCddEepkTw1JG67RtURX9+Dse4
	vsHYSS54NPfp4jAsgDmU5beuaHImpo0Kz8TddymXcH1nGmTN7cTSElEtjxR1BYD0SUcslZBuAwdIo
	aFUDsmEqqgU6U9R8lL+C+0u31O09b/dQ9grkJWe3S1ftofkP3gnYjIakSKHTaSMZtJQ/c6tzU+TfS
	GkFTWcJNEZ/jHsrogT8xLer0ZJbL8pt7AIhr9EyGkbxVSjwMKCNR4iX/b09kqClBQTz4tJ/f8G5Ep
	zwM7Hme/UUqPipiqA0rSYeS1O2YJjBxJmtc87glfGoXxOXjZUSkXhboARdloKMiqArHt2Q45YSD4w
	1BJX/Rxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os0Ba-00E74B-Ip; Mon, 07 Nov 2022 11:21:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os0B1-00E6mu-Tu; Mon, 07 Nov 2022 11:20:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D343660283A;
	Mon,  7 Nov 2022 11:20:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667820026;
	bh=4GLK87T5vBSOqiSGloJWJSHYEYZ8q1Ph3WTRsU8DmKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b48ldE8vEdmB4cELPLhlq6/zg5UPab9Qz4/Xfxs+Vv2fyJEFUzO4H4B+cLiHeTSv7
	 TRkgiPTGbxGoK4lOleFzzdyOq2O3guLGtKJlq2x3+VLRntrLNizVnYSOQbmWTZc0gB
	 E3BRzEDA0+SSlB9e3nlag9iOGwyQWomlpdmfqp8Z5DFSX8vIAwzNFt8sGFLfS7mwhr
	 JgEqp4K0BXNVqHzrI2BknmldG4vQ9yO1VSAwuoe6suqkozOBM5giMiGAnvNbqe9HwG
	 aWr945ZoVmPM57JozrbJzg1sUkmNcOvP9n7fbCWwfKfrzlI6XW4Sk8G7t0YFuVDg/m
	 k1nKr69ca5i1w==
Message-ID: <96d0f2d2-24b9-0838-4538-7d70c01ddace@collabora.com>
Date: Mon, 7 Nov 2022 12:20:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 01/12] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195
 compatible
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, stuart.lee@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 mac.shen@mediatek.com, linux-phy@lists.infradead.org
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-1-a803f2660127@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v3-1-a803f2660127@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_032028_144096_4AE3D241 
X-CRM114-Status: UNSURE (   7.08  )
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

Il 04/11/22 15:09, Guillaume Ranquet ha scritto:
> Add a compatible for the HDMI PHY on MT8195
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Ack and R-b tags go after your S-o-b.

Apart from that:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>





