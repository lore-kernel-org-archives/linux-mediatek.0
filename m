Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C72C6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoLWcmvp+RvSPkYWvItSPxsdfZmwp4ei8jd4nndeSm4=; b=359ANYJZY2+apQKQxZPK5lMeMf
	KLxIZ0UM6v1yfg2SkGGUCl+2LOMq2Ie2gtEW6qrM3z4hQASWE5fFWRlDdIY6hTCxl0XLgCbj+dt8U
	culSf1mOQgbWPuunCAEf65coBRiBui0wJb8UDZdTQ+saw6nZgAIyd6Ias9racTYdzumOj1I/MpmYe
	84fNilTjdzlq59VUErynmmDnbgQcRM8VmW8g41PrXsFWETVObSugmOA5IamssYCMSbhXQfP2S0RWu
	NqEsD2Glqpmf58pCKurRYI03R4w3aNapSDv7V6qICiCWM0IN1JCGe9iJByOqqTMwfDurNSLvQ1ZD4
	taJV4YTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjtW-003MDh-8h; Mon, 26 Sep 2022 08:55:18 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjtL-003M9B-16
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 08:55:08 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-350cb1c0abaso24006737b3.9
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 01:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ZoLWcmvp+RvSPkYWvItSPxsdfZmwp4ei8jd4nndeSm4=;
        b=fnU9TxGggwpHc3T3uIe210n82Vcbi+qzwEcDkWWdKjNEJgkbn4+v80fy64yIZLdO8D
         dXHRV2sA5XLQ2QbB0p518iCdO2jir+aFivdx99VQHc4yQ43MT4buGb+2LeNC/aXEGKCI
         5w/I6mF4LRDcMV61XFU5CPzF20kbXCMCeAR34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ZoLWcmvp+RvSPkYWvItSPxsdfZmwp4ei8jd4nndeSm4=;
        b=a9dPA1Ne1LrY6LCDgs6duKYIAtr4AqGqahdELRFbRskOnHnxWTxW7DF/DLp0R0f9X+
         4xzQUnZQi3Vhn7iU1TOinHXxv5qqEOx/E2WuYtq2wZJtEaRzBXLbVyNFTqkAyV8pZ+TH
         9e4jeJ9Lh+NUeOqraoMsgweiNsqI8f2B1AzgaQtoCJU7fyBTmvvYS8pVyPtxA5bJvMiT
         Qc4kq+qFYQh8rvMbuOmdunKgi+rTDVUvnoujG0abGdtlbPADXyJ4BO9Z2piMFxVnK1uu
         jESpHY9bsmODRagLN3uh760DdO9RqUjwFPnQUUYWRARf2KKtEYJ7qRYSONt0hiW19OVk
         y3qw==
X-Gm-Message-State: ACrzQf1n09YAkENk+yLRL4UWUGCpAryWuvQxno+9or5UjfzQk7HbtMxs
	50D7F17XARdvj80DAqeiMIHcb6WPlGhlXH5IvXaYvQ==
X-Google-Smtp-Source: AMsMyM4FyTbskSDbEOFQfTU3e4rqIm/BNqsWAkbka54SngLa+fcV7DQivhjU5/iMPqlHA6WwRq1U6B/s4XBrlc3ofSQ=
X-Received: by 2002:a81:4995:0:b0:350:b1ac:891f with SMTP id
 w143-20020a814995000000b00350b1ac891fmr6363214ywa.263.1664182502779; Mon, 26
 Sep 2022 01:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220926083511.3382-1-yongqiang.niu@mediatek.com>
In-Reply-To: <20220926083511.3382-1-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 26 Sep 2022 16:54:36 +0800
Message-ID: <CAJMQK-jQiJTdeY-AYEjzT=LtwGkEffc+PfRkOs6_VF1MTZ10OA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: mtk-cmdq: fix gce timeout issue
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_015507_150137_AABC1191 
X-CRM114-Status: GOOD (  35.27  )
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

On Mon, Sep 26, 2022 at 4:35 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
Please include v3 in the title and add change logs next time.


> 1. enable gce ddr enable(gce reigster offset 0x48, bit 16 to 18) when gce work,
> and disable gce ddr enable when gce work job done
> 2. split cmdq clk enable/disable api, and control gce ddr enable/disable
> in clk enable/disable function to make sure it could protect when cmdq
> is multiple used by display and mdp
>
> this is only for some SOC which has flag "control_by_sw".
> for this kind of gce, there is a handshake flow between gce and ddr
> hardware,
> if not set ddr enable flag of gce, ddr will fall into idle mode,
> then gce instructions will not process done.
> we need set this flag of gce to tell ddr when gce is idle or busy
> controlled by software flow.
>
> ddr problem is a special case.
> when test suspend/resume case, gce sometimes will pull ddr, and ddr can
> not go to suspend.
> if we set gce register 0x48 to 0x7, will fix this gce pull ddr issue,
> as you have referred [1] and [2] (8192 and 8195)
> but for mt8186, the gce is more special, except setting of [1] and [2],
> we need add more setting set gce register 0x48 to (0x7 << 16 | 0x7)
> when gce working to make sure gce could process all instructions ok.
> this case just need normal bootup, if we not set this, display cmdq
> task will timeout, and chrome homescreen will always black screen.
>
> and with this patch, we have done these test on mt8186:
> 1.suspend/resume
> 2.boot up to home screen
> 3.playback video with youtube.
>
> suspend issue is special gce hardware issue, gce client  driver
> command already process done, but gce still pull ddr.
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 68 +++++++++++++++++++++++++++---
>  1 file changed, 63 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 9465f9081515..bd63773b05fd 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -38,6 +38,8 @@
>  #define CMDQ_THR_PRIORITY              0x40
>
>  #define GCE_GCTL_VALUE                 0x48
> +#define GCE_CTRL_BY_SW                         GENMASK(18, 16)
> +#define GCE_DDR_EN                             GENMASK(2, 0)
>
>  #define CMDQ_THR_ACTIVE_SLOT_CYCLES    0x3200
>  #define CMDQ_THR_ENABLED               0x1
> @@ -80,16 +82,60 @@ struct cmdq {
>         bool                    suspended;
>         u8                      shift_pa;
>         bool                    control_by_sw;
> +       bool                    sw_ddr_en;
>         u32                     gce_num;
> +       atomic_t                usage;
> +       spinlock_t              lock;
>  };
>
>  struct gce_plat {
>         u32 thread_nr;
>         u8 shift;
>         bool control_by_sw;
> +       bool sw_ddr_en;
>         u32 gce_num;
>  };
>
> +static s32 cmdq_clk_enable(struct cmdq *cmdq)
> +{
> +       s32 usage, ret;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&cmdq->lock, flags);
> +
> +       usage = atomic_inc_return(&cmdq->usage);
> +
> +       ret = clk_bulk_enable(cmdq->gce_num, cmdq->clocks);
> +       if (usage <= 0 || ret < 0) {
> +               dev_err(cmdq->mbox.dev, "ref count %d ret %d suspend %d\n",
> +                       usage, ret, cmdq->suspended);
> +       } else if (usage == 1) {
> +               if (cmdq->sw_ddr_en)
> +                       writel(GCE_DDR_EN + GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
> +       }
> +
> +       spin_unlock_irqrestore(&cmdq->lock, flags);
> +
> +       return ret;
> +}
> +
> +static void cmdq_clk_disable(struct cmdq *cmdq)
> +{
> +       s32 usage;
> +
> +       usage = atomic_dec_return(&cmdq->usage);
> +
> +       if (usage < 0) {
> +               dev_err(cmdq->mbox.dev, "ref count %d suspend %d\n",
> +                       usage, cmdq->suspended);
> +       } else if (usage == 0) {
> +               if (cmdq->sw_ddr_en)
> +                       writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
> +       }
> +
> +       clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> +}
> +
>  u8 cmdq_get_shift_pa(struct mbox_chan *chan)
>  {
>         struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
> @@ -266,7 +312,8 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
>
>         if (list_empty(&thread->task_busy_list)) {
>                 cmdq_thread_disable(cmdq, thread);
> -               clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> +
> +               cmdq_clk_disable(cmdq);
>         }
>  }
>
> @@ -355,8 +402,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
>         task->pkt = pkt;
>
>         if (list_empty(&thread->task_busy_list)) {
> -               WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
> -
> +               WARN_ON(cmdq_clk_enable(cmdq) < 0);
>                 /*
>                  * The thread reset will clear thread related register to 0,
>                  * including pc, end, priority, irq, suspend and enable. Thus
> @@ -428,7 +474,7 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
>         }
>
>         cmdq_thread_disable(cmdq, thread);
> -       clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> +       cmdq_clk_disable(cmdq);
>
>  done:
>         /*
> @@ -468,7 +514,8 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
>
>         cmdq_thread_resume(thread);
>         cmdq_thread_disable(cmdq, thread);
> -       clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> +
> +       cmdq_clk_disable(cmdq);
>
>  out:
>         spin_unlock_irqrestore(&thread->chan->lock, flags);
> @@ -543,6 +590,7 @@ static int cmdq_probe(struct platform_device *pdev)
>         cmdq->thread_nr = plat_data->thread_nr;
>         cmdq->shift_pa = plat_data->shift;
>         cmdq->control_by_sw = plat_data->control_by_sw;
> +       cmdq->sw_ddr_en = plat_data->sw_ddr_en;
>         cmdq->gce_num = plat_data->gce_num;
>         cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
>         err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
> @@ -615,6 +663,7 @@ static int cmdq_probe(struct platform_device *pdev)
>
>         WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
>
> +       spin_lock_init(&cmdq->lock);
>         cmdq_init(cmdq);
>
>         return 0;
> @@ -660,9 +709,18 @@ static const struct gce_plat gce_plat_v6 = {
>         .gce_num = 2
>  };
>
> +static const struct gce_plat gce_plat_v7 = {
> +       .thread_nr = 24,
> +       .shift = 3,
> +       .control_by_sw = true,
> +       .sw_ddr_en = true,
> +       .gce_num = 1
> +};
> +
>  static const struct of_device_id cmdq_of_ids[] = {
>         {.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_v2},
>         {.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_v3},
> +       {.compatible = "mediatek,mt8186-gce", .data = (void *)&gce_plat_v7},
>         {.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_v4},
>         {.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_v5},
>         {.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_v6},
> --
> 2.25.1
>

