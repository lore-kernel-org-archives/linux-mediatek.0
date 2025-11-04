Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB41CCFA04
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Nov 2025 16:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZURaLbDo3dwoVqwyM02ToCv5MutkNZmPeTZy84rbNEQ=; b=oN+ti0RpNYO90pK1sgQCMOrPN0
	Mx+v92annhYLE0oHxYbxBCg7F+9Al6qnz4H6SgqsckFG9+F9mxLET3/HhLFTN+6RC2qo8h5BwFGWY
	RPSCf7UzScJtjRRKRgBWj/OoeLJsIXYenejyiabtZcHmruSU89pQ2RgAcY80DF7S9wuzkV0Y9ID0p
	68nfrY9kToMUWN/hL/TI3nCLevtEHevPT/EPjjMnrPWxAo9QEzmsyvXLYF7dVgSuK1ycC41Xkf5/e
	4e3FDLM79T+5iXeZzOZQ5eBmg2G5NiPxxIcLz15IF24xT3tHDwSKYAus2ec08ULYVjy/Ev06Kldrn
	u8fx80+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJzL-0000000CCaX-1Cfi;
	Tue, 04 Nov 2025 16:34:31 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJzI-0000000CCYe-1q4r
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Nov 2025 16:34:30 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-63e16fbdd50so4977757d50.2
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Nov 2025 08:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762274067; x=1762878867; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZURaLbDo3dwoVqwyM02ToCv5MutkNZmPeTZy84rbNEQ=;
        b=khG4qCfcZ35qoWFm3qAc5vtPK6EY8+LDQWJwjZl2RTt3shiX3NtctEek+vRzrecWvA
         ez2O1pUobBceg+1s9DP0UddGCDdX5oSLp1fk7pNV3cY/TNbJSM/FjM2JVgMxEhhkrfGX
         BahLgDoKf8vwq1CHFiglD6nu64Nh4hvIHUa+E+4ArBgNP+xQMC4uut5yWJzjBTzW8T1T
         SCsxRKTOY9yH/2P9ggPgy18P6Fzl6HD02gmihj2QsF/ux6iTZN9yU2sHPGue08I71+Xo
         bI0OwKNMa74JDH16Budy4ncJyOBy/0hisZgFH0Xxb+0M/cCBR2jkGl6CMd9aS3SlqO2I
         pEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762274067; x=1762878867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZURaLbDo3dwoVqwyM02ToCv5MutkNZmPeTZy84rbNEQ=;
        b=gDAkd+conCJYe2DlDSo56bMNE/hmiaR66ileH0GlxUTbOqRVGhYbGsOuOuy+rVPil7
         ojOmJRCdZoJWPPEv7IAOV1u6/c3SamaPNStPzj9v/8O6KhbFKmAxpClfT+W8hm36RcF0
         alaLEtR3RASPxpEVlulvQO0Vzr4WYL4Dp1iZq37dVgfsADtgSTU85cx7yqZzIS8oHtWq
         EfXu/dpEAbowhrzUpEBFtVPUhDZCfRBGH4v8D+RmsMsIqRUmbxlJbHeb5gg8iwwsLwRB
         Zsz3rau4iKIMP/CFqWR0SyWUSgv3yVPTvKd8DuR4gjM49X4sO4uSNDfGccTAuQzyWyhz
         Sj/A==
X-Forwarded-Encrypted: i=1; AJvYcCUloUyTEb94mKeLO5YiN2ibUrKdaFl3bax6QCDh+geZuz2AU4F1vuyYHfUjyrPj8kIY05zIBnMSUgZ6sxXFFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/etbU0YwRFwGYKztEwIHhoyGDHsMjlb85jF8fEk2QB7YX3/xO
	UgFPAY0acbShe8GEBvj6pJ7Ny/5Dan/u4hG6ulwVC4AYBJk843KaPhtRloia0GJMvLvVEycrkmJ
	WI8yL7ORYhTviKdosgKJBbIvhYdMBpgBaPcTq3/cp8Q==
X-Gm-Gg: ASbGncuYKFYWtT2O4iQQ2xboZa5sYCrcqVdT9xsWm3HyTTwFmTuP44Hz01LSfAk4Tbf
	8Ucd2rt4lETviZ9AP7P7rUet01P6scA4YVcwBCWa+jgD0rwZqXEbdbSgSqeKKIJ4Xj23yhhcaZK
	ocSrF+j98wDcGYyDNKdGvAVYj3P89FG04iRsEC3m7ec0EDop+jo5oeqaIJ3P+V0CPysZVYxVMhn
	B8eJW9NDtCLBN+zOF7RyD8i00zzKDy2DSlNhpg4Dyc8+AWdFs4tzqd2rcwlOQ==
X-Google-Smtp-Source: AGHT+IGVTYPjRbvY2dc+1i1hVKSl6/mUpbt8rBD57n2a05T5582PeM1IiJduGFBi48QQYI8y525MVnCW3dK3LdtTGiE=
X-Received: by 2002:a05:690e:419b:b0:63f:c10e:6401 with SMTP id
 956f58d0204a3-63fd358fe2bmr57363d50.59.1762274067017; Tue, 04 Nov 2025
 08:34:27 -0800 (PST)
MIME-Version: 1.0
References: <20251030-mfg-mailbox-dep-v1-1-8a8c591aff27@collabora.com>
In-Reply-To: <20251030-mfg-mailbox-dep-v1-1-8a8c591aff27@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Nov 2025 17:33:50 +0100
X-Gm-Features: AWmQ_blVz8oV6Q800iTY_FXK63-gujrHnWpwcZPlwshpI-BtZsgfevwVde_Zipk
Message-ID: <CAPDyKFrJdN_6FyyjMrfNCKwXt6kFPEPAxcuosdasoxtbJHk2GA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: mtk-mfg: select MAILBOX in Kconfig
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_083428_477049_6199A3D8 
X-CRM114-Status: GOOD (  20.32  )
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

On Thu, 30 Oct 2025 at 14:17, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The mtk-mfg pmdomain driver calls common mailbox framework functions. If
> the common mailbox framework is not selected in the kernel's
> configuration, the build runs into a linker error, as the symbols are
> absent.
>
> The hardware mailbox Kconfig system, MAILBOX, has no dependencies of its
> own. It's therefore safe to "select" it rather than use "depend on".
>
> Declare this "select" dependency in the Kconfig for the driver.
>
> Fixes: 1ff1f0db6aec ("pmdomain: mediatek: Add support for MFlexGraphics")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510301311.TcOCnZ1s-lkp@intel.com/
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> I assume this can be squashed into the mtk-mfg driver addition commit of
> the maintainer that merged it.
> ---
>  drivers/pmdomain/mediatek/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediatek/Kconfig
> index b06aaa9690f0..8923e6516441 100644
> --- a/drivers/pmdomain/mediatek/Kconfig
> +++ b/drivers/pmdomain/mediatek/Kconfig
> @@ -32,6 +32,7 @@ config MTK_MFG_PM_DOMAIN
>         depends on PM
>         depends on OF
>         depends on COMMON_CLK
> +       select MAILBOX
>         select PM_GENERIC_DOMAINS
>         imply MTK_GPUEB_MBOX
>         help
>
> ---
> base-commit: d78b0fee454c25d292fb6343253eca06d7634fd9
> change-id: 20251030-mfg-mailbox-dep-ec32ef510e6a
>
> Best regards,
> --
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>

