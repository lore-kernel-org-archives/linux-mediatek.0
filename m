Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC404C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 08:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghUFisVkzz0v20HsfPCt574PMqfeeIsr4fdZUmc2AOo=; b=D5lPHxntVWH5yW
	laUp/BSesweI0veOZACcyUhBHBcKIgEMD7/klVs6RBvML0Dem3gZSXmT5FlsjjA+bOfNztX0LdSpg
	fx7IvBmDW2wfK27EFpVDYZz2FoZqE1eo9vvALBf0DREnuufBEmvikVin64hd688QrtG+iWQcFE374
	C/hteS2Ecq9M3KWk40IuGxDR1iuRZkuSnh1qK/5Or59fIr/KNvAQPuHFGFgq5+Fo5Eu4d7auzAgXO
	lcE7VSRHbmx0MtIfuhavgMvHtKRAgekV+GyMGpn5AvLem5sS8CKBX4EZX8Whup9BwRfc3cbpn301H
	8RSMUxqfX7d3/mEri63A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwfsv-0029rR-Bf; Thu, 02 Jun 2022 08:08:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwfsr-0029mI-4S; Thu, 02 Jun 2022 08:08:48 +0000
X-UUID: 73882f0bdf9640379c5d138c35a71c7f-20220602
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:ef6f8981-5950-4171-ad21-13a307835005,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:e32be037-9855-4915-a138-f5705f1f3d02,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 73882f0bdf9640379c5d138c35a71c7f-20220602
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1194470091; Thu, 02 Jun 2022 01:08:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jun 2022 01:02:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 2 Jun 2022 16:02:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 2 Jun 2022 16:02:55 +0800
Message-ID: <044158674aab0b40d8edcac920855a37fca58cf0.camel@mediatek.com>
Subject: Re: [PATCH v2 0/8] Add a panel API to return panel orientation
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
	David Airlie <airlied@linux.ie>, <linux-kernel@vger.kernel.org>, "Douglas
 Anderson" <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, "Hans
 de Goede" <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
	<linux-arm-kernel@lists.infradead.org>
Date: Thu, 2 Jun 2022 16:02:54 +0800
In-Reply-To: <20220601094637.1200634-1-hsinyi@chromium.org>
References: <20220601094637.1200634-1-hsinyi@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_010845_200048_91A80DD6 
X-CRM114-Status: GOOD (  17.25  )
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

Hi, Hsin-Yi:

I'm curious that panel driver setting orientation in get_modes() would
work or not. It it works, why not just set orientation in get_modes()?
I find that exynos dsi driver has implement the get_modes() [1] but
Mediatek dsi does not implement. Would you try this?

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/exynos/exynos_drm_dsi.c?h=v5.18#n1483

Regards,
CK

On Wed, 2022-06-01 at 17:46 +0800, Hsin-Yi Wang wrote:
> Panels usually call drm_connector_set_panel_orientation(), which is
> later than drm/kms driver calling drm_dev_register(). This leads to a
> WARN()[1].
> 
> The orientation property is known earlier. For example, some panels
> parse the property through device tree during probe.
> 
> The series add a panel API drm_panel_get_orientation() for drm/kms
> drivers. The drivers can use the API to get panel's orientation, so
> they
> can call drm_connector_set_panel_orientation() before
> drm_dev_register().
> 
> Panel needs to implement .get_orientation callback to return the
> property.
> 
> [1] 
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/__;!!CTRNKA9wMg0ARbw!0ytf4wPxKANnYbw_fgq-eqQARnAXIHv4jwu04ZW6X6dAxZDFsJ0CltY_PvCBAQ$
>  
> 
> Hsin-Yi Wang (8):
>   drm/panel: Add an API drm_panel_get_orientation() to return panel
>     orientation
>   drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
>   drm/panel: panel-edp: Implement .get_orientation callback
>   drm/panel: lvds: Implement .get_orientation callback
>   drm/panel: panel-simple: Implement .get_orientation callback
>   drm/panel: ili9881c: Implement .get_orientation callback
>   drm/panel: elida-kd35t133: Implement .get_orientation callback
>   drm/mediatek: Config orientation property if panel provides it
> 
>  drivers/gpu/drm/drm_panel.c                    |  8 ++++++++
>  drivers/gpu/drm/mediatek/mtk_dsi.c             | 10 ++++++++++
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  8 ++++++++
>  drivers/gpu/drm/panel/panel-edp.c              |  8 ++++++++
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c   |  8 ++++++++
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  |  8 ++++++++
>  drivers/gpu/drm/panel/panel-lvds.c             |  8 ++++++++
>  drivers/gpu/drm/panel/panel-simple.c           |  9 +++++++++
>  include/drm/drm_panel.h                        | 10 ++++++++++
>  9 files changed, 77 insertions(+)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
