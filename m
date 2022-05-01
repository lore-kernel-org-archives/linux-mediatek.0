Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC003C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 May 2022 22:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxWGJZG882dyuisDzavHUZnZtVeFujBhryCb1J8NhuQ=; b=DuQkMdU0iO0A5a
	VR6ZyAXq2ItJ//k5ITEzXO4mq3o/5HbPceyhQGbKSmLnYRBkUP2Iv0gi6oPv5EvGxra1ctIDaw8OA
	AiPQWYvBVPme7pbpGAfVvd0PREezGtZxOD7rJQm/B9lb7og2LgXihHCoYwwjSSGcnqBCNcNU7C4hF
	APbyUySCVFbtT21qkDE8UvjuaBIjD5umMsKj+qIRz5YxMeA+PL5sFdAnQneC4Bc3aCW3lbxyg7PgW
	g1TwEeStC/xl9bLhzAnHTiuL7ZQ0msAAYdTXBdAboNDPYcfZBG8FVmTHIuWSKcP8Q91qOgaeoL5oe
	9V042jeznqHLysGbP2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlHm0-00H1wT-V7; Sun, 01 May 2022 22:10:36 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlHlq-00H1u8-W5
 for linux-mediatek@lists.infradead.org; Sun, 01 May 2022 22:10:28 +0000
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2f7d621d1caso131616687b3.11
 for <linux-mediatek@lists.infradead.org>; Sun, 01 May 2022 15:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8WXuaqzf5H6JbTMCrSNoDEe2cTNFwsekkVTcYWtQXX8=;
 b=NIMD1MgHFUA8qDcBtlkRUl6QwAMsrYm2LFtmvl8/1tnPPHxRUpA1yQ5LUAYctdi06T
 TOsD/Pv8VDI71Se+5p7Pej/mhD4qgf+k14w13KqKouOzghHkUgz02mr9ht1C5Q+AQUuh
 0KviUgNPzfaZP4wqvtLikTYkYLlECRohNbsEu9h/EpakyyZgJrAzbiZa3kK32wRWZAP8
 v8ZanNeCIK/+zl9E9gG5DRVG3Hrx7mW8dweXwuLE07vm1+xVHs5Z+8j39wJwgxAr3TB0
 sIVDxA8IhVVZXSJeGhmsZmd4DHlgLnJXoULjO7WRPuijicppJaGPBhttKcLNbK4Ul/z4
 EqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8WXuaqzf5H6JbTMCrSNoDEe2cTNFwsekkVTcYWtQXX8=;
 b=xoOzSge7JyUUx83Y4MRSGeJl7ZU3p7QM4nS6FfdbzDbWZVZG6ur2R1MyGgJ0svKfwK
 mRZHZfwMJh/KCYl39aHu823R0WyRZrkZrE27Wl1mNjrwTdTUH4GhnUJaTOm2GLKaD8Pu
 EDzi+PWHR6ExNm17Ge7r2TnqQZvyJ2HtJTRTChiGU/m9R4PYysEB15GPk91jt3tt9cIW
 jcviLRX96WpNpqAAdE+RoV+NCq27+jXVB4rNTi0m2GKjYBo9F0CdzWKhznbVg5fD1v02
 wUz85y4SSQDGBw9B2FJiJL34fFcIIh82KUUwzqeH8wR1QDlMGkX2hej34yGue8XWknrU
 hPmA==
X-Gm-Message-State: AOAM5326kPYACZennLXrtt6lel+EtZkqqBugpuSZqElk04DZvjZT4fWr
 CiCe3WVdehFhpo55o570vkGN4NjqzHmCduN5lebhKw==
X-Google-Smtp-Source: ABdhPJwVRMVN6PYWPNDrbRGkbqET+tO2dajvHrcjRYlUisQxn4zRaAT7N9xEe7+WAUzHysUVA7VWrMEEZM+qWd2jZ7k=
X-Received: by 2002:a81:2154:0:b0:2f4:d79e:35dc with SMTP id
 h81-20020a812154000000b002f4d79e35dcmr9302689ywh.126.1651443023815; Sun, 01
 May 2022 15:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220427154111.529975-1-kuba@kernel.org>
 <20220427154111.529975-2-kuba@kernel.org>
In-Reply-To: <20220427154111.529975-2-kuba@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 May 2022 00:10:12 +0200
Message-ID: <CACRpkdYOrUkVCW6Bq2V0wkk+2AEP3tkw18m4ra83Gn29knxhYA@mail.gmail.com>
Subject: Re: [PATCH net-next 01/14] eth: remove copies of the NAPI_POLL_WEIGHT
 define
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, pabeni@redhat.com, netdev@vger.kernel.org, 
 ulli.kroll@googlemail.com, mlindner@marvell.com, stephen@networkplumber.org, 
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, 
 Mark-MC.Lee@mediatek.com, matthias.bgg@gmail.com, grygorii.strashko@ti.com, 
 wei.liu@kernel.org, paul@xen.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-omap@vger.kernel.org, xen-devel@lists.xenproject.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_151027_059128_62B498A1 
X-CRM114-Status: UNSURE (   9.34  )
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

On Wed, Apr 27, 2022 at 5:41 PM Jakub Kicinski <kuba@kernel.org> wrote:

> Defining local versions of NAPI_POLL_WEIGHT with the same
> values in the drivers just makes refactoring harder.
>
> Drop the special defines in a bunch of drivers where the
> removal is relatively simple so grouping into one patch
> does not impact reviewability.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: ulli.kroll@googlemail.com
> CC: linus.walleij@linaro.org
> CC: mlindner@marvell.com
> CC: stephen@networkplumber.org
> CC: nbd@nbd.name
> CC: john@phrozen.org
> CC: sean.wang@mediatek.com
> CC: Mark-MC.Lee@mediatek.com
> CC: matthias.bgg@gmail.com
> CC: grygorii.strashko@ti.com
> CC: wei.liu@kernel.org
> CC: paul@xen.org
> CC: prabhakar.mahadev-lad.rj@bp.renesas.com
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-mediatek@lists.infradead.org
> CC: linux-omap@vger.kernel.org
> CC: xen-devel@lists.xenproject.org

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
