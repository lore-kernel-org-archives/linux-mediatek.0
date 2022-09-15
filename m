Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6F5ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 03:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tfm9WqDKMMDTh8ScYXfRfETUOk5oUA8teQhQ5zsKe1k=; b=wXrQYVhNkr11TM3AGamMJEY118
	OmNivfWPubg+FXATv+b30fe8vohbUyboiE3b+Plvd+vR+za7hhpimETzpQaTKCAKOLjMoV10JdoOW
	Aox5eMpoWCqqn76m1BNcVDO6Eq4QMl8Vfh/xdwPmHEhr1gCEIO22QCgzTUsckNzd1Eyso4R54B0uz
	QxvXM5pTt7z/MfpwJqxY6ur8IwGNQVOL2SjaT5npy6nP1p/Rd/txS+1nzEzmrJ6szpLMsZOM/kx3i
	TZP7m1LHmBdHLtn2LxFS6PwN+awAbqHGTUJyNCWT3pnIJShyQFuUhTZsqUbKh74+C4zIWU2NnT2jG
	OPNbDrVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYfOQ-00GXjL-Qj; Thu, 15 Sep 2022 03:18:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYfOD-00GWRq-R2; Thu, 15 Sep 2022 03:18:11 +0000
X-UUID: 508b306628f94b71a8f90ccb735f6e17-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Tfm9WqDKMMDTh8ScYXfRfETUOk5oUA8teQhQ5zsKe1k=;
	b=H7f4cfwj/dYJhpcu5refZH+xF6Be+qC4/tnWABomBIb+qTrrAlXEcXRt0wPZWw7qmUD/JNPC14P8UJq/4kiWcZ0CgDvGPRJPWWcITzjKBw2lnySHWyzzm2IxBnE96G0Z4x/6+oOTFqsDNUb/8AtE/f280cbkawUznomjcEXbE2w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:7a132016-1981-444a-ada6-4983ec5710d8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:17aab45d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 508b306628f94b71a8f90ccb735f6e17-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 773265663; Wed, 14 Sep 2022 20:17:52 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 10:37:17 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 15 Sep 2022 10:37:16 +0800
Message-ID: <a7606a4a3f336f63545ae2d5131a6e38b5bababe.camel@mediatek.com>
Subject: Re: [PATCH v7, 2/4] drm/mediatek: Separate poweron/poweroff from
 enable/disable and define new funcs
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<rex-bc.chen@mediatek.com>, <jitao.shi@mediatek.com>
Date: Thu, 15 Sep 2022 10:37:14 +0800
In-Reply-To: <7a5b9c8a-f074-e6ce-d458-61068452e43f@collabora.com>
References: <1653012007-11854-1-git-send-email-xinlei.lee@mediatek.com>
	 <1653012007-11854-3-git-send-email-xinlei.lee@mediatek.com>
	 <7a5b9c8a-f074-e6ce-d458-61068452e43f@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_201809_901492_7BB7B677 
X-CRM114-Status: GOOD (  37.62  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2022-07-21 at 19:28 +0200, AngeloGioacchino Del Regno wrote:
> Il 20/05/22 04:00, xinlei.lee@mediatek.com ha scritto:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> > 
> > In order to match the changes of "Use the drm_panel_bridge API",
> > the poweron/poweroff of dsi is extracted from enable/disable and
> > defined as new funcs (atomic_pre_enable/atomic_post_disable).
> > 
> > Since dsi_poweron is moved from dsi_enable to pre_enable function,
> > in
> > order to avoid poweron failure, the operation of dsi register fails
> > to
> > cause bus hang. Therefore, the protection mechanism is added to the
> > dsi_enable function.
> > 
> > Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the
> > drm_panel_bridge API")
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> Hello Xinlei, CK, maintainers:
> 
> This patch is breaking machines that are using a DSI->DisplayPort
> bridge (like
> the ANX7625 chip), but that's not the main issue.
> 
> ----> I have never given a Reviewed-by tag for this commit <----
> 
> It's true I've given my tag for an older version [1] of this one,
> which was *not*
> using atomic_* callbacks and that one worked fine (which is why I
> gave you
> my R-b tag for it).
> 
> You have changed commits in this series to use atomic_(pre_)enable
> callbacks
> but kept my tag, which is seriously wrong - and even more, because
> it's actually
> breaking display support for a generous number of Chromebooks
> upstream.
> 
> 
> Please be careful next time and ask for a new review when you make
> substantial
> changes to your commits.
> 
> 
> Anyway, I have already sent a fix for this situation, please look at
> [2].
> 
> Regards,
> Angelo
> 
> [1]: 
> 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/1649644308-8455-3-git-send-email-xinlei.lee@mediatek.com/__;!!CTRNKA9wMg0ARbw!w_fzKvfOShPFrK2vYxBTHs_hi6kORmXAKzNeFORzxRKuNfk8_8Ogvf3h4bPwfjmukw$
>  
> 
> [2]: 
> 
https://lore.kernel.org/lkml/20220721172727.14624-1-angelogioacchino.delregno@collabora.com/T/#u
> 
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dsi.c | 53 +++++++++++++++++++----
> > -------
> >   1 file changed, 34 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index f880136cec09..d9a6b928dba8 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -691,16 +691,6 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > *dsi)
> >   	if (--dsi->refcount != 0)
> >   		return;
> >   
> > -	/*
> > -	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> > -	 * mtk_dsi_stop() should be called after
> > mtk_drm_crtc_atomic_disable(),
> > -	 * which needs irq for vblank, and mtk_dsi_stop() will disable
> > irq.
> > -	 * mtk_dsi_start() needs to be called in
> > mtk_output_dsi_enable(),
> > -	 * after dsi is fully set.
> > -	 */
> > -	mtk_dsi_stop(dsi);
> > -
> > -	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
> >   	mtk_dsi_reset_engine(dsi);
> >   	mtk_dsi_lane0_ulp_mode_enter(dsi);
> >   	mtk_dsi_clk_ulp_mode_enter(dsi);
> > @@ -715,17 +705,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > *dsi)
> >   
> >   static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> >   {
> > -	int ret;
> > -
> >   	if (dsi->enabled)
> >   		return;
> >   
> > -	ret = mtk_dsi_poweron(dsi);
> > -	if (ret < 0) {
> > -		DRM_ERROR("failed to power on dsi\n");
> > -		return;
> > -	}
> > -
> >   	mtk_dsi_set_mode(dsi);
> >   	mtk_dsi_clk_hs_mode(dsi, 1);
> >   
> > @@ -739,7 +721,16 @@ static void mtk_output_dsi_disable(struct
> > mtk_dsi *dsi)
> >   	if (!dsi->enabled)
> >   		return;
> >   
> > -	mtk_dsi_poweroff(dsi);
> > +	/*
> > +	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> > +	 * mtk_dsi_stop() should be called after
> > mtk_drm_crtc_atomic_disable(),
> > +	 * which needs irq for vblank, and mtk_dsi_stop() will disable
> > irq.
> > +	 * mtk_dsi_start() needs to be called in
> > mtk_output_dsi_enable(),
> > +	 * after dsi is fully set.
> > +	 */
> > +	mtk_dsi_stop(dsi);
> > +
> > +	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
> >   
> >   	dsi->enabled = false;
> >   }
> > @@ -776,13 +767,37 @@ static void
> > mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> >   {
> >   	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> >   
> > +	if (dsi->refcount == 0)
> > +		return;
> > +
> >   	mtk_output_dsi_enable(dsi);
> >   }
> >   
> > +static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge
> > *bridge,
> > +					     struct drm_bridge_state
> > *old_bridge_state)
> > +{
> > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > +	int ret;
> > +
> > +	ret = mtk_dsi_poweron(dsi);
> > +	if (ret < 0)
> > +		DRM_ERROR("failed to power on dsi\n");
> > +}
> > +
> > +static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge
> > *bridge,
> > +					       struct drm_bridge_state
> > *old_bridge_state)
> > +{
> > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > +
> > +	mtk_dsi_poweroff(dsi);
> > +}
> > +
> >   static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
> >   	.attach = mtk_dsi_bridge_attach,
> >   	.atomic_disable = mtk_dsi_bridge_atomic_disable,
> >   	.atomic_enable = mtk_dsi_bridge_atomic_enable,
> > +	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
> > +	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
> >   	.mode_set = mtk_dsi_bridge_mode_set,
> >   };
> >   

Hi Angelo:

I am deeply sorry for the problems caused by this patch. 
I understand what you said. If there are substantial changes, I will 
re-request for review. Thank you again for your help.

Best Regards!
xinlei


