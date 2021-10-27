Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15A4C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 09:32:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A67B61056
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 09:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A67B61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHAxvVczJHu7kZNaaeDYJZOehFJ8Vb9LFsYLagdimCg=; b=4MfBdOJ+pI4C47
	zh6hhDMRkXromsG0DUQUHZxp0B/fmB4+6+KQ5VMDhG4hy3Cb2J4Kxz/T1qtpy9Ude8CKh3Te2RK/v
	6P6+FZcdkr2a3b0G2qSI67JlO8C2UYU6GJTTi/0y+Pl25pKnhmtnRr3ieF5JEfhrh+tqzPWu0alig
	LV5D0Vy/3RQEBwypn28IxEe+/ncSKhQXxQvcD0+add+dNUPSwjhssWqGTEw5zDzHN9IULYEhKjpac
	b7dpPf5/S+kTHPbVYKlmQymdvhWjRU81xgTiBDg9N+Hwi8ztda8nX4BtGvzTJQmZ0a9QvvoqWctPy
	vtls7nNmndwjDgjpgx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mffIX-004Qp9-9g; Wed, 27 Oct 2021 09:32:41 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mffIK-004Qlv-Bi
 for linux-mediatek@lists.infradead.org; Wed, 27 Oct 2021 09:32:29 +0000
Received: by mail-il1-x131.google.com with SMTP id j6so2285516ila.1
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Oct 2021 02:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7XHjYTJsHtmmMad6y4D14arx8SSI4DLlQcaRHAcm09Q=;
 b=f7moHQylEHJ9KJFRrrluC9FcbdrY48H1HrCI6LgdHxR0ARIgYRHqyz3yKJ0V2VX9fB
 BwcF0KOpJmqgVmTesRjK8vGTilcFhpOBan2BWYH3k7UY1KwCLHyl7B5eekYGAAYyHCDw
 bEB8A5PuJKWeVmuFBzGeKMZO5sg7k5GTZv+uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7XHjYTJsHtmmMad6y4D14arx8SSI4DLlQcaRHAcm09Q=;
 b=ghC1Z6bDSvHVLQt9eCeNqZdKlCSvvD2WLC67nrBjDukiWpRQ2VgoKCj5eNXKTw1rbw
 gW3237SckcDv5qAlNip+7NihMz4aNxGXTPHJLXmRSfGC/Lhp8EDg0enboZR5KRJYjUVZ
 Uk9QvN3u9lw/2eghIAdWNmZW6LxCQTtiCUBMixA+ty7JaVg1wQd4uha3wwzkNVj8Evat
 4sTLhecShxS4qbsHpX6u+Ber8txj26/NXSIPd57qIU0zu4mWaapJbpF7f7W3uhLZKe8Q
 KLy4nhuLB83S3p0MYAfzzl+9EnpN7dazce7safk8FtyrvUC9M2uOMc+1s+voqQNO59bL
 rJ1Q==
X-Gm-Message-State: AOAM531It15/h+IP3fEXXQL7J2pYS8U9/QR5lM8/yP8BVBBtDdQT4etu
 odW2XhLDEON9coUc0O2njGrRmeTVBo7LGw==
X-Google-Smtp-Source: ABdhPJwlNs/fxSCnsSdpRCmysTjKpp6D5WEBkqUGJ6g/CpkIo5GnOy61SDLhzynKTaOQUdiA9klZ/Q==
X-Received: by 2002:a05:6e02:20eb:: with SMTP id
 q11mr16997453ilv.70.1635327146748; 
 Wed, 27 Oct 2021 02:32:26 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id e11sm8857269ils.34.2021.10.27.02.32.25
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 02:32:26 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id w15so2255290ilv.5
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Oct 2021 02:32:25 -0700 (PDT)
X-Received: by 2002:a05:6e02:1747:: with SMTP id
 y7mr18329876ill.95.1635327145411; 
 Wed, 27 Oct 2021 02:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211027021857.20816-1-jason-jh.lin@mediatek.com>
 <20211027021857.20816-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20211027021857.20816-4-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 27 Oct 2021 17:31:49 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng2=XRV9s2t2dxQf1a2V2GsFwhfB8tRxnNDp-QD5eR_xQ@mail.gmail.com>
Message-ID: <CAC=S1ng2=XRV9s2t2dxQf1a2V2GsFwhfB8tRxnNDp-QD5eR_xQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/mediatek: Detect CMDQ execution timeout
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, hsinyi@chromium.org, nancy.lin@mediatek.com, 
 singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_023228_417015_FE6EC3F6 
X-CRM114-Status: GOOD (  23.68  )
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

On Wed, Oct 27, 2021 at 10:19 AM jason-jh.lin <jason-jh.lin@mediatek.com> wrote:
>
> From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>
> CMDQ is used to update display register in vblank period, so
> it should be execute in next 2 vblank. One vblank interrupt
> before send message (occasionally) and one vblank interrupt
> after cmdq done. If it fail to execute in next 3 vblank,
> tiemout happen.
>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index e23e3224ac67..dad1f85ee315 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -54,6 +54,7 @@ struct mtk_drm_crtc {
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>         struct cmdq_client              cmdq_client;
>         u32                             cmdq_event;
> +       u32                             cmdq_vblank_cnt;
>  #endif
>
>         struct device                   *mmsys_dev;
> @@ -227,7 +228,10 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
>  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>  {
>         struct cmdq_cb_data *data = mssg;
> +       struct cmdq_client *cmdq_cl = container_of(cl, struct cmdq_client, client);
> +       struct mtk_drm_crtc *mtk_crtc = container_of(cmdq_cl, struct mtk_drm_crtc, cmdq_client);
>
> +       mtk_crtc->cmdq_vblank_cnt = 0;
>         cmdq_pkt_destroy(data->pkt);
>  }
>  #endif
> @@ -483,6 +487,15 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
>                                            cmdq_handle->pa_base,
>                                            cmdq_handle->cmd_buf_size,
>                                            DMA_TO_DEVICE);
> +               /*
> +                * CMDQ command should execute in next 3 vblank.
> +                * One vblank interrupt before send message (occasionally)
> +                * and one vblank interrupt after cmdq done,
> +                * so it's timeout after 3 vblank interrupt.
> +                * If it fail to execute in next 3 vblank, timeout happen.
> +                */
> +               mtk_crtc->cmdq_vblank_cnt = 3;
> +
>                 mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle);
>                 mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
>         }
> @@ -499,11 +512,14 @@ static void mtk_crtc_ddp_irq(void *data)
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>         if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
> +               mtk_crtc_ddp_config(crtc, NULL);
> +       else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank_cnt == 0)
I think atomic_dec_and_test() does what you want to do here.




> +               DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
> +                         drm_crtc_index(&mtk_crtc->base));
>  #else
>         if (!priv->data->shadow_register)
> -#endif
>                 mtk_crtc_ddp_config(crtc, NULL);
> -
> +#endif
>         mtk_drm_finish_page_flip(mtk_crtc);
>  }
>
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
