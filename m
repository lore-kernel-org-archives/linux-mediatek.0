Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0687C54E58
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 06:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9zbV3no8c83PzjBsl077R25GMg0rcg/3po9zJLqVKs=; b=V7ANBesD3Q51wWOvfkORWuGUL8
	iThgDkYVCLvyqMqKNPjGuLCc2KLOIAzE98Gao+1u5dOuA4PDAiN3mp87LGJj1to67BHw6YXJqkCGT
	jzkS4Mi6vPVVRvhAn/XikcWMRDq0kUZ7fLyzpiDiKqlrh7pXwtJpPHz0MWduRUrcGVqn9W7pEY+9L
	tkj8oXZf1t8bpQqfRgNSWt+FfEqhpZxPmZfGNE2vJ4ucGag+to9Gl9Z1eFMjxKTqYxLaQJDB2Gf9x
	f0NT4CBJk5YxelaUxLLVhZLvPLoE09POsgW4YA7qSBzyKuXnisLSG3oH4Le8D7UYdO9+5g0+cfL+n
	4b+deyMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnCMi-000000026CX-0xVy;
	Thu, 21 Mar 2024 06:57:28 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnCMe-000000026BL-3y8R
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Mar 2024 06:57:26 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-4765c5905a8so201934137.0
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Mar 2024 23:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711004243; x=1711609043; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9zbV3no8c83PzjBsl077R25GMg0rcg/3po9zJLqVKs=;
        b=XtLfrXGmMAlp3Vs6hZaoHHMwUVUigf6sa9ReNXLDSoxa86V91A6T2cmf2JIl5YvGhe
         bAYw8KQ5zPMxZtg53+ffUT0f4UvPfg6E4QfsJ/LIn2xkxlLM+VLGMlmlHzdjwyoexSag
         v6cWCdEvLwunGCm5PkGBFy0Z4m28xd61y8cYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711004243; x=1711609043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9zbV3no8c83PzjBsl077R25GMg0rcg/3po9zJLqVKs=;
        b=rUdiR/YvUC65X4S9UllC9aOVgZwJVAnP90Lf9yu47CPD7o/qHpttGhJ6z6eh9Xr0GH
         VxL2lMXLZxM5NLgmkyLtzXUAp7Z/qxpWvDTqYJ7nXmPO45BaeuhoYD0F3YNQ9BOps58g
         TSm6yVqkGbJoqV9EzcgdwWOyR3Y32KaKKde1YnVM8WcCr5vrhlpIikmCBRMvWcjtcNj1
         s3tFQHCjw1OqSzrSjX2GlOMWP3zUtIK+bJndNCTXBfCAeuQd6LjZXx6RKiyZphVo9yPm
         MF2Sk5Oab4qX155aPqzW1eZ6xVBObHbA7NzrQWOK1OnCVwhnjpZHoSEIEa5aFuG3+fSq
         Hp3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAsANqUGqP0DJut8tSrMG/a5gpge5J+sGa2o2gJFtSjzRv4YWHW0eY+wOSCDp/rxE6xoP5TQtPaY76lwmAa9N5fczlI8NPaT//MHIWf1Ag8riG
X-Gm-Message-State: AOJu0YwAKWLQYA7f2aefvQAhpsK1iMGtM27/9zsdlM6lu8btT/kzYxjG
	DMXwjFd2Ri58NQr1ifKoBxwVXPt1V3aLp1M5XTYVaF5kHp9XLI0SeC0C78VxHutRkRJwQT8e0YR
	Lvw==
X-Google-Smtp-Source: AGHT+IG8RQBvDCNSnyXhXZcpdT66OCZY3hJBjOLZh3n64yXR7PU9n/B+4bz8is4cobPc8rPEfFINYQ==
X-Received: by 2002:a05:6102:2a68:b0:476:8b63:9ffc with SMTP id hp8-20020a0561022a6800b004768b639ffcmr982902vsb.28.1711004243070;
        Wed, 20 Mar 2024 23:57:23 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id r19-20020ab06f53000000b007dbc688e5e2sm1771173uat.33.2024.03.20.23.57.22
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 23:57:22 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7e09ad21b34so275657241.0
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Mar 2024 23:57:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXus9iBvuPrJz7Zn2kTTwjb7S3lg3Nqo3Q6D27MIswVUyYn9EqwrNJo6By9JKch5QvDd8T3+JEBtTsmT1Pme+8737XSM+MzG630e7LLkKl4en2P
X-Received: by 2002:ac5:c4cf:0:b0:4cb:56c5:5818 with SMTP id
 a15-20020ac5c4cf000000b004cb56c55818mr989958vkl.3.1711004242162; Wed, 20 Mar
 2024 23:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240321064313.1385316-1-fshao@chromium.org>
In-Reply-To: <20240321064313.1385316-1-fshao@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 21 Mar 2024 14:56:45 +0800
X-Gmail-Original-Message-ID: <CAC=S1nixtu8e1L+dOUXxfsFmqW_5xR9NPuJWzyz0OxRXFPd0sg@mail.gmail.com>
Message-ID: <CAC=S1nixtu8e1L+dOUXxfsFmqW_5xR9NPuJWzyz0OxRXFPd0sg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fixes NULL pointer access in spi-mt65xx.c
To: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_235725_030402_44810934 
X-CRM114-Status: GOOD (  17.70  )
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

On Thu, Mar 21, 2024 at 2:43=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> Hi,
>
> This series contains two patches for spi-mt65xx.c, both focusing on its
> interrupt handler mtk_spi_interrupt().
>
> The first patch is to fix a NULL pointer access in the interrupt
> handler, which is first found on a MT8186 Chromebook device when the
> system tries to establish host communication with its embedded
> controller.
>
> The second one is a decorative clean-up when I'm working on the first
> patch, which simply renames a variable to better follow the rest of the
> code.
> I put this after the first fix because I think that will make
> maintainers and users slightly easier to only backport the fix if
> needed.
>
> Looking forward to any feedback, thank you.
>
> Regards,
> Fei

Sorry, I found I messed things up in the last rebase and this doesn't compi=
le.
I'll send a v2 soon so please disregard this series.

Regards,
Fei

>
>
> Fei Shao (2):
>   spi: spi-mt65xx: Fix NULL pointer access in interrupt handler
>   spi: spi-mt65xx: Rename a variable in interrupt handler
>
>  drivers/spi/spi-mt65xx.c | 47 ++++++++++++++++++++--------------------
>  1 file changed, 23 insertions(+), 24 deletions(-)
>
> --
> 2.44.0.396.g6e790dbe36-goog
>

