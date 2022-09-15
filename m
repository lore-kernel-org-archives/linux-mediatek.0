Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AADFECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 10:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQUPaDejsuC9yzmQ0/i/EFHRfotILL1VonfSIxVGecM=; b=u4QPnwClSP0Hr+ApYzYLu8vleT
	hCXPkBt2leUhBPsiw078Slu70+6gtRg7o5VaeLW4PPzZR9tpTpAroZMM9tZ/WjNGtDphkQ4PWbwCx
	91Hbsw7jQFXI2UUcyLRPt4ZwuoKiPrKpHj2GkKTMnpC13hBaoCKXz4kBpc6dG/plxDt2ldgVLrSxW
	CjI3UtWde0YWwYK0BBHYBB6p3pydeIBkdIE8yAdDt+8nw+wavEk/QkJyPoRJQpH0j9XbP8yOw0Q0h
	bWoWYbzpTUFesOBJ2ibCLhQ3iLMSEawlEiZYNf5dUrDuvlW8Q72+C3YrWZkH1XzE2mjWO7runTHQa
	sSqJGygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYm3R-006f1T-G9; Thu, 15 Sep 2022 10:25:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYm3E-006eck-MH; Thu, 15 Sep 2022 10:24:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E86936600371;
	Thu, 15 Sep 2022 11:24:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663237495;
	bh=dzvyAv7u5rz3DlDYP4mS/XsMlrYVI4W8bUZSZ8822rI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IogmJYyCu2reXph7llyGnbDKO2WatCn1H95lf84LDss+/omDaeEbVELjcngQZr7mq
	 9j14Dd2VhkvL1L9lGzDma2t3eIn0p6ImRd5yval+7QWdUCDn/DTJSDrapMwQoH8/l7
	 WS6ydCweXMxbjoMtI5tAU/JjAR3fPVR/qmX9Ak67jhZZd1ig0v62mnYonis8c2ioL2
	 kLZbEP7CZLYCAGKyCaG2B/bNg1zOMA/U+1vsAmA48DE622+Z+SeYQn+1LiUgC8/Usz
	 U1kCtthnJIB6VdSK+o3P2kzGfimr1t1OlhY0AiLfPTF4yEG9uJvcXS5uvUKT/78xR2
	 QLJ8JxVe4JkFQ==
Message-ID: <7498e2dd-1d5e-78ae-54b9-4d5dd9bc7ce1@collabora.com>
Date: Thu, 15 Sep 2022 12:24:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 2/4] arm64: dts: mt8195: Add edptx and dptx nodes
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220915094640.5571-1-rex-bc.chen@mediatek.com>
 <20220915094640.5571-3-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915094640.5571-3-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_032456_899542_00E03318 
X-CRM114-Status: GOOD (  10.31  )
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

Il 15/09/22 11:46, Bo-Chen Chen ha scritto:
> In MT8195, we use edptx as the internal display interface and use
> dptx as the external display interface. Therefore, we need to add
> these nodes to support the internal display and the external display.
> 
> - Add dp calibration data in the efuse node.
> - Add edptx and dptx nodes for MT8195.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



