Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198F3C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6O+ufV9mUNMmsfNj7NkMI/Mt/Fc2vJ3KZAuwCEMv0ak=; b=iEmeBoJhUbqycTGysoM2u5UkAj
	ipnUiFdtAPHfLM/AOLCLul7B3irwd/bdiDJutQ2pueC7acY9gFR/ziuIwImGQyM1YiwZBqmmLUj7N
	wClKyEDPWfyBH2x9NsFWPHJj0vDftUP0v6RMTFAbYUTFgjnMRiz/X2+jtNTBM95eM5JugcPJdSGfQ
	ul/lfbzU5b34aN4kXv/LQoSNOlLJkrkzZSVos0t9pHXFv4qFHF7Dhbf4nRqMJ/xPwHdipRHE7XDNW
	6lc9FdFwiqQPmGv/oeSB70Frul/wS3QD0KN9r5U0IX/NJmaUkEMFF8FL0HYUaf+CM//1K4lV8+FER
	9A1pFJQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28ao-006ngu-44; Fri, 17 Jun 2022 09:48:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28aa-006ncb-VV; Fri, 17 Jun 2022 09:48:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D7FAB660179A;
	Fri, 17 Jun 2022 10:48:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655459303;
	bh=uN6wnbzAZuoDWwRcuXfVxiPLqXUDSzCb7JMLgqXhcJY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PiYfAcyPeP0HfwUiZkJpxWz8nAl4hgrf5aNPMEFifj35+464fd2lwcx/ebiiChtPM
	 DpjmiH90rIx/6+VUzJDkpM/4d+WGK/9zI1HKHapcXJ5O0Lu7w2bT+QSNT94isb+UbY
	 M8PUye0LtMKw22fs0VSawR1LKce7KVYuAnn7xVkji+UR8YzV26irDQf5WpWvGmB/GU
	 iwezIe0MY1BokCxkUKX6N7UicST6Db6rzBmXWTjykRB9tS7eCat8DgW94Qon7sopIo
	 wnNQcb1NzdIF4KM4LcPD6eclqVVZF+5iAIdQnRCF4lzdyK+EPtXdoBww+jQeoGA4NQ
	 vualHWAqQimFQ==
Message-ID: <d5566b11-e3eb-28bf-73d1-b17e0802b0c0@collabora.com>
Date: Fri, 17 Jun 2022 11:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v10 2/2] phy: mediatek: Add PCIe PHY driver
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wei-Shun Chang <weishunc@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, rex-bc.chen@mediatek.com,
 randy.wu@mediatek.com, jieyy.yang@mediatek.com, chuanjia.liu@mediatek.com,
 qizhong.cheng@mediatek.com, jian.yang@mediatek.com
References: <20220617070246.20142-1-jianjun.wang@mediatek.com>
 <20220617070246.20142-3-jianjun.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220617070246.20142-3-jianjun.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_024829_271846_090A4469 
X-CRM114-Status: UNSURE (   6.07  )
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

Il 17/06/22 09:02, Jianjun Wang ha scritto:
> Add PCIe GEN3 PHY driver support on MediaTek chipsets.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>

Reviewed-by: AngeloGioachino Del Regno <angelogioacchino.delregno@collabora.com>


