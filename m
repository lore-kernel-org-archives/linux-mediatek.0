Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF71C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwsTPf07wBbTRP9llTgDwQ3cE74y1ibjQ7WUWeqzIJ4=; b=ZFleuYIP4idUgjW8TRbKj3iw8P
	e0J4kSn5s8MXi14QI3lIrAVJa2Pq/LwBYAwxOxPJjXXLGWfemI5oRN0AzeqgUNANx9EXrWbFFEgRp
	nAGu0xbHG0Ps02pQp6FVJZFQuz7vlbHSXmIaJlW5Hdntr6F6L8S3BD422w/kGwO2ZmktGtBmPlr5G
	tf3lRcVLlRBQBsfDjbjO35ePX3sz0HHLghSyg+h2OV5XVngCWDDFLSWBSZvRlYhByIZFInwMMYNa6
	sr3GV5ju9FH5NZi8MIh0KbDRJVzGwu8ATvI7S8v3VI4vQBWRaw9nBFmoT1hUIyI1qPXllEdRENTW2
	slsrPeXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9KT-00GryP-2e;
	Tue, 11 Apr 2023 08:26:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9KQ-00GrwB-06;
	Tue, 11 Apr 2023 08:26:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3B9EC66031E3;
	Tue, 11 Apr 2023 09:26:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681201572;
	bh=r3zfi38g9XOFbxPCsU6s5EHHY+Cy6cYn92dcZBVVo54=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rd86UrR4/FjxK+t4HmQbwZ2soqvldGu85uXmi4jMAMhfdjl5kyZzUEhV+tJ5E2Yi+
	 zX08gPDPkw18x6K+ZO1X8YoAaT13c8nlzu8kB2ynKYU7eIqHrQB6FBEOYUaGCPnW1k
	 9C/7sWNNSlx2ILjFp5jOuIin9nPrNBWmx6m4Egl/DHlZdbPm7e+4f7FbcJy128zpTl
	 fdT1XzZYtjB6BErihCjxN+ReW7uBCwKejCIHPGvGcHP84oJOUhA0TVCqj0HDEqa4pm
	 2exNtBSqHpET+9eFiqhODR4gWKBy6CKLLEJujX+6DWTQEVXeVQ6zQkyHXOdndXYBKJ
	 Wxdb4RIKVQLmA==
Message-ID: <130305a6-54bb-2928-a447-c0e410c97a2d@collabora.com>
Date: Tue, 11 Apr 2023 10:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 2/7] arm64: dts: mediatek: add camsys support for
 mt8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
 <20230207-iommu-support-v3-2-97e19ad4e85d@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230207-iommu-support-v3-2-97e19ad4e85d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012614_202908_6411DCA8 
X-CRM114-Status: UNSURE (   8.63  )
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

Il 07/04/23 11:34, Alexandre Mergnat ha scritto:
> Camera System (CamSys) incorporates an enhanced feature based image
> signal processor to connect a variety of image sensor components. This
> processor consists of timing generated unit (TG), lens/sensor
> compensation unit and image process unit.
> 
> For more detail, ask Mediatek for the MT8365 AIoT application processor
> functional specification.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



