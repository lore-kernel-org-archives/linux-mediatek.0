Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62610CA0FE9
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 07:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOJl3FfqMhjjvAormojjiGOU7cbmmP0kV8NhkU6+TYI=; b=yIBq0D0NeEiocF
	jOLFG/BqkcuLKX+3uChy9qWgXjuYbhT7bxrUeK+ATcCaZlwhYixfa9n5g3nM2+wsXtrMbihK/mbch
	ZD3VN77ESvpFtLcQWMB4pSjK6XL1oGRu/v1VcEl8dnmMUAaQ/vIuUmVgOm4BgTL3mktnLnmX6QbNw
	OTtiqJGwRsIaOrxCGtRqyy9qON39kMd5hAlgGxxswBpxuvQCsdNClHyfmAHL2xMo0CBYIBxftdRw1
	Zdo+ro0MvYMKmnKDwPNwbnKm39wLACT93tIqTzNznMumbMRCoVa2oR5x1MxRD4J9EciBHoUlbyW2j
	ojtlfg7rkyXb+9NdUuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQpO-005THK-17;
	Tue, 05 Sep 2023 07:50:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQpL-005TGj-1f;
	Tue, 05 Sep 2023 07:50:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 479B86607033;
	Tue,  5 Sep 2023 08:50:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693900222;
	bh=cXx08/+vSTpp6ZDNY6TezW61pOCQM/cfaUeXecccxEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xk12O4wDk4dwa824rlDTtt/bK3NANY2/gQ/BRI4Kc6AtQ1h1yLDJo4Erf8XeMpb5M
	 eVvGVczDyCeMtMVDhcGnBYErf8pl4k5I41OZIEH5JiiNRpO3j4t/6L3eEOXYgcnz5D
	 6QFiOU2J1MIm9LF5+0HhudMggXps7T89C+/3wbnC3cqfI+keT+/rdjp1OjRN+aRjLk
	 szwpnEGmLSeeJu57XRrYmYQyCIcSBI9wBTbDka0y8JEB3u1crs1J6ipOaYJoF2130V
	 5Lfwz1FAZ+FjE4ddBmPCHRwWdEb7bixwkjwRjVTs+TVEe6yEG+frZP/2NLyCQugOqC
	 1F9bHbA0cBsWg==
Message-ID: <33df386c-cbe4-22e5-5d31-f306659b9cfc@collabora.com>
Date: Tue, 5 Sep 2023 09:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] drm/mediatek: fix kernel oops if no crtc is found
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230901174557.3617839-1-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230901174557.3617839-1-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_005023_685902_FAB9CD13 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 01/09/23 19:45, Michael Walle ha scritto:
> drm_crtc_from_index(0) might return NULL if there are no CRTCs
> registered at all which will lead to a kernel oops in
> mtk_drm_crtc_dma_dev_get(). Add the missing return value check.
> 
> Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT8195")
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



