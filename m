Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A690C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 02:40:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37CFC20708
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 02:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GRzEWJUi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LZ9n0rZU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37CFC20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qjai6Y0S7wRCjjHTqQrdmQK2/kesGDo7vi2YSDt8NNc=; b=GRzEWJUiyRYIubUN07OnFPD6B
	WcS4CeWm4eRLyQgE0Dn48dD8lyG/lkmyX8WYCt/5oj3hGXrJ3TbzLOEZCKpuh5OxS66fQ15jeSLgK
	Eo88FwyIOgEinW10N9q5tQ5u+t7rC5kztMHnayXwOP/dpAP2rpeaqNvSjX39QeSQkX5+0wC6kun74
	m+dTVkMrl9wx3NF+XAu0fvIi0U7KTFvzc6IUQBcF9cQ5VjGkgqXmdPMa18WpksSNQ7N/ayc9ytoiK
	PjUlP19kuab+T7FwHH31ZIB6Qz3kBhqFKYWPKohMt7zlmzNbtAMz5J416y7jW/iyD0EnYrtmlqrLZ
	b5RyrMuDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtMTZ-00016m-6X; Thu, 09 Jul 2020 02:39:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtMTT-00015E-WD; Thu, 09 Jul 2020 02:39:49 +0000
X-UUID: 1e1849340b4f4d3c94d3553ddc4e6c75-20200708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GVIo4VsOj/fRhOA3I3T2Kp/4alllZZbEdvQH5u8PYno=; 
 b=LZ9n0rZUoa2AjpgtOBhqK4Ptc+JqGmAcUUON7qfM19xQAJ7OBCYUEYn1IksCF7C+qjq9HLGGRqKIJ43s2ADt2doZuPnz9n3cxJndS+17DzCQBp6exyAuFMiKyaUfxdedaECTH0evpyd3yMwqJ5m8G0CqLlBXlT3z99WaJJTLG0U=;
X-UUID: 1e1849340b4f4d3c94d3553ddc4e6c75-20200708
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1666808531; Wed, 08 Jul 2020 18:39:44 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 19:39:38 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 10:39:36 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Jul 2020 10:39:34 +0800
Message-ID: <1594262378.21095.3.camel@mtksdaap41>
Subject: Re: [PATCH v3 9/9] drm/mediatek: reduce clear event
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Thu, 9 Jul 2020 10:39:38 +0800
In-Reply-To: <1594136714-11650-10-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-10-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_223948_226096_F20F04E3 
X-CRM114-Status: GOOD (  15.40  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, wsd_upstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dennis,

Thanks for this patch.

It's better to send another tree for this patch.
Because this tree is only for soc/mediatek.

Please do not forget to add the dependency information.

Bibby

On Tue, 2020-07-07 at 23:45 +0800, Dennis YC Hsieh wrote:
> No need to clear event again since event always clear before wait.
> This fix depend on patch:
>   "soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api"
> 
> Fixes: 2f965be7f9008 ("drm/mediatek: apply CMDQ control flow")
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Reviewed-by: Bibby Hsieh <bibby.hsieh@mediatek.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index c84e7a14d4a8..ba6cf956b239 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -490,7 +490,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
>  		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
>  		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
>  		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> -		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, true);
> +		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
>  		mtk_crtc_ddp_config(crtc, cmdq_handle);
>  		cmdq_pkt_finalize(cmdq_handle);
>  		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
