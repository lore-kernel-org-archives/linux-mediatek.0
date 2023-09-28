Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9DFCE7B11
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 09:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdkX2tQLdDGqLMkmAlY3/35F5zkWBYR6mWA/F0W8zQc=; b=wbmzx/0alxLIPXJETfTgsOc5tk
	+KE3QjrhwT38xyM1A4q2TC8f+wNpq0Q57px7q8Duq0MJnRpIOvszPQt4HYOAGPojYkmyuuigmw4wW
	xrmpssKmBGyEFHZ85aZZbyOAIqm/7rKK3PjxrXT5Qrt/X39soIaOZCG6g1lsHwxdmiact3Ke5h6GY
	JRbydGxZX4NFqB6lKw8oThNl3LQuqsAJWc91X3GTHb76Gmd8k3TO0yBuJyzNxgdpw/js5qCBzp43H
	jizSO3DyRTzdsw6lUEbj2rF/jnqC87vwxV6zoQuIDH5o/oFU64Ow+T9CsIF3G5Oy04IMACjBCuVho
	2UskF5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnGQ-002ir7-0K;
	Thu, 28 Sep 2023 09:24:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnGC-002ikX-1h;
	Thu, 28 Sep 2023 09:24:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 103086607333;
	Thu, 28 Sep 2023 10:24:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695893077;
	bh=OKC1ZB4o8RZIhby/fkaNfRn42DaLxN+2mi9lYCYJJeg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QAI9BX+ye6e4uq8fHfbGLRKOlmHv4N8T235esvCLTrUhF3uXUADNvR5I90d8kSgd9
	 OugA2C0HU04GN7zcBMgMP64vBIWz152uY6EgEBusNbMyWgaLe6/4SxKmww27fjytAt
	 kx7mYRGzge/qklvgX2JzPFkmxkk6P9ElWYZAZKyzumLa0OP2GypZbRouCPRi9cAwmk
	 Mc2+YPx6elFPSxxJfpOQdltbZgCgesNxQ2IB9C+aF8drxs+wnWjQwE1xuTb+AaqxtA
	 hMtrgHFnnG6mLmBjSCNF+e4fOx96qrOwhPm2cT/zs1nQ4IEH51vIJTskAEnYscIypc
	 GR2TkzXoRVnhw==
Message-ID: <fa509d7c-412e-98ca-80a3-0cfe2ecfd6de@collabora.com>
Date: Thu, 28 Sep 2023 11:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v10 8/9] drm/mediatek: dsi: Support dynamic connector
 selection
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
References: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
 <20230927153833.23583-9-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927153833.23583-9-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_022440_707999_C91F5A9D 
X-CRM114-Status: UNSURE (   6.96  )
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

Il 27/09/23 17:38, Jason-JH.Lin ha scritto:
> Add implementation of mtk_dsi_encoder_index to mtk_ddp_comp_func
> to make mtk_dsi support dynamic connector selection.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Tested-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


