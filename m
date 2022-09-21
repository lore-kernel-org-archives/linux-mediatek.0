Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BE4C6FA8B
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 08:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czHTzFKanr1MkIHVyPgaFPozvmKkxmGd57hnLv/VmTs=; b=h1a/dzinXUqnwtKbfwKDn/OrAJ
	DbgL07iBIZ4X+YGm6zdY14YWpoig6YYlKTx5fpGKTgMhecIAiPllDK+1VQkiJRGsPSkcVpmGsQfnb
	FmSyx6dL+F5VDHu7tXwDxs70jPsH3vNn0fwKww+NC6aXBNUwlQRcTT9N73IaJb7musOk1l45Q1J9x
	ho56gG06E4bXMWK7SLcExrFmNQynvmqVtcANjlO4A+pI5Pc1gQpOIIuvP5EVzKO8zIuW2pi+3zliH
	gYUkUQwAqWdcrBPIviv0637xvRvQD2Cf/CscOLcpe+AKeb74XxcQvoGcvHZk5F4pLdnu8DFz7zYNE
	YNewJMqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oautx-009rV4-L3; Wed, 21 Sep 2022 08:16:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaurZ-009qLB-5R; Wed, 21 Sep 2022 08:13:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 567E76602002;
	Wed, 21 Sep 2022 09:13:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663748024;
	bh=SRIF+BE4y6ayL9qbaLOyz0oXw3nZG/Mv2C9ZyzBP8/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ln62zNQAv4FozRtX7XIvtS2aTpaZ6gTyYnMEaWRQQobZlbiMESNRcDZcGcXFjeUPb
	 CPHdioMFBZrbAxH6/VxRzs89GZhcGx2Nl2BxvoT9rmp4W6zmHQ2s4BRsj/D7JefbVk
	 TLgD/2wTZ6OlVlPpkBSvpGnTgOfDJSgH7zByzhdkWmVR3/YZR6gbPACPN9uL/MNY3j
	 oRedEFp5bABVQHyMnHXXf2yNDcCHxanXG44JsSRXi6mQcbcS1NaK+Py6lF1zfHoodH
	 Df78p9+HwzUAGal1qAe1wFyBKffEwJkS1xx7nyeciVjf8O3oSuG+KW2ac4C9XwlIHK
	 5vqjU38ffSe0g==
Message-ID: <7b36e7a5-d54d-afa6-a647-72aa87d16e8b@collabora.com>
Date: Wed, 21 Sep 2022 10:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 08/18] phy: mediatek: hdmi: mt2701: use common helper to
 access registers
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
 <20220920090038.15133-9-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920090038.15133-9-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_011345_406407_670D3EAC 
X-CRM114-Status: UNSURE (   6.67  )
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
> Use MediaTek phy's common helper to access registers, then we can remove
> hdmi's I/O helpers.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



