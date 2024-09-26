Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78ED8CCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 08:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDXefO2upITO1L9eu5vY/qnmpwEvr02OoKEJox/WEZU=; b=0hkvHp+Hf0MNUuymgS+6N4Ct0G
	2x+uTJkqJDfBb/oyX9lTdlNoy3D5EiUoPdnfvF5cqLTuyp4tWFPiDhDUz/Eneuc779+KLfXo2zl7x
	1CCl8IF/FurFYPehA7BzuJ+o7S/TQBDWvoO/eioRLxrwiJvUWLKRjAZ+zFbnA0yWkTDaCCUbeFu2Q
	HfgBBh4vPBC5quXEdrT/rUW4/vvhFPYcDAF8ApFtGb/F4UOa1NZudJCjrd2IaMI8/doMdX2WyJ5sm
	JoPEIpTRC1VtjoJzuR/G5boMH1UYej8bv+VzbX7CYlbVkzUSmHsJ//1Sn8WkWGTTaLNBwwxbm8Rwr
	KbocD1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stkCz-00000007l1n-3mJb;
	Thu, 26 Sep 2024 08:50:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stk0J-00000007i2i-1B3Q;
	Thu, 26 Sep 2024 08:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727339857;
	bh=1P1r8VZxe/zn+c9DOqxIXnq8EBkiT30JweUnMt9tvdE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X653y6rvkSthS/5duP//v09NQJeY6fLxTzrkLJ54ExRu5LUNgWu5ZPg/d4R8/qHeO
	 tJuDXJ1zd7uu5w5/eJYxUuKwy6UKXq4aIX6fq+XYNzmIKp9gsYkBt6+rdot0aPJp6a
	 P1tV1F3hhwtDbmLzhlM6IXAXsnJMRyv57FGd+mEReCQAMh0wP99v4vGqwgaWOvvuDV
	 VT+/Kcpry07mr03LjUNEs0ejNdzh5/T1eydsQHRaDSW2aEobN+Rl/ertu/KfLU+BjU
	 8+lT/hf65O1R6YgETw/C+AyFi9B7l5SapIU59nOBxV9b12+Q6jAEXk0V5957cApCXG
	 jSlmt2t00irmA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B20217E0FC2;
	Thu, 26 Sep 2024 10:37:37 +0200 (CEST)
Message-ID: <64b96ec0-1264-4a3c-a26d-f8a0c3375d79@collabora.com>
Date: Thu, 26 Sep 2024 10:37:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/mediatek: Add blend_modes to mtk_plane_init()
 for different SoCs
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240925101927.17042-1-jason-jh.lin@mediatek.com>
 <20240925101927.17042-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240925101927.17042-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_013739_509615_411EA52A 
X-CRM114-Status: UNSURE (   8.09  )
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

Il 25/09/24 12:19, Jason-JH.Lin ha scritto:
> Since some SoCs support premultiplied pixel formats but some do not,
> the blend_modes parameter is added to mtk_plane_init(), which is
> obtained from the mtk_ddp_comp_get_blend_modes function implemented
> in different OVL components.
> 
> The OVL component can use driver data to set the blend mode
> capabilities for different SoCs.
> 
> Fixes: 4225d5d5e779 ("drm/mediatek: Support alpha blending in display driver")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Just perfect.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


