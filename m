Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8187C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 12:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbTgWVsi47UHsl5M+v35UJUQfljWVst9jNTaTDUX0Qc=; b=ZOqB/PRT9GHPt+HfDTu2iJ+JM7
	Pv5pcDzxiikWghDjpYAbeKhlGNhPH19MABhebMpc9lcis6hL1sNmrftSxxjb2YPYDr0pAPJ+egwDu
	0bZXIuSSQVxGxa3yu1NKK2K1kNmZBjC5EtzgXbyq8eYjcg9YUJlZSuEG3C5rt/5i/iPz4Z+NkyJ3V
	DbUg6Msyi2DlaHtEET663bRR+MD/tXD9QsTJ7nSnI6bUHukqdA3hEXOxvzalYce+iLI+QOC2Rec3s
	IU/aIgj3eKHSQFGstpgfILrqPHArXVInpMojKQqsA+eAj7laqB5ymh9bAxqEfPQHHbhlx8E3bLekC
	XUY5bH/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6w2-005OGE-0e;
	Wed, 19 Apr 2023 12:29:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6vy-005ODx-1S;
	Wed, 19 Apr 2023 12:29:15 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 415966603255;
	Wed, 19 Apr 2023 13:29:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681907351;
	bh=n4H4lWi+eMSYO2Ve2dgwZfLNR5C1f0+gyK2oXDwGi70=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TGzetHNIvs9mBDuUupc0UaeoOqvROtO1SsTZCDBY7lARr6E2G+u4QyGY4/uh3sJOz
	 gwwdEjNDOM9HdmreV6WGhnAGvyiV4aPP6AFBwe8Og/zT5tlanT20pAtnc0jt2xCeyF
	 Pwza0dmQtdsXdlp+s1h9MJ0a+L7TkT9abOW+sP0L4eaKbUt1nOFLP3KfWOXovClBBx
	 m25Ul/fDDK/PCPllUeD2uoOFDraIanty6K5RUoPxjfodOeZ0aZPAQtvgIW+qroPJ/8
	 llklopdG4ZRaE9PuP7EzWu0iMikbG+OhWrcTkPt7zSFU+0ylmvo2zlX3DRhWMCKcux
	 e3igAQ5sv1UaA==
Message-ID: <9d1acd01-b973-2c1c-88dc-170d3c86c4dc@collabora.com>
Date: Wed, 19 Apr 2023 14:29:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] phy: mediatek: Avoid floating point constants
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Guillaume Ranquet <granquet@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
References: <20230419122131.2167122-1-thierry.reding@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230419122131.2167122-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_052914_707187_17CAEB82 
X-CRM114-Status: GOOD (  12.36  )
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

Il 19/04/23 14:21, Thierry Reding ha scritto:
> From: Thierry Reding <treding@nvidia.com>
> 
> When building with old versions of GCC (6.3 in this case), the compiler
> stumbles over the floating point constants in this driver:
> 
> 	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c: In function ‘mtk_hdmi_pll_prepare’:
> 	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:331:23: error: ‘-mgeneral-regs-only’ is incompatible with floating-point code
> 	  } else if (pixel_clk >= 74.175 * MEGA && pixel_clk <= 300 * MEGA) {
> 
> 	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:361:12: error: ‘-mgeneral-regs-only’ is incompatible with floating-point code
> 	 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
> 		    ^~~~~~~~~~~~~~~~~~~~
> 	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:361:12: error: ‘-mgeneral-regs-only’ is incompatible with floating-point code
> 
> Fix this by switching to the KILO macro instead and multiplying the
> constants by 1000 to get rid of the floating point.
> 
> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



