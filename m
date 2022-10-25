Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648F8C04A95
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 09:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8r7L6rhh4TAZcDmS0XgjikERgXONFwizO/PY2BYDK8=; b=uzKJ89nU3PZyfG3/TPLTXklED2
	oN5eVy8OQkIc5dVfACQ4tY2SxhQ58qFx0oB1AJy9cY7pPWRB3iCw5nnjskqnpgZsHE+2na2yihd2W
	a1tQHpPKs9oWTXbWSShJYmEo9hTRXgM9wxlRXD/F+kduDfcfgPk2mqOiSkZNU3wscsN3nqWIzLHlf
	a3nLS02Cdhv5RkSYeQM3d3AUlXGECZk4PjiPubCbqJHjG8CJICQ6aZOTJDB73KL+Qn3OJTJvXXhGh
	qJelRaj+14+4u1K2sqTAAzrfT6rfaiCP36biLUy7zhOobBSPaDHlETl9wCnMMRmfgUTP671D/f8Ij
	eWT0aipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onGd4-004ewW-2D; Tue, 25 Oct 2022 09:53:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onGcm-004et1-4U; Tue, 25 Oct 2022 09:53:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EC30E660237B;
	Tue, 25 Oct 2022 10:53:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666691603;
	bh=AfoC+u7QOoMXL0swZVl0spuIt4jUU/HeJkWsU7RAiyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e3IHYNgCWZFHB87MlOvMPIe8lEbMrg8kIJx4WoAX8/jwbREZ7I3fZaTIyr0w3J10j
	 pZBOISwXMzpJCcYc7/SQvDd+Ma5oayPsd8+Ka6I5VNGbVveaGhOL8VeRMqvGMgKBpL
	 exWc+XE1mILerfwugzCj1mWwZ1a9Va2UaSUVjtsUeKpM5q/neXObmgIHRnRKlTyLAR
	 MbtO1yqpogjhUhFaJsm+l+jIcu4xvzEVqJmUZMkiMNsA/4y4wXTxuu4aApxS8uY5iz
	 abIvvWX4zMGKOFa+VW0O6sL/fttYa5qLsw5kuw9CT+Ca78H8kubHmx9Jb8aRahwQXJ
	 oHQ5piozLYcYA==
Message-ID: <03f10476-f36f-3b74-6523-7bfbbbf1a5e7@collabora.com>
Date: Tue, 25 Oct 2022 11:53:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 3/3] soc: mediatek: pwrap: add mt8365 SoC support
Content-Language: en-US
To: Fadwa CHIBY <fchiby@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 "Zhiyong . Tao" <zhiyong.tao@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>, Sen Chu <sen.chu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221024131544.31219-1-fchiby@baylibre.com>
 <20221024131544.31219-4-fchiby@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024131544.31219-4-fchiby@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_025332_358417_4B0B3FAB 
X-CRM114-Status: UNSURE (   8.23  )
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

Il 24/10/22 15:15, Fadwa CHIBY ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add PMIC Wrap support for MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Fadwa CHIBY <fchiby@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


