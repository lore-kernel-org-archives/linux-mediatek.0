Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF60ACCFA15
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 10:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YI1O6xC3HyERyofpb85wCYK3zDN8LX4hMfW3s7gxHpE=; b=2aoMWcmSj6mdle8lB1XHWfEUbs
	/IajY7sEEE6DvrIEvKEg7x+awHIKNt+PxaJHNDRAD5FlZhIYEGoWfPAXmftzZflBKtePvRlEZ7tLA
	pL56v7u6rSP77IAtJYRlwT5/YT0E5KcacMYtDLVctz9zW6oYXvclFqPwZ4uqx26kfTGm6A+gObJT/
	oTifS2q1RcG3Emkd1jTiioIWwDxWXXI7NCiJRp9qhdDSFlx9KMP2WsEjkQb5DfmSs/B0Uqfgw+bQp
	hSGYReqyioqFETGr1jMOzV3TWPe219fumrQrFBlJeTgTkKx2YBmzKLFQVf498AS22t2/wNFjmK3rU
	Kfz8R7Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stldN-000000082PC-3C7D;
	Thu, 26 Sep 2024 10:22:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stlc8-0000000828N-2jib;
	Thu, 26 Sep 2024 10:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727346046;
	bh=FGpDX5gwBtAhPdxu0vkxzjI8OtyY37jNUs9wtjhYW8E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pAMmVC92LN0xZR+o5+W0Uw/L8MF6w2waN2k2L5ElMzobLAcJ+ZJ2f5rCUfILvOg6i
	 Q4rEccfQuZCG6UmnGlaHUk7AhIwjUyOpI2zjil6ReH7tUFjYR0CB/ch3+eRuX73BPD
	 zJu0e8jBomgkPMTIcRtkP7OGNav+6F5rKqAcg21z9WR1W7OfV9vPW5Jfk4QujZAaZG
	 eBQbFiTQwmL3aI8vLaWeSpVhPHAj+XNgwrcs4wZWi34Z3utH9aVx9rwZqQ9vNVGtqi
	 IdBmMdQKl3b5WOEW7T6koMjKdMZp9Zbl9df9S6otYYrtysrDcFqH7slyIwwgV9a455
	 vSynJcwhka1fg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5BB8917E1134;
	Thu, 26 Sep 2024 12:20:45 +0200 (CEST)
Message-ID: <7b7605c4-aa8a-4e03-95c1-386bc5f1669a@collabora.com>
Date: Thu, 26 Sep 2024 12:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: phy: mediatek: tphy: add a property for
 power-domains
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240926101804.22471-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240926101804.22471-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_032048_877020_FCCA1EDE 
X-CRM114-Status: UNSURE (   5.89  )
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

Il 26/09/24 12:18, Macpaul Lin ha scritto:
> Some platforms requires a dependency for power-domains.
> So we add property 'power-domains' and set 'maxItems: 1' in the
> DT Schema.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



