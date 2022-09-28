Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68090C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 13:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMXPQUd67EWnxbHZrBKrWkuqduZHJ4uQBnoT5N44HnY=; b=szbs4uSZun5mT0qeayOFnkEqaS
	K1ZABtl/hpTVi7bybAe+D9q1kiyaf97yUtjIFAzOWJXYeH9jFu8a+NF8BjVx5dlmcAGYh9ZBUShNj
	rrJTfSwqvatBuf1L0g2fKUzR2g3OoKsb/p/WSNbzQELu+RKRD0Jkab6RIx8NnetRe/8cpkVVJ4ZpQ
	4BleEreIreQoChY48w48/VeFRp/DzqKCBurjWZ/DIri/OVBBAfOmIq3ubFMXh47twBthaV0zyMumw
	pCVz7eGsIBMtOn6L4kJ66bLuWQKXLQkyMagzXuhszSas0mycq9FwRa1DfdJNz7lGFx2ImMjgZmYot
	WNQJhdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWhH-00GOzj-UM; Wed, 28 Sep 2022 13:01:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWh6-00GOw2-PH; Wed, 28 Sep 2022 13:01:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7EEB56602288;
	Wed, 28 Sep 2022 14:01:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664370100;
	bh=ASSVLLMUq+ZRt7bCotXGkZism/xFGgXPWANaZ8iChG4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jS9D2twkkPXrFJF3UUgu5SbRIKBpOWIsBunhzZtGpzGiqjqawF0318/xw8w6Bmj2Q
	 sWAwR3d+8Tw0pslFoyLvSeg/PE/K8w0a+Ls+KJaQjiBDurJc7tCAdnBK7FahHwWMYO
	 LLetMT8ysz81Yx84Z3y7rWLIqhBshZy9/Zbv9HMBHgYPioQsoxdC9AXZw5uvZoL+mw
	 k5pZbwu4myU6dD/8wgHWUICYiyDd+q6FNotMNjgY6qGDdmr3kgbd7qL+3+a7yPCxZk
	 +peD98VDUULl2x16wVwUOpXMxO9UJ+mLN38DialFlw9U2oEMvlensFLSMEMtlWI+eN
	 0L6fZc9NYmU2g==
Message-ID: <9fdec950-065f-201a-4de3-823beba5d792@collabora.com>
Date: Wed, 28 Sep 2022 15:01:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [resend PATCH v6 4/4] net: stmmac: add a parse for new property
 'snps,clk-csr'
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220928092308.26019-1-jianguo.zhang@mediatek.com>
 <20220928092308.26019-5-jianguo.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928092308.26019-5-jianguo.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_060145_079406_A084B915 
X-CRM114-Status: UNSURE (   7.64  )
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

Il 28/09/22 11:23, Jianguo Zhang ha scritto:
> Parse new property 'snps,clk-csr' firstly because the new property
> is documented in binding file, if failed, fall back to old property
> 'clk_csr' for legacy case
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



