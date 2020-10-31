Return-Path: <SRS0=R22q=EG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54821C00A89
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2020 01:49:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC8E720702
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2020 01:49:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PuNfk2Ph";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PzOU5zcQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC8E720702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1T7rZeFQo5S34EoT1p2N4dwDhBPqI8sm9+JrRWKA2HU=; b=PuNfk2Phr1Ufe7flDfrw87QDt
	f9lcGlHyW7I1r8OuI/NJjvFPJZ2T4vD8jQY/gip+EvvLL9Hve6/AZgR7BG/XrO1SBnezXg47Yj4Cw
	kNOEKfbIOTi4HLDboHIHdxFCFO/rB5OAqOx258yptbRR5XHY+IdJXb5NGaDIVAwTCynDOFRshfwkH
	73NO8athUI0ptUNQLWdd/qFZUhj6rPObTSB38ARvMh0MTHuu9V1jxrYHiWpX6Cjm+/wsd6tKmNh5Y
	ufZ+T0HQlo7vC/0Z4KpltC64LdOdHLylvB1/UaWBDCNGovilDw5IMjVEbGw0a0GTsMTOyRfSHmmBU
	DGPHNk2/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYg1I-0000T7-Nd; Sat, 31 Oct 2020 01:49:28 +0000
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYg1E-0000S9-RG
 for linux-mediatek@lists.infradead.org; Sat, 31 Oct 2020 01:49:26 +0000
Received: by mail-vk1-xa43.google.com with SMTP id u202so1855556vkb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2020 18:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZPV/6ZjBRsY6KZRFVNPjP+7C/4GJI8B4fX6GI9U1bfY=;
 b=PzOU5zcQSwvi3EzbEIVtg/DDLYvsBmNveN2MNbLTY9mOYyUxQcT6gnk2XY50TSq+Mz
 3ZcJz1PeIpxCswbwjZlQlHFzrSksRfTGt1+j7WVq4oKwFdbbLh2Mxe6/Bq+E/XxJVT+p
 +Z7jFzxTvSthZYITChYtjD1+qY54ytXoGDKWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZPV/6ZjBRsY6KZRFVNPjP+7C/4GJI8B4fX6GI9U1bfY=;
 b=C9WGLcWx0xnaVQZUq5Y7B52sXTJGP0svfeoXqJyeQoDeuMlMti5x4kQ5oZ0FY7gBlq
 PbOkZZiVs6VJjF+MoEWQlRIESNbP8YS5+AYJM9yZt/E5eEiIkS0cvh02LTO1pZHOj0CW
 INKD8GBlzme5i+IIE+1Ek8iGKCaejwnmEmiED6hst1rY74PTRIc5LQj4K6fIOv8r299V
 JJ7Ww7aVwGYtNSGJWY5OZPgjjT3Cq2FB261FYhC7WKO1PyNmB4R2rLnJRly7aCmXOaXp
 rX4mrVgrFJWQANNlK4fDGKAgbOqUAN2IGWyP0uOtADa3VZFcJjFHANO8GZEla8RKh8dC
 DIZA==
X-Gm-Message-State: AOAM530NIVlsIMFiqTFyCiEgtcYqtx2pXyWBm+EJ3PYnf7CPIIRlC35P
 tvbh7Kg3cDkeqS8F0BHtomCYgjEDJWoL+vdvOJ0/mg==
X-Google-Smtp-Source: ABdhPJxBfKPPEJsrRFAmfTb4PERFWlWcbJtupKxWmgnrLFxU+/eLQiLlHLypOOh1LpMzphA/TROBecVMymzvZfkoUrI=
X-Received: by 2002:a1f:2e45:: with SMTP id u66mr2964184vku.9.1604108962735;
 Fri, 30 Oct 2020 18:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201022094152.17662-1-houlong.wei@mediatek.com>
In-Reply-To: <20201022094152.17662-1-houlong.wei@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Sat, 31 Oct 2020 09:49:11 +0800
Message-ID: <CANMq1KC0nDNRUGm8Y5Lw1nH1uecYx7FnG9sWY=Gg9RhisroafA@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: cmdq: fixup possible timeout issue
To: Houlong Wei <houlong.wei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_214925_019052_A92D8342 
X-CRM114-Status: GOOD (  21.27  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Daoyuan Huang <daoyuan.huang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, CK HU <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 ginny.chen@mediatek.com, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Thanks for the patch.

On Thu, Oct 22, 2020 at 5:44 PM Houlong Wei <houlong.wei@mediatek.com> wrote:
>
> Fixes: 576f1b4bc802 ("soc: mediatek: Add Mediatek CMDQ helper")

nit: This belongs right next to the Sob line, but I guess/hope
Matthias can help you fix that ,-)

>
> There may be possible timeout issue when lots of cmdq packets are
> flushed to the same cmdq client. The necessary modifications are as
> below.
> 1.Adjust the timer timeout period as client->timeout_ms * client->pkt_cnt.
> 2.Optimize the time to start the timer.
>

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> Signed-off-by: Houlong Wei <houlong.wei@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index dc644cfb6419..31142c193527 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -350,7 +350,8 @@ static void cmdq_pkt_flush_async_cb(struct cmdq_cb_data data)
>                         del_timer(&client->timer);
>                 else
>                         mod_timer(&client->timer, jiffies +
> -                                 msecs_to_jiffies(client->timeout_ms));
> +                                 msecs_to_jiffies(client->timeout_ms *
> +                                                  client->pkt_cnt));
>                 spin_unlock_irqrestore(&client->lock, flags);
>         }
>
> @@ -379,9 +380,7 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
>
>         if (client->timeout_ms != CMDQ_NO_TIMEOUT) {
>                 spin_lock_irqsave(&client->lock, flags);
> -               if (client->pkt_cnt++ == 0)
> -                       mod_timer(&client->timer, jiffies +
> -                                 msecs_to_jiffies(client->timeout_ms));
> +               client->pkt_cnt++;
>                 spin_unlock_irqrestore(&client->lock, flags);
>         }
>
> @@ -391,6 +390,21 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
>         /* We can send next packet immediately, so just call txdone. */
>         mbox_client_txdone(client->chan, 0);
>
> +       if (client->timeout_ms != CMDQ_NO_TIMEOUT) {
> +               spin_lock_irqsave(&client->lock, flags);
> +               /*
> +                * GCE HW maybe execute too quickly and the callback function
> +                * may be invoked earlier. If this happens, pkt_cnt is reduced
> +                * by 1 in cmdq_pkt_flush_async_cb(). The timer is set only if
> +                * pkt_cnt is greater than 0.
> +                */
> +               if (client->pkt_cnt > 0)
> +                       mod_timer(&client->timer, jiffies +
> +                                 msecs_to_jiffies(client->timeout_ms *
> +                                                  client->pkt_cnt));
> +               spin_unlock_irqrestore(&client->lock, flags);
> +       }
> +
>         return 0;
>  }
>  EXPORT_SYMBOL(cmdq_pkt_flush_async);
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
