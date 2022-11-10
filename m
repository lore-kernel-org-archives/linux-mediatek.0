Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F29C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 13:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTq1bXsfcVLv23q57hZ87gHICOMyypM9xWYuJN+iMbU=; b=xGIe8hiZWi1hSMbmn9+xxHW4i4
	X08DnCbsSUf4kLrZOfFU5PABA4Fceu6mrtu+tBX6iVuSItnRKVFSjeI5zfAsb1AVXNn+eoOCmQ5bv
	O7fAQeR6LukclqcAeolJxpHnAnHIo0OjsYaPxC0d2lmQUg1VvOMEvzR2waPfrgVjwZ5bJIWKrUyao
	XuQQT24L3Tl5yPl7Hzeec1vDWt3CP89leSz8l7c5qLjv95y3g0Ub+wP4ADds/deov049WPPAfGRqB
	VPp2/b6TLuS0IzudM5smFYZLeTdLC/o9l+bs0+B8UPn+mh1yb0ZDJbLwQUlR/VOmqCahs0fqM+kIi
	CH2hL5Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot7tH-0067u6-3O; Thu, 10 Nov 2022 13:46:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot7sz-0067hr-L6; Thu, 10 Nov 2022 13:46:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69C69617B6;
	Thu, 10 Nov 2022 13:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BE9C43470;
	Thu, 10 Nov 2022 13:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668087987;
	bh=WikX9e5FhWwL7eFHkQUjP1JRBQuq/6z+6AyUynumX/U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HH/JqNN6H6Z67RdpwqNtQtE80l+UZCXbUleQrV0XC6FGW5VY38GVlJphPUeGUcH+6
	 jz7sMQO4MtCP01jIHZ94KB9uCQwUVECaVfAa7nGyk3mV7FIabdIqnEUeT4bgRYDXh0
	 H+otBaDKC+Tg1lBHrfr8PZeqhXRaJ4incS7z3meWGQkkK1bnJ6yzlRL4nAqkFdgwC0
	 EHMK3WHGWAcwvlUUOAfrvAnCCN4FowAhLi4pfY6xIMM1tbpdA4tsux8f4h7OgOQ09h
	 cMjgXUE97U4v2zoQaQiu4hhqI0YM3076jjtYsckNmjN/UXhuPt+CeweU9h2b2GA9H8
	 Aq1IJ57S368+w==
Received: by mail-oi1-f170.google.com with SMTP id h132so1858185oif.2;
        Thu, 10 Nov 2022 05:46:27 -0800 (PST)
X-Gm-Message-State: ACrzQf1XoeFHXTotfdqCZWRhbPTX2Q+lSt0iMXnTOeQ55PYUdUky6Lwj
	VH8+C2ZCRF+Fe1/yy5KDSfa+oOKaIYLslO3yZg==
X-Google-Smtp-Source: AMsMyM7heHQhhR8U8FcAhrEWFRx/vGh8Q5o71pB3LucXfyRgJEhfJs8rNnSOfM3YnYLlWLM1DN1HFK3WOXid70DGiSk=
X-Received: by 2002:a05:6808:3010:b0:355:23ba:8631 with SMTP id
 ay16-20020a056808301000b0035523ba8631mr42095899oib.269.1668087986747; Thu, 10
 Nov 2022 05:46:26 -0800 (PST)
MIME-Version: 1.0
References: <20221102100736.37815-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221102100736.37815-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 10 Nov 2022 21:46:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8+d-t4wJKytp9=Q3a0z7DQVMyV6ax9tn8kBWD36gR4-w@mail.gmail.com>
Message-ID: <CAAOTY_8+d-t4wJKytp9=Q3a0z7DQVMyV6ax9tn8kBWD36gR4-w@mail.gmail.com>
Subject: Re: [PATCH] mailbox: mtk-cmdq-mailbox: Use platform data directly
 instead of copying
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jassisinghbrar@gmail.com, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_054629_816130_6055DF83 
X-CRM114-Status: GOOD (  28.86  )
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

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2022=E5=B9=B411=E6=9C=882=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:0=
8=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Copying platform data to struct cmdq serves to no purpose, as that
> data is never modified during runtime: it's worth at this point
> storing a pointer to gce_plat in gce and.
>
> Remove all duplicated `struct gce_plat` members from `struct gce`
> and reuse the platform data across the driver to save some memory.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>
> This commit applies only on top of series [1]
>
> [1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D6=
84195
>
>  drivers/mailbox/mtk-cmdq-mailbox.c | 88 +++++++++++++-----------------
>  1 file changed, 39 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index c5229f377c5e..a460ee26eb11 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -75,15 +75,11 @@ struct cmdq {
>         struct mbox_controller  mbox;
>         void __iomem            *base;
>         int                     irq;
> -       u32                     thread_nr;
>         u32                     irq_mask;
> +       const struct gce_plat   *pdata;
>         struct cmdq_thread      *thread;
>         struct clk_bulk_data    clocks[CMDQ_GCE_NUM_MAX];
>         bool                    suspended;
> -       u8                      shift_pa;
> -       bool                    control_by_sw;
> -       bool                    sw_ddr_en;
> -       u32                     gce_num;
>  };
>
>  struct gce_plat {
> @@ -96,21 +92,21 @@ struct gce_plat {
>
>  static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
>  {
> -       WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
> +       WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
>
>         if (enable)
>                 writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL=
_VALUE);
>         else
>                 writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
>
> -       clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> +       clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
>  }
>
>  u8 cmdq_get_shift_pa(struct mbox_chan *chan)
>  {
>         struct cmdq *cmdq =3D container_of(chan->mbox, struct cmdq, mbox)=
;
>
> -       return cmdq->shift_pa;
> +       return cmdq->pdata->shift;
>  }
>  EXPORT_SYMBOL(cmdq_get_shift_pa);
>
> @@ -144,10 +140,10 @@ static void cmdq_init(struct cmdq *cmdq)
>         int i;
>         u32 gctl_regval =3D 0;
>
> -       WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
> -       if (cmdq->control_by_sw)
> +       WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
> +       if (cmdq->pdata->control_by_sw)
>                 gctl_regval =3D GCE_CTRL_BY_SW;
> -       if (cmdq->sw_ddr_en)
> +       if (cmdq->pdata->sw_ddr_en)
>                 gctl_regval |=3D GCE_DDR_EN;
>
>         if (gctl_regval)
> @@ -156,7 +152,7 @@ static void cmdq_init(struct cmdq *cmdq)
>         writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CY=
CLES);
>         for (i =3D 0; i <=3D CMDQ_MAX_EVENT; i++)
>                 writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
> -       clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> +       clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
>  }
>
>  static int cmdq_thread_reset(struct cmdq *cmdq, struct cmdq_thread *thre=
ad)
> @@ -201,7 +197,7 @@ static void cmdq_task_insert_into_thread(struct cmdq_=
task *task)
>                                 prev_task->pkt->cmd_buf_size, DMA_TO_DEVI=
CE);
>         prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] =3D
>                 (u64)CMDQ_JUMP_BY_PA << 32 |
> -               (task->pa_base >> task->cmdq->shift_pa);
> +               (task->pa_base >> task->cmdq->pdata->shift);
>         dma_sync_single_for_device(dev, prev_task->pa_base,
>                                    prev_task->pkt->cmd_buf_size, DMA_TO_D=
EVICE);
>
> @@ -235,7 +231,7 @@ static void cmdq_task_handle_error(struct cmdq_task *=
task)
>         next_task =3D list_first_entry_or_null(&thread->task_busy_list,
>                         struct cmdq_task, list_entry);
>         if (next_task)
> -               writel(next_task->pa_base >> cmdq->shift_pa,
> +               writel(next_task->pa_base >> cmdq->pdata->shift,
>                        thread->base + CMDQ_THR_CURR_ADDR);
>         cmdq_thread_resume(thread);
>  }
> @@ -266,7 +262,7 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq=
,
>         else
>                 return;
>
> -       curr_pa =3D readl(thread->base + CMDQ_THR_CURR_ADDR) << cmdq->shi=
ft_pa;
> +       curr_pa =3D readl(thread->base + CMDQ_THR_CURR_ADDR) << cmdq->pda=
ta->shift;
>
>         list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
>                                  list_entry) {
> @@ -289,7 +285,7 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq=
,
>
>         if (list_empty(&thread->task_busy_list)) {
>                 cmdq_thread_disable(cmdq, thread);
> -               clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> +               clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
>         }
>  }
>
> @@ -303,7 +299,7 @@ static irqreturn_t cmdq_irq_handler(int irq, void *de=
v)
>         if (!(irq_status ^ cmdq->irq_mask))
>                 return IRQ_NONE;
>
> -       for_each_clear_bit(bit, &irq_status, cmdq->thread_nr) {
> +       for_each_clear_bit(bit, &irq_status, cmdq->pdata->thread_nr) {
>                 struct cmdq_thread *thread =3D &cmdq->thread[bit];
>
>                 spin_lock_irqsave(&thread->chan->lock, flags);
> @@ -323,7 +319,7 @@ static int cmdq_suspend(struct device *dev)
>
>         cmdq->suspended =3D true;
>
> -       for (i =3D 0; i < cmdq->thread_nr; i++) {
> +       for (i =3D 0; i < cmdq->pdata->thread_nr; i++) {
>                 thread =3D &cmdq->thread[i];
>                 if (!list_empty(&thread->task_busy_list)) {
>                         task_running =3D true;
> @@ -334,10 +330,10 @@ static int cmdq_suspend(struct device *dev)
>         if (task_running)
>                 dev_warn(dev, "exist running task(s) in suspend\n");
>
> -       if (cmdq->sw_ddr_en)
> +       if (cmdq->pdata->sw_ddr_en)
>                 cmdq_sw_ddr_enable(cmdq, false);
>
> -       clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
> +       clk_bulk_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
>
>         return 0;
>  }
> @@ -346,10 +342,10 @@ static int cmdq_resume(struct device *dev)
>  {
>         struct cmdq *cmdq =3D dev_get_drvdata(dev);
>
> -       WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
> +       WARN_ON(clk_bulk_prepare(cmdq->pdata->gce_num, cmdq->clocks));
>         cmdq->suspended =3D false;
>
> -       if (cmdq->sw_ddr_en)
> +       if (cmdq->pdata->sw_ddr_en)
>                 cmdq_sw_ddr_enable(cmdq, true);
>
>         return 0;
> @@ -359,10 +355,10 @@ static int cmdq_remove(struct platform_device *pdev=
)
>  {
>         struct cmdq *cmdq =3D platform_get_drvdata(pdev);
>
> -       if (cmdq->sw_ddr_en)
> +       if (cmdq->pdata->sw_ddr_en)
>                 cmdq_sw_ddr_enable(cmdq, false);
>
> -       clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
> +       clk_bulk_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
>         return 0;
>  }
>
> @@ -388,7 +384,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan=
, void *data)
>         task->pkt =3D pkt;
>
>         if (list_empty(&thread->task_busy_list)) {
> -               WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
> +               WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clock=
s));
>
>                 /*
>                  * The thread reset will clear thread related register to=
 0,
> @@ -398,9 +394,9 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan=
, void *data)
>                  */
>                 WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
>
> -               writel(task->pa_base >> cmdq->shift_pa,
> +               writel(task->pa_base >> cmdq->pdata->shift,
>                        thread->base + CMDQ_THR_CURR_ADDR);
> -               writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->shift=
_pa,
> +               writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->pdata=
->shift,
>                        thread->base + CMDQ_THR_END_ADDR);
>
>                 writel(thread->priority, thread->base + CMDQ_THR_PRIORITY=
);
> @@ -409,20 +405,20 @@ static int cmdq_mbox_send_data(struct mbox_chan *ch=
an, void *data)
>         } else {
>                 WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
>                 curr_pa =3D readl(thread->base + CMDQ_THR_CURR_ADDR) <<
> -                       cmdq->shift_pa;
> +                       cmdq->pdata->shift;
>                 end_pa =3D readl(thread->base + CMDQ_THR_END_ADDR) <<
> -                       cmdq->shift_pa;
> +                       cmdq->pdata->shift;
>                 /* check boundary */
>                 if (curr_pa =3D=3D end_pa - CMDQ_INST_SIZE ||
>                     curr_pa =3D=3D end_pa) {
>                         /* set to this task directly */
> -                       writel(task->pa_base >> cmdq->shift_pa,
> +                       writel(task->pa_base >> cmdq->pdata->shift,
>                                thread->base + CMDQ_THR_CURR_ADDR);
>                 } else {
>                         cmdq_task_insert_into_thread(task);
>                         smp_mb(); /* modify jump before enable thread */
>                 }
> -               writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->shift=
_pa,
> +               writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->pdata=
->shift,
>                        thread->base + CMDQ_THR_END_ADDR);
>                 cmdq_thread_resume(thread);
>         }
> @@ -461,7 +457,7 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan=
)
>         }
>
>         cmdq_thread_disable(cmdq, thread);
> -       clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> +       clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
>
>  done:
>         /*
> @@ -501,7 +497,7 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, un=
signed long timeout)
>
>         cmdq_thread_resume(thread);
>         cmdq_thread_disable(cmdq, thread);
> -       clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> +       clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
>
>  out:
>         spin_unlock_irqrestore(&thread->chan->lock, flags);
> @@ -548,7 +544,6 @@ static int cmdq_probe(struct platform_device *pdev)
>         struct device *dev =3D &pdev->dev;
>         struct cmdq *cmdq;
>         int err, i;
> -       struct gce_plat *plat_data;
>         struct device_node *phandle =3D dev->of_node;
>         struct device_node *node;
>         int alias_id =3D 0;
> @@ -567,18 +562,13 @@ static int cmdq_probe(struct platform_device *pdev)
>         if (cmdq->irq < 0)
>                 return cmdq->irq;
>
> -       plat_data =3D (struct gce_plat *)of_device_get_match_data(dev);
> -       if (!plat_data) {
> +       cmdq->pdata =3D device_get_match_data(dev);
> +       if (!cmdq->pdata) {
>                 dev_err(dev, "failed to get match data\n");
>                 return -EINVAL;
>         }
>
> -       cmdq->thread_nr =3D plat_data->thread_nr;
> -       cmdq->shift_pa =3D plat_data->shift;
> -       cmdq->control_by_sw =3D plat_data->control_by_sw;
> -       cmdq->sw_ddr_en =3D plat_data->sw_ddr_en;
> -       cmdq->gce_num =3D plat_data->gce_num;
> -       cmdq->irq_mask =3D GENMASK(cmdq->thread_nr - 1, 0);
> +       cmdq->irq_mask =3D GENMASK(cmdq->pdata->thread_nr - 1, 0);
>         err =3D devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_S=
HARED,
>                                "mtk_cmdq", cmdq);
>         if (err < 0) {
> @@ -589,10 +579,10 @@ static int cmdq_probe(struct platform_device *pdev)
>         dev_dbg(dev, "cmdq device: addr:0x%p, va:0x%p, irq:%d\n",
>                 dev, cmdq->base, cmdq->irq);
>
> -       if (cmdq->gce_num > 1) {
> +       if (cmdq->pdata->gce_num > 1) {
>                 for_each_child_of_node(phandle->parent, node) {
>                         alias_id =3D of_alias_get_id(node, clk_name);
> -                       if (alias_id >=3D 0 && alias_id < cmdq->gce_num) =
{
> +                       if (alias_id >=3D 0 && alias_id < cmdq->pdata->gc=
e_num) {
>                                 cmdq->clocks[alias_id].id =3D clk_names[a=
lias_id];
>                                 cmdq->clocks[alias_id].clk =3D of_clk_get=
(node, 0);
>                                 if (IS_ERR(cmdq->clocks[alias_id].clk)) {
> @@ -614,12 +604,12 @@ static int cmdq_probe(struct platform_device *pdev)
>         }
>
>         cmdq->mbox.dev =3D dev;
> -       cmdq->mbox.chans =3D devm_kcalloc(dev, cmdq->thread_nr,
> +       cmdq->mbox.chans =3D devm_kcalloc(dev, cmdq->pdata->thread_nr,
>                                         sizeof(*cmdq->mbox.chans), GFP_KE=
RNEL);
>         if (!cmdq->mbox.chans)
>                 return -ENOMEM;
>
> -       cmdq->mbox.num_chans =3D cmdq->thread_nr;
> +       cmdq->mbox.num_chans =3D cmdq->pdata->thread_nr;
>         cmdq->mbox.ops =3D &cmdq_mbox_chan_ops;
>         cmdq->mbox.of_xlate =3D cmdq_xlate;
>
> @@ -627,12 +617,12 @@ static int cmdq_probe(struct platform_device *pdev)
>         cmdq->mbox.txdone_irq =3D false;
>         cmdq->mbox.txdone_poll =3D false;
>
> -       cmdq->thread =3D devm_kcalloc(dev, cmdq->thread_nr,
> +       cmdq->thread =3D devm_kcalloc(dev, cmdq->pdata->thread_nr,
>                                         sizeof(*cmdq->thread), GFP_KERNEL=
);
>         if (!cmdq->thread)
>                 return -ENOMEM;
>
> -       for (i =3D 0; i < cmdq->thread_nr; i++) {
> +       for (i =3D 0; i < cmdq->pdata->thread_nr; i++) {
>                 cmdq->thread[i].base =3D cmdq->base + CMDQ_THR_BASE +
>                                 CMDQ_THR_SIZE * i;
>                 INIT_LIST_HEAD(&cmdq->thread[i].task_busy_list);
> @@ -647,7 +637,7 @@ static int cmdq_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, cmdq);
>
> -       WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
> +       WARN_ON(clk_bulk_prepare(cmdq->pdata->gce_num, cmdq->clocks));
>
>         cmdq_init(cmdq);
>
> --
> 2.37.2
>
>

