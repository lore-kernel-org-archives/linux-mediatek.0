Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633F7C4741F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:49:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2AA620708
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J6N4ljjb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WiP+6Tbs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2AA620708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EzeYC3atNVkegIUVfZj8ZPOWB5Z/G3p/P/G0ggHM7f4=; b=J6N4ljjb+Ej/+rUjKHU7UvcLI
	NkUJjch9MXy+qMDCKcJLdnaMFSkTWIbnA1yoxxA4t8OR6nxbGF+Jglmk0CUpdfNPeJlU6z3mFY8Iw
	UDQtfSOucuWeMB75yD8KkVjZtETDLIlsq+tci2exoGlTxTlmC+3L6iaA9rg2j85noOQ7pes3HKG6c
	CfQ6YlC90qQpQKOO787pbTluYHPttVo2IH9y3B/RNtj7lfhnPsQSPW5XChxYEwhEkWaxMcF7+Ftqe
	w0qlmlraoEj36VSSBEW44bRACpxkzkz1tbMCRbkOUEoCdBxOKHHq7PmTuH93O38olhYlajo+a3gN+
	jRVvf/UcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXnf-0000cm-0z; Wed, 30 Sep 2020 08:49:23 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXnA-0000Oj-II
 for linux-mediatek@lists.infradead.org; Wed, 30 Sep 2020 08:48:55 +0000
Received: by mail-lf1-x143.google.com with SMTP id b22so1133511lfs.13
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2020 01:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LwsH4RNzM7M1YZuptel9pzVtCDIa+ZWwO2h5LWJGBOE=;
 b=WiP+6TbsCK2Y5YTT5RJHL4rQtHQ9Atapoj/vpKrfxYU4qy9/48B0y0IwPfJT2Spbfb
 4vpLswz7BfIvYDnM2tl4py33Wbu45yki8K6u2dmQi3IYnCoWBxxJh8Vi+cROnJW9bwuD
 TSezmy3VfFlrI25skDsudj2l71nrUDtQTWOTw3gmcXNqyHwjfziUK6sGQQR8HNZINSLA
 UAlo9M6y1StSHvcqHEC0IJ+NHNNOJSRN620b48DZxmSJeRxmK0vLD8KTCgJIOCoqLvaN
 wLzOJRvsENpsPuBe3E6aoXbrmUp/riajJly+8g6+CZv1xK5L6GP0idVMa6US7ZnjDvnh
 etaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LwsH4RNzM7M1YZuptel9pzVtCDIa+ZWwO2h5LWJGBOE=;
 b=tvdz6JofNoK+ULib98RklzVovTIOABNLcxTStjh/KTN5OQeB9c7vpkDN0zamvx5hyh
 0CTWDQTCCNfPk9nGY/R+vUUCjh5vzkVo+vn7QO6Q11rA5v1PtSBV+mH4ZRsP89h/z7Gt
 hyxIrIYST80MhMi6b1H8XQ91AQMkz0tm1yoqBUsgyB0LKOUGI3fD7fnqReSfb+BnA59I
 2W/bqEnAQ8NyNT0tUoP+52RRdUcCitE4cDxKc9CX8dvcD2UQo9SZ5c1twBddokgkNOKG
 wKNThVpdMrmoCZ1ri1A2+REGyN2RK1IeOnPlHx5QfnelWf71lp6K9YQUlCvrvICGi7xJ
 Kz+w==
X-Gm-Message-State: AOAM533QzZhvBZ69plEDw9l5mGJ7yeWZtclm/ehIhJdUH3iT+mxVxldZ
 SGMwn8gze6b5dWrCZ4w4bUAH/8boop3Sz0B2r+AkDA==
X-Google-Smtp-Source: ABdhPJzwTQaHeKwf02xAiuAF5IJuYvnnkzJxA7qbMaCsOnrpapueh2yOo2TkZHTZ/fvDlwd2pS2bqGeQl2q/DBwNqkc=
X-Received: by 2002:a19:1c8:: with SMTP id 191mr478715lfb.585.1601455730766;
 Wed, 30 Sep 2020 01:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <1597922546-29633-1-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1597922546-29633-1-git-send-email-hanks.chen@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Sep 2020 10:48:39 +0200
Message-ID: <CACRpkdZiaSQdtW8QmoxvVyA+RvZoTh7h6CjsTidZrm+YddcADQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: check mtk_is_virt_gpio input
 parameter
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_044852_698747_6B125136 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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
Cc: CC Hwang <cc.hwang@mediatek.com>, sin_jieyang <sin_jieyang@mediatek.com>,
 Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 20, 2020 at 1:22 PM Hanks Chen <hanks.chen@mediatek.com> wrote:

> check mtk_is_virt_gpio input parameter,
> virtual gpio need to support eint mode.
>
> add error handler for the ko case
> to fix this boot fail:
> pc : mtk_is_virt_gpio+0x20/0x38 [pinctrl_mtk_common_v2]
> lr : mtk_gpio_get_direction+0x44/0xb0 [pinctrl_paris]
>
> Fixes: edd546465002 ("pinctrl: mediatek: avoid virtual gpio trying to set reg")
> Singed-off-by: Jie Yang <sin_jieyang@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
>
> ---
> Changes since v1:
> - update Singed-off-by
> - align with pinctrl/mediatek/pinctrl-mtk-mt*.h

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
