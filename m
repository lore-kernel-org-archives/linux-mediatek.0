Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D6CC0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 07:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZdq66tsSUQfN2Fd9eNccBF9Uo455jqidn/MJfQHOlA=; b=qDvbBZwWvMahmkGPO/+3W45T5P
	LUfC6YkmVFcrJdr5XNNuzZAVusIu7Uxq+GC9XYZp/IPghgs/gQrHO2bmhYlCeJU73VZ6W44e7cocT
	HwsRBDYJn8+otMjtuFKNf97LNcLtflFjjya0MfvcdZ12t959KWHGpmJnbrge29plLFeLE25omwUK8
	s6jlRliSmckjOIaWgrTRd0g4JKY+VYJP1ZKrN3qgoZVlC0Pb9PX04pUfbqvFVbZovAM/Jj+jlteh7
	gmOXvVFm143s6fy0QloeqjR/VwmL7YPuldhQ01DXOXtcgOy0ZdakdWzxbE6yZzSs6x+G/GzdAOvxO
	xpsspQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqnH-002EnC-2g;
	Thu, 13 Jul 2023 07:31:19 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqnD-002EmD-2Z;
	Thu, 13 Jul 2023 07:31:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CC0DC6607035;
	Thu, 13 Jul 2023 08:31:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689233474;
	bh=H+CV57KKU5YOchvpQhf4UeBBdOfwLF5gSkEruFhwdhg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Twd83G8qfsh7ml3i8rQVN+4JuNr7fJZYwviEPXRVYzYfgx2PcRNRJS2cpDpnjx2er
	 pfidQLHN5H0i0Gxyb4TcXW2pEcVYXvWto7ANtJRM2s19jtdRIsFh1+eMJTotYaz2XM
	 aL4CR/igU0n3rFXBZAkES11bWUXmovpFsMHne1QLTIq6K4u/hoLU5iaNx24f7Ncnms
	 0SOy0U7a4DgLXVJynZhnSvcmzxt6E073X/hCDwnawfMIB5DAq3SlrckHi/EghDSIUX
	 ObqeUkNuHdsIGFZXXr43YGsefoQZ/Vxd3oSqwWREN1uIXDomrz8ZQESPLnYumIlQ+Y
	 omNfxT5Q0XDBw==
Message-ID: <52970189-dcb1-e48c-578b-4cd0679e56ab@collabora.com>
Date: Thu, 13 Jul 2023 09:31:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/4] drm/mediatek: Small mtk-dpi cleanups
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_003115_967392_8D64437D 
X-CRM114-Status: UNSURE (   8.93  )
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

Il 12/04/23 13:52, AngeloGioacchino Del Regno ha scritto:
> This is a small cleanup of the mtk-dpi driver, switching it to devm
> variants where possible and where it made sense, and reducing lines
> while retaining and improving human readability.
> 
> AngeloGioacchino Del Regno (4):
>    drm/mediatek: mtk_dpi: Simplify with devm_drm_bridge_add()
>    drm/mediatek: mtk_dpi: Simplify with dev_err_probe()
>    drm/mediatek: mtk_dpi: Switch to devm_drm_of_get_bridge()
>    drm/mediatek: mtk_dpi: Use devm_platform_get_and_ioremap_resource()
> 
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 59 +++++++++++-------------------
>   1 file changed, 21 insertions(+), 38 deletions(-)
> 

Ping for a fully ready and well tested series that I've sent *3 months* ago.

Thanks,
Angelo

