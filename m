Return-Path: <SRS0=6VVk=OM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884C3C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 09:58:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A7B61131
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 09:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57A7B61131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k/HiAJsrjpD6iVe8JkM6uvrrqObrlm3/2SBKz34nN3c=; b=J7U3FiTwJq1cLc
	4rRx4YCMVJc/1qAUydVgseWJG7dP8DaEuMfZWbpTk2jZEmnPTBv/fw3TC+IhNhm21UYG05dMr5Gcn
	2+piYp8ysLyFZ5O8zk0QVYE2a6Qxx8/1bcYzqcgu5J6qnPYQ9paqI4/oLodhA5YsRZegNHeckDKnA
	t84KqtXcQpcMszzd1kLGbOFontgrvN3shsyCBis1n8kVa1rjPZ50zCBgvG5l8KeKDOoaI6pqOI5A0
	5x+TQOUnkGpNC5w9hNmF1gd0WN8MkJ0BNbGo5qfULbXrJrHVGzaF+C0PmuAl+O6pmZjY6/2rURP/c
	e+LXvbPQfTwvFUMs0aVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSz0x-007frP-Cr; Wed, 22 Sep 2021 09:58:07 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSz0k-007fob-Vq
 for linux-mediatek@lists.infradead.org; Wed, 22 Sep 2021 09:57:56 +0000
Received: by mail-lf1-x12f.google.com with SMTP id b20so9772490lfv.3
 for <linux-mediatek@lists.infradead.org>; Wed, 22 Sep 2021 02:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5zPFLKdwxEQ81o/wg7gBk+tb/obGKRy8ThoN2UKg148=;
 b=FgS4Cst9PhmI+ylUCDv/S8Jwho3iMZN6S7wLDxLWtfTUVEOcGUs9EqWASkMndVYxwU
 /IoGAqAowTA2uVRKJ3ZR7G6mIOOx3vJL7C2XLeL45qX4o7yRu6zeW32VsITeT0Ugwnju
 vbi+j/UbmDeRoGap7sFoCSh/Y3Mji5RCPczOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5zPFLKdwxEQ81o/wg7gBk+tb/obGKRy8ThoN2UKg148=;
 b=hB+Uk0oZz9RhJ95ifBtbAAn6J94jt2phTJXg/O/k4vE+GMhBTfVDhO41pkH1gPI6Wu
 P6AoABe86nbvC+WPD3TQItuZ5lnKsdNj0BiAWT85eKcIbKfK/CmIRU4wshO5IEkQq8uI
 v1lb7P/JWoRO/Xc3SK/K9/K2tPbBWYwCt/qqtHFcgCVU87m5ff0wnAtvemxx3S+twOWx
 O6bb48zIdy7XIl7bJX8TYr/dt/48mQI3lMTniCN37jKds5Nh0EwRrlUJlS5DLH40OUsE
 KGyZ6IkL6nO76DheMpAZMNfeI4A6FG5i2UdffCem1Ef1GJPG5j/KQ/pLFuXHPktnKl8S
 YZkQ==
X-Gm-Message-State: AOAM533mosQNRHTvAi0T4E8tYuaFOgKYOreuY+0zdYnRST4q/zWXNDDD
 2NMWISvxCIp+8VKCHAG4eufQkWawikQRTinEgbKg9Q==
X-Google-Smtp-Source: ABdhPJwZLSMZ4vH/uiWlXM/0D55iZGTePsjP293/G8LySD8PaTBNULi2fm0jDPKEeSDfde0cJX66xJG5b1IxF1qccqM=
X-Received: by 2002:a2e:4b09:: with SMTP id y9mr27182090lja.201.1632304669689; 
 Wed, 22 Sep 2021 02:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210922025640.11600-1-zhiyong.tao@mediatek.com>
 <20210922025640.11600-6-zhiyong.tao@mediatek.com>
In-Reply-To: <20210922025640.11600-6-zhiyong.tao@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Sep 2021 17:57:38 +0800
Message-ID: <CAGXv+5Fs696ZM2+QEUf8+zoxrh1e4n8Ke5xoijJWDu0_xWOr7A@mail.gmail.com>
Subject: Re: [PATCH v13 5/5] pinctrl: mediatek: add rsel setting on MT8195
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
X-CRM114-CacheID: sfid-20210922_025755_052892_5E1F02D7 
X-CRM114-Status: UNSURE (   8.37  )
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

On Wed, Sep 22, 2021 at 11:07 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> I2C pins's resistance value can be controlled by rsel register.
> This patch provides rsel (resistance selection) setting on MT8195
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
