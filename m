Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C38ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctybIeOcBBXJaw7cjrI8Dvtg5IIS4ffpqAeCOrO4z8U=; b=NkQyOgCfGgJjsE3+zpc0k+K/j7
	5g1gysNsg0OLg/lYnqnHmSnjDNsbQPLh2A/ykNWTMjslP3J7JJfLvlyD8FCCQIxVn2a+KkbDBmQjV
	DHsI8SKIjoIqseXgR7fXRfGEJKFR/cX0x0OZwjNHcP0gWuqtSxneKZxmzAobqogAJRSRzdZ3YcFnR
	v+fV4UNvoxakSH6DGh4Wn9QCJVVrFA/n/HYjKcrPlWzYh4BRhy/CHQzvbLeoG14GMZK7rRWgBIW+i
	wnCY7XHc0G8rDDO1/5TZ3A9GnLFlREPCBmyslwcrlWoRBu9gfcpYFhXOpi3rN6rb+3SdgZUCNhBmH
	6ApA6M5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYpk-00EBTY-Nq; Fri, 09 Sep 2022 07:53:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYlE-00E8Jp-7w; Fri, 09 Sep 2022 07:49:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1DEFD6601F9B;
	Fri,  9 Sep 2022 08:49:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662709750;
	bh=jMGgQw3flSvEElU0iAiEiuXLD9yc+tyfB4ZbbObfSCs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lqahKRi5D2fcH1XTZOcLLNJxVA8+jnjRiNNWbq05YAqMDCWlMh/37KaueNTxEGT4C
	 1EAgD+7qpYuDQ7YzSNU2+gJs8K99DRBEkjmGXVNskV4EY/a1GAG19u7rq5yFGkaFQW
	 QCfMGJTHb9HIns0wO91BQuJUSVwb/IRmpE5unXPatduVx02qRwHjaUtWE8102MkblG
	 0okIN5+AzfY4R73Rhd09pOpmit01q3JNSP7mYlHwcLD4OVfqg+NbT3iqSVZvajBRqu
	 phh6LGYrHF7cAd1OhPp/XAhkSxmfYAwM4TpfOB3owWbBbQmymBUVaMZOtmtFI546Pt
	 cQmCEMkaW+F2w==
Message-ID: <5032e29d-dfa0-e071-b3c2-845136443b0e@collabora.com>
Date: Fri, 9 Sep 2022 09:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] dt-bindings: iommu: mediatek: mt8195: Fix max
 interrupts
Content-Language: en-US
To: matthias.bgg@kernel.org, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>
References: <20220908141529.1478-1-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220908141529.1478-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_004912_463942_F045B61A 
X-CRM114-Status: UNSURE (   8.45  )
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

Il 08/09/22 16:15, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The mt8195-iommu-infra has five banks and one interrupt for each.
> Reflect that in the binding.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



