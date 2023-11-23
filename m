Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ED4C61D85
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 06:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFOK9nMH1VcoZ2z6PVa19sLHI4+eJmqfxzPGi62CvS0=; b=m9T5TDw6bUijO2TzcLyC+g9oxA
	PpRhth1cGDpb4V8y4VXQg5ZPF5FRKvOZdkIQfewa5HrsGmjjKp5phZVTaWdOM1jgNwZcSTN2eCEVS
	WaG4Ywhm9Z6y7UKfjbJ3jcyLOJ3pRcO6eQaPcgDI++a53PvAz512V5hyelaZYTW1t1TxwChBX/ODW
	BymnSIyTILQ/hoy6oFsUYu7gFYn+rbDHCy/LXCeRd7RLkrzThP5Eydh05xeXB/hki3yJ0xo0cQiY/
	fzHLRHBDvYpQq5GsSfXJ9D1M6slNAqgo1b7noLCkAUVsEGGzKvJfG49oMJPQSvc/cq9izo+oUoJqo
	LEV9147g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r639T-003thR-1A;
	Thu, 23 Nov 2023 06:25:27 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r639Q-003tfM-0o
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Nov 2023 06:25:25 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507be298d2aso642243e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Nov 2023 22:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700720712; x=1701325512; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFOK9nMH1VcoZ2z6PVa19sLHI4+eJmqfxzPGi62CvS0=;
        b=ciiMCQsgEHN6z3z+rACG0SzXj1mC4Xa9mnEkSfSTE+JnRy93g9hLLI8PhmpMUDoz91
         SD7/+Nbu2/fQKzVVvUf86LNnHL45dKhZXFyJyxr4OpMQE/3tVDfXYeSLqIiqzipxHWQS
         Rd/fgOAeF5WRiLdYKbR01iqqXvsk40G4EMN44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700720712; x=1701325512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFOK9nMH1VcoZ2z6PVa19sLHI4+eJmqfxzPGi62CvS0=;
        b=SVs3h0lY25+cqRhjdTVy+uU08g3IDpvLgKM92JlTAdc3btnUzFT8an4g8WTcZ7RuAu
         ImQnNDWbjzePFpeWRPE3D6r/Zcrg6IVF1sKA3/avVaFrt11jjisCtSaZpihu3ehQpMtn
         thvB57O8Cj009D2s/yKS/ViQenOFUC8XTtPj3La/Epy/MjH8mvT6WoIW794Pkcuk4inh
         /aO3pyTpr9xM9UPcMj7lHY+cztK+x8EJGH5KqCuQY0t3PD24Fwd06FNwtUXZxUesdecL
         kDsdQptKMHxdg6KHhwUTMaKyHcoUV5qDm6mPKN9D2ksXPgYDpbRbHyptGKyqk0hrhtkV
         Ir8g==
X-Gm-Message-State: AOJu0Yx0ywNFT4FbJNieu/j1K/yiI4H/TanGxqyHbXUHWWFc+roC/ADC
	ZicXtH+/omlIohejlypx+5F+OJVRaxBPUaJTE/TRFQ==
X-Google-Smtp-Source: AGHT+IFuPfRKfSodWyGjGtPPCFDTxGK/LY8CUSpBiO06DaoCkH39868TwRxSy06GbUtySSJqdraZ2vGVf5GKnhE/Gsg=
X-Received: by 2002:ac2:520f:0:b0:505:6c99:bd7c with SMTP id
 a15-20020ac2520f000000b005056c99bd7cmr2959574lfl.57.1700720712087; Wed, 22
 Nov 2023 22:25:12 -0800 (PST)
MIME-Version: 1.0
References: <CAKpemQKo2gigO44amj=eFUXgUnUeSmiOoTbS8GdXMx3O07N1vg@mail.gmail.com>
In-Reply-To: <CAKpemQKo2gigO44amj=eFUXgUnUeSmiOoTbS8GdXMx3O07N1vg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 23 Nov 2023 14:25:01 +0800
Message-ID: <CAGXv+5E4TXrPmhb++r3vMGA4WoPc=covi7_=zgLLcOhGt9UBgg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] regulator: mt6358: Add output voltage fine tuning
 to variable LDOs
To: Bret Joseph <bretjoseph@gmail.com>
Cc: angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, 
	zhiyong.tao@mediatek.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_222524_290446_9477C7BF 
X-CRM114-Status: UNSURE (   7.80  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bret,

On Thu, Nov 16, 2023 at 12:52=E2=80=AFAM Bret Joseph <bretjoseph@gmail.com>=
 wrote:
>
> In mt6358-regulator.c
>
> static const struct regulator_ops mt6358_volt_table_ops =3D {
>     .list_voltage =3D regulator_list_voltage_pickable_linear_range,
>     .map_voltage =3D regulator_map_voltage_pickable_linear_range,
>     .set_voltage_sel =3D regulator_set_voltage_sel_pickable_regmap,
>     .get_voltage_sel =3D mt6358_get_buck_voltage_sel /*regulator_get_volt=
age_sel_pickable_regmap*/,
>     .set_voltage_time_sel =3D regulator_set_voltage_time_sel,
>     .enable =3D regulator_enable_regmap,
>     .disable =3D regulator_disable_regmap,
>     .is_enabled =3D regulator_is_enabled_regmap,
>     .get_status =3D mt6358_get_status,
> };
>
> the function [regulator_get_voltage_sel_pickable_regmap] causes a -EINVAL=
=E2=80=AC when registering
>
> vsim1 vusb vcamd vefuse vmch vcama1 vemc vmc vldo28 vsim2
>
> using [mt6358_get_buck_voltage_sel] results in a successful probe

Sure it will probe, but any values you read back will be bogus.

Can you provide a dump of /sys/kernel/debug/regulator/regulator_summary
and `grep ^1e..: /sys/kernel/debug/regmap/1000d000.pwrap/registers`,
and also any relevant logs?

ChenYu

