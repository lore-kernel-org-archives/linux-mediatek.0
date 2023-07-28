Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219FBC0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 08:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGVvwH0oV1xP2c91Q5+E8p5Y7Z6a+omLEdmGqUKb5A0=; b=gBvo1KIoZ9mHrd4YLEFEYbR4pl
	55r0HFYGzhfp3mGQjyrGWpMCpjDk6YQvHLrvBNe11Eo6isyvD8W/M6t83d8ZyxWDOTmri+NjBjaRc
	1duKzcc42w8/BNmiciZHuw7dZPEX78ShiPEsPDd8mY+Yjx5pECqV7ZP3oDHG5K8F4UZbgqAuAQzhg
	M3M7jTaRjITCKmBEzGkFZ/v2envf29MZ/Z3qst1xo1m57zceufq2GwQbLXpE8XjECCYqEZxGOxPzB
	jUkXXQHGIegQ/x5JdITjXMGh/yDotoUWE9dyD6t/QH4QthlKbfXO0vCaEuwR7JyudVMrnzD2dJQKn
	QMuLefrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIZ8-002L4W-2x;
	Fri, 28 Jul 2023 08:11:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIZ5-002L2Z-1D;
	Fri, 28 Jul 2023 08:11:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0BA0F6607166;
	Fri, 28 Jul 2023 09:11:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690531869;
	bh=yYvD8O4U9F8BRRQYpZMS0nxYKjHuhUsKk66nJf/o4K4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PHxGpKjauUYQ+IRh+pFphVXTu+e4qLGhqkzO9B9n72R7UWmSP7Ty3QtoQjBnur7Xm
	 4qDtxsdoAXvlXlqDQ/Zp5MCgFlqIBEDorPx0iNGIguKfoYgn34i9EggXOSzD3ZWHWz
	 Qd2CBe/ojBoYPn24B1e9qga4uj+kM7qJGlxu7tNY4W4jNDULZpT5FeuOtmgCqNwNcn
	 V7DSZ5Coz8ukTktW/KI0r3yoTc9eBbMMuPTGIgOz+ENl3MnVM1kp1iaTkuysjQtaBm
	 563yHj5s8r1pxW+0TAE/VycPajQqcuGlAEdz64BsW1EJADolN323rlgmkInxvc3CPb
	 D0Kgh27k4JCNQ==
Message-ID: <8c18da20-87cb-4125-c93a-c6750fd02b7d@collabora.com>
Date: Fri, 28 Jul 2023 10:11:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 2/4] drm/mediatek: Fix using wrong drm private data to
 bind mediatek-drm
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230727164114.20638-1-jason-jh.lin@mediatek.com>
 <20230727164114.20638-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230727164114.20638-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_011111_567685_7CE68FA5 
X-CRM114-Status: UNSURE (   6.57  )
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

Il 27/07/23 18:41, Jason-JH.Lin ha scritto:
> Add checking the length of each data path before assigning drm private
> data into all_drm_priv array.
> 
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


