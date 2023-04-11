Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB31AC7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ci5xt3MJIAp5WvBi9tAM2iSl4ybehwpeHKIXsCmfuwI=; b=dsBvBu1m8BA4J950ZfhKUAJW49
	oIindyn5n1TaOrdOME2gONhx2Uq5UMeSkS8nf068v5B0JzJx5WATXIR5DazBJ7uHPpI7ZT7Vd5nhU
	k31yMSpdbiHKzlq6sR7JQufW5D9n6h4L5qcV8rLQLk1Z9xFWjecO4adImeANiIitpbikMoCBaa62I
	C4Fv1MQPERS+iIXCBCQzg8YrLht1UmP46NcV4Op4KY540Kr8o4PI2Y5Sx/CaLTgi6jRF6QeWZ6qbl
	V2Gf2rNV38a+UNO8YIHYcanRqUNoYs9L5a61FKVSDQQh2mH04PzzT49Ec3BGB9mZLMiUr+ZW3KRcz
	Nkr8C7MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9No-00Gt8D-0H;
	Tue, 11 Apr 2023 08:29:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Nk-00Gt6B-2Q;
	Tue, 11 Apr 2023 08:29:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 289A366031E2;
	Tue, 11 Apr 2023 09:29:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681201779;
	bh=Ma2v3EyMsGkOmwNVpAiayuKQ7gD6/5OgGM3RlenFbQ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j7Fp0Vl4eeBCo7tuhT5NhwmGW0UPnULoNJPS6wK/5ow8+VVW528ehX3678+8ZSWEw
	 WIz18+faOuBxT80h3hi3RHEmPEcHgjbqK5EAXEeMCIGqpZ1BCwxj0kUFcMQfgMsIiK
	 D3meYwqQoC7tUlcX+PsM8LqbvTCJGNJ9NnbajrkAmc89EgXU44rI4L7D4Kw7MhqYXv
	 bSlZxB+SRXmL0K5uNJZKhqJpCW+9lDrv0tQZmyw7z8x069vmNJ7CLkm9mnMlIKHObk
	 fnj3SJA+5D1ylkCGIXUtJYnUd8xqo5K8ssRJUTHgYwBxYMmnbMTQX7PFzcw8INVGGj
	 fObUgexo41wNQ==
Message-ID: <da270d1e-5c92-b8a8-7d85-e633c43809e7@collabora.com>
Date: Tue, 11 Apr 2023 10:29:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 3/3] dt-bindings: memory-controllers:
 mediatek,smi-larb: add mt8365
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20230407-smi-driver-v2-0-8da6683cdb5c@baylibre.com>
 <20230407-smi-driver-v2-3-8da6683cdb5c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230407-smi-driver-v2-3-8da6683cdb5c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012940_916214_6EB37A36 
X-CRM114-Status: UNSURE (   7.70  )
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

Il 07/04/23 11:13, Alexandre Mergnat ha scritto:
> Add binding description for mediatek,mt8365-smi-larb
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...but the bindings commits should come before the driver commits.



