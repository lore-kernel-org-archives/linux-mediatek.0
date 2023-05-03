Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC93DC77B78
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 15:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sv2+/K5XC2b0HdPgDdX2IKatg7rHcYkRnUy7gDiaJ7M=; b=ZPCooQ9//FkCidxGkZtVxcRaOd
	/by6GR3Cwn4/eXlcAPh4BQZ2t6yi/p9daRLuwJ4hwWnZ/WjjlPEw+yPQGVr4UrARiCwiaFguBn7Hr
	Sc2VhbPgfZe/SL4RhgAX5sxOkKJe2D40PAh1molc4zOxk5OigLh+9sfjoW2LC5aEnnHl6UE8nf4gJ
	OG9ki9/GRDf96or36XRkfeuAswd+R4lgliN/ji5hzLKtKggoF4eYnxp48jJekyQZnrKqPc+6GYBTM
	OVIsHCk9oj7mDcYKJYpTX9yBs3ERY8QEhDqPdo5ty5fWLw4nGlsYRREx+ROOzybXB2cQC/hoa4gVm
	OwqHqWnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puE63-004ufv-1A;
	Wed, 03 May 2023 15:08:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puE5z-004udb-0P;
	Wed, 03 May 2023 15:08:44 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 86AEC660309E;
	Wed,  3 May 2023 16:08:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683126519;
	bh=RwTGWOhkT7pHlQLK7lBAvP67WOlpNIgQtMBeQOTu5GQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TsfBtP/r5DB06esjjVFlv1laNtIZfYOWcaJSjKiK/vBGHoYjiFdeIa33f0Frtk+4L
	 FUOXQETj1YxZhTvk8Uz2iLdvcFRnG/bmQbl2rWVB1DE3dYAG3r3bMjv7dLtUm8LoPX
	 YY+R0XBOaaFdkKUU3aAx58sz4tmpSTnWKlmYLhWkYl+MXlIWNY9Y+QZBPq9+4BJFJu
	 0PpCVJbt46yoxg7GdS2G7OPKqFPh5A+udbnNKP2yoZq7lgIBU4n1quPJ4bzwVnM7+c
	 L03/4EmwU0SXjcwgPA5LwzTrWdQEs0M6tiGvbIMikeeonyPlx8/hEPVl/L+IlFrSCl
	 V8LxOwUKef5nw==
Message-ID: <449d21bf-c91c-f8dc-38c4-1206a5463fdd@collabora.com>
Date: Wed, 3 May 2023 17:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/3] thermal/drivers/mediatek/lvts_thermal: Handle IRQ on
 all controllers
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>, kernel@collabora.com,
 Chen-Yu Tsai <wenst@chromium.org>, Balsam CHIHI <bchihi@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230428195347.3832687-1-nfraprado@collabora.com>
 <20230428195347.3832687-2-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230428195347.3832687-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_080843_341738_AFD53092 
X-CRM114-Status: GOOD (  10.49  )
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

Il 28/04/23 21:53, Nícolas F. R. A. Prado ha scritto:
> There is a single IRQ handler for each LVTS thermal domain, and it is
> supposed to check each of its underlying controllers for the origin of
> the interrupt and clear its status. However due to a typo, only the
> first controller was ever being handled, which resulted in the interrupt
> never being cleared when it happened on the other controllers. Add the
> missing index so interrupts are handled for all controllers.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



