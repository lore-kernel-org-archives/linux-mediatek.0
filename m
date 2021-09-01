Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4269C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 04:36:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DC9F60724
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 04:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DC9F60724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQa9rC6SA478YGTVeWwLE2kygBNZk6EhS9VfeEgZsW4=; b=3jS9qiKtOgp/KS
	GkaUF+jYH33b4ojBPR3pBWRkq92N6lDFbZEVp9nQo/pB/n0I6S2thnVqOxdb3UWgYpOcGaNRQXONn
	FhTfFOIbtH4Tt1n+AJ72WefrLOaQ64aabdjVjhUJK7bPfaXzeoYRzL8pPUn/jeuYesHfRVMaJ1FDq
	/2r0GJKLCoAas2Bh8wJAO5M7g8d1eNfCfMndD7G/o4umFEdzW7wgrpKUZ5TxfpShzfEN8CfzEt9iD
	gycFg0jbV8fsHo8b/FgoHMQQrSzQnUXz6SksV0lPNkkR7p0uwT9v7Z5i4+iK151wQTvf+KqvYMAte
	eu4Ck5u0ino1EmxeSdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLHyt-003mbP-PG; Wed, 01 Sep 2021 04:36:11 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLHye-003ma6-9i
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 04:36:00 +0000
Received: by mail-lf1-x129.google.com with SMTP id p38so3826786lfa.0
 for <linux-mediatek@lists.infradead.org>; Tue, 31 Aug 2021 21:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lhspy1Lcz1PiiBOGE+v1mcRdMh4tYchPF+3AL6Zubvk=;
 b=J93QWDCZT6uuBqffhguCrmmulYwP0uLkMtoO28ijrPVTOU+0AhmYQRXxSmEtUWr6Jr
 9MgdRl+11hjg+mUW4dhUv4dTavhx30vBmZgVeQG4qdf3fxJpANvQHaUHm6NaRqE78sho
 qw8ZTRLNXUYvPIxw8vQ8fB6SKwgd5fACA+XHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lhspy1Lcz1PiiBOGE+v1mcRdMh4tYchPF+3AL6Zubvk=;
 b=Z/ZO1xPYVLiVJaPFrI5Buq75n2FnedSfMrkmzrdNreHh/YYKrk5Jx7XfIChzYgXyMk
 7TINE3+7eCVgfVsUe2Ji2adNUYDS8AVUqG8j6y6EPx5mj9lidx/vD0l70fCY+wKRmMoz
 97FcJNav2nVjPyTJNo+yCwaWl098nBB70NvjsIVsRgmMzA7wsptVqoNR8fm5GJpw15dS
 6EeQIYhDgx994GOaVfVZTTvdr/RMqSnde687gWUygzYdz6YaV127dKuRPBqH3ZMe+rpn
 qKkecaJgkufhNQNv1aTKqWo0p/IeVkNXTo+VyQWSxgt+jdJAp+7q9yvtTcDdPZZCcsjn
 EGHw==
X-Gm-Message-State: AOAM532hx/o/LGiKG/bx/BNRFGVFQTofr3E4pNwJJsjp180QmImflGIz
 xCb0COwL8fT6VRg7SLp3ZD1HMD3ZvIuERo5RESVisA==
X-Google-Smtp-Source: ABdhPJwE4jWrVsnG8qdYIOadYpldVmY+nJaGWsWtd2ijWGWx7vBq3pDPcJJ8hJSsKuUwLelkLoQY0/YgYsZN8Cvigzk=
X-Received: by 2002:a19:6455:: with SMTP id b21mr24188573lfj.656.1630470954146; 
 Tue, 31 Aug 2021 21:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20210830003603.31864-2-zhiyong.tao@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Sep 2021 12:35:43 +0800
Message-ID: <CAGXv+5HeNj2Ly-T1bWMvnYXv6nP-Q1kv+D9QEd+5u4xfNVibOg@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: pinctrl: mt8195: add rsel define
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 hui.liu@mediatek.com, 
 Eddie Huang <eddie.huang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, 
 Devicetree List <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_213556_418078_48A58EF7 
X-CRM114-Status: GOOD (  18.72  )
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

On Mon, Aug 30, 2021 at 8:36 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This patch adds rsel define for mt8195.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/dt-bindings/pinctrl/mt65xx.h b/include/dt-bindings/pinctrl/mt65xx.h
> index 7e16e58fe1f7..f5934abcd1bd 100644
> --- a/include/dt-bindings/pinctrl/mt65xx.h
> +++ b/include/dt-bindings/pinctrl/mt65xx.h
> @@ -16,6 +16,15 @@
>  #define MTK_PUPD_SET_R1R0_10 102
>  #define MTK_PUPD_SET_R1R0_11 103
>
> +#define MTK_PULL_SET_RSEL_000  200
> +#define MTK_PULL_SET_RSEL_001  201
> +#define MTK_PULL_SET_RSEL_010  202
> +#define MTK_PULL_SET_RSEL_011  203
> +#define MTK_PULL_SET_RSEL_100  204
> +#define MTK_PULL_SET_RSEL_101  205
> +#define MTK_PULL_SET_RSEL_110  206
> +#define MTK_PULL_SET_RSEL_111  207

Could you keep the spacing between constants tighter, or have no spacing
at all? Like having MTK_PULL_SET_RSEL_000 defined as 104 and so on. This
would reduce the chance of new macro values colliding with actual resistor
values set in the datasheets, plus a contiguous space would be easy to
rule as macros.

ChenYu

>  #define MTK_DRIVE_2mA  2
>  #define MTK_DRIVE_4mA  4
>  #define MTK_DRIVE_6mA  6
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
