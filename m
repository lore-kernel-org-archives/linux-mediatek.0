Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B141C636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nj4XNpHE5K9KmQIQ84AQ95h94mgRlhaGoSgIeNfnAIk=; b=I63jVXO3+YpKmh0RQqRuWnadI3
	Z1W+jqI44CyvG/y2F1aPC0BEaBeFZcnoBdWceuNRuJ37WKpP/Z5LG+vy+aOmoJ+ADWZJYhNNu26ZC
	7+a0fqQyGxiDtSjtrFYNVMCs9TeAZ0BhWkYcLvHyZbtDvtbHBasFuAbNeD5x9gJR95yQEx9DiayYh
	6N7lJfKHGnaAJQ+pIQ6zHUZEh+c9WxC+5Q3FJakpHG3rr2eKi8ZsfqviKlTKgl/a/futSlXYs9B+1
	TnVOAUhYEgFo6P+4X9qYUeUZYeZJry+dahQ9Q4AGJXkMmwswGx7hof/M2WglCZ43f855ZCjXaxDQR
	cjky5RHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQS4c-005aFz-2y; Fri, 10 Feb 2023 12:00:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQS44-005a0F-ED; Fri, 10 Feb 2023 11:59:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 58DDE66020D9;
	Fri, 10 Feb 2023 11:59:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676030371;
	bh=R8WWjxf5J7RMeHFDaBzUtdy3/qBuqs+WTluEnKiLZJY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TBZ/yXOo0MGokwkmNaqbiMlDvg6zFAWaa3pIdeSjzURDsbPV8TpgadSPO38bsJjer
	 TC7VhAxxw+DcT4gfl+G1lFr+Y+Q1UvM2T6mgqii7KyXYTIgVmfXQd9AKvway/IxtKq
	 yWg+pvD7fCO1zGM1esebEu9XXKLCbtn1Xg0fCP3rs48pshBt/k1MIynPHBU5wBpi9+
	 zocZ37EullRo2akYQ1f2YcmlerWCoe7Mie/EVGjaumsw5b5XThOjC9OQE2XUqSKLDw
	 +oY3rNsO4oLOr8TlbsFs62FUxYulcianRupxmuDp/VD6OdpO992p6pQaTEr04Aohh2
	 ZuAL36Rj4re6Q==
Message-ID: <75e61244-3927-d6c7-39af-520f7f1855f2@collabora.com>
Date: Fri, 10 Feb 2023 12:59:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 1/4] arm64: dts: mt8195: Update vdosys compatible
To: matthias.bgg@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230209160357.19307-1-matthias.bgg@kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230209160357.19307-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_035940_636131_EF9DB890 
X-CRM114-Status: UNSURE (   8.16  )
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

Il 09/02/23 17:03, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> In an effort to fix the vdosys implementation, the compatible has
> changes. Fix the device tree to adhere the binding definition.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



