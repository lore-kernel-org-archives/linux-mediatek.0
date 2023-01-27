Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8679BC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 02:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIX7jlBfeDEoV6ij8z1nVgRuoHTx/dhIgLO99n5jrBM=; b=ZE8/QnRB+C1ViMmnaU74PnJTil
	mvL7Z5jvTnrflphFtcWwAzw1lVTCtFqrTGPm7ZqHqxYU2079VB0Vono3BluY3vOUhBZsfRTf4pqUZ
	rOqoiSwrZy84VXXUAChzP9s0yxQQBnzjG3JCKD0C3PYr/QDv6ag8X86kPchPXH1qTNquxoYAKa/cy
	I5z4Or12754mBh2wVInv5tb8lvUbAfKKrLFuDN0oWCdqg0XeNpxKRySmUIqVLVnscPWn3Ln8ozZbu
	Aa6kJIuRcsKShySQWiCcjKreBG3yCmmGiUeSdy8syZWcQcvp3pYJgmX6sk4j/N7WBfjohQ0X6Ezp5
	RJmUlThw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLEr8-00D9i6-Ly; Fri, 27 Jan 2023 02:52:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLEqu-00D9gH-MS; Fri, 27 Jan 2023 02:52:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DC26DB81F8F;
	Fri, 27 Jan 2023 02:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D4DC4339E;
	Fri, 27 Jan 2023 02:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674787949;
	bh=XmZzmR0H0odzZa8z+aZHxpi+uFsfehvEV4nWc6PcC00=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eo1FVATEqdfJvfJZte/joq1pAcX0U8hjZirWywMNQZxEJducD3X9WqLsXD4HJsfdj
	 LD53lb34LZM9SgFT5t8ZLqJo7P8eepC58YF+wJqauy8qAuyEOYeXmb1iWOaswC+f3A
	 lJyXN0Q4cGx1LxPkmYZSSdcASUqRKAFifFv793zJSP0AsJ/96IJdm0AxGcdOYHLGHJ
	 ym+2zKZhz32VEpKNTo+g7wRjXodyc6LooXiI/tQcCTAKX7lCa+J/1rdrDIL1k5hW5u
	 3sINUC/oBAyqy0TsVs+XOCnbn9MZISVWGzfYPyHmGok9N6rhRof9VzXwTIi6LNtZfm
	 vPjHynsH/+Nnw==
Received: by mail-lf1-f43.google.com with SMTP id w11so6067691lfu.11;
        Thu, 26 Jan 2023 18:52:28 -0800 (PST)
X-Gm-Message-State: AFqh2ko9k5ICKL0+ekm5G506Gd19IX/Mg5xDYAWEo40FEmfd5rWD4m2H
	LMQQr2mApMIRX3g1jKszkvKhif1+XqmLVLaVsA==
X-Google-Smtp-Source: AMrXdXuUHO8hzB79znCWY5z5W+kP+XGUd9qQcOVFLEto3iBwYVy74HhXFjPnd5hXwwIRJ9E6HcUdt0DBWBdYu5B/NjE=
X-Received: by 2002:a05:6512:3f0c:b0:4b5:2aed:39be with SMTP id
 y12-20020a0565123f0c00b004b52aed39bemr4431185lfa.195.1674787946999; Thu, 26
 Jan 2023 18:52:26 -0800 (PST)
MIME-Version: 1.0
References: <Y8LNIt97qxLk8e70@ubun2204.myguest.virtualbox.org>
In-Reply-To: <Y8LNIt97qxLk8e70@ubun2204.myguest.virtualbox.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 27 Jan 2023 10:52:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY__4hW_MKnL5PxES+Z_VYTM1JXPgNCi2TW=WAb7Ri9yHLw@mail.gmail.com>
Message-ID: <CAAOTY__4hW_MKnL5PxES+Z_VYTM1JXPgNCi2TW=WAb7Ri9yHLw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dp: Remove extra semicolon
To: Deepak R Varma <drv@mailo.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Saurabh Singh Sengar <ssengar@microsoft.com>, 
	Praveen Kumar <kumarpraveen@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_185236_044004_4D3ECC6B 
X-CRM114-Status: GOOD (  14.95  )
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

Hi, Deepak:

Deepak R Varma <drv@mailo.com> =E6=96=BC 2023=E5=B9=B41=E6=9C=8814=E6=97=A5=
 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8811:41=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Remove unnecessary semicolon at the end of switch block closing brace.
> Issue identified using semicolon Coccinelle semantic patch.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang

>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 9d085c05c49c..9da58ac5a8b8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1693,7 +1693,7 @@ static int mtk_dp_training(struct mtk_dp *mtk_dp)
>                                 break;
>                         default:
>                                 return -EINVAL;
> -                       };
> +                       }
>                         continue;
>                 }
>
> --
> 2.34.1
>
>
>

