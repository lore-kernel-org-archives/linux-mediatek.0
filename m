Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6A3C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 17:50:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CEC42074B
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 17:50:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3TjBrEhe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2cAp12zB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CEC42074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SSTyCMMEc/nSZiUFf7V1C5OYdIQCd8R+VbFEzFikPrA=; b=3TjBrEhe4jQlRsYBLNRuWWSxy
	y2hBgFuK2Hi8vnulb7VysQzi+eheqJXiVnGXhSTR7JMUHDyGKKOeh2s7hCRCqm8uCyZyn/0EfALUW
	4vdcA8i5qKX9pTNgHUft4ztem+ZNIeWvTK8TQIoFFu0VejuVwLpV18DEnjj5+9ZPnuA0rssL84O90
	CHemZO3quJaPG0aJDkx69Ktd2udL4nqqyV0F+9fnzgqJVzkCTRuaTydFgi7KD5R5HNv1iYXnkehj9
	LacNUSwM+YTeQ7IblT7686E/KmCYpI2fFduet2dYceO6jVAhubKfjJfvvyn92ajIXleCyGl24yBe0
	e2KOerc9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1ZB6-0000Be-Am; Fri, 31 Jul 2020 17:50:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1ZB2-0000At-PZ; Fri, 31 Jul 2020 17:50:41 +0000
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E57D22B49;
 Fri, 31 Jul 2020 17:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596217840;
 bh=xIA7hRiGI8hcIKt24KewaMAWkWoF/yDX6COzosKFz0U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2cAp12zBS5xCLw85wjvdjdkrrYdGenmddqas/YJEZAPOvYSUiVcQNwHf1z3FDbPuw
 cCHIZsg7FocV3nJ4qpnkIuFA1YuIb0cwL4oeVRXgvzuUmA+LA/qE07FoatkDIKFqYY
 T758LDjUVTI0sWA0R8iNFwd4qZl/8UA6UprEjHVs=
Received: by mail-oo1-f48.google.com with SMTP id z10so3180219ooi.10;
 Fri, 31 Jul 2020 10:50:40 -0700 (PDT)
X-Gm-Message-State: AOAM530tlElGB92xutgeNUNdImx51BNdvqT2D9dCjVsI3qTJmOH7xWom
 JYzzYSl15vFx0SbceJOQS9Ls0bIetcaoaPNJaA==
X-Google-Smtp-Source: ABdhPJw/OSexwE0OrWpOTs5zx2c0CPD/ZcImiHA06bu/BmJSIz2sUGn0TTjq1kVG2vBqMM8m5HsBIkCPn13mRXjt5Ms=
X-Received: by 2002:a4a:9c0f:: with SMTP id y15mr4046986ooj.81.1596217839437; 
 Fri, 31 Jul 2020 10:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
 <CACRpkdYpMWHKNe_jOHJxLvLC=H_yVSJfhNp09ahy-dh9qJC+gg@mail.gmail.com>
In-Reply-To: <CACRpkdYpMWHKNe_jOHJxLvLC=H_yVSJfhNp09ahy-dh9qJC+gg@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Jul 2020 11:50:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKEPhRtf8zabUB6UKkOf=J4m+3P3cSvSXFSVp9UKd1auQ@mail.gmail.com>
Message-ID: <CAL_JsqKEPhRtf8zabUB6UKkOf=J4m+3P3cSvSXFSVp9UKd1auQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/7] Add basic SoC Support for Mediatek MT6779 SoC
To: Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_135041_048025_0502F889 
X-CRM114-Status: GOOD (  12.14  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 CC Hwang <cc.hwang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 7:25 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Hanks,
>
> I applied patched from v9 1-5 to the pinctrl tree again for test!

Patch 2 has warnings as I reported. Can you pick-up v10 or an
incremental patch is needed.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
