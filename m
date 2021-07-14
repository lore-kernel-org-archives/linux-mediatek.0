Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAD1C07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 06:33:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8C7E613AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 06:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8C7E613AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ez1v65rt0EEqMM8CscRUsCUw//EyXJ4X/kNVAvYlT1E=; b=f4HEg5uOCw8GKM
	D2Gtm2iVRNnvonoFW9o5yA4itTTXn1rMjBsCl6Io1NVJx2nlICLJqo7i+5wlj4PuNggz0sCThdQNm
	Lussk2FdyFebWsh9ljdkpZ+uUIyFnEHiO8SyPPurgSOFFzXrZHNA2mpifvHIFz8wYQjXUCSJaQG33
	XeN4BekQJ5HO0E9uGpp27Zo8wD9OPwvQrXnzNrTTNMTs7WePosdIsgkDsDAZEz4AYmnBclClTsPfN
	E5UNtyJu1TCoa34Qv17u0Z8j2fYwdxwrHuy2KbYulT/YxPsE1Q6CeZpRjJZOMVZPARieRN0ds0cM7
	gmABsyEgmwNXUlU/tMIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3YSW-00CQlV-HM; Wed, 14 Jul 2021 06:33:28 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3YST-00CQkd-8a
 for linux-mediatek@lists.infradead.org; Wed, 14 Jul 2021 06:33:26 +0000
Received: by mail-io1-xd2c.google.com with SMTP id g22so740196iom.1
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Jul 2021 23:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fF0A3SNyCoLJ9V4Mf6IFTlcVxCvyAcihWUy7P8dtXJI=;
 b=DN/o78lFqAKsgN5uUZevIfvTthvAaqLUS7o/z4AqRbGBER//DxjodEcfhITop+1Sbi
 5xnPBW4khvCZ9s+B1EueYDKprlSNK7aHd7gD0NOPaVX7FC2k2vU+jDakW2TtboEyTibR
 qoWxRSuHKBrIIysihP1UKdBy4Awi8uwDvRoP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fF0A3SNyCoLJ9V4Mf6IFTlcVxCvyAcihWUy7P8dtXJI=;
 b=jBjXNSgfAWHaqlCLszyDhk2ZVQ75R9F6y1HYi89ZV0xM6/wJoe6thpit2j0cLKeJuU
 yJqpecBRFZVTq/17TB40N7VV0IwtV9sXSE6E5hiqRQUeQeEIohDOxTPIaku0IgMbj5Wx
 3UNTeK5MGVmz8mqiBSFIWwFfEbtdbcUGnDLrBZ+URt5RX5TWPDnqzxgGStMhBM3tQH5v
 sFie+Et/ke5tdFNZWbc/7cciz+Mxo2MVsFLKPwXG1hGAZ4OmT5xQxAZr3L3LSsdDm216
 /1ftg1t5JKDwPIbjN8ONJ/tW9BEoTa/qrsONo9qArGg3MX6NNgPY01PXhpMnFID0BiZ9
 KawA==
X-Gm-Message-State: AOAM533IZc0pRspWnnes9RV5MQPBZHEr8Qb+0CjgSrhErBhj3J8E8hXH
 VtMOGSAtEQcx9w3bt9JNNkE53kaZCuBwxIEDGSkDjQ==
X-Google-Smtp-Source: ABdhPJziJytxeQ51ecTdT3CtD4o86bg7Q+pPkL3Gi50sJ3vzYsr9bjOhfcALk+Ji1bGlr/PbCYsHfE4mxG+wawo0Vso=
X-Received: by 2002:a02:cce6:: with SMTP id l6mr7474610jaq.114.1626244402499; 
 Tue, 13 Jul 2021 23:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210705053429.4380-1-jason-jh.lin@mediatek.com>
 <20210705053429.4380-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20210705053429.4380-6-jason-jh.lin@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 14 Jul 2021 14:32:56 +0800
Message-ID: <CAJMQK-g-3-WeLMH57cJBWVt1=i7SuxwGG2Ae253igEEX9oywKA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] mailbox: cmdq: fix GCE can not receive hardward
 event
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsin-Yi Wang <hsinyi@google.com>, nancy.lin@mediatek.com,
 singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_233325_374097_6ED361B8 
X-CRM114-Status: GOOD (  19.97  )
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

On Mon, Jul 5, 2021 at 1:35 PM jason-jh.lin <jason-jh.lin@mediatek.com> wrote:
>
> For the design of GCE hardware event signal transportation,
> evnet rx will send the event signal to all GCE event merges
> after receiving the event signal from the other hardware.
>
> Because GCE event merges need to response to event rx, their
> clocks must be enabled at that time.
>
> To make sure all the gce clock is enabled while receiving the
> hardware event, each cmdq mailbox should enable or disable
> the others gce clk at the same time.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 102 +++++++++++++++++++++++------
>  1 file changed, 83 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index fc67888a677c..44a3cf252fd5 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -19,6 +19,7 @@
>
>  #define CMDQ_OP_CODE_MASK              (0xff << CMDQ_OP_CODE_SHIFT)
>  #define CMDQ_NUM_CMD(t)                        (t->cmd_buf_size / CMDQ_INST_SIZE)
> +#define CMDQ_GCE_NUM_MAX               (2)
>
>  #define CMDQ_CURR_IRQ_STATUS           0x10
>  #define CMDQ_SYNC_TOKEN_UPDATE         0x68
> @@ -73,14 +74,16 @@ struct cmdq {
>         u32                     thread_nr;
>         u32                     irq_mask;
>         struct cmdq_thread      *thread;
> -       struct clk              *clock;
> +       struct clk              *clock[CMDQ_GCE_NUM_MAX];
>         bool                    suspended;
>         u8                      shift_pa;
> +       u32                     gce_num;
>  };
>
>  struct gce_plat {
>         u32 thread_nr;
>         u8 shift;
> +       u32 gce_num;
>  };
>
>  u8 cmdq_get_shift_pa(struct mbox_chan *chan)
> @@ -120,11 +123,15 @@ static void cmdq_init(struct cmdq *cmdq)
>  {
>         int i;
>
> -       WARN_ON(clk_enable(cmdq->clock) < 0);
> +       for (i = 0; i < cmdq->gce_num; i++)
> +               WARN_ON(clk_enable(cmdq->clock[i]) < 0);
> +
You can use clk_bulk_enable instead of looping. Same for clk_bulk_disable.

<snip>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
