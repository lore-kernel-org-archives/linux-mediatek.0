Return-Path: <SRS0=4wrq=4P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961D0C4BA24
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 09:05:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C55F2467F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 09:05:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BqGwTcL7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uOObFOEZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C55F2467F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V91iqxx5GSu6HOvGNhiTkJZNtqeC68yYGqVCmU9Zx9M=; b=BqGwTcL7866hsP
	rM/KvmGSlUGMzgS67CqSpaMyT+cEl9Aw0+LJVsvgoH0zLopuTBsJBpndurd+t4kU3C252ikBciVl7
	JnA6YRCWPNEzrQTyR/Pzcx7Giz+i0tZVHsdBjmEZm7O48F2NCasYSr+Z3oboj2yCW6/HLqQcMApt6
	RkM+u/g4GxrL1Qr+kt9yTHzVH5bOk2tFJ9ZC6N1qAmbyL/gcuGCE7UkTInc5si7EcWcUzYk7trNxd
	SmLhKj9bLYOGOL36E8yVpf3l/sDQ/Ti2UQlkO+mahNUJDrFNwNKPVyaH2Y/HmFkUokTICuQn+R7fv
	ZfY2xLl8MumL4KPZ3fvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7F6I-0004iE-3V; Thu, 27 Feb 2020 09:04:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7F6F-0004hW-Ox; Thu, 27 Feb 2020 09:04:57 +0000
X-UUID: 2d873fecf51347ca9996a016e08e8dfe-20200227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=s49kQ/4eBBv+UD7Hr3V2alwWMpIr4yXzqun9qCCm8kQ=; 
 b=uOObFOEZ2OLqrPWfV6UHRh2NuRS3r9Wx+TD98rDpTzTM6XsEnERsdQzhxwHUH8VZ7a3KZh3McPkkI9Lv8PfjaBl3SfdjDk9Gae03OpEMFlTR09+IoIUHC2MxLbOeNeReSh3JzW5R+lZoOHhxU2T9z/8/fmQW/BxxHc5WAQ9pfAQ=;
X-UUID: 2d873fecf51347ca9996a016e08e8dfe-20200227
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1576935954; Thu, 27 Feb 2020 01:04:48 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 01:04:46 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 17:03:36 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 27 Feb 2020 17:04:20 +0800
Message-ID: <1582794271.1889.10.camel@mtksdaap41>
Subject: Re: [PATCH v9 1/4] drm/mediatek: Use regmap for register access
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Thu, 27 Feb 2020 17:04:31 +0800
In-Reply-To: <07976851-8ac4-9c0d-3257-74fd4df74ef0@collabora.com>
References: <20200226105419.632771-1-enric.balletbo@collabora.com>
 <20200226105419.632771-2-enric.balletbo@collabora.com>
 <1582765858.20746.2.camel@mtksdaap41>
 <07976851-8ac4-9c0d-3257-74fd4df74ef0@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1593FEEEB5C71E2C9B1951E4352218ED93D394FC9E26DABA78D1534804CF88642000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_010455_823713_17A88AD0 
X-CRM114-Status: GOOD (  24.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 Allison Randal <allison@lohutok.net>, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, frank-w@public-files.de,
 Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <mbrugger@suse.com>, sboyd@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Enric:

On Thu, 2020-02-27 at 09:45 +0100, Enric Balletbo i Serra wrote:
> Hi CK,
> 
> On 27/2/20 2:10, CK Hu wrote:
> > Hi, Enric:
> > 
> > On Wed, 2020-02-26 at 11:54 +0100, Enric Balletbo i Serra wrote:
> >> From: Matthias Brugger <mbrugger@suse.com>
> >>
> >> The mmsys memory space is shared between the drm and the
> >> clk driver. Use regmap to access it.
> > 
> > Once there is a mmsys driver and clock control is moved into mmsys
> > driver, I think we should also move routing control into mmsys driver
> > and we could drop this patch.
> > 
> 
> Do you want me do this in this series or later?

I would like you to do it in this series. If you move routing control to
mmsys driver, you need not to use regmap any more. What you need to move
is what you modify in this patch. mmsys may provide mtk_mmsys_connect()
and mtk_mmsys_disconnect() function to replace
mtk_ddp_add_comp_to_path() and mtk_ddp_remove_comp_from_path(). DRM
driver need not to map mmsys's register and just keep mmsys device
pointer. You could move routing control after clock control has been
moved.

Regards,
CK

> 
> Thanks,
>  Enric
> 
> > Regards,
> > CK
> > 
> >>
> >> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> >> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> >> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> >> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> ---
> >>
> >> Changes in v9: None
> >> Changes in v8:
> >> - Select REGMAP and MFD_SYSCON (Randy Dunlap)
> >>
> >> Changes in v7:
> >> - Add R-by from CK
> >>
> >>  drivers/gpu/drm/mediatek/Kconfig        |  2 +
> >>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  4 +-
> >>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 50 +++++++++++--------------
> >>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |  4 +-
> >>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 13 ++-----
> >>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  2 +-
> >>  6 files changed, 32 insertions(+), 43 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> >> index fa5ffc4fe823..89e18a473cb5 100644
> >> --- a/drivers/gpu/drm/mediatek/Kconfig
> >> +++ b/drivers/gpu/drm/mediatek/Kconfig
> >> @@ -10,8 +10,10 @@ config DRM_MEDIATEK
> >>  	select DRM_KMS_HELPER
> >>  	select DRM_MIPI_DSI
> >>  	select DRM_PANEL
> >> +	select MFD_SYSCON
> >>  	select MEMORY
> >>  	select MTK_SMI
> >> +	select REGMAP
> >>  	select VIDEOMODE_HELPERS
> >>  	help
> >>  	  Choose this option if you have a Mediatek SoCs.
> >> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> >> index 5ee74d7ce35c..a236499123aa 100644
> >> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> >> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> >> @@ -28,7 +28,7 @@
> >>   * @enabled: records whether crtc_enable succeeded
> >>   * @planes: array of 4 drm_plane structures, one for each overlay plane
> >>   * @pending_planes: whether any plane has pending changes to be applied
> >> - * @config_regs: memory mapped mmsys configuration register space
> >> + * @config_regs: regmap mapped mmsys configuration register space
> >>   * @mutex: handle to one of the ten disp_mutex streams
> >>   * @ddp_comp_nr: number of components in ddp_comp
> >>   * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
> >> @@ -50,7 +50,7 @@ struct mtk_drm_crtc {
> >>  	u32				cmdq_event;
> >>  #endif
> >>  
> >> -	void __iomem			*config_regs;
> >> +	struct regmap			*config_regs;
> >>  	struct mtk_disp_mutex		*mutex;
> >>  	unsigned int			ddp_comp_nr;
> >>  	struct mtk_ddp_comp		**ddp_comp;
> >> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> >> index 13035c906035..302753744cc6 100644
> >> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> >> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> >> @@ -383,61 +383,53 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
> >>  	return value;
> >>  }
> >>  
> >> -static void mtk_ddp_sout_sel(void __iomem *config_regs,
> >> +static void mtk_ddp_sout_sel(struct regmap *config_regs,
> >>  			     enum mtk_ddp_comp_id cur,
> >>  			     enum mtk_ddp_comp_id next)
> >>  {
> >>  	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> >> -		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
> >> -			       config_regs + DISP_REG_CONFIG_OUT_SEL);
> >> +		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
> >> +				BLS_TO_DSI_RDMA1_TO_DPI1);
> >>  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> >> -		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
> >> -			       config_regs + DISP_REG_CONFIG_OUT_SEL);
> >> -		writel_relaxed(DSI_SEL_IN_RDMA,
> >> -			       config_regs + DISP_REG_CONFIG_DSI_SEL);
> >> -		writel_relaxed(DPI_SEL_IN_BLS,
> >> -			       config_regs + DISP_REG_CONFIG_DPI_SEL);
> >> +		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
> >> +				BLS_TO_DPI_RDMA1_TO_DSI);
> >> +		regmap_write(config_regs, DISP_REG_CONFIG_DSI_SEL,
> >> +				DSI_SEL_IN_RDMA);
> >> +		regmap_write(config_regs, DISP_REG_CONFIG_DPI_SEL,
> >> +				DPI_SEL_IN_BLS);
> >>  	}
> >>  }
> >>  
> >> -void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
> >> +void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
> >>  			      enum mtk_ddp_comp_id cur,
> >>  			      enum mtk_ddp_comp_id next)
> >>  {
> >> -	unsigned int addr, value, reg;
> >> +	unsigned int addr, value;
> >>  
> >>  	value = mtk_ddp_mout_en(cur, next, &addr);
> >> -	if (value) {
> >> -		reg = readl_relaxed(config_regs + addr) | value;
> >> -		writel_relaxed(reg, config_regs + addr);
> >> -	}
> >> +	if (value)
> >> +		regmap_update_bits(config_regs, addr, value, value);
> >>  
> >>  	mtk_ddp_sout_sel(config_regs, cur, next);
> >>  
> >>  	value = mtk_ddp_sel_in(cur, next, &addr);
> >> -	if (value) {
> >> -		reg = readl_relaxed(config_regs + addr) | value;
> >> -		writel_relaxed(reg, config_regs + addr);
> >> -	}
> >> +	if (value)
> >> +		regmap_update_bits(config_regs, addr, value, value);
> >>  }
> >>  
> >> -void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
> >> +void mtk_ddp_remove_comp_from_path(struct regmap *config_regs,
> >>  				   enum mtk_ddp_comp_id cur,
> >>  				   enum mtk_ddp_comp_id next)
> >>  {
> >> -	unsigned int addr, value, reg;
> >> +	unsigned int addr, value;
> >>  
> >>  	value = mtk_ddp_mout_en(cur, next, &addr);
> >> -	if (value) {
> >> -		reg = readl_relaxed(config_regs + addr) & ~value;
> >> -		writel_relaxed(reg, config_regs + addr);
> >> -	}
> >> +	if (value)
> >> +		regmap_update_bits(config_regs, addr, value, 0);
> >>  
> >>  	value = mtk_ddp_sel_in(cur, next, &addr);
> >> -	if (value) {
> >> -		reg = readl_relaxed(config_regs + addr) & ~value;
> >> -		writel_relaxed(reg, config_regs + addr);
> >> -	}
> >> +	if (value)
> >> +		regmap_update_bits(config_regs, addr, value, 0);
> >>  }
> >>  
> >>  struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id)
> >> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
> >> index 827be424a148..01ff8b68881f 100644
> >> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
> >> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
> >> @@ -12,10 +12,10 @@ struct regmap;
> >>  struct device;
> >>  struct mtk_disp_mutex;
> >>  
> >> -void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
> >> +void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
> >>  			      enum mtk_ddp_comp_id cur,
> >>  			      enum mtk_ddp_comp_id next);
> >> -void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
> >> +void mtk_ddp_remove_comp_from_path(struct regmap *config_regs,
> >>  				   enum mtk_ddp_comp_id cur,
> >>  				   enum mtk_ddp_comp_id next);
> >>  
> >> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> >> index 0563c6813333..b68837ea02b3 100644
> >> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> >> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> >> @@ -6,6 +6,7 @@
> >>  
> >>  #include <linux/component.h>
> >>  #include <linux/iommu.h>
> >> +#include <linux/mfd/syscon.h>
> >>  #include <linux/module.h>
> >>  #include <linux/of_address.h>
> >>  #include <linux/of_platform.h>
> >> @@ -425,7 +426,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
> >>  {
> >>  	struct device *dev = &pdev->dev;
> >>  	struct mtk_drm_private *private;
> >> -	struct resource *mem;
> >>  	struct device_node *node;
> >>  	struct component_match *match = NULL;
> >>  	int ret;
> >> @@ -437,14 +437,9 @@ static int mtk_drm_probe(struct platform_device *pdev)
> >>  
> >>  	private->data = of_device_get_match_data(dev);
> >>  
> >> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> -	private->config_regs = devm_ioremap_resource(dev, mem);
> >> -	if (IS_ERR(private->config_regs)) {
> >> -		ret = PTR_ERR(private->config_regs);
> >> -		dev_err(dev, "Failed to ioremap mmsys-config resource: %d\n",
> >> -			ret);
> >> -		return ret;
> >> -	}
> >> +	private->config_regs = syscon_node_to_regmap(dev->of_node);
> >> +	if (IS_ERR(private->config_regs))
> >> +		return PTR_ERR(private->config_regs);
> >>  
> >>  	/* Iterate over sibling DISP function blocks */
> >>  	for_each_child_of_node(dev->of_node->parent, node) {
> >> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> >> index 17bc99b9f5d4..03201080688d 100644
> >> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> >> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> >> @@ -39,7 +39,7 @@ struct mtk_drm_private {
> >>  
> >>  	struct device_node *mutex_node;
> >>  	struct device *mutex_dev;
> >> -	void __iomem *config_regs;
> >> +	struct regmap *config_regs;
> >>  	struct device_node *comp_node[DDP_COMPONENT_ID_MAX];
> >>  	struct mtk_ddp_comp *ddp_comp[DDP_COMPONENT_ID_MAX];
> >>  	const struct mtk_mmsys_driver_data *data;
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
