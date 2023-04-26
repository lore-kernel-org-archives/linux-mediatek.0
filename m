Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA342C77B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 16:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4gwcCmmM+Y1PLgZw9XcWeLGKRKHQq/1YEoQ0r3Lmgc=; b=my4zEgifZ3q7c6K9osvSWNU/J3
	GR/62FrYI7K77vG1XOXsqWNKdcivSsuU1gTAlUhBxhzpYmKMx7rr0GNBZlXyH1plq4fSPG8T90X7r
	hPfOMVtEd0ah4UGDwVh6jnQ+c5VKCOcPjH2drGOygBin/q+/rOuHaGUSLFpYHoE+ZsXsFES4CIoeI
	ZhTeAvF2erYnkNcUH+t0KEnErN9Z6jErlHBbjrygBzrauLWyI5Er256TotN+jpYfRUjJY5S6VHoYJ
	TkfkEIRy9Ys3zUzh3Faa2k7e9ykmhwpi19Ud/+93Q0E9ruMTlkpy+EOsbKt05XpoqmVV4sYc9xN1v
	/bFvpZOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1priBm-004QA7-12;
	Wed, 26 Apr 2023 16:40:18 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1priBi-004Q8r-37
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 16:40:16 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-76073fb4511so163454639f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 09:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682527210; x=1685119210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4gwcCmmM+Y1PLgZw9XcWeLGKRKHQq/1YEoQ0r3Lmgc=;
        b=aBmsxnW1NobzOOm4veAFG67zaiW9yGGeSqSxD1bduLIZlEIAKE1AkX5KOWxVQE4Axh
         u2B/6mhggNAEI5LcRzpseyGoooAXLUGEP3sjih+gi+TRcI9R8GkeCv7cEnjOimaCyUo1
         jbcMgT3GdLRTMMXZ49oli9dM1RsGv9UiVnrxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682527210; x=1685119210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4gwcCmmM+Y1PLgZw9XcWeLGKRKHQq/1YEoQ0r3Lmgc=;
        b=S6llKUqz6FTRCEB8jNKvdToLt2xQIIC3I1nk7AMRG5e+HNT9kCxBBdV6jhqXv/D5v9
         wcZX6dZKynXS92BlwaNb3iJb6iH+qZCLy+7joTT9AbRSW6UaOhqjtksFtH0/sOmdjKVB
         rvvsvzDhs2a+RjzDfROhBLFSoQbk+OEEccAGelfHixtiqxAKvM7fJA7ukEAnsH2o2tMt
         sSsS9B5+QYbZaEsevweKEE1mGeWU494Ub/xzZqeAqo86uIOVtbVUEcc2U5XcSQei+EEM
         JVkjcXQXzXeQCWK1tCOTcI0JORXC61Qhqr1RKRHdsvU/yQQz5shxK/f3x+KXPQKBQjZB
         ChmQ==
X-Gm-Message-State: AAQBX9c8WFGdSnr3T3dGiTMwUXaYcFYv2a9/0Rffg34ZwBFJg1lAh70G
	FVuz+9VxDoCSRVKfVR4p8SsFTzW3soKHcEvxjvU=
X-Google-Smtp-Source: AKy350busOzP/CFJ9MriIpZ+vZodL0h+czLCgMirPIila4Wh+9WX5zCYspYb5K+d/RRF1e7XXrEQcw==
X-Received: by 2002:a5d:8c98:0:b0:760:ec3c:33ea with SMTP id g24-20020a5d8c98000000b00760ec3c33eamr10450687ion.7.1682527210023;
        Wed, 26 Apr 2023 09:40:10 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id a2-20020a021602000000b0040fb0c702f7sm4939480jaa.177.2023.04.26.09.40.06
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 09:40:09 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-32ec968434eso285975ab.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 09:40:06 -0700 (PDT)
X-Received: by 2002:a05:6e02:1be7:b0:32a:f049:edc0 with SMTP id
 y7-20020a056e021be700b0032af049edc0mr280720ilv.17.1682527206123; Wed, 26 Apr
 2023 09:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230426144423.2820826-1-fshao@chromium.org> <20230426144423.2820826-3-fshao@chromium.org>
In-Reply-To: <20230426144423.2820826-3-fshao@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 26 Apr 2023 09:39:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UUXAje++Za2UZU3gVTGR7iCEHA23ZSqWcscg0VsO3g8A@mail.gmail.com>
Message-ID: <CAD=FV=UUXAje++Za2UZU3gVTGR7iCEHA23ZSqWcscg0VsO3g8A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] HID: i2c-hid: goodix: Add support for
 "goodix,no-reset-during-suspend" property
To: Fei Shao <fshao@chromium.org>
Cc: Jeff LaBundy <jeff@labundy.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-mediatek <linux-mediatek@lists.infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Stephen Kitt <steve@sk2.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_094015_011683_E0C4C00E 
X-CRM114-Status: GOOD (  26.49  )
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

Hi,

On Wed, Apr 26, 2023 at 7:44=E2=80=AFAM Fei Shao <fshao@chromium.org> wrote=
:
>
> In the beginning, commit 18eeef46d359 ("HID: i2c-hid: goodix: Tie the
> reset line to true state of the regulator") introduced a change to tie
> the reset line of the Goodix touchscreen to the state of the regulator
> to fix a power leakage issue in suspend.
>
> After some time, the change was deemed unnecessary and was reverted in
> commit 557e05fa9fdd ("HID: i2c-hid: goodix: Stop tying the reset line to
> the regulator") due to difficulties in managing regulator notifiers for
> designs like Evoker, which provides a second power rail to touchscreen.
>
> However, the revert caused a power regression on another Chromebook
> device Steelix in the field, which has a dedicated always-on regulator
> for touchscreen and was covered by the workaround in the first commit.
>
> To address both cases, this patch adds the support for the new
> "goodix,no-reset-during-suspend" property in the driver:
> - When set to true, the driver does not assert the reset GPIO during
>   power-down.
>   Instead, the GPIO will be asserted during power-up to ensure the
>   touchscreen always has a clean start and consistent behavior after
>   resuming.
>   This is for designs with a dedicated always-on regulator.
> - When set to false or unset, the driver uses the original control flow
>   and asserts GPIO and disables regulators normally.
>   This is for the two-regulator and shared-regulator designs.
>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ---
>
> Changes in v3:
> - In power-down, only skip the GPIO but not the regulator calls if the
>   flag is set
>
> Changes in v2:
> - Do not change the regulator_enable logic during power-up.
>
>  drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

You already carried over my Reviewed-by tag, which is fine. ...but
just sending a quick confirmation that v3 looks good to me. Thanks!

-Doug

