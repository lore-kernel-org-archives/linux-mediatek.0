Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30087C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 10:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=io5PJbQ1CSuaECxo3XzAWd0Hsme1+DosLaSj3N6E2CI=; b=HjQIK/Lvh7qopl
	TtYB3ytllL2GUsxVDaT1h7S+8oDzLbigodb8x+so38E0vSi25Y/F6dsTeNMQQHEmRsTpdD48vmF+i
	gUi4WbLvxr2dRPdhp08gWZXOJ35YwiXmoGuLxqRfQpRGHznyZbnw+zU3IQG8agCOvlE4P7NWQ5lZW
	9t04cnmhd8vk2Y4/gFr5Omkovu1oLY6mGVcw7dfDecnrWjEyE9r1qfPgf1Nx8J69O4JaPyDzbAbkD
	saEnv6TSyEPFfPjwVkqvC/a6M4e6PGaAdXkpjBTw/cWo+Qu5PU9AyfNCHuT36apE84KOZnQ8Kj60b
	n8QXQHTjCPiH+3jJNkfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEUNH-008xvI-M4; Mon, 31 Jan 2022 10:57:31 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEUNF-008xtf-2h; Mon, 31 Jan 2022 10:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643626649; x=1675162649;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZdENkAwNTJtD0Npkluazkuj5//kfgKoLfVNh1OSJ8Us=;
 b=juQuVowaK2BDCSttta/HQfP7FdGVfA4z0Lh6ZyV/13wlffPhUvson1b6
 p0h4h8WMO1OYXnU6hvAhSbB1lezfJKrDoknAO9fd/obs/PYpIonBzS3dV
 HAFpwjsyVex9aqKLCGKpKekmKFL5pxw+joBafwFRrMIt7rJOjYzdU4PJC
 Zxy3QND1GEUxdDTb8ZYdxBXRx/mmrZceIKVTDYRCm+LFqtJ06/gH2U7dP
 BPu3VDlrTCBwBcegk6kqITlRcTWeqls0e13mYppF5Lnz/4g//oxEWHD8M
 jXPvcckwSg9RsIE2vh/atkxwCwYj9/5Fvq6JFXhQF/qZl9lbBa71wDKT0 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="227408507"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="227408507"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 02:57:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="481712993"
Received: from ylian16-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.16.100])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 02:57:19 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Yong Wu <yong.wu@mediatek.com>
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Joerg Roedel
 <joro@8bytes.org>, James Wang <james.qian.wang@arm.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, srv_heupstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Tomasz Figa
 <tfiga@chromium.org>, iommu@lists.linux-foundation.org, Robin Murphy
 <robin.murphy@arm.com>
Subject: Re: [RFC PATCH] component: Add common helpers for compare/release
 functions
In-Reply-To: <YfRtGF3v+BwH5RkG@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220128081101.27837-1-yong.wu@mediatek.com>
 <YfRtGF3v+BwH5RkG@phenom.ffwll.local>
Date: Mon, 31 Jan 2022 12:57:16 +0200
Message-ID: <878ruww4tv.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_025729_167489_9F5A9A3B 
X-CRM114-Status: GOOD (  19.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 28 Jan 2022, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, Jan 28, 2022 at 04:11:01PM +0800, Yong Wu wrote:
>> The component requires the compare/release functions, there are so many
>> copy in current kernel. Just define three common helpers for them.
>> No functional change.
>> 
>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>> ---
>> Base on v5.17-rc1
>> ---
>>  .../gpu/drm/arm/display/komeda/komeda_drv.c    |  5 -----
>>  drivers/gpu/drm/arm/hdlcd_drv.c                |  7 +------
>>  drivers/gpu/drm/armada/armada_drv.c            |  5 -----
>>  drivers/gpu/drm/drm_of.c                       |  8 +-------
>>  drivers/gpu/drm/etnaviv/etnaviv_drv.c          |  7 -------
>>  drivers/gpu/drm/exynos/exynos_drm_drv.c        |  5 -----
>>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |  5 -----
>>  drivers/gpu/drm/imx/imx-drm-core.c             |  4 ++--
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c      |  5 -----
>>  drivers/gpu/drm/mcde/mcde_drv.c                |  7 +------
>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c         |  5 -----
>>  drivers/gpu/drm/meson/meson_drv.c              |  8 --------
>>  drivers/gpu/drm/msm/msm_drv.c                  |  9 ---------
>>  drivers/gpu/drm/omapdrm/dss/dss.c              |  8 +-------
>>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c    |  5 -----
>>  drivers/gpu/drm/sti/sti_drv.c                  |  5 -----
>>  drivers/gpu/drm/sun4i/sun4i_drv.c              |  9 ---------
>>  drivers/gpu/drm/vc4/vc4_drv.c                  |  5 -----
>>  drivers/iommu/mtk_iommu.h                      | 10 ----------
>>  drivers/power/supply/ab8500_charger.c          |  8 +-------
>>  drivers/video/fbdev/omap2/omapfb/dss/dss.c     |  8 +-------
>>  include/linux/component.h                      | 18 ++++++++++++++++++
>>  sound/soc/codecs/wcd938x.c                     | 16 ++--------------
>
> Seems like a neat idea. Please add kerneldoc for the new functions you're
> adding (bonus point for an example in there) and make sure it all renders
> correctly in
>
> $ make htmldoc
>
> Also please split up the patch series per-driver and add the maintainers
> to each patches' Cc: list. With that I think this should be ready for
> merging.

Aren't the function names perhaps a bit short and generic for the global
namespace though? If you encounter compare_of, release_of, or
compare_dev in code, component.h is not where you'd expect to find them.

BR,
Jani.


>> diff --git a/include/linux/component.h b/include/linux/component.h
>> index 16de18f473d7..5a7468ea827c 100644
>> --- a/include/linux/component.h
>> +++ b/include/linux/component.h
>> @@ -2,6 +2,8 @@
>>  #ifndef COMPONENT_H
>>  #define COMPONENT_H
>>  
>> +#include <linux/device.h>
>> +#include <linux/of.h>
>>  #include <linux/stddef.h>
>>  
>>  
>> @@ -82,6 +84,22 @@ struct component_master_ops {
>>  	void (*unbind)(struct device *master);
>>  };
>>  
>> +/* A set common helpers for compare/release functions */
>> +static inline int compare_of(struct device *dev, void *data)
>> +{
>> +	return dev->of_node == data;
>> +}
>> +
>> +static inline void release_of(struct device *dev, void *data)
>> +{
>> +	of_node_put(data);
>> +}
>> +
>> +static inline int compare_dev(struct device *dev, void *data)
>> +{
>> +	return dev == data;
>> +}
>> +
>>  void component_master_del(struct device *,
>>  	const struct component_master_ops *);
>>  

-- 
Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
