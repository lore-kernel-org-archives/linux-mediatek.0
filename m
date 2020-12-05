Return-Path: <SRS0=IZYC=FJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12308C4361A
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 07:30:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6034E22D58
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 07:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6034E22D58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3u1A5a8sOlr71OWygxOAV7T7B9xCacoO2CZB1a5S6/c=; b=pPL0FveLHVgtrorKN2CeZfuFh
	YxBdgQU0BlwkMJW1c1/xrOi9On2k3cV4MOai3kZpB5GfzVE4wlMLpovqhirvr1prmrjhjRSjbb7gs
	9OSInMs5NLzcIhkeqVzcinbL2m5lYffV5SWC+5tMjrMsaC3CqAZBGRkedQWqkF+RGdPrcAkciPPq3
	ypAHDr0l4waoFONRX9H3BtA3XGPZzUhbP1iQZvv/c9dWiWB4Eranfm4kQuoTkFyoKKumJEHawNcbp
	4cWLEvV8z8ef1NxyxAt/Dl3dkytuP3CqI5rYZN4sXvsLCHWAYraXryDl39/Exhycqhoue91W2NOCu
	X3P3sHyvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klS1j-00037J-NL; Sat, 05 Dec 2020 07:30:43 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klS1g-00035q-A5
 for linux-mediatek@lists.infradead.org; Sat, 05 Dec 2020 07:30:41 +0000
Received: by mail-vs1-xe43.google.com with SMTP id v8so4618971vso.2
 for <linux-mediatek@lists.infradead.org>; Fri, 04 Dec 2020 23:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PVl4mPVWUd46XCRZhLi+cr8uHjV2Z7jL+fg9NKg+71M=;
 b=edNOUVq1cViNXg/pK/xleKw22hUhic5MPStTYjmTnNbv6cJPTLcYUGVIbO4j8F1Rwt
 +wAkFzgwazwvbS0T5M2ifmb+D8ndT+wHnhthjt6FyAg2MSfJwEpJ2bEDmWnfVDU4TkAF
 bh6jee8qRJQLxC8G5NP98H7QAA87eRixtY044=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PVl4mPVWUd46XCRZhLi+cr8uHjV2Z7jL+fg9NKg+71M=;
 b=tOSQFMXM89AkMHe6mXQQ5uTJ/oWZLuQEAsHxQMfQPX2R9sa56Ad7svwXNsfoUOIi+A
 pX7uh+VxHn2ocbJf2vOJRs3ROsWGCZJSB3HtoSkXNpKeaM7plyaIsSKmUohH7YcMCf0A
 RhxpGKvZ9DRsIDJGRqM0HTGxl3oeAQSu69bhCKBIH+H89/YB5h0i8Cvmh6kfU+pSOdzv
 0p3JSNS1SUqyEmEuHvMWRvcqZJzDGoXzL9sRkSxL4A/JQTl62g7rgwqAgW3T7gKuwDTm
 ldxU96OLfqkrNTT0ucSxVri/d5bU+bNwWKuDkd62mt7L1FO/v1/25Y7HokuEtq6HXeWV
 CsXg==
X-Gm-Message-State: AOAM532M8ZdksfIr0Qh+nzr3FDEt5KLt7F4RuzbyP3LGZwG0gNeJAFy8
 cnGZXmBM5lFxKs7Cg6EgQI6/u+BM/ltLL1rOpqE71g==
X-Google-Smtp-Source: ABdhPJzXvqDzLe1ZMwTemW7PNInHdQEHH3HkYidK1l7D2zd1eYtLyFTuqpYjAg6WH/cbCWE4eSurnelP7EVha8x8nbo=
X-Received: by 2002:a67:ff03:: with SMTP id v3mr6924809vsp.48.1607153436299;
 Fri, 04 Dec 2020 23:30:36 -0800 (PST)
MIME-Version: 1.0
References: <1607141728-17307-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607141728-17307-5-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607141728-17307-5-git-send-email-yongqiang.niu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Sat, 5 Dec 2020 15:30:25 +0800
Message-ID: <CANMq1KCX+iPXVg-xqVKBGNTfJty=cu+MQYaujjv4NgTd1C740A@mail.gmail.com>
Subject: Re: [PATCH v1, 4/5] soc: mediatek: cmdq: add address shift in jump
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_023040_528959_70495EA9 
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

On Sat, Dec 5, 2020 at 12:16 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> Add address shift when compose jump instruction
> to compatible with 35bit format.

This looks reasonable, but task->cmdq->shift_pa is not new and was
introduced as part of mt6779 GCE support.

Do you want to add a Fixes tag?
Fixes: 0858fde496f8 ("mailbox: cmdq: variablize address shift in platform")

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 1c01fe0..5ed39f8 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -174,7 +174,8 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
>         dma_sync_single_for_cpu(dev, prev_task->pa_base,
>                                 prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
>         prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] =
> -               (u64)CMDQ_JUMP_BY_PA << 32 | task->pa_base;
> +               (u64)CMDQ_JUMP_BY_PA << 32 |
> +               (task->pa_base >> task->cmdq->shift_pa);
>         dma_sync_single_for_device(dev, prev_task->pa_base,
>                                    prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
>
> --
> 1.8.1.1.dirty
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
