Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EF9C12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 07:37:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5D8D613F0
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 07:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5D8D613F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHYrw8YaqXhH6d8szHEBpyo7CxtLYOZ0aLVEjd8PLmg=; b=lfVcG1VyAcka/O
	QJjRuUutKrc9riUmZtB5Y5ZlrkBk2sjp/dbdbd65SNazq+4AEiI/ZqwwKcEJ7lkbjGJxIM6+COFmS
	w6L9SnsKj7ygCpaOShxaNyuAECQzuEuiRUggDrI0cKV6tVldJOphDOolRm0/KrwGl0Gs+zwUYQL9+
	6uN5iidNAkkKEIUMv9hSmm5b3QpUznvQq0KE2AnpLTvsZGTdsnii+UfarnOFsGQ4ZD8ZsBqKKTL9g
	x2wDs0G48fDdFK0J47eVmHuoKh5pAZ3C6uJWRbu2CoCBFspuszHg37DvsgRpTuVabOYOqY93Nvrxn
	d/EVIJRhSzfHU+Eqfk6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4IPg-003Y3F-JE; Fri, 16 Jul 2021 07:37:36 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4IPd-003Y1V-2d
 for linux-mediatek@lists.infradead.org; Fri, 16 Jul 2021 07:37:34 +0000
Received: by mail-il1-x130.google.com with SMTP id j5so7462070ilk.3
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Jul 2021 00:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ANiQyDq/folOxbicLwy3YOWgSYI5J0bEHqTHjcfWpeE=;
 b=NZ/hguWCrTo//AU1Q0svGXlehzVRhlRy/nSls8iodhXXHgSEeCwbBTZ/daP8ru1+2y
 BxRBJiEgjMWnZOPOkNow345Owj7290E/vXITWK+0+xpPLDyrmWtEgAaLi1EYLiW0H96w
 NuqSZvzGC2Z4C51n2jOptN+DVowI83OLjjCDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ANiQyDq/folOxbicLwy3YOWgSYI5J0bEHqTHjcfWpeE=;
 b=XB49xhH2N8YMFyziOZRD2PkzVQ5jIqSwTK0iUoK+oTBoWU698LqgGt0a3uoMdNOLCn
 OT3qgtZNjw3prHxJktYNPyndeP6A59A3lcceOgt2QH06R1ndC9WcorSwkRPzAUoTJV/2
 7KVOjeak1eWeS2Bp3V2fMihry6ozLMlFD5j9AwR4MO1f72E75ZrsAclpGxc+ysDiVCV1
 pLVWV41ggfZ3tAtbHgiduSCbjO+EHeEiviuUM0sU/PSYnOZ4u15T4QGpLg+/b6/dog9w
 0TlkgGGiqtA/CmOv+OBoqKB9cGv9EnW3WVwxPTeU1cdQCcdjQcdjL19/apam4sBPq2Rs
 y6qw==
X-Gm-Message-State: AOAM530403xUXVaM7YxbcsxuIDQarAZNWQifl4ZyD7Vjn72SFLy1hmqF
 Sl0FGDpkM4koDcARRbtBSClgbb3jNrjkvddY88sbGQ==
X-Google-Smtp-Source: ABdhPJyT8V6x97LXNxXCsukgUCvYDKNceqkLDBqaokboRJb34I4xEcF3g0U8Zw6BQAhoQ5hGaStIUlO4jTjCi2i7VqY=
X-Received: by 2002:a92:d305:: with SMTP id x5mr5796115ila.150.1626421051833; 
 Fri, 16 Jul 2021 00:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <1626418701-28467-1-git-send-email-yongqiang.niu@mediatek.com>
 <1626418701-28467-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1626418701-28467-2-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 16 Jul 2021 15:37:05 +0800
Message-ID: <CAJMQK-ghGCR3L89NzBx-6X6rJK-4VQYZT18DqdKM780r2bLvpA@mail.gmail.com>
Subject: Re: [PATCH v1] mailbox: cmdq: add instruction time-out interrupt
 support
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_003733_190056_DAB73E6E 
X-CRM114-Status: GOOD (  17.45  )
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

On Fri, Jul 16, 2021 at 2:58 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> add time-out cycle setting to make sure time-out interrupt irq
> will happened when instruction time-out for wait and poll
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>

Hi, it seems that this series is based on
https://patchwork.kernel.org/project/linux-mediatek/patch/1624440623-4585-4-git-send-email-yongqiang.niu@mediatek.com/?

Please state it if it's not based on linux-next, thanks!

> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index de4793e..9a76bcd 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -35,6 +35,7 @@
>  #define CMDQ_THR_END_ADDR              0x24
>  #define CMDQ_THR_WAIT_TOKEN            0x30
>  #define CMDQ_THR_PRIORITY              0x40
> +#define CMDQ_THR_INSTN_TIMEOUT_CYCLES  0x50
>
>  #define GCE_GCTL_VALUE                 0x48
>
> @@ -53,6 +54,15 @@
>  #define CMDQ_JUMP_BY_OFFSET            0x10000000
>  #define CMDQ_JUMP_BY_PA                        0x10000001
>
> +/*
> + * instruction time-out
> + * cycles to issue instruction time-out interrupt for wait and poll instructions
> + * GCE axi_clock 156MHz
> + * 1 cycle = 6.41ns
> + * instruction time out 2^22*2*6.41ns = 53ms
> + */
> +#define CMDQ_INSTN_TIMEOUT_CYCLES      22
> +
>  struct cmdq_thread {
>         struct mbox_chan        *chan;
>         void __iomem            *base;
> @@ -368,6 +378,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
>                 writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->shift_pa,
>                        thread->base + CMDQ_THR_END_ADDR);
>
> +               writel(CMDQ_INSTN_TIMEOUT_CYCLES, thread->base + CMDQ_THR_INSTN_TIMEOUT_CYCLES);
>                 writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
>                 writel(CMDQ_THR_IRQ_EN, thread->base + CMDQ_THR_IRQ_ENABLE);
>                 writel(CMDQ_THR_ENABLED, thread->base + CMDQ_THR_ENABLE_TASK);
> --
> 1.8.1.1.dirty
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
