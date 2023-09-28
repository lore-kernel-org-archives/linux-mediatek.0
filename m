Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A532CE7B12
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 09:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XNVHqolgyYXLsAAbjj/YQKsSy8ImPUOebb0P2iOGHY=; b=MbLETck3qhN2OP/JRmDzj1D+cL
	vBFFJNxaVAs6Q5CHW4LNrEj8WoS1tM6uvhPF6PqdM/9dqmETT7aZZ6AbZ4LtZdzDIcoZHDYRHSHyt
	g7ffx0ZjhjOYs9ex62vd+DOuBimKfpRGlbzwFaPVReWc8muynk8o4THfcKU0w1e6KBTkHuEvzk1au
	hB7M/TD/+dXcG46X+g1QyjqbjrYfNanDpggepMjD49oBTXnzDF7SIiMmaaVYLe2IgX7MSz7wVWRYQ
	0vsbtTjEQSP8JhI45I2x7NaXpr9zQaHePeK1VTrgV5uZxxQyX9FdKaHvo3A2qVQcsVDMSvefTW3F8
	Bl4C8+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnGP-002iqU-2B;
	Thu, 28 Sep 2023 09:24:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnGC-002ikW-1h;
	Thu, 28 Sep 2023 09:24:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CED2066072A2;
	Thu, 28 Sep 2023 10:24:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695893076;
	bh=x3Cm7auwoIUOgII2Rhz2cmoHlHW0TwBSCVD6n8f4Ti0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gAFRz6577QKM0TiVZIYzURalkWB2wB9rmZz5P3oJ8KGDq9SDbEh4qWQ/io9xhmUoN
	 AMUCxoSQSzKHqHpI9HddTH7+x87og6VlNm1mqYph4igIJ8oI5JX6JITH8TpyZnhTCv
	 /XU+SrOfhJTJibc/sMrh3A0VFP8evZwy+gWyDQJKYWvsVutKloua4dTXBYD8ziJ5zJ
	 VDLkwStCZEZkWh+DgNY0E1LWma4P/KvwiMxiUhLlfsGXnJpCfgIPFJW/dNWbqJMz1n
	 tPLTPkwQPUuKJRB44MbOVRZhSN94EacH3hEUCphe9ajT8F/6VVtZcJBHtpMssDSzgX
	 wigu6rIIlsgIA==
Message-ID: <dde725f0-2e9f-f506-7a7d-d5ca4797f1cb@collabora.com>
Date: Thu, 28 Sep 2023 11:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v10 7/9] drm/mediatek: Support dynamic selection of
 DP_INTF0 on MT8188 VDOSYS0
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
 <20230927153833.23583-8-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927153833.23583-8-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_022440_703138_1A1F0B58 
X-CRM114-Status: UNSURE (   6.80  )
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
> Move DDP_COMPONENT_DP_INTF0 from mt8188_mtk_ddp_main array to a
> connector routes array called mt8188_mtk_ddp_main_routes to support
> dynamic selection capability for mt8188.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


