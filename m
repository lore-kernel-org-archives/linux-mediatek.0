Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A07CCF31B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCxUhP5PTGRYIcR3m3Jk5Aux/17r3kHlckBWx5mLpvs=; b=cHLB/95mzNN+u8XSn0s2P5djLp
	MxAx87khb2Ph14yKIcofT2Rc0TaR5mPMHEO97YI8tGVZoX6r93AgLUG+PHhRDx05iCZjTH66TZ1bX
	hS4tWD0Ri/S9iOt/GidKTJuO6N827pXoVCOYAK3nrxhDcEihzEzK4b2tase/0Oi9J2bXx1SfY+OtY
	FpF7mrBr8rTXzY383y+qHWucQtEw8UcPy0vuXTjLGkodNGB1gj7T1t8pmn26/IahpwQqupIRf8PtX
	ZPQVcIfVJ16FA6tVYJwOH6Xv8hPcmz3KBXmPQzuWhsJmNrEhbZ0CVnEB7XzG+WxcdC5fPseB7cqAV
	VhMt0i1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svxHS-00000005cN5-3xlG;
	Wed, 02 Oct 2024 11:12:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svx55-00000005aPg-2MmB
	for linux-mediatek@bombadil.infradead.org;
	Wed, 02 Oct 2024 10:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JCxUhP5PTGRYIcR3m3Jk5Aux/17r3kHlckBWx5mLpvs=; b=aYu5icDX32x6uYq/9gIKxZCeKT
	gsQah3679sPCiwlYliwqIG/wz6QOLdA/dNGnQCisK0tjc8B4VbNdTQD8f0+1uvk1DTJ/a466BqUe7
	AnkZxvqnZVzp7pjgnmUTnpVSF4PDCibTaVGEspYgULvvTTgCW2p5TOihIOqfvCaFSHMEKDaOXwtbQ
	T/QT+gsBV5dS5toE8nEsJ+vPcY2o5ucN0iv0kUi1KgAAsgOCY2KzaudcyAKyCEKdgMZePi2O5i82n
	abbz8jIpCo2thD4sbHf6FEoYzd4KN0T/8AXiXt8Ni0DwbQG2+yS89ZF+THux+KlpoiwCoo2ZnXwt4
	8wNaC0iQ==;
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svx51-00000003Spo-3ylQ
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 10:59:42 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e252d1c5b25so5931956276.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 03:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727866775; x=1728471575; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JCxUhP5PTGRYIcR3m3Jk5Aux/17r3kHlckBWx5mLpvs=;
        b=zHl/3LH2bgYYiFgJvNNzAINNY4/xi/d+8NKmzMlCIjlOwwAbQMeyyiu0QcBueXfv/S
         PoEaos5W8G2j+cvRUzecQs3s7Sqq4IaLyNtNvobZwmgeVEHkt1kg+SGdcmMKXXSISSqe
         6RuekmXaKJ6Qy+osNSKhpg4CuMYpTRCNHTMrutWvtGrsSHTS2DcJdS1xll4RrAuh6DEs
         KiX6pMj2MqAdhgFTNKFtslX0vs8zLCPcFnOk8bV7BHC25uzbI1GT3VVVAlfcxfGaMB7x
         MOZl7FbdnK5jG64rlhgIkCzY1jmPzep7PUCjNq46e+wmCYYy/78ggKJE3eKpzJA6vrfy
         ZA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727866775; x=1728471575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCxUhP5PTGRYIcR3m3Jk5Aux/17r3kHlckBWx5mLpvs=;
        b=rJ8WV54rVYX1vFasRnizO4MvcyFBkxzGXPY6BaetQSD9aPiL7Pp9jyU1wx9wiwTKgI
         ueW/63LZ6YQTcBYmqPjseGEJWcdMF0M6nI/SW+jOFEsaJ8KoKHAz4oy4WWlSXnUfv3NC
         NcrasOZ3XeXm0xWFLLJJ69VF0WXhO3/yzuklk4U+zOx3pp48evQnT2LR+/wR5u5pnrA3
         MtkHstRHqGrXE9LaWg0k1GaLqwXH/6258UQzGHFJir8fIivwQfEMHUw7tpXWeusm8yVZ
         DlWmSnXbVi2u97eNEP9ixD4t+VdwUrfE9yunpoPho5BMUeI+SwuZObqsQlNS8h6Ul4vc
         wppA==
X-Forwarded-Encrypted: i=1; AJvYcCXOEvz++Za4Eqa/8Y4vkc0vJ6CLflRxTKKgMhjhTKF6k5AsL7SjvdirLKXS66TiVXn/oJQZzruFi1YVx+BLzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+hCpa9ONBD2Rq63gH8HO06Upmqb2mB/XLFttj7aiYTDr6XSQy
	MoniiUgt8txYSFJADX4G+W/oXs3BxAOOS6GGqvCRl4H7oq4uGUHXkWc4rB9JOlHXSbTTgyLhqIL
	B9ESLACv0JlSSzczpbNz8DQT7nmnPZx7E72NkFg==
X-Google-Smtp-Source: AGHT+IFq0pk8pMecMnHenj+WF1HIEXl1ETFIdkc88bklqtHOqecgN4eekOLxn+WfMWdGyjsskNLSuEFzJ2UWoa/M8hk=
X-Received: by 2002:a05:6902:2e11:b0:e20:2a9d:f909 with SMTP id
 3f1490d57ef6-e26383998fcmr2106920276.12.1727866775632; Wed, 02 Oct 2024
 03:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240930044525.2043884-1-wenst@chromium.org> <ZvsVfQ1fuSVZpF6A@finisterre.sirena.org.uk>
In-Reply-To: <ZvsVfQ1fuSVZpF6A@finisterre.sirena.org.uk>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 2 Oct 2024 12:58:58 +0200
Message-ID: <CAPDyKFrNXtFY0Juwa7Hm6Z5yBeXztg2BMRDcMmM4z4NRXdHm-Q@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] Add of_regulator_get_optional() and Fix MTK Power
 Domain Driver
To: Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Pablo Sun <pablo.sun@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_115940_229122_CB1035C6 
X-CRM114-Status: GOOD (  16.87  )
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

On Mon, 30 Sept 2024 at 23:17, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Sep 30, 2024 at 12:45:20PM +0800, Chen-Yu Tsai wrote:
>
> > Patch 1 adds a new of_regulator_get_optional() function to look up
> > regulator supplies using device tree nodes.
>
> > Patch 2 adds a devres version of the aforementioned function at
> > Sebastian's request for the two power domain drivers.
>
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
>
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-of-get-optional
>
> for you to fetch changes up to 36ec3f437227470568e5f460997f367f5446a34d:
>
>   regulator: Add devres version of of_regulator_get_optional() (2024-09-30 01:11:41 +0200)
>
> ----------------------------------------------------------------
> regulator: Add of_regulator_get_optional() APIs
>
> Add of_regulator_get_optional() APIs, which can be used by generic code
> to improve integration of regulator management helpers for their users.
>
> ----------------------------------------------------------------
> Chen-Yu Tsai (2):
>       regulator: Add of_regulator_get_optional() for pure DT regulator lookup
>       regulator: Add devres version of of_regulator_get_optional()
>
>  drivers/regulator/core.c           |  4 +--
>  drivers/regulator/devres.c         | 39 +++++++++++++++++++++++++++++
>  drivers/regulator/internal.h       | 18 +++++++++-----
>  drivers/regulator/of_regulator.c   | 51 +++++++++++++++++++++++++++++++++-----
>  include/linux/regulator/consumer.h | 37 +++++++++++++++++++++++++++
>  5 files changed, 135 insertions(+), 14 deletions(-)

I have pulled in the regulator tag from Mark's git tree and applied
patch3 for next, thanks!

Kind regards
Uffe

