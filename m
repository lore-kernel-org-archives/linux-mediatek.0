Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAC6C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 09:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5TqpPrUkoanTYoAt/AYRd+O62AXgBGsYjsSBum67aI=; b=OgMsmdfHMospCyUnFNMg/F2sE1
	ABJRGmT4xgVmSu5jDQQZCdm4XQP+sUForDA7lN8idPwYJebPuA7EfpIaDTiI0NeLwpsyHgvuLFWLI
	Dbqs27KEb/O+1ul1dMZoRun6PjKdrC3RRNlP+z1kSeaLtutLAkBFXLkvn6gOMJ+GDPzpX22D7QLEW
	go9UZo21gV0kQxUxmjKmRSCpWYyyOQ2nttoNu7U18MYP5duNekaC9xrQBM5wLBlOaBQlWGER6t4v2
	X2CuDLvI4NUM6Y1y26mbBf5gclNwFLSRUJi+F47tgwDDodfGqbCFldCo4h0xtJBBeXeHKjJ8GVf0Q
	fP5BK05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8eJh-005grM-V4; Fri, 23 Dec 2022 09:26:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8eIR-005g8Q-RC; Fri, 23 Dec 2022 09:24:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 96DA16602CE0;
	Fri, 23 Dec 2022 09:24:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671787494;
	bh=1AV/dpG/SGyMqYXb/ZlcEitn1sr8xuzYHUTilN0Ab5o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dFaTbQuOx0zqIyo22pokTJHCrJDic7POObFFAIcTFpb3Zc3VgIuOCD4fSjd5SbQ8q
	 oxX1G/Ll0qT1J5gjk/94LS9xhIzXxoh+8HI0yuPzDxhR8S2u6Mt9fKnqphM0KJDoMD
	 Mq9iFszBqX58G6u3DLhiaj8Mmjjvn4cW6+34BHFpqzZLqGR/xe6nwpf42mjj44riXF
	 CtxEhJYQc8FeDLVGm13APQ6Qykp+/2pSRp5utnZzyHgWj/vmNz0FCMzV4E/iU2P9BV
	 Qaa2cUpNT7/7ZQBgYrA72cSFVt+IlDAt/k9MbBvcFz+SBhLudTHAAKok4mebzHv/cT
	 SbU4d5ANalX+Q==
Message-ID: <d7c50228-5d4e-8c73-28b3-4950917708a0@collabora.com>
Date: Fri, 23 Dec 2022 10:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 2/2] arm64: dts: mt8195: Add Ethernet controller
Content-Language: en-US
To: Biao Huang <biao.huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 macpaul.lin@mediatek.com
References: <20221223015029.24978-1-biao.huang@mediatek.com>
 <20221223015029.24978-3-biao.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223015029.24978-3-biao.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_012456_158333_0AC2E706 
X-CRM114-Status: UNSURE (   6.48  )
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

Il 23/12/22 02:50, Biao Huang ha scritto:
> Add Ethernet controller node for mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



