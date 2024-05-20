Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095E9C04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 09:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+KRfjf68PXTMIN2077uFRRp+7xFwbNQ1cUQc8k3tRU=; b=ROd0qCNqg1UlgVpbqXVQ8rnY5f
	f24bUHSd+MaTtJ2DbojqOcXqHqspaXGq5hbHPTR2w4KWPsZc4APw92EI/NiaSKj2pHIvJNyYl/y06
	CzQBsbvpKPZ5l6aC1vrooIjEAxuOqW0BVQZna9k6nTq02wQE9xEMDZzm4NcBKvF3oZ/XQQpmPoYoq
	cJ5ZQUhEe/wHlo8E6wEHMTMJjjCWxdMs3wfSG2/cZkgP/COvE4YmIalHvgQ9uwzzQLHjECTo1AC7z
	bHHH3JXWWyG7PFj5wcdx0tEm/UtXvNjTetzefv93o9We4KcqtamsUgr9cSbQQTjVGvDUPu7ZNg+SC
	+OVFQ58g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8znT-0000000E4A7-2woI;
	Mon, 20 May 2024 09:59:11 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8znP-0000000E48A-3k6f;
	Mon, 20 May 2024 09:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716199146;
	bh=YXr5OkApT26+XTrMA/rnWYnu5JA55GQIUti3yFLD6rE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=vThg0w5GsICMH+h606V0YqDGp5cHx2istjfTQxTxSjOMhxyn8xYYhWoPKPswYI8qG
	 xTNGLq8cVs7WWpvnlXR5/sT+v7C65wnK2ZHNZ5HlZiG54vUVvo8vcCh1+e2UIxPPqa
	 e6RjOHpchfDDm9PLk9ICdPbrG0JsdB8lPa/6C15wQWYm/0K9jGzy+/p38i6/QVhy5Q
	 AFo0SG8OApHsJ1SgpG6hE9fZL2X5uHEHIyqeXTA2/Ug0oDB5aHD3jPSjEa3QvGVUw5
	 vku4tNZd+J0hYSwmrIYvOEOgqeFvXcu4ZRMGAsB7PrHtCRDQkiaEMdxijIj+jYKXC6
	 YD2B+9DSdhs2g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 05C1237820CD;
	Mon, 20 May 2024 09:59:05 +0000 (UTC)
Message-ID: <38422eed-cc98-488e-a3d7-a01b6f3ba1fb@collabora.com>
Date: Mon, 20 May 2024 11:59:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mfd: mediatek,mt8195-scpsys: add
 mediatek,mt8365-scpsys
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_025908_103142_7BEA124D 
X-CRM114-Status: UNSURE (   7.50  )
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

Il 18/05/24 23:11, Krzysztof Kozlowski ha scritto:
> Add a new mediatek,mt8365-scpsys compatible, for the SCPSYS syscon block
> having power controller.  Previously the DTS was re-using SYSCFG
> compatible, but that does not seem right, because SYSCFG does not have
> children.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



