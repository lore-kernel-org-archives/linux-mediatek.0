Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C12C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 08:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ceKO4nhczUlmINYC2UjM32y4xvErmhFKcT1As9IY7E=; b=Y53uwVqkyZXvmHSOhUUNZi+/z6
	szY6ip0M2ykqyq8gUTcTTF4B8653i3wPYRsThTzKv2VRaUw5UyBODMBNS1aD+eR9ZKsEq51sK8kw2
	8q+DjlpivZRQ8DmMmYY2qOOisdUwU2l65sEBUuCwGAMzJa6wox5iG/UezrbQw9K+YmDXBYBOh+2xA
	XKtmY9LunEB4vTm5xs6dKbpSqkjVEVAet46FMnGgerx17FYDEGwAwdRwqHMnoVTl3pt9+UTjIpz+6
	LDC9dDH8O0qOMsjaitTFeyr5RCWtzAyRxnzuQph+rxalHjXnKtrUxsqEdk4vLU7UNi/sG10kER8Jp
	uwBMqlGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Bsg-003awB-TX; Fri, 01 Jul 2022 08:20:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7BsT-003apz-DH; Fri, 01 Jul 2022 08:19:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F4546601974;
	Fri,  1 Jul 2022 09:19:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656663587;
	bh=fS/iT1xgWFnZF/STuxFQ2EWwRzYU7ahVyBexaMgwNOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MVZ0UVaj0GOM+lhPo/zLqAd6wwphw9owl+wPI6t4QNosIzdxpif+1OJbFMqkPEmgK
	 BceDORJn6eD6XpXc1J45h/cqIuUow6DMCUCsbPdYrsg5i9iC6YGZudO2UpqYr4rkFq
	 jkT1DcMhyPm/dPKy0P5wf7XweLV/jtfSu/gfLsy+zOXWvm9NdgU8f4SF7ynzxwz5ix
	 5PptZatYua+ko/0x+JyC7YfrZVGSmdCaCXNSkh+Gp4JWO7ZIuzCJn12SDg6f9W5VBo
	 /t0oOFZyA7KupjTCBSNdoK50QQnE2H6PLsdW1lTKOhOVDIY9l9N5VjxsFRx7rV0k20
	 cg8AjERufTsfQ==
Message-ID: <60079979-c84e-a9ba-f1b0-2f82cbac2604@collabora.com>
Date: Fri, 1 Jul 2022 10:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 09/10] drm/mediatek: DP audio support for MT8195
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, liangxu.xu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220701062808.18596-1-rex-bc.chen@mediatek.com>
 <20220701062808.18596-10-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220701062808.18596-10-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_011949_619470_CA9E5476 
X-CRM114-Status: UNSURE (   8.48  )
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

Il 01/07/22 08:28, Bo-Chen Chen ha scritto:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> This patch adds audio support to the DP driver for MT8195 with up to 8
> channels.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


