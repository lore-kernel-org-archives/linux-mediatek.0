Return-Path: <SRS0=+oxs=ZK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9C8C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2019 09:34:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEDFC20727
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2019 09:34:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EKFodG53";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W6V9SCS3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEDFC20727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKVApYHinoYCo6dBdNG7MgW10cv9/wkjWh/tUjia1cY=; b=EKFodG53/THRet
	CKA206FS4jjq7egi8Les4EmQMuVQcGcoG6+VkNlAEoDXripygnl08xA72k+2u3SOMdiizssV0M28+
	s0wWdTx7U1Cj/vSEkEwR7qDA8SShtklQEWCClGoKEkDhSlp+uM1R+ptS47U9C8HShaf0sVHs1V1Oe
	zSl2ACrkKVJCQdDurQekqDTMhsk50dYHPU5jnNYEPIECOlJpdOImI1aba7qOa+eRvHfqrDplLfYn0
	aytDCvoI5u0rsaydlSC2VpyQp4dgfM0skEIOHbxarnABPCFCOAYKHvlI3/ahqZQQWVOSnHhxwEPBR
	w6n0P814L7UMSLAriBgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWdQm-0002V4-HG; Mon, 18 Nov 2019 09:34:48 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWdQh-0002Tw-Rn
 for linux-mediatek@lists.infradead.org; Mon, 18 Nov 2019 09:34:46 +0000
Received: by mail-il1-x141.google.com with SMTP id n18so15362450ilt.9
 for <linux-mediatek@lists.infradead.org>; Mon, 18 Nov 2019 01:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lr/4E5ZW9jz9oShySXGCc5V6Txdcr0g9QJ5gIXifIGk=;
 b=W6V9SCS3NzD7+ytXHksdvuTMYaJofAh3nWAX40damlaaJWjWjZHtQ+k6ikYy6z6QM1
 VHwrlguvhMqY7NmZM9gTooG0Z9XHILEXYgbysYUT6DYzcl/XH1wIjioMeK/75YCyLtb/
 aUi3Yq3X/P9iXf6Kg85iW+swL8ttWmJ0SlonE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lr/4E5ZW9jz9oShySXGCc5V6Txdcr0g9QJ5gIXifIGk=;
 b=kzvoiK3XQM2xEBV/q0A8XeSO9qcHMpv058hAvCLdoh0HYl16V2OkYmnbkvaup6blEm
 7H+c1NviCWsUgNOZufB+G1a0uPO5eGYplT+bGF90uC6yO9IB2AOtrWBYuWkYs7IiQf+g
 BTIwn3a3TQUQBKWgquqnZFJicVsR3UlRgEfQEGKZ54xTDjGhKO4WrEJ+/TUeydBZwokf
 3Zsd7uepURFwZvD1vSghp2gIGYybLwCINv8pV4bpEJcR7NVbSMYnQpNx+vz1rSGIqoFT
 zF3QclnEza9t/Szm+VuAClVd57EiIK2E9PDdLwRTGFrHwl+/cqFkcm6TPug1eYY0ERE8
 2Ksg==
X-Gm-Message-State: APjAAAVef7FcP5iCsCymzVWGFP36e+yw/Y0ltKcqwlt83o0LCuo65FMc
 LPg1920vlw4UtXC0DXDlDPFlcmuqfvwEbkVOUscz5g==
X-Google-Smtp-Source: APXvYqxLrh5aVv3p0xE1Cuv2M9Lu4EqPeULGldZRnOqi6Hjy+4RMLF1tR9vxtOQ6RJa0zB6OkWOb0ZxRDT43EqGIS1Q=
X-Received: by 2002:a92:d608:: with SMTP id w8mr14471824ilm.308.1574069682145; 
 Mon, 18 Nov 2019 01:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20190830074103.16671-1-bibby.hsieh@mediatek.com>
 <20190830074103.16671-3-bibby.hsieh@mediatek.com>
In-Reply-To: <20190830074103.16671-3-bibby.hsieh@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 18 Nov 2019 17:34:16 +0800
Message-ID: <CAJMQK-ir=8ukNZw8XN=prLuh3znjbjNszVB=dcDxa_bVnFwVAQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mediatek: Apply CMDQ control flow
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_013443_925598_3350464C 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, tfiga@chromium.org,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Aug 30, 2019 at 7:41 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:

> @@ -405,26 +458,69 @@ void mtk_drm_crtc_cursor_update(struct drm_crtc *crtc, struct drm_plane *plane,
>                 return;
>
>         mutex_lock(&priv->hw_lock);
> -       plane_helper_funcs->atomic_update(plane, plane_state);
> -       for (i = 0; i < mtk_crtc->layer_nr; i++) {
> -               struct drm_plane *plane = &mtk_crtc->planes[i];
> -               struct mtk_plane_state *plane_state;
> +       if (IS_ENABLED(CONFIG_MTK_CMDQ) && mtk_crtc->cmdq_client) {
> +               struct mtk_crtc_state *mtk_crtc_state =
> +                               to_mtk_crtc_state(crtc->state);
> +               struct mtk_cmdq_cb_data *cb_data;
> +
> +               mtk_crtc_state->cmdq_handle =
> +                               cmdq_pkt_create(mtk_crtc->cmdq_client,
> +                                               PAGE_SIZE);
> +               cmdq_pkt_clear_event(mtk_crtc_state->cmdq_handle,
> +                                    mtk_crtc->cmdq_event);
> +               cmdq_pkt_wfe(mtk_crtc_state->cmdq_handle, mtk_crtc->cmdq_event);
> +               plane_helper_funcs->atomic_update(plane, plane_state);
> +               cb_data = kmalloc(sizeof(*cb_data), GFP_KERNEL);
Check kmalloc failure?
> +               cb_data->cmdq_handle = mtk_crtc_state->cmdq_handle;
> +               cmdq_pkt_flush_async(mtk_crtc_state->cmdq_handle,
> +                                    ddp_cmdq_cursor_cb, cb_data);

> @@ -494,13 +599,29 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>                                       struct drm_crtc_state *old_crtc_state)
>  {
>         struct drm_atomic_state *old_atomic_state = old_crtc_state->state;
> +       struct drm_crtc_state *crtc_state = crtc->state;
> +       struct mtk_crtc_state *state = to_mtk_crtc_state(crtc_state);
> +       struct cmdq_pkt *cmdq_handle = state->cmdq_handle;
>         struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>         struct mtk_drm_private *priv = crtc->dev->dev_private;
> +       struct mtk_cmdq_cb_data *cb_data;
>         unsigned int pending_planes = 0;
>         int i;
>
> -       if (mtk_crtc->event)
> -               mtk_crtc->pending_needs_vblank = true;
> +       DRM_DEBUG_DRIVER("[CRTC:%u] [STATE:%p(%p)->%p(%p)]\n", crtc->base.id,
> +                        old_crtc_state, old_crtc_state->state,
> +                        crtc_state, crtc_state->state);
> +
> +       if (IS_ENABLED(CONFIG_MTK_CMDQ) && mtk_crtc->cmdq_client) {
> +               drm_atomic_state_get(old_atomic_state);
> +               cb_data = kmalloc(sizeof(*cb_data), GFP_KERNEL);
Check kmalloc failure?
> +               cb_data->state = old_crtc_state;
> +               cb_data->cmdq_handle = cmdq_handle;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
