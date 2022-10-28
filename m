Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FADAECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+xzGGeY0yJxRvUhTs1AXVNe98H2427zi9v9Df9LF0w=; b=Yl7EladGZtuRjb8iuUiEodcYHL
	SP3iIp6FD9prsd8v63IgaolcKLId1kqDssHfnYRzQk3gfB/tJLSqGcWe26BLqZr6QFWjspzg1ecWS
	RYN6zQaUww+5qlghOUeTnAOzga/h54JQw1oXKBd+x+OiUz6e+TrGuUqjm/LylPHpa/4/2m/Gl/KqX
	lURN9T+mRXR7JJf4n1kRZPqnbtLFn8dG7TOlhtAg/SB4NZepuBMlgtG4X8wu3OcNTqgD2mp4eEe1O
	x59ecSq3K104vOVnsHcEfkID+AQ7H6JsCOSKoZrOsk2UGtjlMSoJ9kf/1NeHH/Z3QXN3m/IpT4C5p
	EW4OdQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLcC-00GIpA-2P; Fri, 28 Oct 2022 09:25:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLbr-00GIj4-JM; Fri, 28 Oct 2022 09:25:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 652266602910;
	Fri, 28 Oct 2022 10:25:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666949101;
	bh=2bIhaQBUmBagbZkcCfQYz81lwmySMXrFscfo52gtVRY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cqy0A/x9OWYhJT94GG1oWVGElLve88xG2bRickgsjeuqW8Smq+XthNAvn6aPDNkgq
	 Vr0R61BN0q6XQDo90RYsIdecOmKlTppC7WhRSf2A7Xdwhs+v2P0sptLIvl4iGmJFf8
	 JImafWgy3puPOaZeNO/7hoe+iDuFfA6tRB2L7+Se01jtMayD1pg+s/jMzJYtBD/cZn
	 knn+UhSc1le9C8gGW1vijVDCGwMyebspnBzIGcZeVOTE29ZPOqI8TncCT396Db2KHB
	 TZ1hIQPdl3cAJi/nD8HkXuvqmAn4noDb0K7yzJqwuCFcxBF4iBUDK6QY62jwp51KR3
	 747fObHVRLuXg==
Message-ID: <8adb643e-9c0e-2870-fdbe-0c6d75fbc63e@collabora.com>
Date: Fri, 28 Oct 2022 11:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 1/6] dt-bindings: mmc: mtk-sd: Set clocks based on
 compatible
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
References: <20221025132953.81286-1-linux@fw-web.de>
 <20221025132953.81286-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221025132953.81286-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_022503_788550_3431E21A 
X-CRM114-Status: GOOD (  13.05  )
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
> From: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> The binding was describing a single clock list for all platforms, but
> that's not really suitable:
> 
> Most platforms using at least 2 clocks (source, hclk), some of them
> a third "source_cg". Mt2712 requires an extra 'bus_clk' on some of
> its controllers, while mt8192 requires 8 clocks.
> 
> Move the clock definitions inside if blocks that match on the
> compatibles.
> 
> I used Patch from Nícolas F. R. A. Prado and modified it to not using
> "not" statement.
> 
> Fixes: 59a23395d8aa ("dt-bindings: mmc: Add support for MT8192 SoC")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


