Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3BBECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 07:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Cb28ER/c7HepYy11W8pB3M1HyY3hrhqixoU/YdDLMo=; b=o39s6uM5M6rEnUCURUcOgEz3Bq
	i+TOxWzSoT037JcemXQq+bPEexorVW8GSuRFJ6wMMqQg1Wx3NgKm0to1HuXWqgUAsSLEaopTLCi6w
	wNly1mKZC6wL+cdf3R//Xx/gmMDJRl8gHpC0q7AcH1iK4qTzeuphzt/PmoPqjDC2YgrVcHJw8QX+l
	FoAlLzxNaQrj/XO+ljexsRqwIzCrDQ9hskbl/BvlMXVdu5RvDBSliUrvZOnSNY6GWzslrqqumksmo
	SZEVtMZE7fLXlLqfSe2TzuTxY2f7YwS+zidxmRVE4P5v7+tyMt6wzyX10Q1qA/orZ1CVP+xDq7WyQ
	3es1nWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYNBF-00BnpJ-QY; Wed, 14 Sep 2022 07:51:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYNAh-00BizF-0Y; Wed, 14 Sep 2022 07:51:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4854F6601FA3;
	Wed, 14 Sep 2022 08:50:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663141856;
	bh=3T5SQxFBMEjJX4Qw5hQM8ZcMUKcEzM5CjnkjKW21j1k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KD3U750oIjMKg9fBPcRbFzf7p+36wQepJ1r1OWtgGKs7JBmzld9PjcxuqQkCnrb5a
	 AwIs/cqC8asIgDqQpY+ttmil8ezq9ILrqeHIK4EbQx3ma/j79RiEeOnTvFVH5bMLsy
	 Ynq/Mz7u0kgxs4wkPfJvynscwgriq6+/S+TKvDirmDijs44pTFYoH7XjQOJ3Ei2oNf
	 Pt11U8AitSW/5+sT/u4vsZEwlWLRBP51tLVnW2DoBvmm67ohcstrj8N0IuAJbrjiQC
	 hgK9rSyR/JIashKS0rlCYlx15atnXH5Yh9HVlQzReXe2jLtKuW7D7PKg6Z7sddm8mg
	 UteiBVAUyEkgQ==
Message-ID: <2de048b8-00fd-cdce-9ac9-e234c88db9f0@collabora.com>
Date: Wed, 14 Sep 2022 09:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 6/7] phy: phy-mtk-tphy: set utmi 0 register in init()
 ops
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>
References: <20220914060746.10004-1-chunfeng.yun@mediatek.com>
 <20220914060746.10004-6-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220914060746.10004-6-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_005059_307771_F0A78E0E 
X-CRM114-Status: UNSURE (   7.79  )
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

Il 14/09/22 08:07, Chunfeng Yun ha scritto:
> No need repeat to clear utmi 0 register in ->power_on() and
> ->power_off(), just do it in ->init()
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



