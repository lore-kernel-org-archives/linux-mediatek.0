Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B68C48BC2
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 00:36:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 752D461352
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 00:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 752D461352
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOPPh1X3h4JrirYaqeSVaNk+CwCoLgH2YAgkHa0kTds=; b=AFbYabSMW8FY89
	PnitkHLfFX+YnZuHgnjRhAQAGuxBtstH2RKvRIotVG+N/DH6gcHzkKoziJowDmMJzzN6fyTjEVHPA
	WXxPX2b68FvPe3lgCWke1TK6VCNiK5k/P2rxQw2JLJ2NgozR559m4SRY7GVlwhzqNdBbwXjLrMj85
	XAb+2sTxTMc98edbd5rLaSN2FB6phzHtqUgzExJfQXMNSwTr6sHn9/ozM7Gv2G2d08BS45bzQCr3W
	4zilZoyib1Z+Un9YVCw/FASTrMPOZNS4WBD8s8I57m+rv8TI7ohjpF7BNlI+vRKsMhLYiw5yWAqo+
	C0loaBm57bodHFOrRKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxfG5-006MBr-D5; Mon, 28 Jun 2021 00:36:17 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxfG2-006MBJ-Op
 for linux-mediatek@lists.infradead.org; Mon, 28 Jun 2021 00:36:16 +0000
Received: by mail-lj1-x232.google.com with SMTP id k21so1951210ljh.2
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Jun 2021 17:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gaVCDaYqtt9b3KVihy9mfeTRmIqBNx++UINpmJ3IlGo=;
 b=ewfww11LZVv3L1/XDYvF41JFKOeUxXAJrE0cxkokTyX5A/WOVyjJvC/gPRep56Ec6Z
 kcdbwGmb2AfXCuco2oNp2Ae9BtQTGaNzFDbQfMz4dnh/KYf1TWTa+5UTJqkX7O5MLGu2
 DsNLTZ1Dxu4oKIlYZL4zHrb0bOXc4mw9dIgP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gaVCDaYqtt9b3KVihy9mfeTRmIqBNx++UINpmJ3IlGo=;
 b=VRCaEXS47a/MbapCFZoCW8kNRkmSAimJRcXkvV0Me4do48g5B1w6xI6Zaj1tgrEfD/
 LN+t3SG9jX5rqmSK//wOQLKT0+/aw7TXGinfji10t0k+e3hDKeYmpGCrSfAg65IeQetG
 ntr7UKRxhxW6V9m1YwdAh8GFWuPDEkUp7KNtLLWpsGAQvXf1Vcsw7Ssyl3fX5oMp08RV
 hj1A5U9u+8sOdDvpNwrM+RVIljNYhGh4FBDsN6ayAjCq+owWMy79ZiGnYe5mcJvkthUq
 sCxgtR8bRw7qd9t1eLyxOedjN8M396dBnH2BcfixHahPe8HHuJwgwxDtkpTw5WLVVbGk
 GwlQ==
X-Gm-Message-State: AOAM5313aTOXyxc+M88WtnVOdCtOa/OoRnD8THJPozAqKwYnRcSNKmGT
 AmOZQcICTzNYhMYz9uwddYhlom9fvEQlmTlfkuY=
X-Google-Smtp-Source: ABdhPJzaejYDWdM/2Hyy4nZxgKtFKm9mO/k0+dGqArcaNwM18fSPXqon7827JSHaFS9o0hltv/Ql4A==
X-Received: by 2002:a2e:b790:: with SMTP id n16mr17844653ljo.9.1624840572118; 
 Sun, 27 Jun 2021 17:36:12 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id h3sm1163548lfg.204.2021.06.27.17.36.11
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 17:36:11 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id a11so28902791lfg.11
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Jun 2021 17:36:11 -0700 (PDT)
X-Received: by 2002:a05:6512:331a:: with SMTP id
 k26mr14837143lfe.152.1624840571313; 
 Sun, 27 Jun 2021 17:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210625062448.3462177-1-enric.balletbo@collabora.com>
In-Reply-To: <20210625062448.3462177-1-enric.balletbo@collabora.com>
From: Eizan Miyamoto <eizan@chromium.org>
Date: Mon, 28 Jun 2021 10:35:54 +1000
X-Gmail-Original-Message-ID: <CAOak1e8uJum7Wf6Z6CO_w5+aKvbm5JvwRYuT+Rzp2LwTOh_vQw@mail.gmail.com>
Message-ID: <CAOak1e8uJum7Wf6Z6CO_w5+aKvbm5JvwRYuT+Rzp2LwTOh_vQw@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mmsys: Fix missing UFOE component in
 mt8173 table routing
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Eizan Miyamoto <eizan@chromium.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, drinkcat@chromium.org,
 hsinyi@chromium.org, 
 Collabora Kernel ML <kernel@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_173614_869995_7635C1F9 
X-CRM114-Status: GOOD (  21.58  )
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

Dear Enric,

Thanks so much for your hard work bisecting and crafting this patch.

I have verified that it fixes the DRM issues we were seeing on MT8173
with Linux 5.12.

Tested: Eizan Miyamoto <eizan@chromium.org>
On Fri, Jun 25, 2021 at 4:24 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> The UFOE (data compression engine) component needs to be enabled to have
> the imgtec gpu driver working. If we don't enable it we see a black screen.
> Looks like when we switched to use and array for setting the routing
> registers in commit 440147639ac7 ("soc: mediatek: mmsys: Use an array for
> setting the routing registers") we missed to add this component in the new
> routing table, it was present before taht commit, so fix it by adding
> this component in the mt8173 routing table.
>
> Fixes: 440147639ac7 ("soc: mediatek: mmsys: Use an array for setting the routing registers")
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>
>  drivers/soc/mediatek/mtk-mmsys.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
> index a760a34e6eca..11388961dded 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -209,6 +209,9 @@ static const struct mtk_mmsys_routes mmsys_default_routing_table[] = {
>         }, {
>                 DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
>                 DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_RDMA2
> +       }, {
> +               DDP_COMPONENT_UFOE, DDP_COMPONENT_DSI0,
> +               DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, UFOE_MOUT_EN_DSI0,
>         }
>  };
>
> --
> 2.30.2
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
