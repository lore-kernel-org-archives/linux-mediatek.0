Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481D3C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 10:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NC8zSh55g4sjOhuHnBEl1Di2NqBYrZ7pde83ABSnLIo=; b=WpNz6ROAUiYh261ISPLRaD75gU
	YntCGcQeAiRiwXa/PrOZalaXsH2y7V13E7FsIBiNapsluVXzbplN9jAnUbdX25Ff6l3FfWWCo3Odl
	jl0kWrTNI6a4e1oByqMwzMOpO3N8bcNa9dWlEtQ4fnTsMNBcaCPFKKgsWZoXBvOAn6wZh3tir7j1t
	u7sBYjnTkPyYDNlGO0BNxqOtWaPQyrPbVZP/nXouMsORX/Z0c0mi3Ho0a58pZuITrXkHKx1SXaB2T
	Op6frE/V5CwKiktJlw5oAuc9gxpNgII/R4tgV3QCCdnPsGdr+XTqSrB1AiCbaSyoEIMVCdp0pTsdN
	JMd35jgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r66mf-004MYh-0p;
	Thu, 23 Nov 2023 10:18:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r66mZ-004MWs-2A;
	Thu, 23 Nov 2023 10:18:07 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9AB0C66003AF;
	Thu, 23 Nov 2023 10:18:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700734682;
	bh=i7pSyJcAGPN+KpJvho68vV3Hb3HZCvrZdQzWPqZsuxE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B6zDkjcnoXa/+4M9wox/yHwHX4/3zkY5ULaNyWhdFy+RimY9BMFUNa19gZDjLtDye
	 xI9oFRKj5ISNFU8JxFMx5kBtzTL7xL9CPYv8eNFD+r3TGe27XOyCIHfTMSmEgjpkRo
	 Lsj8236AQXkrJQVtjnaaNyNe6DOf5NI2ksIng3Jmzjk+aaXq88dVRLWh2LzetalohR
	 BZFacD/4yM+HFx9jABuFKKeOrhUZDBZf1fGaDqeNBbrKcKSmsH4jFPaE530Ek7NmD1
	 6tl0vWMcPXML3K+FS5EMAvFkWeCS7cut0YzdAB0/dUdrk4ImNHGMQQmxVtP8WDFBLn
	 xW82u8e7EegQg==
Message-ID: <4b48564c-245b-4562-943e-a7455b214825@collabora.com>
Date: Thu, 23 Nov 2023 11:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] arm64: dts: mediatek: mt8195: add MDP3 nodes
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "Nancy . Lin" <nancy.lin@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231030094840.2479-1-moudy.ho@mediatek.com>
 <20231030094840.2479-4-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231030094840.2479-4-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_021803_837766_9EE51194 
X-CRM114-Status: UNSURE (   4.89  )
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

Il 30/10/23 10:48, Moudy Ho ha scritto:
> Add device nodes for Media Data Path 3 (MDP3) modules.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



