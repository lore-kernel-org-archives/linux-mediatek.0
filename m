Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A681AECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 12:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ark57VTLZLSreyHxp92nYN7q7RpSyTCzE4QV2bI6EhI=; b=U9Ov9qvI09p2rR8c76gm+cY4ss
	4T2wtHXm6waq8n3wVzrzRtjq4KNnxTpr8W2g8g5qhfiSPSgWiWDLYvqQzJaE2b3UYRnfepNx5fo4A
	PDzgBBgSkDN425Kue+SISUrUVblTyIC6eDGxTP5hX6YpwLf1yfTQu6mySl7UqdBLP4arz+hHVNXNk
	Bjovnoe0v4S7jRyD7M4YO83M+25+G+lWbhjM90wKPI1IyyyjmkZVbyFw7phL92qGJ30WsrD8TKw4x
	S1pp/JoXUegR32/nvPoX+D48dfAlQ/z+S7z9moEmKF798JR1cRjPv7oW0z4AVCnjw0Pbn264og54l
	tRCZE9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUNV-00BsSz-L9; Mon, 31 Oct 2022 12:58:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUNK-00BsPz-MX; Mon, 31 Oct 2022 12:58:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9852D6602387;
	Mon, 31 Oct 2022 12:58:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667221125;
	bh=BeO+oKNCameH1zwWU+wvsYFCN/BzRO3hzCcri9HM8Ts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UyCAja/GRKvLpVKSbz7anu0DQ+8wfifs86/5lOQgb/e0PNtobNTqmWJn0yZ2ZpWmb
	 Ydy+npxCpco9Vg5RxZBiLe8obCwipmCEN0WF9K0Q04IFCkbSvu7cSl7F7uqpZMQdEE
	 eWWr4fbXAAjhkGNIciwGGrXYnRymzMcOzip0zqVxhQWqiB4c/0ivI0Yy8owLatja68
	 VZ8ZDGBves4YliS4lJ1RWfKEZikmKZysMoornAAPba44vbL7qxIKSZvRvcwQk8Ueta
	 SfoANlKgBQR6102N9tPyTPu7qijUx0UESyby8qSEbdCzDGHbqhfC92JDBJuDvjbC/L
	 fB7ysKlhc3rhg==
Message-ID: <270b6269-0d5d-752a-c59f-44a7d28baae7@collabora.com>
Date: Mon, 31 Oct 2022 13:58:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 1/3] dt-bindings: soc: mediatek: pwrap: add MT8365 SoC
 bindings
Content-Language: en-US
To: fchiby@baylibre.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 "Zhiyong . Tao" <zhiyong.tao@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
 Sen Chu <sen.chu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221031093401.22916-1-fchiby@baylibre.com>
 <20221031093401.22916-2-fchiby@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221031093401.22916-2-fchiby@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_055846_893434_051A8039 
X-CRM114-Status: UNSURE (   7.53  )
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

Il 31/10/22 10:33, fchiby@baylibre.com ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add pwrap binding documentation for
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Fadwa CHIBY <fchiby@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



