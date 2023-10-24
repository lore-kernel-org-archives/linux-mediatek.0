Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561F6C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 02:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvrqgGSngoJnXhESnfS3t+NdB91nFoYVT3tITLPVU4M=; b=TCajMwg6dopf9NUkWUejfwoMoX
	QxMe+ICHai7EKDVM6DyW5XWy8z+KZN+50QNkjFR6yn2A2pGklEvXaUZAuYSfjX7NshBGo9x8hNja3
	sinHsUiu382+82NWcO3UYzRSTfpG7JsT/l26dPdhVUEnUhn8Ro5z1vdaFfmtmCdF/Sv5pVTf5r2v2
	qQhoKCl9qqlwIHPmryZ8QcxZNkqBBPBxoarGnsg5eIk3whLqPVqsLSVZSc8YlhEIox1CGZVseEk74
	z3+Zc+gBzfotumYbZ53ITvmKs6Igq9AQj7/PTRpgQhGwu+VJyY3XLGKQv2iOZMHlZ3mNKwHkrtjia
	fed+D7eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv7dV-008gdk-1g;
	Tue, 24 Oct 2023 02:59:17 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv7dT-008gcw-1r
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 02:59:16 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507a3b8b113so5995676e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 19:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698116351; x=1698721151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvrqgGSngoJnXhESnfS3t+NdB91nFoYVT3tITLPVU4M=;
        b=YpBZ2HxFLycAm9who4txme3BCSap/mzvrh3mD7eySe8sVL0FG+CkztfjUCe4CW8iJc
         xhh4ufwHmSziI0J293xFxdoC1ret5xq6ka8wrinSuK26xE6TZCbfhMr7mBtUTaJ9IRjW
         35ot131TUleFttG/27bcsmGFACLefV3TwpSlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698116351; x=1698721151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvrqgGSngoJnXhESnfS3t+NdB91nFoYVT3tITLPVU4M=;
        b=GYskCk26ag3eJ9LM3urDRp5Kh6OJz/BzIZ/qGldXXrevJ1BpFHys7APJX5VGxHhiIq
         6kJ5jsuSVi/Ww28B2KRyRqnflSGKIQQMu9BNPBpOuXQpLqoJcOrlAA+id1GtPOFQaSEl
         BzCncCwU8/R4jyZTuEa7LjKQYWk2kyKMAvhcfGbq7IPegW8x219420ZWByCZoSwALE6j
         HE/vBkfs6GT0BtIcKthfYPrc59MGqVRLzr4ph8yv4dqNBBpiILXMU/+hJjseD5d5HyG1
         N8ocJdZmJY8P3UIDpty+UT7bLL4SIVeZ6M0um6pGsyvyU2GbN+q7MlgUzKDvIcxGnhBb
         XKIg==
X-Gm-Message-State: AOJu0YxQ0pmEhAPs69QRL0k1MZioPveGeTXyTmDHREBpk7kN+SIaQsoy
	lh9n7hqX7ZoutV5p5Y05jPybg2TtVYk1tE4Z75O10g==
X-Google-Smtp-Source: AGHT+IGBrjxdShgGwLm/nKBlp6mMXyHZKc8GJR6Sa8BG8WPw9au3jcqx4fC7Aiq/VT+UoJbUAgQ50zuQjPdOXvQt81c=
X-Received: by 2002:ac2:562a:0:b0:500:94c3:8e3b with SMTP id
 b10-20020ac2562a000000b0050094c38e3bmr7076723lff.57.1698116350988; Mon, 23
 Oct 2023 19:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231019124914.13545-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5H0rUajeU-i8nYyV2xWFQTnzqxioZCCyyP_RZXKqmcugQ@mail.gmail.com> <283d18028590d57025e5654d18b8b5b7.sboyd@kernel.org>
In-Reply-To: <283d18028590d57025e5654d18b8b5b7.sboyd@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Oct 2023 10:58:59 +0800
Message-ID: <CAGXv+5EpBLnXVdxnk9wBZi5F7U5wdJRfYH7fgg4Lkr1HJXm+WA@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: mt8186: Change I2C 4/5/6 ap clocks parent
 to infra
To: Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com, 
	matthias.bgg@gmail.com, u.kleine-koenig@pengutronix.de, 
	chun-jie.chen@mediatek.com, miles.chen@mediatek.com, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_195915_615792_E71288AE 
X-CRM114-Status: GOOD (  15.45  )
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

On Tue, Oct 24, 2023 at 10:52=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> Quoting Chen-Yu Tsai (2023-10-19 22:06:35)
> > On Thu, Oct 19, 2023 at 8:49=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > >
> > > Fix the parenting of clocks imp_iic_wrap_ap_clock_i2c{4-6}, as those
> > > are effectively parented to infra_ao_i2c{4-6} and not to the I2C_AP.
> > > This permits the correct (and full) enablement and disablement of the
> > > I2C4, I2C5 and I2C6 bus clocks, satisfying the whole clock tree of
> > > those.
> > >
> > > As an example, when requesting to enable imp_iic_wrap_ap_clock_i2c4:
> > >
> > > Before: infra_ao_i2c_ap -> imp_iic_wrap_ap_clock_i2c4
> > > After:  infra_ao_i2c_ap -> infra_ao_i2c4 -> imp_iic_wrap_ap_clock_i2c=
4
> > >
> > > Fixes: 66cd0b4b0ce5 ("clk: mediatek: Add MT8186 imp i2c wrapper clock=
 support")
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> >
> > I'm curious about what led to discovering this error?
> >
>
> Is that an acked-by?

MediaTek engineers are saying the original code already matches the
documentation provided by their hardware engineers. I'm trying to get
them to respond on the mailing list.

ChenYu

