Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39F7C9830C
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Jan 2026 20:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AGoxtBWa7Hges9TlON6JW/74fTOpKQVhj45ottMY/WE=; b=FLZ5qf0UTJXwyB
	e8/vxIFYlDJ4GNmXkrKmmw+YGXPEtHbFb06gbTPuTOuexTaP/F/cqQSNOzhZIxlIUnSEDoIoTqbfG
	Yv51lAVLMj7iqHgAIJy4PnuGbwIKOGnVJ4JHiB7xcZmwpbK7SRXVzuwfsWRIcsrzkoNMbg3P/i9BL
	QMmoEsD/i7tmUeXgNYI/PrpeySwDziXOsO6n5f0LHSB4VdteK6WaJHDWJBz1bKqb+GcDA+pkZRbH0
	3VHRQD4amQUW4JF2eHuodfXrcHlWjHaLF1Hd/tCCYZqwhFrVQRuSaXY9FqYMSKcIwPaDIHsgPxBqL
	ju9zZzyBnb3Nsd4ag3GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZ6h-00000000swg-15OJ;
	Sun, 18 Jan 2026 20:10:43 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZ6e-00000000svh-2nf5
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Jan 2026 20:10:41 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-45c889aba0dso2110922b6e.0
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Jan 2026 12:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768767038; x=1769371838; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGoxtBWa7Hges9TlON6JW/74fTOpKQVhj45ottMY/WE=;
        b=XfrnZK8rJg86GqTWrtSt+m5kwVlhGg2CFhUFtCbkz1N9QqFN2fHL7azpul5VNHMAw0
         tgpXhfOXeMhYjeddAX112haV/eEcpF+Pi9VN93De629mxYyhBh1dHzMxg94l2mGy4qIq
         N0S05df2DrZINj45VoIhekQbaUFZwskBPybTvECxmFkvyBqdsNTpnwKWMe01OMS2wEet
         Uvb2MeDIiKNRoplBdt7NJ+7wwyY5vIGdoRZb0lIE1243NBk/3xgcMpIJ5vZctIth2/9M
         r8goSWwD51+rB1PE9hzVbbVm8HRURLqi9oHflgss5Iu9K2v/2CLKjawH9+yZG+BQa75p
         Fq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768767038; x=1769371838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AGoxtBWa7Hges9TlON6JW/74fTOpKQVhj45ottMY/WE=;
        b=rESVEXilebbrIRxoOw1EuLLp+zI1j4dcrDCUOX9KDtEbHRbGQs2fOnLjydfc2d/Yk8
         yhS/ds5B4vEAgIBl5ARw+XNivtM5Q0DCT2xEhtaWSqegD/TGy3SMYEuIBDib41VHBHKV
         CVll3sCP1A0zGniIlfSD/SFhd2hgHnQbAOM+iwyxyy+y2HAApQnCxVSWdL3qIWNShUiM
         KN3Ce6qfbeCJHQKT4rpaGFEuPpDNIwrcoiFd241hnaZ3mmZO0icpKi0Odjs58T9Mg2Pp
         109bpW0cc67rI/xqnJxaVGkgILDN9S3TecLBo4BufbN40I3HwTbMSHAGM1w1PAKMVHzy
         Ip9A==
X-Forwarded-Encrypted: i=1; AJvYcCUmzJUeAMMfgtKSdoNQ4oLz6cKFjUy9e6MuwF2nvX8QbHcpCwTIm0BqAhapS7JyoymoXE5PCBwiNlQw0JJZdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxS1taapHfY0+vAswaAwBLM8W12R4NRo8NwIvNCRY8Sse74CnHS
	jhq0kDBnhXlnd0afMkrK3JfpdfkGXxTJMzKIHP3sS5zKMVluEL2LTvvZpFzUrN3IbslS70TLAeD
	l5pUXIn1YBtY0P3wJVyUy3++7L9h8sqI=
X-Gm-Gg: AY/fxX7CTCFef928WclcAYzo2R/VxMgOyEKkrkp+juTjIgZKrZnUt2hcwlVJT7wpMVL
	uanES+8HGumXYa1IsT3GvtMx5hWL8Yfmv03Unmnl3DxtDjbUgZB+Pld/Aou4X+YD6JWJXNgLvP9
	YSPLXghGbDlGvogVjn/vHxMp2R62Qjg61bfoGy0i7BeihLULHsso+3KIMWDV07dPSUk0Hrb5Sp/
	3E7pFobQDTNvG3S5gwWZA7n8VikVMRTs92Doq74jUAZFpLrrbagAxW0GhFj9FcvYLxW4rHL
X-Received: by 2002:a05:6808:80b3:b0:450:89ee:922b with SMTP id
 5614622812f47-45c9c88dcd6mr5123911b6e.22.1768767038493; Sun, 18 Jan 2026
 12:10:38 -0800 (PST)
MIME-Version: 1.0
References: <20251031155838.1650833-1-jason-jh.lin@mediatek.com> <e6c2c86d-71bd-453c-847c-1eff2be88be7@collabora.com>
In-Reply-To: <e6c2c86d-71bd-453c-847c-1eff2be88be7@collabora.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:10:26 -0600
X-Gm-Features: AZwV_Qh1K-r-Z8NlKIiE7Ar8yunvRZXy4lr5rzaBilBfhNZa6yCxoqTzBHyaliM
Message-ID: <CABb+yY3ioZ4KCG0tp-r7Xj7hJZFf57xeA_mByUEZBXRaBQQ35w@mail.gmail.com>
Subject: Re: [PATCH 0/9] Add GCE support for MT8196 (series 1/4)
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_121040_748448_10465F51 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: Singo Chang <singo.chang@mediatek.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Xiandong Wang <xiandong.wang@mediatek.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, Project_Global_Chrome_Upstream_Group@mediatek.com, Paul-PL Chen <paul-pl.chen@mediatek.com>, Chen-yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org, Moudy Ho <moudy.ho@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 8, 2026 at 3:37=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 31/10/25 16:56, Jason-JH Lin ha scritto:
> > From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
> >
> > This series adds initial support for the MediaTek MT8196 GCE in the CMD=
Q
> > driver, including related API changes for new hardware requirements.
> >
> > Series application order:
> >    1. [Fixes] Refine DMA address handling for the command buffer
> >    - https://lore.kernel.org/all/20251022171847.379470-1-jason-jh.lin@m=
ediatek.com/
> >    2. [Series 1/4] Add GCE support for MT8196 and update CMDQ APIs (thi=
s series)
> >    3. [Series 2/4] Migrate subsystems to new CMDQ APIs
> >    4. [Series 3/4] Remove shift_pa from CMDQ jump functions
> >    5. [Series 4/4] Remove deprecated CMDQ APIs
> >
> > Please apply this series after the DMA address handling Fixes patch[1],
> > and before the following series.
> >
>
> Jassi, since this is touching both mailbox and soc/mediatek, can we avoid=
 to create
> immutable branches to pick this entire thing?
>
> If you wish, I'm fine with you picking the soc/mediatek commits as well a=
s the
> mailbox ones, or I can pick the mailbox ones instead if you're okay with =
that.
>
Yes, I am fine with this going via mediatek tree.
Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

