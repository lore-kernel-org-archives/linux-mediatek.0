Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD94BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 07:01:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80134615E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 07:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80134615E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bI9amc5Uv+6c/ZJOHR+BqhI5y/KCp9rTbBJ2c3VQCJ0=; b=kp/1xIYLulayd8
	P8Aei4Efnvsv0LzFp52m6BFfTe9Zw63r53kr+K2TcPscV1RZZoDCJb7+/r7j0P0lpUEH3ExmjCWu8
	seTL+Uxr1aIuhhhKAy50rhETzcLjH/WCmlJaERMgQz+QumbUgQXaRUJLOS3Hn3R+AJiYdYpmYxtaa
	Dk53qss916nn2CD5YXiNjx++otISyb6ZNqVk+XtuB3d6+drPkUPYfiIRoYhFNl4+UW9WReHgpSA7S
	u0LsFkkSSVqYO/UM4kZszM/ln/yi84x8++ehaDgbi2NiBuXl5rS/aBtQvPC0q8c0bNyOyuWrBEwgS
	np4FJYC5LlbLyHdAC7Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVq44-00D7uA-Eg; Thu, 30 Sep 2021 07:01:08 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVq3p-00D7rv-Kc; Thu, 30 Sep 2021 07:00:55 +0000
Received: by mail-ot1-x335.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so6108126otb.1; 
 Thu, 30 Sep 2021 00:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ue6uNPnLLdl7jKDUxvPsPxqXMJIv3DpHCbjBPHb+V6E=;
 b=XalgEcT5QsfkjgOWM+i22TOdnTp9NNx9Fvrc5aCHWIEn163QTmmLjPToqPsmoDAJ21
 ne0f0Mu2dMhCrid6VICN7O8aD3gymPvbNeSK1HJNu3MlfWSvxVN8hZOlvC0ovLls1RU4
 2ARRLjTEOit9maXcJVMDDyY3eHr9RL0jN9LNrVDl+4wrF9Y7jjRNqEzvEm5LJV+jp8aN
 XMsNSyWJwtk2jp2tacZeJkCgKGj2VgNLV22MkJnpq8eqyrHz5by2GAiJB7pHlLUqs2mh
 2TAbkICBraqOUtSibZiHg9njNTbizCoD6O27P7MDFWge0HWGXk2hqOqYcM52h/xUyaah
 ZAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ue6uNPnLLdl7jKDUxvPsPxqXMJIv3DpHCbjBPHb+V6E=;
 b=fh8SzJaA92ROm6voAFWs0sRrxp2GoRLlJrraQEFm+l1oN+zG4pNvlaRDxmEfkTCawg
 63Y7Ke89biU+J7hc1WwK/KVsJ4LWJu3DHt55aROc+lyH6rLE3DxHfJQcLj5/rm50+kTP
 jjfxbh9qOcgAyuDxy70Y8EazCg+6/EIv+gJeu8VOvvszqnkvuwi5Tfh0NkaWThyHWR0y
 O7KO7gQN1aAsDsHKX8F92B34z1SqTEl3JaM0qiwgbL7Vz5xXmf1jnNdNkym6kAWtMeF5
 KolSqrtCdaPefRoCRZeUcWAAq5RGggbyeJ2JOv/JupaR9Zpup3VdIz9SnASZtRvlmYbB
 gHag==
X-Gm-Message-State: AOAM5331mRQNNhtuJ36nP9mdQSqe+E/s911F8OD323GQzX2iyEA0nRYP
 7oANDn5PymXGjeU8doYO6SDnERX6avbjq398p6o=
X-Google-Smtp-Source: ABdhPJy3XkRsegSss9Hy+paR7Fpx8O2PdcXw9Xl5jXPSzeYvrSlpIJ8rmYtlF0sh6lW9S9hQLSPN1YrmuBQO9ou2QsQ=
X-Received: by 2002:a9d:173:: with SMTP id 106mr4021216otu.150.1632985251729; 
 Thu, 30 Sep 2021 00:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210929070807.4488-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20210929070807.4488-1-jason-jh.lin@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 30 Sep 2021 09:00:39 +0200
Message-ID: <CAFqH_53KkXEB__cMiQ6d_vKu1jy71XyaNRfoULmMOpSsfQdQAg@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Remove WARN_ON for async_cb.cb in cmdq_exec_done
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@google.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "Nancy.Lin" <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_000053_702371_760A24F0 
X-CRM114-Status: GOOD (  18.99  )
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

Thank you for your patch.

Missatge de jason-jh.lin <jason-jh.lin@mediatek.com> del dia dc., 29
de set. 2021 a les 9:08:
>
> Because mtk_drm_crtc_update_config is not using cmdq_pkt_flush_async,
> it won't have pkt->async_cb.cb anymore.
>
> So remove the WARN_ON check of pkt->async_cb.cb at cmdq_exec_done.
>
> Fixes: 1b6b0ce2240e ("mailbox: mtk-cmdq: Use mailbox rx_callback")
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

As expected this removes the annoying "false" warning on the Mediatek
devices I tested.

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Thanks,
  Enric


> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 64175a893312..c591dab9d5a4 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -195,7 +195,6 @@ static void cmdq_task_exec_done(struct cmdq_task *task, int sta)
>         struct cmdq_task_cb *cb = &task->pkt->async_cb;
>         struct cmdq_cb_data data;
>
> -       WARN_ON(cb->cb == (cmdq_async_flush_cb)NULL);
>         data.sta = sta;
>         data.data = cb->data;
>         data.pkt = task->pkt;
> --
> 2.18.0
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
