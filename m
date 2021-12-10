Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E2DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcOrl9Ief7onyTxAWKLmJTteik7cJhpM2G2KB5p5Wzw=; b=TzQblHaZM+CGPvw7cNPhHOjbJx
	ue2dHMgFhlyVYH/XlI+mqJg+xBLn2mUUydLr1hQuN/22hNzB1PdqO/KICIzsLyghg63XZ0A/Jzkio
	vOiq9Z0R8M/VlVpoiIEyLucsE+Hqsg/ax+z6CUO5FFY1m9l9t614w0nuLjWsJ+ruy45li+IBSzc9c
	au+Rsklss6wtnHJV5SDmUmVGIumiduZGqJyS4EhEzwZFMsCgIgPDmlRxEG8nJ5WktLXycZxIgRxIa
	7tGeBG5JWUXVOYXfVo3ShwEop5K6zHQaZA3aa51+ie+x7iLcDmSOSYtU60e6+owRp6dEztZo3PoAT
	1PXH7LYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvcyc-001UOd-Tc; Fri, 10 Dec 2021 10:18:06 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvcyO-001ULO-Ic; Fri, 10 Dec 2021 10:17:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8F6441F4709E
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639131468; bh=Gjv8pg77wAZyx6FV9xWPNtCyByurMxg6U07KqvM1fqo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ODmsPABiBeHD9ryRiRsKqYvoOLjFkrf37+cM12Q+/qOrTPyAHT5tDzYjzPztfv7h7
 6ZuxRLiPfUCS/jdP6+D8QZqEp2Tm7Z/mEM7oxGgbN1+mc2ON3/u1dnmbonnifIOpWd
 GdEkYJq3aE5UosKSAQP2lngcpf2RjejnVSYaYo+RNNGk8FdbxYydCG5MC+PTFf3q7O
 oNoh1FTPvQWXNcDaPWmtBMzKHpS1GgAa8Z1n75qah1vZzLMIWcyyBrtTaf0SbnreEb
 SYlI6p/Ful7B/1LgJoDoXcoxeuI3aK5ScEnUvQbitFYzeYzDbEEzN1hE8O9vVcI0yv
 MxSCAIw7FE6BA==
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
To: Guillaume Ranquet <granquet@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-8-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <b307d567-774b-ca9e-d7d7-09846782c988@collabora.com>
Date: Fri, 10 Dec 2021 11:17:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110130623.20553-8-granquet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_021752_779526_2FAD72F1 
X-CRM114-Status: GOOD (  28.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 10/11/21 14:06, Guillaume Ranquet ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC and a
> according phy driver mediatek-dp-phy.
> 
> It supports both functional units on the mt8195, the embedded
> DisplayPort as well as the external DisplayPort units. It offers
> hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> to 4 lanes.
> 
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so that
> both can work with the same register range. The phy driver sets device
> data that is read by the parent to get the phy device that can be used
> to control the phy properties.
> 
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reported-by: kernel test robot <lkp@intel.com>

Hello Markus, Guillaume,

there is a critical issue with this patch. Please check below.

> ---
>   drivers/gpu/drm/drm_edid.c              |    2 +-
>   drivers/gpu/drm/mediatek/Kconfig        |    7 +
>   drivers/gpu/drm/mediatek/Makefile       |    2 +
>   drivers/gpu/drm/mediatek/mtk_dp.c       | 3094 +++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_dp_reg.h   |  568 +++++
>   drivers/gpu/drm/mediatek/mtk_dpi.c      |  111 +-
>   drivers/gpu/drm/mediatek/mtk_dpi_regs.h |   26 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c  |    1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h  |    1 +
>   9 files changed, 3799 insertions(+), 13 deletions(-)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> 

<snip>

> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 384074f69111b..e6e88e3cd811d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c

<snip>

> @@ -979,6 +1051,16 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	dpi->dpi_ck_cg = devm_clk_get(dev, "ck_cg");

mtk_dpi is used on MT2701, MT7183, MT8183, MT8192, but these platforms haven't
got any "ck_cg" clock defined in their device-trees (regardless of whether these
can support adding this clock or not, any code change shall be retro-compatible
hence not breaking compatibility/functionality with older device-trees).

Reminding that:
- mediatek-drm uses the component framework
- mtk_drm_drv is the component master
- mtk_drm_drv bind() won't be called unless all of the components added with
   match aren't calling component_add()

... this change not only breaks DisplayPort support for *all* of the
aforementioned SoCs, but also makes the entire mediatek-drm to not finish
probing, producing a global breakage that also includes DSI and the entire
stack of components of that master (so, no display on all of them).

To avoid breaking any SoC that's not MT8195, please use devm_clk_get_optional()
here in the next version.

Thanks,
- Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
