Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97795ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 08:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FC699J7Tln4H5tFyHIklPJVJrVTJuUSHOfZmkavsksg=; b=kcBJztrJOVL7kYI7qQ8E0jcVB9
	OU6b//MT0FDAhgnrLhG54Mpm7oro4Bln1T2Kssru5tw5TuaSfZAL9ZZQ5LFfkibicxCmAFw6FX31H
	LLZeb8Wa0dwdQvvVSz/VeepFxpOBAmFOoswfHHf6c8JgfluBwejX2GLDDxqMyau7yILb7xBEk4LSX
	MT37JWgUMH5fLiHNadd8MiAbamhS7URJAoE6ta2rlCvPy++o/QyV4mOKhOMsZPqvoT5RZtp11Oqhb
	8ITFkhIBYsZ6DitOuN2/wGjDMkJ1aqGhAXnMjY3mSPFrUShRCZYpPh7+adnL2v/yV1FrdyyzCxRZe
	/mojR3BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oausI-009qiF-U2; Wed, 21 Sep 2022 08:14:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaurU-009qI7-P0; Wed, 21 Sep 2022 08:13:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E9AB66601FFE;
	Wed, 21 Sep 2022 09:13:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663748017;
	bh=WLqZP3N3+oO0SeFHdjpc9691Pmoj6eYkynhYtlA5BnY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N8ZoMb/b35w+FU+WH0DdUj1pOfuUCbBeMpSgPG7VeDnqyRfQzeHOlVxrX+D6QvimF
	 xyAlqxdKXK+q0VJAz/O++Y45yHzacXjUDevaTTHAMpqBahg3yJw7GeuJvwy8SkcDQi
	 nHFQD2fOByBRVbZJlglaj97nCGn3XWlF5d/e796kA+1U6v22qk0seiGYme8L+b1dJN
	 jsRKK/l+ni1d/x3gd62NLNOsBr9lftxPjkQbv7rN7dK8TDGNoKLL/GbfBvPP5qlzYt
	 qJgwsVryoFKLiVJ50VQDk80mUy2/miOAnXl4RKjbcvEeG6crOR/ZXadsU2hjYdi5+Z
	 TjdziTCw43xDA==
Message-ID: <1066dde3-74e0-57b2-464f-23fd0a5a38d8@collabora.com>
Date: Wed, 21 Sep 2022 10:13:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 05/18] phy: mediatek: pcie: use new helper to update
 register bits
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
 <20220920090038.15133-6-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920090038.15133-6-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_011341_012606_E09FD2C3 
X-CRM114-Status: UNSURE (   7.56  )
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

Il 20/09/22 11:00, Chunfeng Yun ha scritto:
> The new helper will use FIELD_PREP() macro to prepare bits value
> according to mask, then we no need do it anymore.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



