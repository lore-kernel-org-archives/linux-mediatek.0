Return-Path: <SRS0=J4iI=27=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E44C33C99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 06:30:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7F8A2072E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 06:30:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cp8fVTQK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="C1L+sKks"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7F8A2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZV/wrxVZ8iEEcxH42tMcDIgUNpmHFsx48LJFq8ttbv8=; b=Cp8fVTQK7ebPpU
	c01lN6xWcY8N/x6EoSfscQvS3rk/6BR7ckTB5suQe9ZwOoA4TdF8ZZplsAI/19fuMkkNmJ4ho6XvK
	S4O8aFD/fGjQqDjUq1y9pX/70NzUk/pV6qeFnnMj+MKv7068F/tf0EQCtv6f+Mbz1oPSMwHd2pqZB
	JSNLfx/EQsZXfqjOEZ6JmuxS9fy5wxR9Noj8CPJlLz2SPEbvXvGhL+nt/VOcMVTXRnPAn5+taXXp4
	dC6v7rG0+VyBZ06vuOh2h0z2HsIciqUT6Z39s0sA8w7OzLvDnowjnRvbg+VRokucJTWjgI06eqbNV
	XAWan+lWZkWSGInJUtQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipnoE-0006gR-4c; Fri, 10 Jan 2020 06:30:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipno2-0005M0-MZ; Fri, 10 Jan 2020 06:30:04 +0000
X-UUID: 3a709631d0df46f19b826d746124cbce-20200109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2hX33a9oKQvAaZtJ3NQ0cW54cICk0Docx++JIfjlN54=; 
 b=C1L+sKksrUCaSk1L4aeeOVIVRwEj1HUrt9aleg63TRWpo7VBpUS81ERuh3PNSUunD9Xu1wprIqEyvlTGUgv9u46+P+pc5ZtS6J/CrC9/cU+QCMQc5rn+h0O25Y2pUfHBO53nYFXa68rXi9isephJKUdMzm32vi13QPLKNVRvKQI=;
X-UUID: 3a709631d0df46f19b826d746124cbce-20200109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1538986212; Thu, 09 Jan 2020 22:29:49 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 9 Jan 2020 22:20:25 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 Jan 2020 14:18:47 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 Jan 2020 14:20:24 +0800
Message-ID: <1578637185.29400.3.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: check for comp->funcs
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 10 Jan 2020 14:19:45 +0800
In-Reply-To: <20200109072900.17988-1-hsinyi@chromium.org>
References: <20200109072900.17988-1-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_223002_754966_A17C232D 
X-CRM114-Status: GOOD (  14.85  )
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Hsin-yi:

On Thu, 2020-01-09 at 15:29 +0800, Hsin-Yi Wang wrote:
> There might be some comp that doesn't have funcs, eg. hdmi-connector.
> Check for comp->funcs otherwise there will be NULL pointer dereference
> crash.
> 
> Fixes: bd3de8cd782b ("drm/mediatek: Add gamma property according to hardware capability")
> Fixes: 7395eab077f9 ("drm/mediatek: Add ctm property support")

Because the fixed patches are still in my tree, so I merge this patch
with the fixed patches in mediatek-drm-next-5.6 [1].

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6

Regards,
CK

> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> This patch is based on mediatek's drm branch:
> https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6
> 
> After
> https://patchwork.freedesktop.org/patch/344477/?series=63328&rev=59,
> there will also be funcs for hdmi-connector.
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index fb142fcfc353..7b392d6c71cc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -808,11 +808,13 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  
>  		mtk_crtc->ddp_comp[i] = comp;
>  
> -		if (comp->funcs->ctm_set)
> -			has_ctm = true;
> +		if (comp->funcs) {
> +			if (comp->funcs->ctm_set)
> +				has_ctm = true;
>  
> -		if (comp->funcs->gamma_set)
> -			gamma_lut_size = MTK_LUT_SIZE;
> +			if (comp->funcs->gamma_set)
> +				gamma_lut_size = MTK_LUT_SIZE;
> +		}
>  	}
>  
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
