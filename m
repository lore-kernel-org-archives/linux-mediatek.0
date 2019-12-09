Return-Path: <SRS0=SGDP=Z7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED44FC43603
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 04:49:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEE2720637
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 04:49:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cNljoXDq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="glfGCYkY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEE2720637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNQrW18saJKz1IOKeolfCCxhY1BKmtfkFvwl4xglh0g=; b=cNljoXDqNYJqfQ
	4q7dCyFLjvaxojUd6Aj2czPBWwrXu9n5UK7CB0GV03pSfiSEOI/9ae58FejeuJWE7vfWalENHlrgh
	xchaFUO+RE3C4knWhffzINteqjp+Zm9GmXYNQW0LK4onC1Hua1/Q7nQ9wG7+s2CRA3QkVP+gHafVb
	7qnPXjvQecE0ZNOPzuVAyqqXVsQ5UNFpfVKB0qjjvS1OQulibJUthLJqMkuzvUtMA0/VqM0//D1Zm
	SYO9U4b6r1xPZ+ouNJlOqIImrLsf54IaxNl2vV2z2pTcG6DmwdPT2KdXPlVOiyZUOChSpWg0Ba/H8
	dBofCWS7K2RP/GQ05KvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieAyo-0006vB-6C; Mon, 09 Dec 2019 04:49:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieAye-0006oF-Ai; Mon, 09 Dec 2019 04:48:58 +0000
X-UUID: 15b597eb00e84f3190ecaccb581992f0-20191208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YcgZtnqzg5VT3Hj1syPa/xCvJ6RF8xt8gpVFl7qpqMI=; 
 b=glfGCYkYNOGN2BY8rePw6TlmD+rXhi9x84TLt5gd7g8twW+mDutlcXvD5XlXPH08bgfg2ODPnpB19AtwcksCXZVQF0cTPMErgDUM14//VvalbDh2WG+t+wLFqFUFXUNNSm3Gk09ffGTyGVRCt37DfFas2+16hPUfP3jR/iH8dVc=;
X-UUID: 15b597eb00e84f3190ecaccb581992f0-20191208
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 803527195; Sun, 08 Dec 2019 20:48:50 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 8 Dec 2019 20:49:03 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Dec 2019 12:47:46 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Dec 2019 12:48:31 +0800
Message-ID: <1575866920.32541.4.camel@mtksdaap41>
Subject: Re: [PATCH v4 0/7] drm/mediatek: fix cursor issue and apply CMDQ in
 MTK DRM
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Mon, 9 Dec 2019 12:48:40 +0800
In-Reply-To: <20191205092749.4021-1-bibby.hsieh@mediatek.com>
References: <20191205092749.4021-1-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 55801605C57CA610921F609EFECE446D43442399BAEEDB01006B5353DB3550B02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_204856_380027_A81BFEB4 
X-CRM114-Status: GOOD (  15.34  )
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

I've tried to apply this series to 5.5-rc1, but there are many
conflicts. Please resend this series based on 5.5-rc1.

And I've found that if I config CONFIG_MTK_CMDQ=m, the code inside
'#ifdef CONFIG_MTK_CMDQ' would not be built. I think you should change
this to '#if IS_ENABLED(CONFIG_MTK_CMDQ)'.

Regards,
CK

On Thu, 2019-12-05 at 17:27 +0800, Bibby Hsieh wrote:
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
> (https://patchwork.kernel.org/cover/11255147)
> drm/mediatek: Refactor plane init/check and support rotation
> (https://pw-emeril.freedesktop.org/series/69015/)
> drm/mediatek: Check return value of mtk_drm_ddp_comp_for_plane
> (https://lore.kernel.org/patchwork/patch/1154517/)
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
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 132 ++++++++++++----
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  47 +++---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  86 +---------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   7 -
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  47 ++++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h    |   2 +
>  11 files changed, 381 insertions(+), 224 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
