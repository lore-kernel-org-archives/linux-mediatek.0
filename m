Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88118C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2CoTYYkSpK+sQj3p0R6Cfi101yt3YpQVds/7qZK0/E=; b=kaQj/sB87FvW4jMc4xCsyQAENF
	HsOlNbO+QKSQA/ftcLr/aGlB7JjBtCbI5zXcZofXJE9Jh3lYK0Uo6JlLjc/nuJmsotTgYXWWvZbMM
	ruh3DWg5qZXNYMjntOr7lOWwdPrOGLSsT6djtpbujTZ6VuyJk1R+ath0Lir4TzvwFwej0O/fBHfdn
	tW5oDano0NYGljzTDOZfeMA/g4f09hYMrK+1USuZdGhoDqzqiTbFlkgF47Y6E/16vaQ/ccEs036sO
	grwYXPjVNby6G86BU/JoTsWYa43hQwmPLEP5KQNhx9oe073ahkpeOriWpRyVBpsYnf7WygPt6IU00
	Sth54JQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os3bG-00FSzt-RJ; Mon, 07 Nov 2022 14:59:46 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os3ML-00FKOS-NA
	for linux-mediatek@lists.infradead.org; Mon, 07 Nov 2022 14:44:23 +0000
Received: by mail-ej1-x633.google.com with SMTP id kt23so30672155ejc.7
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Nov 2022 06:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c2CoTYYkSpK+sQj3p0R6Cfi101yt3YpQVds/7qZK0/E=;
        b=BC4wd+UVzNToFcbV2iVIZ9rGyRHo5M8PVDarYeufP55XrNjp8E1FCWyEVKl5CwoaY0
         lR+2atWzyXzMT4A3XPzWTFWDeHC3PbLvpogP9fta5cjFa5fbBaxIkMw1HGIi4P3d4I0c
         cza+mPzRFrTO1Rt27xiHBYqwdjRL5KfCWBTXsVRvLCXieB2HMwTp2CgraQPvvydqRQZd
         60i1wgkl4fnrTjNLVC5yiPE7Is22jItfeRhURFn6lCwPcOQxM0jk5dc+VfQ/tBUOZCmQ
         64TuCMlV4E8PCMTg22qLzhIbbSAXqpPkwC5iRK3DKGCbpSfEXTrajEXqk0yF3bDgFQ4f
         mM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2CoTYYkSpK+sQj3p0R6Cfi101yt3YpQVds/7qZK0/E=;
        b=RNbYidiC24b0vN8U/4maZv8qkbM7ydfS+N8ZG3BKBHYqoB9MivbP58YZaIWQnMePNu
         uhxED9AqJZt513Vni3eFJxjww6CDfAmz16wdYjDkuuijG8JSPjzY4MdSOpe46zr+hOKD
         6jzYh2Vfkdn54sDU903XZziCs13gzK4c+kodwL2pjhnwgNhYxK6GqZz83peuK5VVSsV8
         Yc5+iJ8WU26VeNKap3pCTJBgUhNJALj69ozoxWvoQPhrsvTUz6ebmvUcS6liDXxnz6bs
         Scx88/0Ysa9gnt1hkFcho2X5MrW85c1azvehU5tSztxn3Pt/j/mDLb3DKhkQiFijqEHB
         DwFg==
X-Gm-Message-State: ACrzQf2yey3zsAVbu3ijQZnlQsa5v8Rj8haJniWj7MjVJVaGdx+57x94
	l/vS+6U0zA9xZAxJDOOvtHZT0NipyaSK/g37uO2HVw==
X-Google-Smtp-Source: AMsMyM66VeTBEt4Ejj9PcxdBT6i+5GxO0WwEHmtm+cP2hP7E419Giec+LXEu+KXWIgYVPJ+vs8/wows07Wwnsj6FP4g=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr16653409ejc.690.1667832256100; Mon, 07
 Nov 2022 06:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20221021084708.1109986-1-bchihi@baylibre.com>
In-Reply-To: <20221021084708.1109986-1-bchihi@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Nov 2022 15:44:05 +0100
Message-ID: <CACRpkdYdmG5cFenESg36BwVpJ7FDJunPH1Z8dJjHwmu+NW-etA@mail.gmail.com>
Subject: Re: [v2, 0/2] Fix broken SET/CLR mode of a certain number of pins for
 MediaTek MT8385 SoC
To: bchihi@baylibre.com
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_064421_845733_6C884D3C 
X-CRM114-Status: GOOD (  12.54  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 21, 2022 at 10:47 AM <bchihi@baylibre.com> wrote:

> From: Balsam CHIHI <bchihi@baylibre.com>
>
> On MT8365, the SET/CLR of the mode is broken and some pins won't set or clear the modes correctly.
> To fix this issue, we add a specific callback mt8365_set_clr_mode() for this specific SoC.
> This callback uses the main R/W register to read/update/write the modes instead of using the SET/CLR register.
>
> This is the original patch series proposed by Fabien Parent <fparent@baylibre.com>.
> "https://lore.kernel.org/linux-arm-kernel/20220530123425.689459-1-fparent@baylibre.com/"
>
> Changelog:
> Changes in v2 :
>         - Rebase on top of 6.1.0-rc1-next-20221020
>         - Delete MTK_PINCTRL_MODE_SET_CLR_BROKEN quirk
>         - Add mt8365_set_clr_mode() callback

Patches applied, no need to resend for small issues.

Sorry for taking so long, I wanted some feedback from the Mediatek
maintainers but haven't heard anything, so I just applied them.

Yours,
Linus Walleij

