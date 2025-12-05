Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F38D2F7F2
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Dec 2025 13:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nArClPgrtg5VCuCRQeCz3AURqc1MkzU/2k/kKLgwFik=; b=1ZLNSD+bj+AHwN
	EHqSzFui1mU1z9V+fUs61noe8udOKJN92yOaXg2N8Dnn+FN4J37bqMkw8xc2xTtFIZUCqy1U11vnu
	d5WwD+0JXYc2FE8qKT8rISKiUtmzPy5xNk1NY9U3t6N75W6b/I9WH2MUQoGden93haIrT1ZJ4f6m4
	jCvGe97eG+Iql9Q/NOBSl4J12DXYud2gQ0j0d4llaK9juSVufeZg7JNBrQ4XeO9e7m1397vAqPbSx
	k4dsYIZGd+rmLt5+AowAsFkNPqCqOhXiUl/msI7Wf5NRjaWwbyR5qsxSw6jC+o1ZhltspfHjLi7wv
	hkTQVwdMcF1RpMyqa4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRW9G-00000009XcK-2INV;
	Fri, 05 Dec 2025 13:47:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRW9D-00000009XbW-3BYK
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Dec 2025 13:47:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CC0043B37
	for <linux-mediatek@lists.infradead.org>; Fri,  5 Dec 2025 13:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EAA9C19421
	for <linux-mediatek@lists.infradead.org>; Fri,  5 Dec 2025 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764942419;
	bh=G1DKwO3QOoOSXazmt1Hz6axf9JJ+8JmRfw6we/+3fMk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V5mZW47gQS5wF6e3EaBjNjjRUsYMKA5vtJw93WQp8Yb3ErZUowS8tGrMrJ45GQxYQ
	 AbLPrtq+M/80a5GkVgG4trzqo4ZS06PDiyqJL10XkzmszUyl82UICaM7tlvH3l9Uyl
	 d0xkk90igghwQVETRaYIURkSlQPvPI1ZBBWyVrvrMnOXpgRRsQrz17hR5jryW0txIR
	 llk7JIYWKm9l8V0VbRMsqVOie6XSQfvEh0NtI8kaP6WFrPxHcPr6/ZSNoCWW9rtHVk
	 Z+hnLUnCmtNR78D4tNQw2Qhyv51Ht5Jjta3zjv/kSaYNY13nH4ZDVMFIJ9nyjdi43F
	 EI2rrYf74UnNg==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso3302412a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Dec 2025 05:46:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXOJIMfbQS1kxKsn178qT7YTM0zUbUEUwGQOHyBsS6brDRJ8R4RD0uwnm/NywstUKckOA0K1EI1Sc+FZlT/Zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZV3KmOB2A7gz5A1w/l1kqpOXkBhSisX7PT8hPEAK/pdWRfmee
	/OXHADwxWZcd/8Ekf62SGwCgcPu2Pv9IRCzs60M15zr/29ya2qnonJ/J1YVrx6ry4FpOXGaZnBz
	zp8leUFeqoB37xcUgSQklqggK7RXBFw==
X-Google-Smtp-Source: AGHT+IGnSnntD86eE9Z5w3JvKyrgl2TQ4p6Ck5tFuBzhXTViEp5pLzmxGFWb0Gp0bPBwpBev5udEHdS7Zgzngud/oYg=
X-Received: by 2002:a05:6402:520a:b0:640:f2cd:831 with SMTP id
 4fb4d7f45d1cf-6479c4076c1mr9111075a12.10.1764942417575; Fri, 05 Dec 2025
 05:46:57 -0800 (PST)
MIME-Version: 1.0
References: <20251119175124.48947-1-linux@fw-web.de> <20251119175124.48947-2-linux@fw-web.de>
 <fc5c9829-96fa-4028-a642-0792699e92a5@kernel.org> <ddad2f21-4853-41c9-acfb-1613f5000f0c@collabora.com>
In-Reply-To: <ddad2f21-4853-41c9-acfb-1613f5000f0c@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 5 Dec 2025 07:46:45 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Zu14ojvNNjgOFWA40iaqYrgGQsrHNWraooOML98fXyw@mail.gmail.com>
X-Gm-Features: AQt7F2rRik37jIlkQlnszPiS-dbpLXF7k5YqaJSivvbMgbRGbC8B4kGSUMOvhpk
Message-ID: <CAL_Jsq+Zu14ojvNNjgOFWA40iaqYrgGQsrHNWraooOML98fXyw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: mediatek: mt7986: add dtbs with
 applied overlays for bpi-r3
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_054659_835519_71F8A881 
X-CRM114-Status: GOOD (  14.27  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 5, 2025 at 3:05=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 05/12/25 09:10, Krzysztof Kozlowski ha scritto:
> > On 19/11/2025 18:51, Frank Wunderlich wrote:
> >> From: Frank Wunderlich <frank-w@public-files.de>
> >>
> >> Build devicetree binaries for testing overlays and providing users
> >> full dtb without using overlays.
> >>
> >> Suggested-by: Rob Herring <robh+dt@kernel.org>
> >> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> >> ---
> >> resend of
> >> https://patchwork.kernel.org/project/linux-mediatek/patch/202406080805=
30.9436-2-linux@fw-web.de/
> >> due to discussions here:
> >> https://patchwork.kernel.org/project/linux-mediatek/patch/202511172113=
06.725678-1-robh@kernel.org/
> >>
> >> changes:
> >> - updated sd-nand with sata-overlay
> >> ---
> >>   arch/arm64/boot/dts/mediatek/Makefile | 21 +++++++++++++++++++++
> >>   1 file changed, 21 insertions(+)
> >
> >
> > This looks like still not being applied and now it is a warning in
> > Linus' tree.
> >
> > Can this be applied and sent as fixes?

There's still one warning remaining after applying this series which I repo=
rted:

scripts/Makefile.dtbs:20: .dtbo is not applied to any base:
mt8395-radxa-nio-12l-8-hd-panel.dtbo

It's fixed in my original patch. Can you all take that and drop the bpi hun=
ks.

FWIW:

Acked-by: Rob Herring (Arm) <robh@kernel.org>

