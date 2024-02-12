Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F500C48297
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 16:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5e0qLsgbAC04Ea+lUsuUQR8n5Q6fLgOHYw/TRDHBms=; b=AGbWK2ylSR/TB9rprJmqv6Dcaa
	6GyoIZHn+X26Z+Yx7Ki8iE3lj08hnEL1u4dM+19+7ImQOmshyZp/xQ0mak251nWPcHnzQJHgVgkh0
	o1bDtHlR856m4t4ZgEzIkTRb1I4lqqH5ozgq8yqfqGiF7lMA6y0Rw8gMORVXzYcVstZQ+mgz1gG+O
	WdbRUaj6gv8M21PK6HFTXc25PDlcDSXx8u816gSAcgn5ld+nzFx4i1wBboJFPdfZTE3GqRAop4G+E
	dU9HDjfLa5FRRGMvJaL0tBR7cr1BDNpDdHAM1A5oeLr5kq9DypcCLLOdVQaMOrTUVzgVavvlPBVyj
	Uy03SI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZYsP-000000064tT-3r41;
	Mon, 12 Feb 2024 16:09:49 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZYsN-000000064sj-1eNB;
	Mon, 12 Feb 2024 16:09:48 +0000
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-59a24bf7cadso1131235eaf.0;
        Mon, 12 Feb 2024 08:09:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707754185; x=1708358985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5e0qLsgbAC04Ea+lUsuUQR8n5Q6fLgOHYw/TRDHBms=;
        b=kMgWpx6vgFY+wGOiZTVMYO4DFaOBHyrKaJNMjLtul72MHBwwt5sSWDZqI/GQBr8pKR
         WV4IsX2JSwmKOHDqrMUsPWmPpuDqekzRw0bOQcaR/ycLb6AiSwIKA6yUE++fl2E65xZL
         5H6CBfx0Ji0dAVGzRLpWoThM5FElX6i4XATxntFzslv68+UNDE/l2aH1KWEVXfa1RiPx
         XjJexl3pcnDOuKcYvel1DilFhrP5m2QaYBUd03hzubuNYkyJ2B2kaRY88ZStfwZ/lZ0D
         REESquK0bqAWCcYLglJ8B6+JJJZuw/eC146q8aC6AuBji1LRLhYy0HC1IEaynkfpwYgb
         OMfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4WC3K/FaoSPZVdWvbmD9DyvBE9fYLkgvwzwZdQ6vQ07KVeTFOF0DluuYfHDTvFOKw66IjpCXVkz4Uf1ujRb7fnpKDxM+wdYpJwpHmVDUa8LMmrzTXl8OODMCIkrlTrWobnFpN83H22gcrPJqIfCwPTRyIwUUrVxE=
X-Gm-Message-State: AOJu0YzSKYTG2gxpc5pncTX+LFClufBlPr5CeGGA6L/ILgJkUdYMQUKp
	ui01HRhI0yTHh/+xRx/MvnepD+ZFmxN3Q2u2GcMCIRNfU0u2Lfvlb4Pmj4LICgf3U0Ou1IKOzKd
	OUvVfZmeGlgrFg7e5YJzAwA70O4M=
X-Google-Smtp-Source: AGHT+IFiKd1X5QT/b8mqARYA+9uqMmrsDSU9HFZBpkHGxmWDJQUSetX+LEKcJj8u2LCCtG8xB5vxv4lGuf7M2mVTgOo=
X-Received: by 2002:a05:6820:1f8e:b0:59c:eb7b:c04e with SMTP id
 eq14-20020a0568201f8e00b0059ceb7bc04emr5091034oob.1.1707754185267; Mon, 12
 Feb 2024 08:09:45 -0800 (PST)
MIME-Version: 1.0
References: <20231219031444.91752-1-bo.ye@mediatek.com> <e23ebdd8-7fbe-435b-a850-0ef18a51b020@collabora.com>
In-Reply-To: <e23ebdd8-7fbe-435b-a850-0ef18a51b020@collabora.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 12 Feb 2024 17:09:34 +0100
Message-ID: <CAJZ5v0h=OKnY85EF9Mg1irsSbnea+P9oAQAdQURqjn+6_5s2PQ@mail.gmail.com>
Subject: Re: [PATCH v2] fix overflow in idle exit_latency
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bo Ye <bo.ye@mediatek.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	yongdong.zhang@mediatek.com, C Cheng <C.Cheng@mediatek.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_080947_450184_D69ADB4B 
X-CRM114-Status: GOOD (  14.83  )
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

On Tue, Dec 19, 2023 at 11:56=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 19/12/23 04:14, Bo Ye ha scritto:
> > From: C Cheng <C.Cheng@mediatek.com>
> >
> > In detail:
> >
> > In C language, when you perform a multiplication operation, if
> > both operands are of int type, the multiplication operation is
> > performed on the int type, and then the result is converted to
> > the target type. This means that if the product of int type
> > multiplication exceeds the range that int type can represent,
> >   an overflow will occur even if you store the result in a
> > variable of int64_t type.
> >
> > For a multiplication of two int values, it is better to use
> > mul_u32_u32() rather than s->exit_latency_ns =3D s->exit_latency *
> > NSEC_PER_USEC to avoid potential overflow happenning.
> >
> > Signed-off-by: C Cheng <C.Cheng@mediatek.com>
> > Signed-off-by: Bo Ye <bo.ye@mediatek.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Applied as 6.9 material under a different subject (cpuidle: Avoid
potential overflow in integer multiplication), thanks!

