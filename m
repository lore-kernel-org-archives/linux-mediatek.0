Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A49C07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 05:18:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5603B613EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 05:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5603B613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6XeMebiYACjCCxXPMOt2MV2DlapYCA3J9RPF25sBwnc=; b=cPIrFVA+TsWqQm
	HQhkr+gaHFOVc663W1QbWtfKteIem28zlrExu78N1YUwmsb1K5TR2gQRmRF/hrJ6fAlK0TtlP6kky
	+yMFCdBnof75S04ZK9vahgiNw78J/x3u+sSX5uge9HlzWGxlfqrq3wl7auj3IUO0EH0OF3REGHLl6
	1piZoLKEyDowNa5y3uc9jh0d9vEUFTQYSpE3FX28lCOc8QntUc6fVV7MoHGnGbNJqWGjylzbqQOWD
	JNroQPUk0Yq3SFMpa7AbqBj7KibZ1fdxPFn3ZOGiBCjRubNFDm9F5damTSBY3MWLJVlDFe1JKNZx5
	S+8uvD5H/2hezTbmwTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4GEm-003A1E-BM; Fri, 16 Jul 2021 05:18:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4GEY-003A0F-MT; Fri, 16 Jul 2021 05:18:01 +0000
X-UUID: 65a670ff04f34a7584a067dcf25829fc-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=P1PqkGczpPcvXL+IzAZftPYToRlDDBZD9w87wJ0kAHw=; 
 b=mQcCrsGRKaRiO8i5EZBuSWghx+bwTW1gU9lB38AR5ZwellxEGTHP04HMxE6Us5DZ791LgpxH0zwNzR8UmKKWXQvJwzxtYxGL3m5gsEfLAaAyW/ktCKrW6LPuug6OTxtiv6z8lBJLbnIVCw0p7S2e5OKZxMdtvjfA21Kkf53Kg6U=;
X-UUID: 65a670ff04f34a7584a067dcf25829fc-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1886126334; Thu, 15 Jul 2021 22:17:54 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 22:15:13 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 13:15:11 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Jul 2021 13:15:11 +0800
Message-ID: <1626412511.16906.0.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: dpi: fix NULL dereference in
 mtk_dpi_bridge_atomic_check
From: CK Hu <ck.hu@mediatek.com>
To: Frank Wunderlich <linux@fw-web.de>
CC: <linux-mediatek@lists.infradead.org>, Frank Wunderlich
 <frank-w@public-files.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, "Jitao
 Shi" <jitao.shi@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 16 Jul 2021 13:15:11 +0800
In-Reply-To: <20210712080736.116435-1-linux@fw-web.de>
References: <20210712080736.116435-1-linux@fw-web.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_221758_783749_859ADC62 
X-CRM114-Status: GOOD (  16.15  )
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

Hi, Frank:

On Mon, 2021-07-12 at 10:07 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> bridge->driver_private is not set (NULL) so use bridge_to_dpi(bridge)
> like it's done in bridge_atomic_get_output_bus_fmts

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Fixes: ec8747c52434 ("drm/mediatek: dpi: Add bus format negotiation")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index bced555648b0..a2eca1f66984 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -605,7 +605,7 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
>  				       struct drm_crtc_state *crtc_state,
>  				       struct drm_connector_state *conn_state)
>  {
> -	struct mtk_dpi *dpi = bridge->driver_private;
> +	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>  	unsigned int out_bus_format;
>  
>  	out_bus_format = bridge_state->output_bus_cfg.format;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
