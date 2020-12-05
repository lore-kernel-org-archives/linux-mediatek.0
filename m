Return-Path: <SRS0=IZYC=FJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841AEC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 07:35:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3522D22D58
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 07:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3522D22D58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WlnDdUOnxjg/AJp1RVFRbTput1qKDAJCX5b5kHSNoVM=; b=dIlqnSgWNH6x0A9clAZzzzRFL
	ufoJtstvai/okxb+5WK8h0EouS8btHNpjhsnWhHoAr525LGwLSZq8MGPdAZ9uK9lcG9uMhW0aQw8P
	5h/tsOD6tdx9EvmPZc3lKBkpngvDN1cMDhaTk8cdVBDuDicRlL2WOQbyNZJc8mHT2c4OeXHNbdVCk
	zy/YYSE/U1bl4qUQi+omMMSPnb6wGJFxw/328ZwuvR55TsCsFas6ix2YAzp9jEZ6sVX1BQFLZbd+V
	yGMxY/Pvt48sltj9W0hpH4Vee6OquWKXUoRInlCjmnUpjG8hqFI0KiNuhlWkfHdIIb4p4FmwW6olz
	ggMtmCbfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klS6K-0003YK-3K; Sat, 05 Dec 2020 07:35:28 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klS6G-0003X9-2T
 for linux-mediatek@lists.infradead.org; Sat, 05 Dec 2020 07:35:25 +0000
Received: by mail-vs1-xe42.google.com with SMTP id x26so4632050vsq.1
 for <linux-mediatek@lists.infradead.org>; Fri, 04 Dec 2020 23:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wvz8/c+BmSxUPKOte4ILOvp/ZC9OehDDCPuA6tvG3S0=;
 b=K6t+x0wUD6+gcBEHcRnqOjge0qLsOpeU+IBfjcKm+7goKFfXsNIOkfQe0ErdBiwZcC
 c//ry1RZv65MdRb0PK4XbJop3klQOQtVNGlgu1RUTXdz2BYyINxYkP6fddxtxO8EFY+X
 F2Ng/U0DCbKXiLr5Mtz5iAszjD8PFTKCgf0do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wvz8/c+BmSxUPKOte4ILOvp/ZC9OehDDCPuA6tvG3S0=;
 b=V13tSoXbUfI2YmRrqJfRmh4tuMWtcaoVVqU/pQ8bSWh8EPS9e4YFC0omrVpjSrgAGe
 OQd/R84yCaKZ6eHxvuaFVY7OPsouLzneiGRHzMAr0rrNo6x0D3WJcXj1mKNOv+pjpmy9
 DlgO2rNjKdL8fARJYgQYxQj1OCzOSpHFSQ8hQcb0JlfqkQQh/eUz2LMbwU2roKXDwYXh
 DYg/KGhmlhNClGms3dReLsz7+HY/JDjh+41hOEQGLP8e/Ay5fuhgP/h1MRVjIb9ECT0Q
 1EpLWexsdnzRXfTj++T0LKYsA9Ki3MUQ27Lw2XPvZn/P8d5/UhNeOlH2HHkzQQwirHfM
 BAWw==
X-Gm-Message-State: AOAM532V3hjE93QzqmUaIyXhkEs64455FLwJb8np1BOiThE0T3b/qIvb
 6nGAeX1H04EKILnmMtYZY6FY03W/JXrKGqGynExVyg==
X-Google-Smtp-Source: ABdhPJwFwcxNs/rUWeL3nHnAVJay+557ujsyjsp13A68iO7wBKwVvs3THM35jPvHbDdVlcyYdOJrr67dWMqlB0pidgw=
X-Received: by 2002:a05:6102:3234:: with SMTP id
 x20mr7358436vsf.21.1607153722309; 
 Fri, 04 Dec 2020 23:35:22 -0800 (PST)
MIME-Version: 1.0
References: <1607141728-17307-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607141728-17307-4-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607141728-17307-4-git-send-email-yongqiang.niu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Sat, 5 Dec 2020 15:35:11 +0800
Message-ID: <CANMq1KDWwfijinZq0b8BVqvYBj1fOHFpfMPLbzj0JR8z9LKypw@mail.gmail.com>
Subject: Re: [PATCH v1, 3/5] mailbox: mediatek: add control_by_sw private data
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_023524_143901_6B8CE3B2 
X-CRM114-Status: GOOD (  15.49  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Dec 5, 2020 at 12:18 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> add control_by_sw private data

Can you describe in a bit more details what this means?

>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 5665b6e..1c01fe0 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -36,6 +36,8 @@
>  #define CMDQ_THR_WAIT_TOKEN            0x30
>  #define CMDQ_THR_PRIORITY              0x40
>
> +#define GCE_GCTL_VALUE                 0x48
> +
>  #define CMDQ_THR_ACTIVE_SLOT_CYCLES    0x3200
>  #define CMDQ_THR_ENABLED               0x1
>  #define CMDQ_THR_DISABLED              0x0
> @@ -76,11 +78,13 @@ struct cmdq {
>         struct clk              *clock;
>         bool                    suspended;
>         u8                      shift_pa;
> +       bool                    control_by_sw;
>  };
>
>  struct gce_plat {
>         u32 thread_nr;
>         u8 shift;
> +       bool control_by_sw;
>  };
>
>  u8 cmdq_get_shift_pa(struct mbox_chan *chan)
> @@ -121,6 +125,8 @@ static void cmdq_init(struct cmdq *cmdq)
>         int i;
>
>         WARN_ON(clk_enable(cmdq->clock) < 0);
> +       if (cmdq->control_by_sw)
> +               writel(0x7, cmdq->base + GCE_GCTL_VALUE);

What is 0x7? Define a macro for these bits?

>         writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
>         for (i = 0; i <= CMDQ_MAX_EVENT; i++)
>                 writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
> @@ -536,6 +542,7 @@ static int cmdq_probe(struct platform_device *pdev)
>
>         cmdq->thread_nr = plat_data->thread_nr;
>         cmdq->shift_pa = plat_data->shift;
> +       cmdq->control_by_sw = plat_data->control_by_sw;
>         cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
>         err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
>                                "mtk_cmdq", cmdq);
> --
> 1.8.1.1.dirty
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
