Return-Path: <SRS0=ysX+=5R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A32C43331
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 02:26:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 866E62071A
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 02:26:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TD4L0eDP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="E5XwNqTj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 866E62071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Ma5xoxUN6DVdyI4cgpWUeGJ+T877cud2Gx+MM1Ulzw=; b=TD4L0eDPrB+rD9
	ihF2M6gd/5+aZFFfgQ4rkHB9bFbYZldJBxZEMtqC2+Sj7tIKRNT8jhNBKReD1s3PMRpzhqDhcyyH1
	G3hOhXQks6XuRSBOSLcos9cpAVaezDS3SMd3YJ6RxfKYPbEF3e9q+/vIsHLIorMX0wOMWGZSRLXkf
	bjeuunr5eey9Uwov0znbncdJV/S2ezNx7IBn4AwKN/nPgn9gYpkOHdxuA2dYmfTc0IMk3DsOSZj1J
	dSv2P8i3i9t9Ilhw4Lj0AtfJPdAXYuaXK+xVxIYuM5OCiAASjS34ykjwyaO0e+xEjSvApDB5lNe5C
	TW3JJxpxBfud8G6Nk9hQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJT4x-0001Kb-Sf; Wed, 01 Apr 2020 02:26:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJT4v-0001JR-Ed
 for linux-mediatek@lists.infradead.org; Wed, 01 Apr 2020 02:26:07 +0000
X-UUID: d8a6f0bba99140ccb27079fdfc8ab26b-20200331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ozChR75QyhnkmzvgkYzHisLoS9xThMPk60TjOXq2y0w=; 
 b=E5XwNqTjj7DmNh1TQV5VjC/i34j7mzgfT6rWfcrOtFBjsJ4xsVA+juCWKEwZQiBehk4TDATtzbvt3U83b80S/BfWEPuT1vOxXGfc/0FthSwO6+cOBHuRLxwwMtAU7bDFGkJwGcCenOEPXdumzSDT00rFLkpoYK/XLqb6EswMzUs=;
X-UUID: d8a6f0bba99140ccb27079fdfc8ab26b-20200331
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 729377008; Tue, 31 Mar 2020 18:25:58 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Mar 2020 19:18:18 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 1 Apr 2020 10:18:14 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 1 Apr 2020 10:18:16 +0800
Message-ID: <1585707503.28859.21.camel@mhfsdcap03>
Subject: Re: [PATCH v3 3/4] phy: mediatek: Move mtk_hdmi_phy driver into
 drivers/phy/mediatek folder
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 1 Apr 2020 10:18:23 +0800
In-Reply-To: <20200331155728.18032-4-chunkuang.hu@kernel.org>
References: <20200331155728.18032-1-chunkuang.hu@kernel.org>
 <20200331155728.18032-4-chunkuang.hu@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_192605_498114_A616977E 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, CK
 Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-03-31 at 23:57 +0800, Chun-Kuang Hu wrote:
> From: CK Hu <ck.hu@mediatek.com>
> 
> mtk_hdmi_phy is currently placed inside mediatek drm driver, but it's
> more suitable to place a phy driver into phy driver folder, so move
> mtk_hdmi_phy driver into phy driver folder.
> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/Kconfig                           | 7 -------
>  drivers/gpu/drm/mediatek/Makefile                          | 6 ------
>  drivers/phy/mediatek/Kconfig                               | 7 +++++++
>  drivers/phy/mediatek/Makefile                              | 7 +++++++
>  .../mediatek/phy-mtk-hdmi-mt2701.c}                        | 2 +-
>  .../mediatek/phy-mtk-hdmi-mt8173.c}                        | 2 +-
>  .../mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c}         | 2 +-
>  .../mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h}         | 0
>  8 files changed, 17 insertions(+), 16 deletions(-)
>  rename drivers/{gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt2701.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt8173.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h} (100%)
> 
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
