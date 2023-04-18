Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F10C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 09:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r95G4asWXtwvDrUYRthsC5fTbFOBzsV99yYe4kJLG3M=; b=hRFNaZBlXcJLD3Xg3zJXVLmJRL
	xUJVDjDXAf12FFo0NIffGRb/KzctblVOw0wVG9WaYnQi5AsPkWsSxi2e+zd5cqi5W/qaJMy47//Y1
	YaoaN4T2+9gxdKjamgYg0xdvZ+uUArWzcZC+y7Put4g4N5eyDrYSN6c+P8n8WMo8a0YsvfzNRsgb8
	o9mLOuj6HaJpwKs1yJ87w8JxJHxQ2BUfAUa3az+NrtfLNx0FYTb0vujXBjk4VfEALAH8i1Xjkf1Cp
	86GAAC/8mA/HGVGDHvWL/4uMgJ6v0YvMg15mTQbOP87NkfkgQReJk7OVdI4Vg5rv3pnbUvhzRA9mT
	YBu02Z1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohb5-001ScE-0k;
	Tue, 18 Apr 2023 09:25:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohb0-001Sb0-3B;
	Tue, 18 Apr 2023 09:25:56 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CAF09660323E;
	Tue, 18 Apr 2023 10:25:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681809950;
	bh=WjDT+ciRzblDEja9H9yUPX/ktIWhUcxaLuEthRRfGXE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DC7iYPraYsiDHayMU8h93EvVtgSQ+ZQfP/cUQ0Sw++EnXyR4tvD9ViXnVnMly25wd
	 hFZaoDm/LvTL6kmJbnOLnKloLUo8uAGyuZTW8EOq/YVFJnGD+XVUKozZnWf1WzNoZP
	 QqDPDj5xXcyoVSwX3qt+kG26OC66DEtNjwLSDDaYMLd/XGr/Xh6tgX79eN7zLrInGa
	 5HZPwJkjBCA9K3+sdG+bVqeOQXpLCAMq9LtKCCLgIhdO2Xgpiu7UHSZ/WqF3p2odxw
	 wZHd/dphuiD6WPrKjLeWxulqroQdhhNLxCn9kOulH6WOmNXXKt1oLFva3npuDOHh1H
	 Wn9W2Ebhun/9w==
Message-ID: <a7ed8963-4669-be63-0769-50a2641242c7@collabora.com>
Date: Tue, 18 Apr 2023 11:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 1/2] thermal: mediatek: use devm_of_iomap to avoid
 resource leak in mtk_thermal_probe
Content-Language: en-US
To: Kang Chen <void0red@hust.edu.cn>, error27@gmail.com
Cc: amitk@kernel.org, bchihi@baylibre.com, daniel.lezcano@linaro.org,
 daniel@makrotopia.org, dzm91@hust.edu.cn, henry.yen@mediatek.com,
 hust-os-kernel-patches@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 matthias.bgg@gmail.com, rafael@kernel.org, rdunlap@infradead.org,
 rui.zhang@intel.com, void0red@gmail.com
References: <48ae0e2e-257d-4ad2-afbc-2eb4b48e516b@kili.mountain>
 <20230417125533.3142236-1-void0red@hust.edu.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230417125533.3142236-1-void0red@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_022555_148648_DA964B24 
X-CRM114-Status: UNSURE (   8.79  )
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

Il 17/04/23 14:55, Kang Chen ha scritto:
> Smatch reports:
> 1. mtk_thermal_probe() warn: 'apmixed_base' from of_iomap() not released.
> 2. mtk_thermal_probe() warn: 'auxadc_base' from of_iomap() not released.
> 
> The original code forgets to release iomap resource when handling errors,
> fix it by switch to devm_of_iomap.
> 
> Fixes: 89945047b166 ("thermal: mediatek: Add tsensor support for V2 thermal system")
> Signed-off-by: Kang Chen <void0red@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

Good job!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



