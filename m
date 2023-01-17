Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AB0C3DA78
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 12:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7+rtGXW0TxjwgtmBGoKw+mq6pQ8uVM0L3dbBtcmflo=; b=IzzCUPJBXs6VOz6KVwgvxay8pM
	EDGRi+mOQhu6dnKB8k+Sff42e9Ntwt/CPX4KPKrzGFcWHwM4suFj8YGw2Yqz/RfYZtsqbxpgC0dda
	6sVtfBH9HkLN/9Bjb5MoR6O1KF5in7XT7/sS7RJ6Hkd8zr7+mKKeAwlcorGFqq/IzMBED2E37c+Vx
	kYVEfBMh5hu0kCsHSut7LY7QkHpErH6WK/J6Ml9EqrcjpE4TrtA+rnOcZqRq9569sDcueEVlaoy2r
	CbKfd6Wg5XdgkvjfDAGEzRpl7SJYYs2Nv5Q1AwZYpliuROqFK40JoM1yKjjApi5CiApT6Fh6ver5H
	oN0A+Qgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHlQ8-00EEct-Gg; Tue, 17 Jan 2023 12:50:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHlPs-00EEW4-Mt; Tue, 17 Jan 2023 12:50:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D89626602D6D;
	Tue, 17 Jan 2023 12:50:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673959815;
	bh=tqjJws5ust3XqNEcU7FBxE5hH4j5VsdQx8UtpembBUI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OuDJeg88WYJZm2Vn4xvz5dUVqrn5fZOjudzbtOAK9eZ4GhZHa1hkh7wclz/9V0lYu
	 LONPDG7QIVMKTUMdaLeTudmewzDdOCf8oKT05xKRSMwnhusaA3EWZ+eKWyl7mjgZ9C
	 9GBoXsA3pfp+zax7Fiq5B9b07Mi5LHZuq1Sjmhb1rewYE94byzdkPs0J4zBpAkexgP
	 Z0Ih0I1mn6zI3h1tdiB0T+DHJsm579AsBVkjTNXo1MspOJR9vUVVKrB4Xx3RgcdBhu
	 eH4YIdxQEDPCkzETO2WmWTkOVi6nIGSJq5dMkvtgZRzyBBgDBMpZwm6pn29jXXbqsL
	 xE9BOs53u01lg==
Message-ID: <f4a65f57-6ddc-d9f1-9f41-c1c2f8c62e28@collabora.com>
Date: Tue, 17 Jan 2023 13:50:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/4] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365
 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
 <20221122-mt8365-i2c-support-v1-1-4aeb7c54c67b@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122-mt8365-i2c-support-v1-1-4aeb7c54c67b@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_045016_921960_8B1C9A6B 
X-CRM114-Status: UNSURE (   7.89  )
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

Il 17/01/23 09:49, Alexandre Mergnat ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding documentation for the MT8365 I2C controllers.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




