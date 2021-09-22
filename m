Return-Path: <SRS0=6VVk=OM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69C0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 03:09:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C2A960FA0
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 03:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C2A960FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odgS1Xtat3dsQrM6k4E2YlOTMYQpP2o/SzrmfKXUZXE=; b=PsgXIK/Z+DwRiM
	LgHy1USj4qiQXD179+KQwsqiYunu89vEX84cqKgQ7jrDiZwWrHRJSaL8C0pcN+PqnKNPxiftD6Bz9
	aFLMcf/VS6fFQfJciFt7E+dJASq2pfQsHHWKMweglcY2XLX8X3iqwr0geL/rZOyvToqz5cEc7ErTJ
	6RujDt5EnMt41iRTYQKegIsBNOiLkmC2jGu2RPS7mtAsKCmXiMSM824ip7kGoTMm+5aSck2oaJgUI
	aEqhC9mdZrmgDHi7nwCAqmRgtwKEv56LiXb7XyQLBJaFBOOrAdfg7alBCkcunE9JLFYvlLYt3p0Ue
	Wp9S+CQKssaVB/7R+2XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSsdC-006os5-Cd; Wed, 22 Sep 2021 03:09:10 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSsct-006oi6-80
 for linux-mediatek@lists.infradead.org; Wed, 22 Sep 2021 03:08:52 +0000
Received: by mail-lf1-x135.google.com with SMTP id g41so6077540lfv.1
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Sep 2021 20:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jvDHJ7BpWxgug9U9vBbLk1VQrGHUm2D+G+8DLCbP+bY=;
 b=Sfgsur3unKHCxqZ719aFss9Iu86/cxn/VrdBaa7t0sVfZbZ04ROT6DUvvF3it4orPq
 3LhMVXZA4pU7CBnxGrS9DyBiNXXr8/bOw7ZL2Uij+QQ8/Clst6kCbXd+thMELOx3WWFv
 hoOf9UsOV81dDEkVI1gPR5gR17doBuWVXzTDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jvDHJ7BpWxgug9U9vBbLk1VQrGHUm2D+G+8DLCbP+bY=;
 b=Fs1wUdpLM9ePlh6PT9lujlkUetNVNrs/mfb1B2SWSUJ8oQZdtsJpOop4ZInFINwbTJ
 MC82GIaw74/EpLMorb1iON+ZeRW7v2R0FMimxskfEqP9HbF5urr4Uhp0i7wfR6mB1r+L
 isJIgLvvJLxPv+yCh6vhlgiLTRxG+Va6CWNxMixTebs1svuaR22kJzoJmL7rjp6PpM/0
 rEkzrXXhHMEQ/h/5tx+ESUu3rkJGp5vNnHsfbn0DtBP77/tcjnsSrnT5Nog0kYprSMW1
 YAddFdoCr3SfjtoQQdtfv+G7UcUcUPIMy4zS/Kmuxh9fbwVVGW3sDhEt4GqfsFI+rTVC
 ZAdA==
X-Gm-Message-State: AOAM531mqpz+0G3ar3foDCVEAyRwbuL/ysR4U0nddKXin8NkcASU2l77
 0WoFxmsXQfmOHsmcSr562qsI69uQyMF1iBUO6Sij+w==
X-Google-Smtp-Source: ABdhPJwXu6UxZE2/bkKplxqrHu28gVpzzYxNZSK+7DKxIotOikhK8OfyyvyApfd/1hOqHv5/p6JsHHkF9q5bI3DOZ6s=
X-Received: by 2002:ac2:4c4e:: with SMTP id o14mr27470353lfk.482.1632280125364; 
 Tue, 21 Sep 2021 20:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210922025640.11600-1-zhiyong.tao@mediatek.com>
 <20210922025640.11600-4-zhiyong.tao@mediatek.com>
In-Reply-To: <20210922025640.11600-4-zhiyong.tao@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Sep 2021 11:08:34 +0800
Message-ID: <CAGXv+5G9cW8uNnaUDzoAOWdy4Rw1Kgm6D7jFhHY2rE_vW4JGFw@mail.gmail.com>
Subject: Re: [PATCH v13 3/5] pinctrl: mediatek: fix coding style
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 hui.liu@mediatek.com, 
 Light Hsieh <light.hsieh@mediatek.com>, Biao Huang <biao.huang@mediatek.com>, 
 Hongzhou Yang <hongzhou.yang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_200851_317889_04D471F4 
X-CRM114-Status: UNSURE (   8.39  )
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

On Wed, Sep 22, 2021 at 10:58 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> Fix Camel spelling coding style to avoid checkpatch
> warning in a following patch.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
