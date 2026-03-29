Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9709F3D610
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Mar 2026 16:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEm9m7dxQ5iQP9UmmPg53kE3LH2ArVB/tcgnz/gczt4=; b=U4NSJuMaK/u2ch
	L9TlmqHzUe5K5+5bUJdkINgIGloEroD56ldW/bCZ3J8vxpMIKawr98ZQ9jd1bkq6ieBVg1UarFhk7
	DaQRPFvP8Wj/1C/kWxw97kjXKozILYMm7jw/caVKb5KdMLtCstrp2xcVJZZeSuKqlTBkF8c2WR+Fp
	KiEBpU7U7PpOyovJBPCYUju52Ewgw4tJabsQQgFEtOSNFjX+jrPOCvhAXSFZqwrIGH9Z4w4PifZBx
	RWNh2/mAmSIb8Sr9YRevs2L/lW1AkeCOYPkzJ3WvJ43fyL+BhPoLhZaiDCdUXpNG7eZdKpejYoTjO
	S9KqSHaomMDOYNFBTvGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6sr1-0000000A6YO-23v1;
	Sun, 29 Mar 2026 16:19:11 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6sqy-0000000A6Wd-1pmZ
	for linux-mediatek@lists.infradead.org;
	Sun, 29 Mar 2026 16:19:09 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7d9d929e27aso3131620a34.2
        for <linux-mediatek@lists.infradead.org>; Sun, 29 Mar 2026 09:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774801147; cv=none;
        d=google.com; s=arc-20240605;
        b=Rak63W8wjjc7Bb1ORBjcYV8Ftouozp18LQeN61ydLmRwrXkGCZ0d2/IPYD8DgIENgm
         lOx8gw30zJsNm7bK215URTxp6mkvYG1sEnZBWhikb6PGr+ccq+p3wfWUEYHzlJQLaxX2
         /aMfJ48o9JMbca1Bo3317KTvXl2m6Sx8FD4OBn9IyEEJBphb/a6BOyDjuVe31jkAFZqr
         JBzcsJe7/B79fxjw15Vw14cqqpUCaOZDSqJpkOoH1ArUGNsstsoyR314jFdg9MK+8ADP
         b7+UUjPplfFmjXQxq2txoGMCrojI7cnljnsyVb0zYLBtwmr1ZUVn9cklhNNUV+L8wpgV
         ivvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gEm9m7dxQ5iQP9UmmPg53kE3LH2ArVB/tcgnz/gczt4=;
        fh=KkIAJmmaQhecKCPpFgzkf8V5BUViImlJCXiBXrf8qLg=;
        b=NU0RjV1YAUpAfXnGmi9aJVFe5rumtzmTW34ZMOHgbVz/lXD2XAooN8eerA7fhpBOjO
         GyPR8DLWOVgmesVSDns4+JO7HJVhKutiGh5hiCXrW8WN0g+C2rYL0iZSQMXh8zffcnhH
         L9krPYtfaYQFhfOSZbmlWSP+OxLmqpQ+6iHqK0eXTym/AGA9E6X7STGa/2SQSttLbW3Q
         7aaNI4PNsi9S0ZODs2Prg6uvgO3VLlXY7mQL7iLzZEM7whx2euARaf9DO4XB1OvEVsmk
         NjOIkaj38bv1SSrbuhzPZph7WYE4X4C+FMKtILkXI7WRK9MeAz3Sbo2wWhSTt4ZKGoPB
         IhQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801147; x=1775405947; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEm9m7dxQ5iQP9UmmPg53kE3LH2ArVB/tcgnz/gczt4=;
        b=JMRlTmwJdfw+ZpSKbKOLx1vfv4HEhmKXoIkrNsTOXcvXt1zrkSTtJoBKYx4TVTtbPH
         M7l4ovoRsYkhB1Woe8ynFJ4q8Hn927nery/tv+qFl9pS1a5XcoWZUJa4q93pxf6zHxw3
         UI7l9rrJO5JcqU46Myhywr5hfW+olwTZPHLtML1g/1929oHOkPg4Q3tpfp7/8ntW+3OX
         oviLL9RYunlx2GYVzEIQZugwvnFVRbparOsappOM8qdANjwDVOGp4m0fq3GINY70IYm0
         3bUKYtszKA0wGYUJfmTI2BOAVvHFDbH19ddu090b2EeLV6WITnbz9sfT/f5jgZ2JdbnW
         KJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801147; x=1775405947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gEm9m7dxQ5iQP9UmmPg53kE3LH2ArVB/tcgnz/gczt4=;
        b=l0gswB0ZmkkkBvVAhNREc6ztm3YZ4DxU7y8kkjGPSdtCZHkiMuVRDseIJzSFcXHobR
         rS6d0BNTUaJuNOJ/aeRCMrMJiJDu0ApXxH++i+UPlZIThTaKImMbRCQA3X+ewcAAXAF6
         isiQRPmmYKs6fwVA/O/3PYNCmBOtdSClCZV5TDvAMQ+KRH3D4Pj3r39mqKoe3PvPq9W3
         2/hSb4vfJEliM8WmsqmmyNWMpPEyMj6s9Cd6mgxZ7Xf3aUxpghla8HXbrjjuWz2wEk9J
         x8683wTfMvd9gYumhKGC7inBwmIoUz6BVHmmWDt+oPWL6D9Ott0dJkQm6KgROZrSWqiV
         QEZg==
X-Forwarded-Encrypted: i=1; AJvYcCWK/mTx/vy/28ISOWv1DckIOc/fVnA6kgFA2d4Eednbq9g8hTYeScGGMvTVHwTp7ygssFQAveYvwV338+hXQg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7UQczYifjEHTaWAFi34pu4hwtJs1exzUxLLm95Z/o7OE+MZlq
	jl6JgFWLOZsPfZV/222FsE7icfO/xjcVMg+cOZY4u8iF7+17ccLHxoH/7akZKhqnQB0LtBud1a1
	vGJdGun7HdyxKxq3O0mSXmMQt3wrf/NI=
X-Gm-Gg: ATEYQzzfE2R7om5NrPW2Mb+agfcShg7+Bfm9bQ0TrYacaku5odyhcpvgjz8iFt2UuS6
	wyt6AzBem+qIgKFYpnW2U6WUcaTnWqr7pWVAG0U0yQ8ISUsEDCxRXiqzLfpn+bwruWp5Th6bglk
	Gs5W/QVDUMtIm5k+uxy3FA8ro+AvgKyli6DoZcnb78ZIYj8PFdI6OEZJFRLBBv7xYFgsT9q1fIG
	rdF5d8/yGMFT2GOgFPD1zzKslgafzm2YDaLqz886HPBW4yUBlruU2kodEnUxm4yEZiABTuYKPWF
	h08wMmvz
X-Received: by 2002:a05:6830:8292:b0:7d9:d2b6:155c with SMTP id
 46e09a7af769-7d9fad972acmr5592504a34.2.1774801147392; Sun, 29 Mar 2026
 09:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260323090742.1522607-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260323090742.1522607-1-jason-jh.lin@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:18:56 -0500
X-Gm-Features: AQROBzA7xXjIQ4tkZaMphxv2Ps8tgRrWBc1wi2mt1Aa8d2cIxfJw63Lhb39TBHU
Message-ID: <CABb+yY2J5CoWcBZvf-o9jgpjYFC5PyXSpnH9UEBdNYj0rAGjEQ@mail.gmail.com>
Subject: Re: [PATCH] mailbox: mtk-cmdq: Fix CURR and END addr for task insert case
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_091908_476912_D3A229C7 
X-CRM114-Status: GOOD (  17.67  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Xiandong Wang <xiandong.wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Chen-yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Sirius Wang <sirius.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 23, 2026 at 4:07=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Fix CURR and END address calculation for inserting a cmdq task into the
> task list by using cmdq_reg_shift_addr() for proper address converting.
> This ensures both CURR and END addresses are set correctly when
> enabling the thread.
>
> Fixes: a195c7ccfb7a ("mailbox: mtk-cmdq: Refine DMA address handling for =
the command buffer")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index d7c6b38888a3..547a10a8fad3 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -493,14 +493,14 @@ static int cmdq_mbox_send_data(struct mbox_chan *ch=
an, void *data)
>                 if (curr_pa =3D=3D end_pa - CMDQ_INST_SIZE ||
>                     curr_pa =3D=3D end_pa) {
>                         /* set to this task directly */
> -                       writel(task->pa_base >> cmdq->pdata->shift,
> -                              thread->base + CMDQ_THR_CURR_ADDR);
> +                       gce_addr =3D cmdq_convert_gce_addr(task->pa_base,=
 cmdq->pdata);
> +                       writel(gce_addr, thread->base + CMDQ_THR_CURR_ADD=
R);
>                 } else {
>                         cmdq_task_insert_into_thread(task);
>                         smp_mb(); /* modify jump before enable thread */
>                 }
> -               writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->pdata=
->shift,
> -                      thread->base + CMDQ_THR_END_ADDR);
> +               gce_addr =3D cmdq_convert_gce_addr(task->pa_base + pkt->c=
md_buf_size, cmdq->pdata);
> +               writel(gce_addr, thread->base + CMDQ_THR_END_ADDR);
>                 cmdq_thread_resume(thread);
>         }
>         list_move_tail(&task->list_entry, &thread->task_busy_list);
> --
> 2.43.0
>
Applied to mailbox/for-next
Thanks
Jassi

