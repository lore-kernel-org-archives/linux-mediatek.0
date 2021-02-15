Return-Path: <SRS0=c1Sc=HR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00F2C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Feb 2021 05:16:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A6F66023B
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Feb 2021 05:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A6F66023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9NzPxl0nRfXNm/SOrR9LDkXUphk+ogpVlzR7eetk7nY=; b=UQ7VLgFyCv1QZcMFmbqiHljPY
	a4X7PADGiiBEdxeK7FYKo2DUNsmrsdJuFuX7let2jtpfX4zn4ed88lyT2P/I/iAj7YlZLY3sBvCBJ
	Sk1wMb3eY/ACM58kWTP+h7IUtTq2H5yBMmbfH3X9re8WqlKOe0XQllyKBcNsmxBUT+Re8Y3GAj3TR
	np5qhts5j9lCle9dPzIbfhLT7m3jpjpZaLCtI+RMzkuJavS//JYdBGYpYQdV6asZpzHcMDcHmx+nU
	8pW/weYbs5ViRKE/qBoNlikp0Mu6ixcxkKEupchbJfI2W4m8IBA7O65U7L8ERYiU91HHIjzbBmJK5
	rc62M034A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBWFO-0003fu-7T; Mon, 15 Feb 2021 05:16:34 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBWFH-0003e3-Bs; Mon, 15 Feb 2021 05:16:28 +0000
Received: by mail-pf1-x429.google.com with SMTP id z15so3495311pfc.3;
 Sun, 14 Feb 2021 21:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TBkqrZBLcfDTB0/M+9n3lElFVq72Vy5NJAtkuckTGN4=;
 b=pm4fNvBwXWCxUC5cgUyImGLfR4w/yKZ/pflBxno08azXdHVjNAF7N/TiLY6z306gz/
 NwT40nkx/FTz+vU0BOctZuzk/kvqILDE4t19NPsl6Ny9Z7uIyTkIR9JcQevyZX/WlPso
 dlOleXIZSuXw82L96wMXWZUd9NvG8+qzzVBYdpFCPzJJflFd0uJaRuMlVBMGJ2JebX/G
 Qsu5+rhqLnv3pDiAVLF/86KcPk5OFYdMSGyqseOouuZHe0XxiFsKO9rjFl3bxkFJfC1R
 Lvh4o7KXBD+YBQLwSczpEhhLc1c0oP1BcrnMlNQ4x2yYjMZybNxD8GuFAaL3mTPjkB2Z
 oOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TBkqrZBLcfDTB0/M+9n3lElFVq72Vy5NJAtkuckTGN4=;
 b=W+sKQJXw7gXfsI1721alneUr8hcVlkGuXR8g/j7zFHiwWy2p4zdbrG1W2N0y7OKHQY
 PNEAWUUGi5ZiJt4d65YSu2xiCxW2tXd9e/5wuh6CgbHji95kz+I+sYPwz3T0CHt9feb8
 PBzUDc7ePQVkj/pOIXh50Yc0BPwezYKSRItTw6UoFFgg/COUxQNAvw46AWbROo6WPKXG
 WWnbac1oFDDoOfG13dr6WolhNcoMdiG6A6H/rFGFSGfYiT+zmdILZKtJOjGghJmW7vGT
 x0ntRclslIVdmg1S8k6xWz4y57Hov7rc9mD8KjKWDuFsVQBoZHk0DWhtVjF3z5i7RnUX
 pzQA==
X-Gm-Message-State: AOAM533k6bKOR2XlI2/LHE8z2Ln1tp5olStLNDMMCCn4jU7wDoS1MDc2
 7v9pkeQYEaiOEYjec/2JNjXtQ0/vW7PpJbwOzNY=
X-Google-Smtp-Source: ABdhPJwOiZw4Qqqmjkha2m3NiVtY90y2KGeUq38HkrELdAMi1GmyuchWJQIojbLcrd0WcqkoeEZZMy7VUEb0HVASvmM=
X-Received: by 2002:a63:1519:: with SMTP id v25mr13584867pgl.217.1613366183592; 
 Sun, 14 Feb 2021 21:16:23 -0800 (PST)
MIME-Version: 1.0
References: <1608712499-24956-1-git-send-email-yongqiang.niu@mediatek.com>
 <1608712499-24956-2-git-send-email-yongqiang.niu@mediatek.com>
 <1610070485.1574.10.camel@mhfsdcap03>
In-Reply-To: <1610070485.1574.10.camel@mhfsdcap03>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 14 Feb 2021 23:16:13 -0600
Message-ID: <CABb+yY3JQUYf8b-mU_01eYR-4nswFRbBE42WS9fS8aSmk2rjmw@mail.gmail.com>
Subject: Re: [PATCH v2] soc: mediatek: cmdq: add address shift in jump
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_001627_428958_9AC08D35 
X-CRM114-Status: GOOD (  20.81  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 CK Hu <ck.hu@mediatek.com>, Damon Chu <damon.chu@mediatek.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 7, 2021 at 7:48 PM Yongqiang Niu <yongqiang.niu@mediatek.com> wrote:
>
> On Wed, 2020-12-23 at 16:34 +0800, Yongqiang Niu wrote:
> > Add address shift when compose jump instruction
> > to compatible with 35bit format.
> >
> > Fixes: 0858fde496f8 ("mailbox: cmdq: variablize address shift in platform")
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> > ---
> >  drivers/mailbox/mtk-cmdq-mailbox.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index 5665b6e..75378e3 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -168,7 +168,8 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
> >       dma_sync_single_for_cpu(dev, prev_task->pa_base,
> >                               prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
> >       prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] =
> > -             (u64)CMDQ_JUMP_BY_PA << 32 | task->pa_base;
> > +             (u64)CMDQ_JUMP_BY_PA << 32 |
> > +             (task->pa_base >> task->cmdq->shift_pa);
> >       dma_sync_single_for_device(dev, prev_task->pa_base,
> >                                  prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
> >
>
> hi jassi
>
> please confirm is there any question about this patch.
> if not, please apply this into next version, tks
>
I can't locate this patch in my inbox. And I can't fwd it from lkml to
myself. Please resend.

thnks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
