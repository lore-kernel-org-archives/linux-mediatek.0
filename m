Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23AEC31D97
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 23:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ChJsKd9nUrCCIHOcicgHlKupltI6o7lz0YIiqLHyiQ=; b=hwhDMMWpekOAzk5uYlaZ4VpmbC
	KJfiO/KDue52+maN9ua6nV00DmxphZFwqustSEdBCSYeI25qEo+ttyyo4+kSv0BhtGm2celB856Ax
	9CDW8kyatWjBF9g3onzkBUVqzXM0eRz6W1N1jYGEzAKb0II8Tn0FdvYb9EMEFni1G9jwoyaaZBTmM
	1j4KGw07Bb/zOp3Iq6KE6wk9/2F7MW3E1LBADj+99ZScTnodI6ADfr0GSXJWBvMBJCv7n75ZKx1eU
	Nmu7CSgYtdS2J0CftabSVPj3mXApdpoFq0xZuiI60b/4+mrzSqLiAOS9Uix1s2h3dBbuLB5CEAZ5z
	DxCWLRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP9Ub-0000000BkFq-3QUy;
	Wed, 03 Jul 2024 23:34:29 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP9UN-0000000BkCO-2UP5
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 23:34:17 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5c25ebf6380so51066eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 16:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bade.nz; s=google; t=1720049653; x=1720654453; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ChJsKd9nUrCCIHOcicgHlKupltI6o7lz0YIiqLHyiQ=;
        b=AScVjfHDAaZIHDGc4cqf61rDmwIC6N8IGzqejpVXTUzaib3fWE7GkCRmoowKQMJI1u
         V0PmR8+qqZlbxsdLvAe4W44s7A9Zch6kscOevhw7RpdJZx9NeTykKTDmkSPNIu6sveA/
         ZjU68MddD3SQVEmo9EUKKqR1JMhXpdqKLDm1XwuugdnEoV7MV63Zvj0bNnrrd3C8bw23
         uaHVZeh+AFdRJ+3SJ1szQypgP3nhol54B0cIHB6+Pz7rohUD0sqJyJp/HJN/yI8HzoJr
         h27A7eKS3UNqHS8LsF+j2bOefEQ9kn1FXx7P4EgaENwWZhkpd2GkXEFxbi6m7SBwe6pk
         m6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720049653; x=1720654453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ChJsKd9nUrCCIHOcicgHlKupltI6o7lz0YIiqLHyiQ=;
        b=bkgB7CvWm+eotT4jlAxOsdGGbFLLVjQYrZqZuWpJpPyEOCeMvaKMcu7BBLeTFhlyBY
         /1deqbtg7dKgatrD74raB9IJbrE1LK+yFU46qWAYSrsveN1GvIiCasgjzPlY7Zl8W1XQ
         wE3oRzSYxrDmb8UJO/cPZP56XzkhMZTw2kuQrLAcvcTwhmEcEz+voUxs8hM+zlQXoMZn
         7ZKakSXkIwZ/uu/N3p0a/VrgWqcdfAkwoIlB5WR81i6MkwOrz6cdQdY7TMSgG0ekN15j
         KL0IGYmFk0wZq3E6lVaOw6SW5PMM+adapG6BeaIkcPOu0PPLDDNvSwl0jxVMyiCgU2bm
         SoRw==
X-Forwarded-Encrypted: i=1; AJvYcCWyPlOFWvTnHx80s3atuENMKKs2mIyJjyuTCcN4l92uW6SrnDpZKwR8bPaQIz8Dqt6lZv0MB7xmyB+w83KYkLKpQqLMSM5OwB30SUUhwNOsUGpM
X-Gm-Message-State: AOJu0YwfXroonXBRYiTXTvfHWxu0c+bOv+jnPtk7yKEuJ50IX2xtyrhw
	QufPzqh2FwV2cxZ+Ruqgq3j6LzoH+4fF9a1bQDANzOaxPb6fGnpsK0ShyybkX/CVZ4XSwy4KIVT
	Qac4L4D6b5nT0ZGa+aFSec8wzjcwFGPh7wm6w
X-Google-Smtp-Source: AGHT+IGKlQ2pI7mo0VbCXTl1zMtiImR+Q3bkZ5aDzc2+PetUeMf8KI9s1d1gy4XqYnABgmOWCY4KaVO4ZAo/Zk+wakQ=
X-Received: by 2002:a05:6870:718f:b0:25c:9bf2:cc18 with SMTP id
 586e51a60fabf-25e10337e4emr1508238fac.7.1720049653415; Wed, 03 Jul 2024
 16:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240608080530.9436-1-linux@fw-web.de> <20240608080530.9436-2-linux@fw-web.de>
 <trinity-82c94d49-2a78-4470-83cd-3c6747e01849-1719434738199@3c-app-gmx-bs52>
 <726f2ed3-675f-45e8-94f0-d392181e7f92@collabora.com> <951E802C-1B53-45C4-B3E6-4A3400F47214@public-files.de>
In-Reply-To: <951E802C-1B53-45C4-B3E6-4A3400F47214@public-files.de>
From: Leith Bade <leith@bade.nz>
Date: Thu, 4 Jul 2024 09:34:02 +1000
Message-ID: <CAPDEroWUeR3iUFnjVr6WFLg3=dkML+5cbRPph9bj64F=zc1UWA@mail.gmail.com>
Subject: Re: Aw: [PATCH v3 1/2] arm64: dts: mt7986: add dtbs with applied
 overlays for bpi-r3
To: frank-w@public-files.de
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, 
	Rob Herring <robh+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_163415_837296_312C9113 
X-CRM114-Status: UNSURE (   7.56  )
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

> Yes, 1st reason is to check if overlay can be applied to base dts (the pa=
rt rob was requested). The second thing that was solved is that some users =
wanting a "full" dtb without the need to handle overlays in bootloader. Due=
 to hardware design of the board there are 4 "full" dtb's.

I have been looking at using the "u-boot-update" package in Debian to
generate an extlinux.conf file so I can use the U-boot standard/distro
boot. This script seems to currently assume that you pick a single
.dtb file for the board, and then the user can put additional .dtbo
files in /boot/dtbo/ for any additional hardware the user has plugged
in.

So having a series of "merged" base files would be useful for this use case=
.

Thanks,
Leith Bade

