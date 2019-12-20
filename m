Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC07C43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 08:28:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EE1E227BF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 08:28:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bUrfNKe5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="s2UOmCDx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EE1E227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DDu5KeOvyf1cN4Q0Q7iAwrAPOHMcMze6fX5mApDLNnY=; b=bUrfNKe5AdSjlU
	du97FrXNeLpCXc0Jqf27rOOImqLUKWdjWPSky8M4lQu8CO1MyiNZozb5YBaPPkRw7v+cnZcrhoRUi
	bFpS+3JrQE0EILO1++bncXDEPG7RnAMLz3z2D0iLmqbPVPSq1GULVrjZE0w03v6QlRLeWMeLYp4Oq
	Ie4Ekm+nfJlh0FBLkBT6CYeVciSOgqZWblBO+Xje+JoAQUYg4v1Xt1StxEM2LjtZD4bpKBHLROBQt
	3eZLrt+LIovirzx02wiVhPcXfQdS78NMdcUG/QkLAaqpZBkZ27R6B7IHY91M1dVXaPAD9IE1sFwt9
	FmwMet20vEpIqnGV9bGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiDeQ-0003YA-Di; Fri, 20 Dec 2019 08:28:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiDe9-0003K5-CC; Fri, 20 Dec 2019 08:28:31 +0000
X-UUID: a319e5c97b19494293368a13f70d25b3-20191220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2fvqpXZ4f+f8Am+74fysA+SXl4Y8KX7VvKLUjOFoqG0=; 
 b=s2UOmCDxarzcVbKJicgl9WQddBKO1XD3I5dKz8Kv/gCpn685W0zCUWxqUj9ZQ3sV6mRrW1pWyZ6PMDgf5xr34SbJWyXbMnK/nzqQ7ERlXNd5SgU+cbl6ZdGNYcI87+5EfKcWoMoNfc6eIkTVtV1t9XyGkTMIx1pZbgMMwMlo440=;
X-UUID: a319e5c97b19494293368a13f70d25b3-20191220
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 233265706; Fri, 20 Dec 2019 00:28:19 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 00:28:43 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 16:28:24 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 20 Dec 2019 16:28:14 +0800
Message-ID: <1576830496.22904.1.camel@mtksdaap41>
Subject: Re: [PATCH v5 0/7] drm/mediatek: fix cursor issue and apply CMDQ in
 MTK DRM
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Fri, 20 Dec 2019 16:28:16 +0800
In-Reply-To: <20191210050526.4437-1-bibby.hsieh@mediatek.com>
References: <20191210050526.4437-1-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_002829_449529_53E6E1F6 
X-CRM114-Status: GOOD (  14.67  )
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tfiga@chromium.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Bibby:

For this series, applied to mediatek-drm-next-5.6 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6

Regards,
CK

On Tue, 2019-12-10 at 13:05 +0800, Bibby Hsieh wrote:
> The CMDQ (Command Queue) in MT8183 is used to help update all
> relevant display controller registers with critical time limation.
> This patch add cmdq interface in ddp_comp interface, let all
> ddp_comp interface can support cpu/cmdq function at the same time.
> 
> These patches also can fixup cursor moving is not smooth
> when heavy load in webgl.
> 
> This patch depends on ptach:
> add drm support for MT8183
> (https://patchwork.kernel.org/cover/11121519/)
> support gce on mt8183 platform
> (https://patchwork.kernel.org/cover/11255147/)
> drm/mediatek: Check return value of mtk_drm_ddp_comp_for_plane
> (https://lore.kernel.org/patchwork/patch/1154517/)
> 
> Changes since v4:
>  - rebase to Linux 5.5-rc1
>  - add fixes tag
> 
> Changes since v3:
>  - remove redundant code and variable
> 
> Changes since v2:
>  - move some changes to another patch
>  - disable layer in atomic_disable()
> 
> Changes since v1:
>  - remove redundant code
>  - merge the duplicate code
>  - use async instead of cursor
> 
> Changes since v0:
>  - remove redundant code
>  - remove patch
>    "drm/mediatek: fix atomic_state reference counting"
>    After remove this patch, the issue we met before is gone.
>    So I do not add any extra code to do something.
> 
> Bibby Hsieh (7):
>   drm/mediatek: use DRM core's atomic commit helper
>   drm/mediatek: handle events when enabling/disabling crtc
>   drm/mediatek: update cursors by using async atomic update
>   drm/mediatek: disable all the planes in atomic_disable
>   drm/mediatek: remove unused external function
>   drm/mediatek: support CMDQ interface in ddp component
>   drm/mediatek: apply CMDQ control flow
> 
>  drivers/gpu/drm/mediatek/mtk_disp_color.c   |   7 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  67 ++++----
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  43 ++---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 165 ++++++++++++++++----
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 131 ++++++++++++----
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  47 +++---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  86 +---------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   7 -
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  47 ++++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h    |   2 +
>  11 files changed, 380 insertions(+), 224 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
