Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F382CE7B10
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 09:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXAToYK1lP4cKVF9RM6rV4QCAXZ4CV1FyiOxlF3oYjs=; b=JTrAqsO2FtSk2RVBxyQMsnqzPj
	deACMr5t6LpaiNL/X9rDXaB6LcxAS2SkPpjYuobbxnnJweaKO4hHJA6mG5FaFALCwvP62r/4lG0wa
	5/vh9jaY/uxAqtzV6od3xC+EF2kPwJ7cXH+aOlLimm07bS7yqk1f61Utn5ivM0q2OggV++F7x6hJ4
	/4i12r6u+5QWt+0Nj39OkJon/FIoDnx8EvYq2lG+JE+rU2VQXcLzniAZT+wh83eN4xodimu6gz+wK
	mz6so2LMOCfqgE5Z8FpK3dYZCT6l0cNT8MxCk3xlyujsjwUEzlJ1GbafpzYUbnyCGfH0xlIPwozK5
	rL/FMAyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnGZ-002iwm-2x;
	Thu, 28 Sep 2023 09:25:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnGE-002ilx-3D;
	Thu, 28 Sep 2023 09:24:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 419E36607337;
	Thu, 28 Sep 2023 10:24:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695893081;
	bh=1WGLRjymulCLCFymdJ9ODG1eFxBIyORpEF5CM37iKgo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MLcVO2z+5Sviv68ibre0mKiLk+ESUDaT0tswsvokTHDG5+jrn0h7mpzR/ClfoGESK
	 8zFS1UdqDekgoUnbedcgWC/ndNK5tVToQPl54AXL4LRyxNdQGKO7SmkTwvj2NF4AoT
	 xQizajm54kWM2SOkTri56GHunJ4yYBLZTJZhN2OwoxO3JYW9+guslh8ZwxD++P1OVp
	 UvOiWAvyQpKCboaw5iIhFLZblg/L8QaiKphF1IflKA/IXHIPcK39CgLy8syUt3RI2L
	 mvJ6iPNLfDyGtJ0kp5W23sskEh5mnUAuFT1jKCBDsPjmYPA62vwWArDJON+3LX+dC6
	 cVXgwtictt1Xw==
Message-ID: <fe510f2c-651f-1456-bce0-034caae143e8@collabora.com>
Date: Thu, 28 Sep 2023 11:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v10 6/9] drm/mediatek: dpi: Support dynamic connector
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
 <20230927153833.23583-7-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927153833.23583-7-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_022443_198313_7A39CFDD 
X-CRM114-Status: UNSURE (   6.68  )
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
> Add implementation of mtk_dpi_encoder_index to mtk_ddp_comp_func
> to make mtk_dpi support dynamic connector selection.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


