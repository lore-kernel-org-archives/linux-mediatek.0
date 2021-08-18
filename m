Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB46C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 04:42:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB3361076
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 04:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAB3361076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPVbf6tu9wyoPlQRS7LrequHOZHBI0Jm4Uf2M/635+0=; b=H55ytDbS12lg0L
	ihZJyMwJVoOP9jKbhXrFOgN22TsJHhvCA77wuPncCLlgS8qutMFeopctGy1Qw+PK6chRdObvKdp3k
	ucYI26587h+ExbPRiNRERjxO8r2x5endwW8/GVhleQT+ImwFpZ6tqmDdGlDJ3Tg28KYDcv7aXyg8R
	1TZbHSwj69Ojkeiyg7cIUPIhqqHvmO0N60PH3ewxnI3F3L4CJArcxBpUCGRHKrt/chBcTtzfC+mFi
	J6MhI9PfZ9fWHdH5Y7SKzvCEimApTmf/mqiCkFy+MlNPN/lHaFu7W3MpBDJx2+iHb71rCK1Lg9cRj
	A2dO/r9SXci2uqCPVs6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGDPD-0049gq-Ay; Wed, 18 Aug 2021 04:42:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGDP7-0049en-Mi; Wed, 18 Aug 2021 04:42:21 +0000
X-UUID: f3ad03bbce204cc398c2ce54368317aa-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=s2eYxQ8WBamf7VOtmtmHxiE6CjpqtO24kF2KWeIi2hs=; 
 b=O5KQ9VRFGfne05GY2JAg9XKHbIPhAy0p7lZx6cw4amZ6y8Silx+aEvM56f3Z6nb10FkqyYwmqjaNJrn0uG6T79azkUbXYXF8mgQ50q6bOSk9YX5aqgR1nBP/7zmMb5P8IaHcWe9OJrFQxlECBUGLzSJlnE7pSrA22bXEHhShGto=;
X-UUID: f3ad03bbce204cc398c2ce54368317aa-20210817
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1463523916; Tue, 17 Aug 2021 21:42:12 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 21:42:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 12:42:09 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Aug 2021 12:42:09 +0800
Message-ID: <1629261729.11678.2.camel@mtksdaap41>
Subject: Re: [RFC PATCH 5/5] drm/mediatek: Add mt8195 DisplayPort driver
From: CK Hu <ck.hu@mediatek.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Wed, 18 Aug 2021 12:42:09 +0800
In-Reply-To: <20210816192523.1739365-6-msp@baylibre.com>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-6-msp@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_214217_790857_E5081D2F 
X-CRM114-Status: GOOD (  19.30  )
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

Hi, Markus:

On Mon, 2021-08-16 at 21:25 +0200, Markus Schneider-Pargmann wrote:
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> 
> It supports both functional units on the mt8195, the embedded
> DisplayPort as well as the external DisplayPort units. It offers
> hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> to 4 lanes.
> 
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/Kconfig      |    7 +
>  drivers/gpu/drm/mediatek/Makefile     |    2 +
>  drivers/gpu/drm/mediatek/mtk_dp.c     | 3025 ++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h | 3095 +++++++++++++++++++++++++
>  4 files changed, 6129 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> 
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> index 2976d21e9a34..d81eb3521c1c 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -28,3 +28,10 @@ config DRM_MEDIATEK_HDMI
>  	select PHY_MTK_HDMI
>  	help
>  	  DRM/KMS HDMI driver for Mediatek SoCs
> +
> +config MTK_DPTX_SUPPORT
> +	tristate "DRM DPTX Support for Mediatek SoCs"
> +	depends on DRM_MEDIATEK
> +	select GENERIC_PHY

Why select GENERIC_PHY?
If this is a phy driver, place this driver in drivers/phy/mediatek/

Regards,
CK

> +	help
> +	  DRM/KMS Display Port driver for Mediatek SoCs.
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index dc54a7a69005..6b9d148ab7fe 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -20,3 +20,5 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
>  			  mtk_hdmi_ddc.o
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
