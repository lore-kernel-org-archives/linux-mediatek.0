Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85C2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 07:12:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E07B6187A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 07:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E07B6187A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5LshohrpTaPHViFqHK0Pfav8AJhaD0VkRXm8FyAsTw=; b=x4mArYpSOeRcDj
	a3peJus/bMxbUrKuQD2CbwRDodBNixEUrGqPvNrf5TdvgrzHg01HRP3m48sxeFZyL5av/6I111PJK
	KKcRJggZ+QgnPc6bzJLUOk6FY5V6d9X6AaslmAyuHNBTtWAnHXHp7AzMcPwGnW3Raix6VohYTFD1U
	haOpMwThdA7gAlxftP6XPg9jQ1qNGZjVNNlzHV1PVRNKpvZg2Um9aKBfTI67v8rkQP0Cw/qVXa1kI
	sKIy8ocL5iZeMrS24HHwn/g/Hw2hJ0y52J4FWQLU7uQPgMA+Fu84A1q58wG1ikgbcGU93zDqFPl4D
	E90NIMICUG3GCq/9g5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVqEq-00D9mb-Vw; Thu, 30 Sep 2021 07:12:17 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVqEn-00D9li-Mc; Thu, 30 Sep 2021 07:12:15 +0000
Received: by mail-ot1-x336.google.com with SMTP id
 e66-20020a9d2ac8000000b0054da8bdf2aeso3898283otb.12; 
 Thu, 30 Sep 2021 00:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lOF0Y3JDOZxaPj0QJbgX2uoE9MrCbAvitKZF6bLpjNQ=;
 b=YokCmknuZngbxHSpDu3yu75O7oK5XAWdoQe+4Z8MMpo9d1xn1brIq1oEA8cFAf6iMa
 qwoZfqP95XSlbsCQryxFXlQto+QlSQBDIsHgi7VTqHhnOmGL+kdR/U+hmBnY9sQ0q/++
 1s3JW67W+P/Xj/LU1+MOiyHAJri80EANOedKGWpIU1vGJ2OVkV/I6z1XbQG11PsNP8ex
 1JZKWYSWMWNR6BtKuaoWOiCc1Er/LBCH2lUZbCtibU3NwbXlG/e9VzrGLFk37nt4UgtO
 zV9NM7ahoEurx9gLWvoier/uQ/v8Cnv07R+3YL6ffM10i5cR6chOPQq3cUiZR4BO1SVm
 a59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lOF0Y3JDOZxaPj0QJbgX2uoE9MrCbAvitKZF6bLpjNQ=;
 b=0LuifwpbTGKjGs9xuj2avs16aiiQJrrS0TBR8zVI2sXm45wb6miBdWZyULsQvmExD9
 Gg7/fOFWwdOqLeoposElHCiuq6jjUtzqczcYgC/O9+sRnVj22STnog2XN0oht3wUPWep
 h5TFd+L+NyI62ew0+YnTTNB8Yci4uHyzCmVxflhoqX1m7xKOgcrD7sgMXke+CnSIWF/8
 k1qLsJkMNhWIGHjhgNS1RBGKrVkDQEJGvmkDPz0yRsu9EyjkgBkcZ66UNSQtXFtWvdTY
 y5T2KTcwRlYVrkxoK+w+q9AY0LCbvfyOvvSk2xJEJPn4ysH/eRwHtdXax24YYG/3AFTR
 QyOA==
X-Gm-Message-State: AOAM532HHPzeOhA+6DlrBLzwH8xQ3nQ/WodXt3P+xQOd0Ey+CBkl0gCA
 fTSkbTmHkVnzZuw/tFVvCffEpKOCq0ePnqzAJPw=
X-Google-Smtp-Source: ABdhPJwmaxs1k8CqJXEC195drKP2OOxFUscJlxxZkQjpoiTP30zgDTZBaODF6yU0VbjXwQ5JqZHRtEmmEpXkcObyhww=
X-Received: by 2002:a9d:173:: with SMTP id 106mr4063274otu.150.1632985932786; 
 Thu, 30 Sep 2021 00:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210930024704.6966-1-jason-jh.lin@mediatek.com>
 <20210930024704.6966-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20210930024704.6966-2-jason-jh.lin@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 30 Sep 2021 09:12:01 +0200
Message-ID: <CAFqH_52w787DGbVE0WqMjA2y8Psw6XDMp8AFhj=7UMyCA-uv+g@mail.gmail.com>
Subject: Re: [v2 PATCH 1/3] drm/mediatek: Fix crash at using pkt->cl->chan in
 cmdq_pkt_finalize
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 fshao@chromium.org, 
 "Nancy.Lin" <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_001213_770346_0AA48EFC 
X-CRM114-Status: GOOD (  26.93  )
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

Hi Jason,


Missatge de jason-jh.lin <jason-jh.lin@mediatek.com> del dia dj., 30
de set. 2021 a les 4:47:
>
> Because mtk_drm_crtc_create_pkt didn't assign pkt->cl, it will
> crash at using pkt->cl->chan in cmdq_pkt_finalize.
>
> So add struct cmdq_client and let mtk_drm_crtc instance define
> cmdq_client as:
>
> struct mtk_drm_crtc {
>         /* client instance data */
>         struct cmdq_client cmdq_client;
> };
>
> and in rx_callback function can use pkt->cl to get
> struct cmdq_client.
>
> Fixes: f4be17cd5b14 ("drm/mediatek: Remove struct cmdq_client")

Looking at this patchset looks like you're fixing the above commit by
reintroducing the 'struct cmdq_client' again, which makes the above
commit as a non-sense commit. That's confusing and not clear. I'm
wondering if it wouldn't be more clear if you can just revert that
patch. Then if there are more changes that need to be done do it with
a follow up patch and really explain why these changes are needed.

Thanks,
  Enric


> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 73 +++++++++++++------------
>  1 file changed, 38 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 5f81489fc60c..411d99fcbb8f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -52,8 +52,7 @@ struct mtk_drm_crtc {
>         bool                            pending_async_planes;
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -       struct mbox_client              cmdq_cl;
> -       struct mbox_chan                *cmdq_chan;
> +       struct cmdq_client              cmdq_client;
>         struct cmdq_pkt                 cmdq_handle;
>         u32                             cmdq_event;
>         u32                             cmdq_vblank_cnt;
> @@ -227,8 +226,8 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
>  }
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cmdq_pkt *pkt,
> -                                   size_t size)
> +static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
> +                                  size_t size)
>  {
>         struct device *dev;
>         dma_addr_t dma_addr;
> @@ -239,8 +238,9 @@ static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cmdq_pkt *pkt,
>                 return -ENOMEM;
>         }
>         pkt->buf_size = size;
> +       pkt->cl = (void *)client;
>
> -       dev = chan->mbox->dev;
> +       dev = client->chan->mbox->dev;
>         dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
>                                   DMA_TO_DEVICE);
>         if (dma_mapping_error(dev, dma_addr)) {
> @@ -255,9 +255,11 @@ static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cmdq_pkt *pkt,
>         return 0;
>  }
>
> -static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan, struct cmdq_pkt *pkt)
> +static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
>  {
> -       dma_unmap_single(chan->mbox->dev, pkt->pa_base, pkt->buf_size,
> +       struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
> +
> +       dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
>                          DMA_TO_DEVICE);
>         kfree(pkt->va_base);
>         kfree(pkt);
> @@ -265,8 +267,9 @@ static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan, struct cmdq_pkt *pk
>
>  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>  {
> -       struct mtk_drm_crtc *mtk_crtc = container_of(cl, struct mtk_drm_crtc, cmdq_cl);
>         struct cmdq_cb_data *data = mssg;
> +       struct cmdq_client *cmdq_cl = container_of(cl, struct cmdq_client, client);
> +       struct mtk_drm_crtc *mtk_crtc = container_of(cmdq_cl, struct mtk_drm_crtc, cmdq_client);
>         struct mtk_crtc_state *state;
>         unsigned int i;
>
> @@ -299,7 +302,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>         }
>
>         mtk_crtc->cmdq_vblank_cnt = 0;
> -       mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
> +       mtk_drm_cmdq_pkt_destroy(data->pkt);
>  }
>  #endif
>
> @@ -550,24 +553,24 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
>                 mtk_mutex_release(mtk_crtc->mutex);
>         }
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -       if (mtk_crtc->cmdq_chan) {
> -               mbox_flush(mtk_crtc->cmdq_chan, 2000);
> +       if (mtk_crtc->cmdq_client.chan) {
> +               mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
>                 cmdq_handle->cmd_buf_size = 0;
>                 cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
>                 cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
>                 mtk_crtc_ddp_config(crtc, cmdq_handle);
>                 cmdq_pkt_finalize(cmdq_handle);
> -               dma_sync_single_for_device(mtk_crtc->cmdq_chan->mbox->dev,
> -                                           cmdq_handle->pa_base,
> -                                           cmdq_handle->cmd_buf_size,
> -                                           DMA_TO_DEVICE);
> +               dma_sync_single_for_device(mtk_crtc->cmdq_client.chan->mbox->dev,
> +                                          cmdq_handle->pa_base,
> +                                          cmdq_handle->cmd_buf_size,
> +                                          DMA_TO_DEVICE);
>                 /*
>                  * CMDQ command should execute in next vblank,
>                  * If it fail to execute in next 2 vblank, timeout happen.
>                  */
>                 mtk_crtc->cmdq_vblank_cnt = 2;
> -               mbox_send_message(mtk_crtc->cmdq_chan, cmdq_handle);
> -               mbox_client_txdone(mtk_crtc->cmdq_chan, 0);
> +               mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle);
> +               mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
>         }
>  #endif
>         mtk_crtc->config_updating = false;
> @@ -581,7 +584,7 @@ static void mtk_crtc_ddp_irq(void *data)
>         struct mtk_drm_private *priv = crtc->dev->dev_private;
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -       if (!priv->data->shadow_register && !mtk_crtc->cmdq_chan)
> +       if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
>                 mtk_crtc_ddp_config(crtc, NULL);
>         else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank_cnt == 0)
>                 DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
> @@ -924,20 +927,20 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>         mutex_init(&mtk_crtc->hw_lock);
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -       mtk_crtc->cmdq_cl.dev = mtk_crtc->mmsys_dev;
> -       mtk_crtc->cmdq_cl.tx_block = false;
> -       mtk_crtc->cmdq_cl.knows_txdone = true;
> -       mtk_crtc->cmdq_cl.rx_callback = ddp_cmdq_cb;
> -       mtk_crtc->cmdq_chan =
> -                       mbox_request_channel(&mtk_crtc->cmdq_cl,
> -                                             drm_crtc_index(&mtk_crtc->base));
> -       if (IS_ERR(mtk_crtc->cmdq_chan)) {
> +       mtk_crtc->cmdq_client.client.dev = mtk_crtc->mmsys_dev;
> +       mtk_crtc->cmdq_client.client.tx_block = false;
> +       mtk_crtc->cmdq_client.client.knows_txdone = true;
> +       mtk_crtc->cmdq_client.client.rx_callback = ddp_cmdq_cb;
> +       mtk_crtc->cmdq_client.chan =
> +                       mbox_request_channel(&mtk_crtc->cmdq_client.client,
> +                                            drm_crtc_index(&mtk_crtc->base));
> +       if (IS_ERR(mtk_crtc->cmdq_client.chan)) {
>                 dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
>                         drm_crtc_index(&mtk_crtc->base));
> -               mtk_crtc->cmdq_chan = NULL;
> +               mtk_crtc->cmdq_client.chan = NULL;
>         }
>
> -       if (mtk_crtc->cmdq_chan) {
> +       if (mtk_crtc->cmdq_client.chan) {
>                 ret = of_property_read_u32_index(priv->mutex_node,
>                                                  "mediatek,gce-events",
>                                                  drm_crtc_index(&mtk_crtc->base),
> @@ -945,17 +948,17 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>                 if (ret) {
>                         dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
>                                 drm_crtc_index(&mtk_crtc->base));
> -                       mbox_free_channel(mtk_crtc->cmdq_chan);
> -                       mtk_crtc->cmdq_chan = NULL;
> +                       mbox_free_channel(mtk_crtc->cmdq_client.chan);
> +                       mtk_crtc->cmdq_client.chan = NULL;
>                 } else {
> -                       ret = mtk_drm_cmdq_pkt_create(mtk_crtc->cmdq_chan,
> -                                                      &mtk_crtc->cmdq_handle,
> -                                                      PAGE_SIZE);
> +                       ret = mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_client,
> +                                                     &mtk_crtc->cmdq_handle,
> +                                                     PAGE_SIZE);
>                         if (ret) {
>                                 dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
>                                         drm_crtc_index(&mtk_crtc->base));
> -                               mbox_free_channel(mtk_crtc->cmdq_chan);
> -                               mtk_crtc->cmdq_chan = NULL;
> +                               mbox_free_channel(mtk_crtc->cmdq_client.chan);
> +                               mtk_crtc->cmdq_client.chan = NULL;
>                         }
>                 }
>         }
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
