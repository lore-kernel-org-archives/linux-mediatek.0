Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19B0C61D88
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 10:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnL16nP+tLU6ypEK+2+iyPqv24x1710gqUDu/uGE11I=; b=dXb1qqv99hfYFYwnBS5m8qinQX
	JGgNUUnWx0GLiDHX9dAFSGo8zsuP5N4vzaKx6eKlV67G2Wl3LCt9nLCFdTABjgOqCJvr84xkPtSaO
	U+/r56sg7NmacamLvu1PLWzXc2JOZ7hC3iilmIzwj8xGD1MUzuQBi1llbRYQbg8MIbC/YZ1rH4JNp
	4NIzorkNtDPF3c4bJH8jYWJyPRhDly2UTf1wcBjOrx7SK/L20EqSjgqh9MwHYHX6LDnFYPcmd3qJ/
	KeH4FDOf5bMTh9+/crq2NUAVYQysN0y3IDs8DS/N27Mw+RlMGi+TpZPYvjKTosGdAFVhA87XTcRoM
	z3+0Ydqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5OTT-00GL52-2J;
	Tue, 21 Nov 2023 10:59:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5OTQ-00GL3A-0D;
	Tue, 21 Nov 2023 10:59:21 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 61B9466072F6;
	Tue, 21 Nov 2023 10:59:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700564358;
	bh=hLDTvtjHXdN1UWZwGnLWI4X4zJiWHH+M2Ta83yfqwfo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gAvj6e7dR5Diin4goCICBXZjFF0Mbi7wDy70vPr2MNWXzA9tHviIkY3PWf86K/pvy
	 Q8WDKjMTWUL5RqPnWYw07zhdKrpVX8GioYG3k5iIYOX3CFRji0z2lDf8BnuxMrod2H
	 LM908JjgUDU4b0bAT+bhXKkuEeWodKrXiRKvt3IvN06Ye6B3AL7mfoU7q40/wIRqVE
	 asPetWPduA2+TQQ3nZ5N87ylwqDjQOosNtsDQ9YSiVw/MNqEUtYMIsm2DkiFCgwCeF
	 tud5BpwDx8qo2EuUduEn7ApiU8e/RaV6WQqB1tFdZV4ZNySVIF/3hmmBd3GE9fbRx7
	 Ml/4gYS9CYO4g==
Message-ID: <8fd1affd-936d-415e-9f1f-b0415b68ddb6@collabora.com>
Date: Tue, 21 Nov 2023 11:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: dp: Add phy_mtk_dp module as pre-dependency
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: kernel@collabora.com, Bo-Chen Chen <rex-bc.chen@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Guillaume Ranquet <granquet@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20231120202837.396760-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231120202837.396760-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_025920_280850_96F167A6 
X-CRM114-Status: GOOD (  16.14  )
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

Il 20/11/23 21:28, Nícolas F. R. A. Prado ha scritto:
> The mtk_dp driver registers a phy device which is handled by the
> phy_mtk_dp driver and assumes that the phy probe will complete
> synchronously, proceeding to make use of functionality exposed by that
> driver right away. This assumption however is false when the phy driver
> is built as a module, causing the mtk_dp driver to fail probe in this
> case.
> 
> Add the phy_mtk_dp module as a pre-dependency to the mtk_dp module to
> ensure the phy module has been loaded before the dp, so that the phy
> probe happens synchrounously and the mtk_dp driver can probe
> successfully even with the phy driver built as a module.
> 

You forgot a Suggested-by here :-P

> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

It's fine anyway; being the best solution that we can use:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> ---
> 
>   drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index e4c16ba9902d..2136a596efa1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2818,3 +2818,4 @@ MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
>   MODULE_AUTHOR("Bo-Chen Chen <rex-bc.chen@mediatek.com>");
>   MODULE_DESCRIPTION("MediaTek DisplayPort Driver");
>   MODULE_LICENSE("GPL");
> +MODULE_SOFTDEP("pre: phy_mtk_dp");


