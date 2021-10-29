Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B209C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 05:33:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E15806108F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 05:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E15806108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U09r4PtCcvQAPoUiZNV3ov0c86+e+vz5bLtP61Qx17E=; b=EVG4cuHwH0dFCc
	38mjdRQclotqw6wiAb/lToVkxD+eMu7uxHV2lcjjfZ1mcGq2iuwt+Z0zlw9K8E6usr4NJISYTKyFQ
	fbiCiZta9iI4GQJEZ1P1tWA5boQ4TaQaH+/4QCKprILO4wwPi7p0yn3tRnrrXGAfZJNpx74Fv5wzi
	yhJhQ6MaDCyCRa35FIlChit6P7njp0q2d6IbZiIToOM7U9z46rVwUqd2QV3xdh806fN030KrjtmR0
	QBfI3UYkCqfa6ssPKGSHGhHejM6Ts4tsIBM7F/AK6z8U+LpSNcyxiNNBKJNgekuXpaEOuodKFmlt+
	/0MFrHYLMxKZihxLA5zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgKWL-009rOu-Vk; Fri, 29 Oct 2021 05:33:41 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgKWK-009rN8-1j
 for linux-mediatek@lists.infradead.org; Fri, 29 Oct 2021 05:33:41 +0000
Received: by mail-io1-xd33.google.com with SMTP id n67so11166725iod.9
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Oct 2021 22:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FReYOopH02D5COr/NffWZKd+wG9WfCzdcsCckINuOIg=;
 b=I/Y64zF/ZpuDtCvP7DXWwJDekequNVZ0j0qyEbOjPZjY6DZgEJ+OeniAVKShH5FZGz
 WjO8IYnAq4i1OFMbDK1L3gz+P/TaKI8Xa+xZyUj7gNBpQm7wD/K0q1oJ9ehrzTCxdCjE
 O8ZEzctOgSVLLPg2CqXubJ8rei5qxnvHBLlvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FReYOopH02D5COr/NffWZKd+wG9WfCzdcsCckINuOIg=;
 b=LBlRRvZD2AKAQfSw+vyRo57JuCPLnv2xx+0TG53RjUYu9QdYYD4cXWG/7hVyaQVpia
 sKw3E/Yu13IBFFtfRTIUhK0cLpfu1/c6cht9zg3MEQ/KYT89qSdjtMQy8EQRnuYG+xAs
 0vQpX6zYEbHV2OpC22tCBHLW9C+vRK4rHhYSEzByEC/91JJDw6KjSqRAFAS7wUvDYapm
 PyEY6m3C4Qmh4Lo80texBzS8XXtj+bZVfJuJ9/mxi/0Qkd+PfmEscmOfzjFGZRhXk5Fv
 5o2yxrxVNos7j8zBAVftcGNVlV3GF8tbNSTCtgxp+WuWHQxO9iRqpF8HoUpoDdn2HuC+
 4iVw==
X-Gm-Message-State: AOAM533AZWkAarZn1MFU6HBUkmud4go9VGYASNND5WnS1LnZ71Bxl21K
 m6XXkQtl3V5AB5IU9WQdFEc5JQbcl2kbig==
X-Google-Smtp-Source: ABdhPJwkrsjuKanKBSqdpwM64Vowcuzb1ypE2Ul3wTEG2in5gWif4jSRvKqhqK+/2k15HgPrZUD2lQ==
X-Received: by 2002:a05:6602:3d3:: with SMTP id
 g19mr6698212iov.42.1635485610702; 
 Thu, 28 Oct 2021 22:33:30 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53])
 by smtp.gmail.com with ESMTPSA id h1sm2823130iow.12.2021.10.28.22.33.29
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 22:33:29 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id q127so10155217iod.12
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Oct 2021 22:33:29 -0700 (PDT)
X-Received: by 2002:a05:6638:12cd:: with SMTP id
 v13mr6826768jas.84.1635485608849; 
 Thu, 28 Oct 2021 22:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211028101912.4624-1-jason-jh.lin@mediatek.com>
 <20211028101912.4624-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20211028101912.4624-4-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 29 Oct 2021 13:32:53 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhCD-mG-5grj5s3c7NJF1nt=V3v4FN=MvZe2ZMkP9z5_A@mail.gmail.com>
Message-ID: <CAC=S1nhCD-mG-5grj5s3c7NJF1nt=V3v4FN=MvZe2ZMkP9z5_A@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] drm/mediatek: Detect CMDQ execution timeout
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
X-CRM114-CacheID: sfid-20211028_223340_122750_F3AD9EED 
X-CRM114-Status: GOOD (  23.30  )
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

On Thu, Oct 28, 2021 at 6:19 PM jason-jh.lin <jason-jh.lin@mediatek.com> wrote:
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
Reviewed-by: Fei Shao <fshao@chromium.org>



> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index e23e3224ac67..a368cbc18923 100644
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
> +       else if (--mtk_crtc->cmdq_vblank_cnt == 0)
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
