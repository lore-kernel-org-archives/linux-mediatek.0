Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDF2C54E4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 13:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/iLQEAIWa+9iCo+Z097C4P+WNocnpiQEibhkrQoWTY=; b=MNRuIz9Ri0zZUZEdT6fFuw73bT
	LZV8UEGP4hKFSMIb1RHOCrwIvSg2H0UH5a9IkjhniZeeI9+l5zw00OUSzJ6L3tGj5V+zpfEVhIMrs
	Kd9l/PzYDg2g+ScFjS6QZXyZjmCU8sOTIh9/78Zs4zwC0DxGAPF9UoE7RK1FVVpdx+Qfbh8WZxrgP
	+suRquRR4ibuTuwc7cO2n9ZTlPgCLOdnm99QA+FnzLILdjj8NMJ8lnUYrXcoBxB8kDiL2eqlGWVZ6
	rGwO7FP6i/j9+eJqVTlxVOQdMcY0d4wQAfpxmttRIPH9mNTS4J0d95A65VkdNVHTl2a64H4Ey78Tv
	TNrv2GJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebJH-00000000uHm-2Bhs;
	Mon, 26 Feb 2024 13:46:23 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaGX-00000000cjC-2tWu;
	Mon, 26 Feb 2024 12:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708951168;
	bh=88dR6h9lJ9zsblqbl116lycqd3kac8LDpJzTZ64nA+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PlHqoQnQ+yYx2ziy2vXnJ7AoZBjp/IkAsdrR4FyFfJ8IqrZw3KTEZJiv3Qk/5nBk4
	 5LlFB4Ol+5Wmwk7XpcpwPj1f5e8N8vJOazW4U4YPrZMx/0mo/+rKasSljVBjXgqWMc
	 hXrDN3j/VlWrKOvbEY82xsbocK241BO/9PjVvtWbguUvNd3wEZ7fzfiNpWe6lCPnIS
	 IeEPSinFX+dbo7hLCSqLPdjjLMaukQkExQuQboshEC+Prn0ViDwK5sYAd9HpKQJz0w
	 JJKeamiVzq0zEw6YdL3bqx3MAX6NAI2z1hpEXIFtOEHJ/87xWXfW1tgHQkhBZdaTSW
	 BkeckRP/QcW3A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 69B7537820C6;
	Mon, 26 Feb 2024 12:39:27 +0000 (UTC)
Message-ID: <e36b420e-28b4-4544-b877-75e0ddcd0abb@collabora.com>
Date: Mon, 26 Feb 2024 13:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] drm/mediatek: Rename "mtk_drm_hdmi" to "mtk_hdmi"
Content-Language: en-US
To: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
References: <20240226085059.26850-1-shawn.sung@mediatek.com>
 <20240226085059.26850-6-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240226085059.26850-6-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_043930_378307_F89DDD2E 
X-CRM114-Status: UNSURE (   6.29  )
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

Il 26/02/24 09:50, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> 
> Rename all "mtk_drm_hdmi" to "mtk_hdmi":
> - To align the naming rule
> - To reduce the code size
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>


