Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C98C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 08:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJSrWgnA7xQFWUTAZxk79C35KMc28fkqd5Xi1pjIoAE=; b=umd09Z9rGyARg4aiXYzL7rgC3F
	DsWUEswuq4QejGznXDZahmwpMWPhva7Nn7lAOU0Fo3UwxMMKOqhdAv3ru2EjJ9JYo1FpQm9Jn0ka6
	fhu3YKXQS4aWRpxgLP8+zrhMgGJbidBZgkvq+k3qFWI0H/0Btf97wWuC5NuRsLWTeT4WJZy09ps1c
	2hBT0Dg0NlH7ittKzUe62/roKN/HwVVKKrwGaL6mnC+gZj/SwvKaeNp5d7qnd1u1bAwDL7/rT6cmm
	iydD07/kSBzxQbnQE7FCI70ivFSjrv1ayDlLK6Xph1DHhkAIiBjwTlDyDXp+OJ63U9fei/uKU/vLt
	kBX67WoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oauv1-009s44-9q; Wed, 21 Sep 2022 08:17:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaurk-009qQm-Th; Wed, 21 Sep 2022 08:13:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 131716602002;
	Wed, 21 Sep 2022 09:13:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663748035;
	bh=NNSx9hRJaoAMLI1n9AvUiccUA/Y2Upvxg5yv9gxOeYc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bZPta+JsdihAr2OFHs5D4+wpQBJL/PMINkgYyr0C9Et7FsAAeuFy8G3972t1NObQu
	 9uzmaAZF0sfpcSNShHUjGn492wQI5QQw+A13HWKBiE9MtWwsMVuiOMivXcLlgzKP58
	 4NsOqAawfMn4NmFXin9KtbN+ilsp3YJ2jlpdkgt5vfnpiJWBhnukgCfJfp6zrJJ3zv
	 oQ5zFLmK2bQvVcrdx8zUn5UicP9MDzercee/Irdfi9sex8D6Zvaqn+VtN0NIP/9jdZ
	 6s2xYJunJhivDu2OCFhkYG9WUDIG0Yfusm7BQc53m9yKkQnXe3QoVMU54M+T0mEXw/
	 gmNT+TIqw/mcg==
Message-ID: <9b8bcb6e-afb1-7b1c-a771-d3348d19427b@collabora.com>
Date: Wed, 21 Sep 2022 10:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 12/18] phy: mediatek: hdmi: remove register access helpers
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
 <20220920090038.15133-13-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920090038.15133-13-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_011357_157844_03A0FFF8 
X-CRM114-Status: UNSURE (   6.46  )
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
> Remove private register access helpers, use the common ones instead.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



