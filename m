Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D583C48BC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Feb 2024 09:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4iT5ETvYJMsi5q/HB6faKSI8PkV3OtFKN0qmQ5ivP4=; b=p1fpUH2IQYrv8Wmv260zqdyrpE
	G6LgHzZEvPEpz4Oju22x8f2LQJYfyTxd5D3Vln9Hd+hJu0tP85bEk685Y4LZUyu0abve1N/ca70IK
	bwRdLf/rZo4HDmhDnKagMqV0qAuDmIv9iwdkXgbdADkO5nUcVHMlO188567cQg6/bXKr7Taa5RrxY
	g8HhhZHGI1xE+tS+Isop7uoQh/X/2WWtIXpjQMRM34ImzP7CPGJloCzIZJ/wak5IlEI8ooozynOyk
	ecqNwj8W9gCbUsSm5qVUwq3nquek5q1LgAYjsSG9ngxAbfnKX7vcM2g1PICCHA84As9CahyfoMcVb
	O4HKPdXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcM24-0000000Ds2o-3F7H;
	Tue, 20 Feb 2024 09:03:20 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcM20-0000000DrzA-150a
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Feb 2024 09:03:17 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d228a132acso39176841fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Feb 2024 01:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708419794; x=1709024594; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4iT5ETvYJMsi5q/HB6faKSI8PkV3OtFKN0qmQ5ivP4=;
        b=HjHVyJTMbdBMe8k2ZkQd9wMx0/Wc387hlmN8vt1qZANFxESF6aRZiyUTT9r521mgtC
         GcuP+fojvhHUKX5/6WggXHf6OM3HZgo9CHrw9CPWLVQYsDJXwQ+znHGpbybQlHKT8zQV
         wZWAomp6sd0bfviyKk0VddZKzSaV3kySBlIQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419794; x=1709024594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4iT5ETvYJMsi5q/HB6faKSI8PkV3OtFKN0qmQ5ivP4=;
        b=RLZX7XMJ1qb+PTuQON9Wp76uNwqW5CoLbhvVxozCEZdVXAGp+bLyZQiKazJZJgCHNl
         jvtvMxVXE7l+l/VWdE/ji44ka/N9iMje6estX5kKOPPYohUU+i/SgiYJqyJe8HtdCupC
         zjYDyV5IQWUNVD131/YYIenJSUljLuk1zY0jCOUssnOczBruEaxOZiFawG34Hu1651L0
         JMeWSBNf6kmA+0x8iF4hOTpWKCR0eGCn/SLSp+8zAxSNYrpt8m1vNUXGY1PlBf6E1TO3
         h5DW/iL7uTT+Ukbjcbcu/kZkMSeaRZsETwe/fDdo1ZwAd0aWA8SXeUoO5F6kv5D2jKYe
         N9dg==
X-Forwarded-Encrypted: i=1; AJvYcCXnDBv84CVhZgpk/04K5t6MG7NHrwXx/CjiFe8zEfeO55LPmYZPpOAICJTXMQ3kwV1Gv6D1zMCRsLqexVXtNVz6dMIn/WRLMl1K4VaHOCJ02yjU
X-Gm-Message-State: AOJu0Yx1zd2ltYYhgR1W+xzekuf3U9zXv2sCKQlJQ6Nu6Y/E5l8bG3/d
	PwTk8kxtSxzKikcXLuz/miIaz5FTtQl3Jb/SDJjh0JuW+bc7W89/iy2+Vmku3GbCsMMubAgNgZ+
	4A+uCCYo0rA/U4BnXI77KHEBXVle+u52O9cXS
X-Google-Smtp-Source: AGHT+IGoUwt6VSMd/dOjGOl0b2TERUUu8zmaj8e7XgFEns+bkkahzHjMnNw6K0ZDdL0dT7DZxQOQvViK5UEn40pteiQ=
X-Received: by 2002:a05:651c:b1f:b0:2d2:36ae:46a0 with SMTP id
 b31-20020a05651c0b1f00b002d236ae46a0mr4748236ljr.53.1708419794100; Tue, 20
 Feb 2024 01:03:14 -0800 (PST)
MIME-Version: 1.0
References: <cc8f7f7da5bdccce514a320e0ae7468659cf7346.1707327680.git.daniel@makrotopia.org>
 <CAGXv+5EKCrvsvZwc2zYiMWAeT9vqvU0JnDrz=WBoebBBbcgp0g@mail.gmail.com> <f1fc67d4-f979-4c3e-988f-a803b7b11c46@collabora.com>
In-Reply-To: <f1fc67d4-f979-4c3e-988f-a803b7b11c46@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 20 Feb 2024 17:03:02 +0800
Message-ID: <CAGXv+5Gxc3OP8nE681C6YQbDMUNmFDf21BfSvJZPBFgoncve=A@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: depends on CONFIG_SOC_BUS
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	William-tw Lin <william-tw.lin@mediatek.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_010316_370785_5A31D2E0 
X-CRM114-Status: GOOD (  20.99  )
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

On Tue, Feb 20, 2024 at 4:56=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 20/02/24 07:40, Chen-Yu Tsai ha scritto:
> > On Thu, Feb 8, 2024 at 1:43=E2=80=AFAM Daniel Golle <daniel@makrotopia.=
org> wrote:
> >>
> >> The mtk-socinfo driver uses symbols 'soc_device_register' and
> >> 'soc_device_unregister' which are part of the bus driver for
> >> System-on-Chip devices.
> >>
> >> Select SOC_BUS to make sure that driver is built and the symbols are
> >> available.
> >>
> >> Fixes: 423a54da3c7e ("soc: mediatek: mtk-socinfo: Add driver for getti=
ng chip information")
> >> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> >
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > Angelo, I believe this should be picked up for -next?
> >
>
> I'll pick this up for fixes, as I've already sent the PRs for v6.9.

The socinfo driver is in -next, so I guess you could pick it up as a fix
for v6.9.

ChenYu

> > Also, mediatek/v6.8-next/soc is missing from mediatek/for-next in today=
's
> > linux-next.
> >
>
> Fixing immediately.
>
> >> ---
> >>   drivers/soc/mediatek/Kconfig | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconf=
ig
> >> index 50c664b65f4d4..1b7afb19ccd63 100644
> >> --- a/drivers/soc/mediatek/Kconfig
> >> +++ b/drivers/soc/mediatek/Kconfig
> >> @@ -72,6 +72,7 @@ config MTK_SOCINFO
> >>          tristate "MediaTek SoC Information"
> >>          default y
> >>          depends on NVMEM_MTK_EFUSE
> >> +       select SOC_BUS
> >>          help
> >>            The MediaTek SoC Information (mtk-socinfo) driver provides
> >>            information about the SoC to the userspace including the
> >> --
> >> 2.43.0
> >>
> >>
>
>

