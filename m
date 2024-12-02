Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0182D78321
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 15:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIEJcaSGdJPUD8j5XlztkJ0eGqAbM3m0e+k9lVXSNJw=; b=NnDFoovvOhrPDgMEh9cWnr7aGu
	adZJnrDp1p6ypAxTphMf2yB73w/Sx9rYzfpYfJRK8IrECE5Nejy2mr0kakvrXpinq3lWZ1+8668R1
	ddddZFVuG97qii59jRdmKLlskAsC6BzbVVdoyg0LPxkAenU11+bo6gVilP0ZwC993nNz3n75q+mu6
	6qc8alYTyTgdneX18DuGCD7YA1rimCgcHvqOmXWTmZvnxhHfg2EUwWeBqMNzprTccN3glPkw2J/Ul
	xz2Km+Bvox66VnrDg4krFeB9D5ioU7agqCpusMsmfBNyXkTwSL0Am7tO2Ga85aahfbuzqji36M1OA
	ltZIHXhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8KO-00000006eO9-0VVZ;
	Mon, 02 Dec 2024 15:27:12 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8Hf-00000006dnE-2Job
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 15:24:24 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e388503c0d7so3040545276.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2024 07:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733153062; x=1733757862; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FIEJcaSGdJPUD8j5XlztkJ0eGqAbM3m0e+k9lVXSNJw=;
        b=H35tgsBKeRxuarT6BYtg4Mmd1wDCo1iFXUoW8PwLaCRhLz2oB9Uvcid8ETG5U6c7r1
         20dudTWg2hadcqfubYMXQ5InDADS6fKxK7JWt5xYtW8Qe95kf1pWQ0IvO39la0LhxT2v
         NdLreOc3irFNEDd0QDPjHW2mswwbrcndkc7OR9Yjccg+HcFp6WZroczlqdSNc6cbr/nG
         SA91IcrrWlsmX+mH2WtRfthCk/hOE/AGpkOygWivP3SuqDpDmJt5Ifzhp4Fi5Aiyy9FJ
         bn4hnWO8OPGIVoZzKVJMZoGdIa627du/iUXDff+o8IFZP5v2SDTfoKAp+wRt2HSg5i3I
         Ce+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153062; x=1733757862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FIEJcaSGdJPUD8j5XlztkJ0eGqAbM3m0e+k9lVXSNJw=;
        b=lRA8FpGuaJZSvT94PVTKwZo1K6qEkeGzj41ZR4tW/JqTrOj5qP4ds6h+CSLsin7VxJ
         73q57RQ3tb+N7pkExnzMfHD3heGxWQhgcJCWtvGaYWZ643/qQ923i9MjX+wokE1JsoQX
         8eqUis0AVwOzeivWzsBJQfe36a0+fRSTxk2/bZ6TsYdA2KfkH6Quc6un68UhK7le55w7
         LlfzNr1jBIK02J2segM4TnWhINe4KNrNNUBP3sdlrzKEV7UlsyE/B+s4XV9B5DbcItPT
         HARIleJ8Fju+k4FRR/Czej8QVFoq/Yv0RGkmRne1jI/W6Gl0hcrbzRWD3W5Cv+rE/LaN
         1d/w==
X-Forwarded-Encrypted: i=1; AJvYcCUmZDro0xiLjsVfHwnOOhH4Oc9+wiQs+lPvgNc8YlMcNVc7r7+o9gSDT5Nf9DKJpmW21+9RcuBo9BwSqc/yRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEr0bWkqK9A99Yxdhq9BXoO/mT1wEyMQLgNmpL5a777nEB/bFS
	al3Z9Mm45eTOlHkUGKs9iQs7dOZWp2zuKHn1i5vchyf28Iq95gnaNepwUD0dxRxemKGcxumCfMo
	7L0CfFhJ6O4GclUF3w0YwG0YAdJ8p3ClmMMnGvQ==
X-Gm-Gg: ASbGncvUwq1v6hofaccsMbZ7elo0U3VyCR26XN6EyvMmTC0URrTxx5+gQ7W+C+KR/n1
	w95BUAKoa/n9/H7SbI5mxWTsQsjmOxorw
X-Google-Smtp-Source: AGHT+IGecYwU3LhrUSWFanjb/IVeaGfWBi0iqpClqfJtpXMYSm61w6LopRzGpgTzgxbggBLwJS3eaTaanLLSHlemPmE=
X-Received: by 2002:a05:6902:18c6:b0:e33:1c36:6a4 with SMTP id
 3f1490d57ef6-e395b887349mr19416613276.3.1733153062390; Mon, 02 Dec 2024
 07:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20241126125041.16071-1-andy-ld.lu@mediatek.com>
In-Reply-To: <20241126125041.16071-1-andy-ld.lu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Dec 2024 16:23:46 +0100
Message-ID: <CAPDyKFpSQj295wZf=mOPmSaLZvi769EdgFTcPJ6QRY0sOHA89w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add mtk-sd support for ignoring cmd response CRC
To: Andy-ld Lu <andy-ld.lu@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	avri.altman@wdc.com, adrian.hunter@intel.com, wenbin.mei@mediatek.com, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_072423_581632_D0C3F622 
X-CRM114-Status: GOOD (  15.97  )
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

On Tue, 26 Nov 2024 at 13:50, Andy-ld Lu <andy-ld.lu@mediatek.com> wrote:
>
> Add the process flow in the host driver to handle the R1B cmd response
> type with ignoring CRC, which comes from mmc_cqe_recovery() in the mmc
> core. Additionally, the response type 'MMC_RSP_R1B_NO_CRC' is introduced
> to simplify code.
>
> ---
> Changes in v2:
> - Change mmc_cqe_recovery() to use MMC_RSP_R1B_NO_CRC response type.
> - Remove MMC_RSP_R1_NO_CRC in the host driver after it is dropped.
>
> Link to v1:
> https://patchwork.kernel.org/patch/13883787
>
> ---
> Andy-ld Lu (2):
>   mmc: core: Introduce the MMC_RSP_R1B_NO_CRC response
>   mmc: mtk-sd: Add support for ignoring cmd response CRC
>
>  drivers/mmc/core/core.c   | 6 ++----
>  drivers/mmc/host/mtk-sd.c | 6 ++++--
>  include/linux/mmc/core.h  | 2 ++
>  3 files changed, 8 insertions(+), 6 deletions(-)
>
> --
> 2.46.0
>

The series applied for next, thanks!

Kind regards
Uffe

