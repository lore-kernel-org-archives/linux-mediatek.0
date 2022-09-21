Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E52ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 07:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwUO6/lwqusc9vo+QzBSaD+C9XAdEv2Hni0izZC1JOM=; b=dqycw6d9DCfIZwUjcDYWw6pKAg
	gABHrlgfA5Uu5HNAcjUqoLOtrhwDHR6StSeERFD2ymlK3Iq9DOvL1CBNTbEAR65pSs/3hOXcl2mTU
	v6M5Xp488GMa0p510yVjJs9s0j1lF/MN3em0nOHDV23kucc5U9YNxXuvuq2k93WgolE3WxwrNgWP0
	cu3YU/WcV+CXoWgC8qjTwWbAFB3MwgHYqvEhWR3EiI8bvrQRC1AY3o1PxIhwK7pRELwr13De9yYxj
	dAL/qTlJ2IO+ZCbpFWStPIgwccM1O08dfG/yMUwYNm509H4/pLm4QolLTaK4SNBkHsTSXTXv5jfPE
	16YW8reQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaucd-009kPv-Ue; Wed, 21 Sep 2022 07:58:19 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaucS-009kLQ-Dk; Wed, 21 Sep 2022 07:58:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 773956601F3F;
	Wed, 21 Sep 2022 08:58:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663747084;
	bh=0xsbhBJNnes4Z0TBPmMmlIFfmkNNIidigNEkveeWtaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PyVZhdv9kT8W+gGErFJHisjYNIFDGZNMw7siSAAwE7VmBgT2dYiSyyBCVvdd2VKV9
	 mmogZgBDUWpn+09igSMhfwh7CO9oPVuJwGOE3jbYX/uvfVYB8ZlhRzU5wrlGpU5fLj
	 wsm1VkHYkK2f+shmF8UilbhBmCWFwdPJg5iowBV4ouNVU+dbfTC13+pki+x/SoKg2e
	 mqviDtaSl+gYXESkwAA/y+w6eDyLfsWefWiBIZYSYH2Elm0s6LnKuroKqWfzA8W+yi
	 M3gGzDdakgQPTMo2SGorY2QTtbUFTxB8NMgRzkpN8VdJmw8G8dkMt+264CcvyAwC0e
	 WcG6Bg6cZIJRw==
Message-ID: <17847e6b-8954-c9b7-d5e0-99dbdf5146cf@collabora.com>
Date: Wed, 21 Sep 2022 09:58:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 1/2] dt-bindings: net: mediatek-dwmac: add support for
 mt8188
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
References: <20220921070721.19516-1-jianguo.zhang@mediatek.com>
 <20220921070721.19516-2-jianguo.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220921070721.19516-2-jianguo.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_005808_618839_F917A787 
X-CRM114-Status: UNSURE (   8.06  )
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

Il 21/09/22 09:07, Jianguo Zhang ha scritto:
> Add binding document for the ethernet on mt8188
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



