Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E182AC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Nov 2021 22:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h66O0lMUAvpNbfByfoAA3VYOqZWTOAK9XTtplqOujCs=; b=cNBaNKpof0brr6
	aGCVG8sGki8mZM/9Q7sONSUChYyrlUbcfe+zDPVTGoOlB599WhVdU/PradWzMLDwb1v35tjZkDmzr
	OP7aVI5+/AlLpSktInr8nxPsWxtCICD/IngoCuOzSx1DIXzItpEZB5d/d0O1ccsCTQMdGBaXKaljy
	L4oACGTDB7OANuq+lZ/oJcY4V51mTzRDgj+0ON8gqKI5r/Y3VohDLS7ok21iMQ8+luGFiavitr50u
	uGZb5wTybBdVX3/4NkqGvND8MstickkbnAQ69r2M4pyVBxNbRZ/RFH1qJk3zKip6p+QVRS8j7tVJj
	G+bGqKaYQfdd9GBEHK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1movi0-00EPm7-P4; Sun, 21 Nov 2021 22:53:16 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1movhm-00EPjD-8M
 for linux-mediatek@lists.infradead.org; Sun, 21 Nov 2021 22:53:03 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so7613026otv.9
 for <linux-mediatek@lists.infradead.org>; Sun, 21 Nov 2021 14:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S//kcdyi9GmuVtFFWZJxzddMkWbwj0AFmp8Ot6MTCXk=;
 b=IMU391RrRtUnCOvmWJGSJh/nGzQfdq8VclIfY4AqWUvZ0pcjcKHK/KIf+a+PC+ebK+
 8mKuwjNlt1KEvyRebl0A4lCgzwGJUiHwqQ/t9JQ5Mtd2MKk4YhtcnTo7vUmeGtamXsMn
 XxqAERrg42V4EsCVFPzYnGhe+oMpiUtgPAVUhfer3Ip6cNGxdPAhGYDAI8Nl38HD+qRh
 ByQ+SZGWOnxaKJhvZV1gEGO9ZRJqvC4OusufJlPUk31ro7wSdw5Xf2JdjrHTC/m+D+2Q
 hkH9BJaC9pZkwvYJRi/p4dy7Y1ClbQiFXWD1aQ5TGW0fuKTH4cFMTeEaWFC3Uxf0O8Zl
 yZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S//kcdyi9GmuVtFFWZJxzddMkWbwj0AFmp8Ot6MTCXk=;
 b=79Ufra4BMLGZHYN5GT5nQX7GU+y96+gGhZVPzvX9Iyt3jlyh3136BFGJb179dEEcnX
 N1Js08yGrRArqx7pEblcFu8BZA4H9VImO4AiYUz4VH2Jv99UHIrs4mtzorqUIx7o+u6l
 UY1WIjaS2meEuJTX+rSKUsZ/1pbb2inSaKvpyAVXPAaEPyufDEBR/iVOMl9EquE3VMvz
 xP9U2JZglmGgRfPohDP0c7eRo0ATSpm58xzHgp5jVLrNYVcsngWvTa12h0X2UzrNsq2f
 D6e6O4kCgXwOt18IqhnvIEdBxeaZpNUNFmTgqpkPY05F+t2S4mQMR/04zkwENxv/b9Nu
 6J3A==
X-Gm-Message-State: AOAM533J+F+4iyHYlUd7Mj1Iz5r0VPePZ5SD6dd2SsuWH5/j4RFsPSnH
 tk8uM3nXzMRkzPPKXMcMa/oSzLlyST9VawKSpyI1zQ==
X-Google-Smtp-Source: ABdhPJwh1/64QH5jwxroi7Tl6t/WXccLTmI+SyTglDokhNiEBtObr6tMM78Ecm4rZRJ3pRiJFlx1BUbLKXeYlxBHm8A=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr20428469otj.35.1637535180934;
 Sun, 21 Nov 2021 14:53:00 -0800 (PST)
MIME-Version: 1.0
References: <20211110071900.4490-1-zhiyong.tao@mediatek.com>
 <20211110071900.4490-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20211110071900.4490-2-zhiyong.tao@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 21 Nov 2021 23:52:49 +0100
Message-ID: <CACRpkdY_kFM_2bvwZdxTLnLWy3NB_LOpCKiRCuRvRi3k+XAwRw@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: mediatek: fix global-out-of-bounds issue
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com, 
 sean.wang@kernel.org, srv_heupstream@mediatek.com, hui.liu@mediatek.com, 
 light.hsieh@mediatek.com, sean.wang@mediatek.com, seiya.wang@mediatek.com, 
 rex-bc.chen@mediatek.com, guodong.liu@mediatek.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, 
 Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_145302_327124_29610C8C 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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

On Wed, Nov 10, 2021 at 8:19 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
>
> When eint virtual eint number is greater than gpio number,
> it maybe produce 'desc[eint_n]' size globle-out-of-bounds issue.
>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes in patch v4:
> 1. fix sort signed-off-by name.
> 2. add Reviewed-by.

Patch applied for fixes!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
