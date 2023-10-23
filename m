Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C4DCDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 10:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBVgs+v1F2PuwEtzAx0uFYqjIrW0rwrBl5lUI4X9c1Q=; b=lZRoslI9V+8EwJw2B59sDx5dEB
	gYu6aowF0Pl2BaVFGrNTD7J0aNFa4B1dvWZVYmXAiM3ss0ufXlsqIu6LZa43YusK6UdDMK10+SPKn
	yXF7ZMqXuIrB3B2PLBlONgQzpmdIybt6LOtKnjZLJpbOoAAaTAt5MCb4oiJH4Xna3PY2CeoyhwxVN
	gMxefodpUt65BU0/1Vvm+H3s49vBTA6H8WcbNPCPyVAvasDb+ezT1UHNUf/bf/w9aEaMFAYGo4peg
	6dMOiq1B6pl2i/qn3DebKM4KVBZyBX7EHNntRg+TE7C+ANf51EGWIIIaTXOd7XRdN3Rw2RFWEsF19
	g755sihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurxT-0070Yl-2s;
	Mon, 23 Oct 2023 10:14:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qurxQ-0070XW-0k;
	Mon, 23 Oct 2023 10:14:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 29C11660708F;
	Mon, 23 Oct 2023 11:14:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698056082;
	bh=MxExbhPEmRnX1oZHQ8dpqIbO6ZBxZpcKiSBVYh9I8qE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ZDoSbWz8VwrfWDv1AdKAK5HqmMgZ3jaEXesZiPRJlHKW32qnlL+PLwmStj1xN/1gf
	 mTF1RL9EPMGogD3qzPHnT+xAprCUxujTFVIo0mK4h9XJ0wGFVXQIRx7dmCSRVIcWnK
	 moCcVhaxelvceh7KcjOc8Q0g0Q1T9WiA1VkHWCDog0LDKEysJUQVx9H7hyASQ3gDcZ
	 fjs1+pNCfFk4ziuFwOYkBIwvmyIhNoMi4dNWYtjODtCwDvftdim8l4LVVLjkKhrFQZ
	 ieDyDnF8kXfPVNCk0rb/r7K0w2S0jKy+io19rSgIGXNXwrvHq7B7Ili0fz6WnKR31V
	 L0Ze6sDnGIZ3A==
Message-ID: <64a04871-7671-40c8-9b70-f2d9c7d5be32@collabora.com>
Date: Mon, 23 Oct 2023 12:14:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] mailbox: mediatek: Add CMDQ driver support for
 mt8188
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>
References: <20231023043751.17114-1-jason-jh.lin@mediatek.com>
 <20231023043751.17114-7-jason-jh.lin@mediatek.com>
 <72277a7e-83a6-4947-8f2a-4881aa8ac766@collabora.com>
In-Reply-To: <72277a7e-83a6-4947-8f2a-4881aa8ac766@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_031448_395726_82C154C6 
X-CRM114-Status: GOOD (  11.47  )
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

Il 23/10/23 11:50, AngeloGioacchino Del Regno ha scritto:
> Il 23/10/23 06:37, Jason-JH.Lin ha scritto:
>> Add CMDQ driver support for mt8188 by adding its compatible and
>> driver data in CMDQ driver.
>>
>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> 
> Please fix the commit title...
> 
> mailbox: mtk-cmdq: Add support for MT8188 mailbox
> 
> Regards,
> Angelo
> 

I just noticed that the secure mailbox driver will need quite a few versions
before reaching a somewhat acceptable state, so I'd also consider sending this
commit separately from the secure cmdq series, as this is simply adding the
support for mt8188.



