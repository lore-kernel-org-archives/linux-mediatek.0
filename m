Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81375C6FD1E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 09:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hwy6vp1UOkI6TgOyzhkOX4LsvF+yS+92E1S8iyFrXz4=; b=ri0wxhWzzyetGQgdOB2Il40cYX
	42DhCfTiOfTeTHF6lS47X2RaxONSJM1dYtiJa4tV6zysq4n8EdAjLnpQAa7LV0GKpPz36fAc9dsv0
	KQwe2DocxChJfdVc7uIijcFQU3ILQ8bM9FMCFcHPCNYmvwtGtlsOW41f0vh7fVwBV4Npm1mI0A3gx
	90AnrIMVfgBsvpdjxbZGm0g2wkK9oLqta1z9HTccfIQqeWVGUVjRl0cAPrCcUQyVm0RYmP1tULBl6
	Hna0j1KIVFoAD5JoOGqfVavfZEsVEhFIWcBYwP5yZMWk+wrodbEqjGII22ZE+UrGHjNwgAvYxmfV2
	o9iAp8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYxU-00Dsgf-Nk; Fri, 10 Mar 2023 09:22:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYxN-00DsaU-J2
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 09:22:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B1D68660305C;
	Fri, 10 Mar 2023 09:22:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678440150;
	bh=JMXL243jAxlm4gqHeJ2NFg+6tI8MwEQEYrunSWbmeoA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HpyEfn34ugkCE8oge3WFGbbnnpHIyaPeh9Nszz0ZpgBSRM+eNVG+ru93CZVHgrJVQ
	 dXrFVQoI/a4siJ8RXW7YvKuTiDGFE6cBYegiuIIPMnsLPDVmqxb9KzDjUH89RzO8sb
	 b06Lj1a06p/GU+EQ7WAxKsckq39wAdNq0hoiUPcOTX2crVBdnAnjhIGJt0SaP5oLRY
	 d0PqvHzNxl7VFcfK7MCtnPupHNavTvcPtnk6gt89scX1eoyQfbN8/s/6a0FsamvUfM
	 NMkWoVBi6H+7i+1YwnuU/Od1WKRQvYOv8Xug03hvMTaevyb0OyKoDQRw7tNFBYErPU
	 HSh39OoPfN39g==
Message-ID: <1e06e948-9871-cca8-fd56-5d32442003d9@collabora.com>
Date: Fri, 10 Mar 2023 10:22:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 1/3] drm/mediatek: Refactor pixel format logic
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 daniel@ffwll.ch, daniel@fooishbar.org
References: <20230309210416.1167020-1-greenjustin@chromium.org>
 <20230309210416.1167020-2-greenjustin@chromium.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230309210416.1167020-2-greenjustin@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_012233_836890_24468430 
X-CRM114-Status: UNSURE (   6.51  )
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

Il 09/03/23 22:04, Justin Green ha scritto:
> Add an DDP component interface for querying pixel format support and move list
> of supported pixel formats into DDP components instead of mtk_drm_plane.c
> 
> Tested by running Chrome on an MT8195.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



