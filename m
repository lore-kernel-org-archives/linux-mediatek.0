Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A566C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 23:13:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 893C461404
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 23:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 893C461404
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8kjAnhzKXoD6N4dlKY6qCnMqdsSG/qoaydI42DGmz2Q=; b=i3dFcIedeH/SnVt2Iu9YolUKt
	vU5waTyPOH+flSANaDE9A/lfRzWFY4PHfNAEm5YX4wKIgUG1gW0mRCXdnVqQNsmhyYVddOD+k6HCe
	H+ijuLADACeqoChOkTF80vPjiygR7bSDq3fF56520XcciR4h7u+z31DKweEmfFhMSBBS+yc0k5xbT
	mwdD2z+UB6lmhB43AdtizliJv5yrDeIvXw2doE8sNvDMzi4PkbJa4WU+ywOST0tYt3FdpOWTMD2Zj
	fTFjOPUZwYuLdLE2sX4D+pwwQ9N1DpiZVwtQqKFhESNFNwHi8lAzaTWn3TALYpnkT6Jbb/9Fw1DcZ
	uQZ+PqKFQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZM1t-00FMJ0-FS; Wed, 21 Apr 2021 23:13:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZM1e-00FMIF-7x
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 23:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=T7eHNIfHcU7QtcVVbnaCiYXMcfZmZGOpkKzfQHUQy5g=; b=PJBdWaCLctJMNzLRqDtd2SEZx7
 12u+bpyBC0t2X5RBAdbgxoDNeS+IxrS43HEiELRWbSsHX3XXRp0xpswoNr0P/S5YbvNo4Ur6qaeOb
 baXXBtLaP8KiUWbXLDC1SgRLchp1axM3ttCkRolzJfbBUYNrWu+EgMPWJ3EkELI/gI01V6Bkdomin
 xEoT3k0zQiDdlOlKQMDWRl2OcEH7z1h3ku9JWJFlaMTa138ENjA7Sy5QH+Q2MdEk6tBpa/D2qWp+w
 SnKvicfZ0p7fAp30j2Xu+9/Q6fuarlMyHe3nSAfqCnX9NZ9RBVNpZv4VLvNIIdZ6vzgfDaL+/nOrG
 DBC4KH4Q==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZM1b-00DFkW-HZ
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 23:12:52 +0000
Received: by mail-lf1-x135.google.com with SMTP id 4so9359014lfp.11
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Apr 2021 16:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T7eHNIfHcU7QtcVVbnaCiYXMcfZmZGOpkKzfQHUQy5g=;
 b=grk9mpKC8n8Dl77wltDy3n2lpygqgROQ3Mfnf88x9+Sa8TqR3b5ZNHeiAz1CjAJ3fP
 XzHOf2+7s4RuzjlwjvGEgYufA8CVegzBB8517t0TS3DSqhAZLpi8BNkccULsh8nQetJs
 J9HgfKzcVgG4iZgJOlnAe3fsTvlz6TXBuOJR1VSCkq2sSB24IVeZzFmijlH5cLvjPl5/
 orezBpfRF0Y2RfnaJQ64eK5ROK1LunlreSLPMP7FuB/aQBTOs54Ca0EK9/qEzxL9Gsfe
 ZN0J1SSUyLL0loKgpaUOjU5cyiyDv6jkG87zZ/klg/rS/lhdxK+JMD0wekExZJv4xcte
 fapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T7eHNIfHcU7QtcVVbnaCiYXMcfZmZGOpkKzfQHUQy5g=;
 b=UF6GDANIvCOZS/kQSUbr/K7cUG4oC2U7dX5n4rMRhbsa0eermgCnYbTHLEABUHwZxK
 BGhGYTXwp7B0XeskiwVntX1JSc0JikrKFKW/iG4w3XWyhwG/eZzBC5Ca00Shpe2hCc8g
 JviS4LUVwWNZr6rjIlthI0nIuVtccwS/kyK4GQorHF926YSZXaLy3zSaWm7OkB+VlJrz
 JclZS/g9gRZsJsVLDRc9T93PO+x/hWpLgIFfJOmAsskYr+2t1shOopZc2fPs0wA/g8BX
 Ih4CTd3IU0NJmjFLqBvOUvQ754KksUEuSglV8R5g4fhqC/hq5GaSz9XOeTRAzMQnK6/q
 PEfw==
X-Gm-Message-State: AOAM531Hql3jSWBzBHbAtTK2k2+1GYEERCOgSgVHj4SIJ15sYWbGmdeW
 hHU9VjIFhqhJuEsw2T3nfT8NGMwdLyO9umobJ8XmAA==
X-Google-Smtp-Source: ABdhPJydFVuqJYzV7C5StXPaUPnHeDYzd1nUo4VCkoodIL0HJhtA7Mjd3Cre/972KXMc6uNGUvXpB82qHb9d8pPRf90=
X-Received: by 2002:a19:ec13:: with SMTP id b19mr359877lfa.649.1619046766609; 
 Wed, 21 Apr 2021 16:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210406144540.3467756-1-tzungbi@google.com>
In-Reply-To: <20210406144540.3467756-1-tzungbi@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Apr 2021 01:12:35 +0200
Message-ID: <CACRpkdb6KM-smFQ9BdVQgWCNOu-4_t=g8k3_NUZ8HH0Pjr=LGg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: use spin lock in mtk_rmw
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: Sean Wang <sean.wang@kernel.org>, 
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_161251_669105_1F3D0F20 
X-CRM114-Status: GOOD (  10.67  )
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

On Tue, Apr 6, 2021 at 4:46 PM Tzung-Bi Shih <tzungbi@google.com> wrote:

> Commit 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.") uses
> mutex lock in mtk_rmw.  However the function is possible called from
> atomic context.
>
> For example call trace:
>   mutex_lock+0x28/0x64
>   mtk_rmw+0x38/0x80
>   mtk_hw_set_value+0x100/0x138
>   mtk_gpio_set+0x48/0x58
>   gpiod_set_raw_value_commit+0xf4/0x110
>   gpiod_set_value_nocheck+0x4c/0x80
>   gpiod_set_value+0x4c/0x6c
>   max98357a_daiops_trigger+0x8c/0x9c
>   soc_pcm_trigger+0x5c/0x10c
>
> The max98357a_daiops_trigger() could run in either atomic or non-atomic
> context.  As a result, dmesg shows some similar messages: "BUG: sleeping
> function called from invalid context at kernel/locking/mutex.c:254".
>
> Uses spin lock in mtk_rmw instead.
>
> Fixes: 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
