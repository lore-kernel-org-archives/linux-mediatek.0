Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE95DC38A2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 08:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6/j0ExGnwjv/ch7aNrJAjA/Z+B9uW++mtUY7SySW50=; b=ZY4r5vLoV5lQIgF97WQs/8eCyQ
	ATq0G9ZwMqtKeXirtLid+tpmqZWNwtjy1X8wqoaFjhtN10MevMSQ/kR5UMh5gU5a2Xgf3zxM1pVMP
	1Gvu1sPUhRh6XSRTivPxjlvdpHxaHszi+n9jyNpw5FadQAy0x1tMb0DKSXaEkEyAB21bi7hjA1zei
	Eeqr++3faO2UmYTKPB7JNf2aESaSkd0Zaun8+SeFMj8je1sfuRDOYJuJhELgLt0mEjezSioNQ8fAU
	VzLxjPDfxvb1v0rR7VrA9+DAB68QEmjV05M5ldqjF5ZcNWkSgNJD+pEoAXjcGE9Q2zXPzDOFg+Unk
	W0O6daTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onxq4-00CHT8-9K; Thu, 27 Oct 2022 08:02:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onxps-00CHPZ-Nw; Thu, 27 Oct 2022 08:01:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A561E66028BD;
	Thu, 27 Oct 2022 09:01:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666857715;
	bh=60an4lyuQrcFiwvQr7KjO4WvCnKliT3qbSJMBKCJ2hs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WUhuwEY0sPYrVwvg5lheWsZAJQlO3d1syGPDWoZl9dogyrx6TBoM0WXDBnOlCrxtG
	 0gv1eYbJeiIU5fX+Z5xcOB2EsxW6H1FamY0fg2k4UMpE7F4+Ra5INRwRCphYxz8eGc
	 0HlOmZ5o9CpO+WCcfk8901ofU16LohU5N5NzBuMIzlJl+/u3F46E0jYunu5uDYSghx
	 X0osKSjK2jYMgcUaWjgQZYzc3bt2ke2YHuZLm+gfDuYWYXJUKZFiybf4WqHqCD1ldG
	 wCM0X2iIvYNyZQTRW6ZDzR8j0ac7WXCUFgPYw1WbEr045MvooFbMzvhLnTL8qMyie0
	 vXJRm5zOaJjHA==
Message-ID: <e64ad829-be27-e1ff-e667-77a90596fb29@collabora.com>
Date: Thu, 27 Oct 2022 10:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 5/6] arm64: dts: mt7622: drop r_smpl property from mmc
 node
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
References: <20221025132953.81286-1-linux@fw-web.de>
 <20221025132953.81286-6-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221025132953.81286-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_010156_933857_93F4D2DC 
X-CRM114-Status: UNSURE (   8.43  )
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

Il 25/10/22 15:29, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This property is not defined in binding and driver.
> 
> Fixes: 2c002a3049f7 ("arm64: dts: mt7622: add mmc related device nodes")
> Fixes: 0b6286dd96c0 ("arm64: dts: mt7622: add bananapi BPI-R64 board")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



