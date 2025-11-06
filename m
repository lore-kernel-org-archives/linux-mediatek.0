Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135B5CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiZSWPf848KRlULZQERvHRkrhWhB8h8TM/h7CEslA48=; b=d0xsokj8fIZ0f1bWcuc0S6s5So
	QEIyLKFXFDXjucUi+JsBv1viyVXed/yww97GI7mAtQVxRbWMuIgiB5z4e6NxqkApSIOyEBI1XLk5d
	oHSi3dWT8rUG2xYOnk0vWjLd5v81nmem+/WcZj+4VT/i9gWtGdN/4sBcVWvzrjcU7K04gZJQnLLW+
	SmruulSy6HA0Wkm8Zt/rVjR1wWHbeG8yzXz63luT8JSkasC0EdiKw1HM28kmgpn5Q0bIcdYbY3ATC
	NLe5UXiuQsFut4jfc6FjVrBHjzQQTmKr1wv/yfZ1JGD4X6SnEqZlaa4l5D4+1pUrFKJgrojh5qvhu
	d2WLEPOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGw2A-0000000F8cG-3mAI;
	Thu, 06 Nov 2025 09:11:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGw27-0000000F8bY-3gmG;
	Thu, 06 Nov 2025 09:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762420313;
	bh=7h2mue6lelhbKzY/Exibr7K7OP7aFWjdpWqi0pwxh1k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jDIcv7O+7SeSWh+mJIAQfJ3iMNNZ2/dZY1WBxYrsjAWy80De0M1se78rYiKpT3J8e
	 FT+RqIGmuz6mKfxiM8E60nOg8rmw1NPVQzPbWAatxlv525Y7eDTzPI3hHdq9HqUBdo
	 N/1qqRxUfNsw5antV7F4wsa3FfmJvxuX5fBtCcdIQnEUPLu4lXIe2SvCdzKIduchwD
	 YzPFo6Q6+fjlwIQCAYBqCLRVZ7j696Q5hqCryQW4Xt8vzVFReBz1pkBFF5KRM+7CER
	 63nGlPVutJ0CMwmoC9nDuvEWS4Z5D5A4m4bhc4qduavsBn5qTZcoE3WJyPlGcxS5EX
	 Kg/zi7uVbtjKw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1BA4B17E1315;
	Thu,  6 Nov 2025 10:11:53 +0100 (CET)
Message-ID: <06516937-4403-4109-8049-77a1d8ca7249@collabora.com>
Date: Thu, 6 Nov 2025 10:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: nvmem: mediatek: efuse: Add compatible for
 MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251030-mt8189-dt-bindings-efuse-v1-1-1148e474a9f5@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251030-mt8189-dt-bindings-efuse-v1-1-1148e474a9f5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_011156_076473_3B9EAAC7 
X-CRM114-Status: UNSURE (   6.79  )
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

Il 30/10/25 11:26, Louis-Alexis Eyraud ha scritto:
> Add compatible string for the eFuse layout on MT8189 SoC, that is
> compatible with MT8186.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



