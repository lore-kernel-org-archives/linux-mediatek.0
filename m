Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58850C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 14:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mr9HMDo/MJuNTypI5wjgUQXDgpx9NKUHRJlWMwJUMe0=; b=jxdFrgoj8ZonWZncQ6Vc4gpPO4
	RsI8xL3sx1AvV1TAgVCiy31w29X3AoITBT+WzKL+KBKTV4NiU06lfxpr/v1cSezGA/b5bIy7/bYkj
	WYzeMHYCW9GfbLQgXB2Z7GMfEgQC7JFl9u0ssFJAF5k/7/L2Q9Z4ublmExVicxUsOGY1YAvVt93qQ
	J1Pe1YIof3X11lJRo28cmfqlxiPcian/j4eV/H1Dop7Ej70O6EBi6/+nXXAZMkyUzR7BvqOWz0yuX
	lVQwRAD/IymHM+ZaI+PLsIn+2Fh8LFM25mlBDb0ixTxS7PKUMcD9OX+1OUYO+f7zjSjfksUbSHdxk
	AfWTAq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pomE7-002Q2t-1R;
	Tue, 18 Apr 2023 14:22:35 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pomE4-002Q1f-2G
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Apr 2023 14:22:34 +0000
Received: by mail-ej1-x62e.google.com with SMTP id q23so64184252ejz.3
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Apr 2023 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681827748; x=1684419748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mr9HMDo/MJuNTypI5wjgUQXDgpx9NKUHRJlWMwJUMe0=;
        b=lRk+QFnlSqDxzU3eT4rs73hVScoqFv1RrT3WJsME63uRLoBjSHoyorSQTcGqboKkhS
         ZSrmb6GYzdM95LJjof5njuIyOwaP8wKZZcJgjArXB21he8BNind+ICxQuOocobrvsbmo
         pPpLErigyJTAVFr5YO6I4CGiltD9xWzBSEDLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681827748; x=1684419748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mr9HMDo/MJuNTypI5wjgUQXDgpx9NKUHRJlWMwJUMe0=;
        b=k+ONU72L3se+B43SGuD4br0t2RH5FP4ScApOO2bAzgxlBEpem+ivnZ8OiUnyYj3uFA
         voKhCfkp1RTqtt0RUCMbk5SLHbsWuQNhs0m7hfll+EkitLmflrzzgahn5zndJiiuOC3F
         ASvIRq3PVegXH6YQqKwcV6VnA+GjyR5OOVuI2okmAiW/v8CSDgUHylWc2eMbCfHsQ/6H
         95Cfs+eNrqmPhC5UH3hMMLpjdX+Qp9tzgcg+4tA3Hu40wzBaMwO0GYZ/iLosp7No8bQO
         0Epa1wSTs8VVSQBYzzBmWq4/Oy0mcn/kl64vf6e9UkD0menSLHI77utm6+lGuyAB7BLd
         e1Xg==
X-Gm-Message-State: AAQBX9cbP+6yJ+B8L9pLg0rI54ehqtzEzS7DxtsyLYKgJOlqJJwNgVGN
	0eTB6B/tgSOXVMYkfId8gE+esa1HTcl6HmVU2572FQ==
X-Google-Smtp-Source: AKy350Zj49AFVSgsrMyTJ/cCZ9u+MVO/moxSMxg/IOc94ZJPt8ry8RLaZr5x8cfgZDAkko9qBQHCZQ==
X-Received: by 2002:a17:906:89a4:b0:94e:23b:75e9 with SMTP id gg36-20020a17090689a400b0094e023b75e9mr10044670ejc.43.1681827747722;
        Tue, 18 Apr 2023 07:22:27 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id w3-20020a170906b18300b0094b5ce9d43dsm8113236ejy.85.2023.04.18.07.22.27
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 07:22:27 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f17b967bfbso9068645e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Apr 2023 07:22:27 -0700 (PDT)
X-Received: by 2002:adf:e195:0:b0:2d7:9771:fc4b with SMTP id
 az21-20020adfe195000000b002d79771fc4bmr620802wrb.5.1681827746736; Tue, 18 Apr
 2023 07:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230418124953.3170028-1-fshao@chromium.org> <20230418124953.3170028-3-fshao@chromium.org>
In-Reply-To: <20230418124953.3170028-3-fshao@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Apr 2023 07:22:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WVH3H9R=dnrOkiCEa-+izcSKjfdXbRDP8bc4xo_AhMnw@mail.gmail.com>
Message-ID: <CAD=FV=WVH3H9R=dnrOkiCEa-+izcSKjfdXbRDP8bc4xo_AhMnw@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: i2c-hid: goodix: Add support for
 powered-in-suspend property
To: Fei Shao <fshao@chromium.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Stephen Kitt <steve@sk2.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_072232_736944_90156556 
X-CRM114-Status: GOOD (  23.84  )
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

On Tue, Apr 18, 2023 at 5:51=E2=80=AFAM Fei Shao <fshao@chromium.org> wrote=
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
> To address both cases, this patch adds the support for the
> `powered-in-suspend` property in the driver that allows the driver to
> determine whether the touchscreen is still powered in suspend, and
> handle the reset GPIO accordingly as below:
> - When set to true, the driver does not assert the reset GPIO in power
>   down. To ensure a clean start and the consistent behavior, it does the
>   assertion in power up instead.
>   This is for designs with a dedicated always-on regulator.
> - When set to false, the driver uses the original control flow and
>   asserts GPIO and disable regulators normally.
>   This is for the two-regulator and shared-regulator designs.
>
> Signed-off-by: Fei Shao <fshao@chromium.org>
>
> ---
>
>  drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 46 +++++++++++++++++++++----
>  1 file changed, 39 insertions(+), 7 deletions(-)

I privately reviewed earlier versions of this patch, so it's
unsurprising that I have no comments. Assuming that the DT folks don't
have any objections to the bindings change, this LGTM.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

