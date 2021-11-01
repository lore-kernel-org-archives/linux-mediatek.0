Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD65C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 03:16:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21A6D60F42
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 03:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21A6D60F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gCWyI0bhO6IdRsqaSHuxdnuD9WG5+8VKmYl5guvfHI4=; b=rTIehcLrZj0V+0
	m8l99tFH/NSFix2bD3YcFX3BnyzLjPVxpAaV2xmPo13LycbgHaTmtQBNwCznVS7uRqd1+galiVqi1
	ruq47Cns/uZvOflRKHbwgSjlgDV9lisGiZ+BHcZ9VDVDaD7cJ+ig1GIWozRiVpJARjR2/KHLcOzAr
	thv3oWGBtv+6ROB9x936NPO218lgC+u+psQbB6+z2NhomDs87YT1zTlYuJhkPsTEV3GG9i7Z0HG+1
	IjcZbR1jSrAZ7m76v4l/bvAEyNPiPRvdQy+o7wRL68Kzaka5PgXUPiJrLZ8kSMT4+oByUDt4qCtoD
	D286Qh9+10gddz1S6HIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhNoB-00F9dd-QU; Mon, 01 Nov 2021 03:16:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhNo9-00F9cH-3m; Mon, 01 Nov 2021 03:16:26 +0000
X-UUID: 2d64e67b398a4ba698a2e2e3ec2de95f-20211031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MplEKwNK6OAffXAWeN1ahMfbiWO2NiLp63P/1LmLGmw=; 
 b=GwLjNXSy9y3R8TBI6qDXqnz80ODYYegeSsZ5xWIcRcMN8Yokk0J4LaCQDl0f28JyFayOUTiNri6legOvAlqbuq+DM2RutmdALU+y67KHM1r7/ObUKEvHUem5inSeOtYItalllV8E3F6cjf8ZyXwLtOerYKO5f+7KX5UiPB2r3Gg=;
X-UUID: 2d64e67b398a4ba698a2e2e3ec2de95f-20211031
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 513292720; Sun, 31 Oct 2021 20:16:19 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Oct 2021 20:16:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 1 Nov 2021 11:16:16 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Nov 2021 11:16:15 +0800
Message-ID: <a16150b6b10dca4bf961b8e02b5e4d940b98468c.camel@mediatek.com>
Subject: Re: [PATCH v7 3/3] drm/bridge: anx7625: config hs packets end
 aligned to avoid screen shift
From: Jitao Shi <jitao.shi@mediatek.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Xin Ji
 <xji@analogixsemi.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <shuijing.li@mediatek.com>
Date: Mon, 1 Nov 2021 11:16:15 +0800
In-Reply-To: <20210915223117.7857-4-jitao.shi@mediatek.com>
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
 <20210915223117.7857-4-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_201625_182445_039B1EFB 
X-CRM114-Status: GOOD (  15.12  )
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

Hi Xin,

Please help to review the changes in anx7625.c

On Thu, 2021-09-16 at 06:31 +0800, Jitao Shi wrote:
> This device requires the packets on lanes aligned at the end to fix
> screen shift or scroll.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 14d73fb1dd15..d76fb63fa9f7 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1327,6 +1327,7 @@ static int anx7625_attach_dsi(struct
> anx7625_data *ctx)
>  		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
>  		MIPI_DSI_MODE_NO_EOT_PACKET	|
>  		MIPI_DSI_MODE_VIDEO_HSE;
> +	dsi->hs_packet_end_aligned = true;
>  
>  	if (mipi_dsi_attach(dsi) < 0) {
>  		DRM_DEV_ERROR(dev, "fail to attach dsi to host.\n");
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
