Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC93C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 13:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYckGC1y39Lw1XTGr9S5HS5fQXNzhK+dPumxGZ9P4Zg=; b=vvmqdL5ak0+mieIrbtRimLDyiY
	EWLMxRupmBuqDFX2QSOIsfYBNYOc15zkENUEdo9YlaoDhzivKCE3ChAZF/iD6JHmlKKng9WEoE5On
	Z0YVA13YOs2iwmQykV9l5U2i47UB0uUkTtgNPa0V/XYpUZiIzzhCzO79MgGWrZPXsYBtWXOv3lug3
	aTNcQfKQGg/8VYCcL55ih5hHzPVNqLi3wMXcXtbIG8PZIdZFKKqgHw95kHWvUhI8jN6X6l91Mlyg2
	gJEvb9w11nt2YlmNgIdj9vZV16fw00n1DTaGlPBEDdFKPOz8WyVjgOfi+1LxZusgaixykkJzBP9me
	SIsUe5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9TW-005n1s-TD; Wed, 20 Jul 2022 13:10:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9TK-005mj4-3j; Wed, 20 Jul 2022 13:10:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3CF996601A88;
	Wed, 20 Jul 2022 14:10:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658322633;
	bh=jeqvqgxO7A/6sT1qqpmHd9fisrNBZJEFg3LINFIwS7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OilSlXJ8lGmJdbXTdLM/ZW+CXHjEwbXiW84uU0jghgqXV/kadvEKWj58iEza6Izdf
	 RpU9SJaBmnWeLZONnxIFWfDuDDaPtdgpJRFcm4qM6a9+Ejv9wERp3gXld2lC4qwREX
	 uqEZwtmz4m1aEgMcnzqbv+L2iObZMPf/+67hv3DyOukeUqtPfPydIbxt01FiteMCEc
	 nSiexE2qz29S22Z5/i71JezrcAy1JQr4JDqPMuOWMThzp7BAiJxAQONNxksrH1OJeY
	 1uERup10s+iJLE76Pqm20H1NYYISsrbqmLWk47ZeHfVDgRUuQTPLZaoWktSGet1zqm
	 fjPFaXiELCmAA==
Message-ID: <4c75be1e-d1d9-f70f-5d84-3e32c8e757e7@collabora.com>
Date: Wed, 20 Jul 2022 15:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/4] dt-binding: mediatek: watchdog: Fix compatible
 fallbacks and example
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220720125015.13797-1-allen-kh.cheng@mediatek.com>
 <20220720125015.13797-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220720125015.13797-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_061038_322284_98335924 
X-CRM114-Status: UNSURE (   8.87  )
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

Il 20/07/22 14:50, Allen-KH Cheng ha scritto:
> The watchdog timer of mt8186. mt8195 and mt7986 have their DT data.
> We should not use 'mediatek,mt6589-wdt' as fallback.
> 
> For mediatek,wdt example of mt8183, We remove mediatek,mt6589-wdt fallback.
> 
> Fixes:a45b408a020b("dt-bindings: watchdog: Add compatible for MediaTek MT8186")
> Fixes:b326f2c85f3d("dt-bindings: watchdog: Add compatible for Mediatek MT8195")
> Fixes:41e73feb1024("dt-bindings: watchdog: Add compatible for Mediatek MT7986")
> Fixes:f43f97a0fc0e("dt-bindings: mediatek: mt8183: Add #reset-cells")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Please fix the commit title: dt-binding: => dt-bindings:

After which....

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


