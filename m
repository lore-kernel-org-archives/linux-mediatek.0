Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9EDC43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 04:09:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F173024676
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 04:09:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QbMjxLzr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ge7vJSYd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F173024676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Am2qtHsBDxqPyc23kj2XRdZtbNyioCRHP2C2TYZA5eU=; b=QbMjxLzr2p9FZ+
	IKZFcLtPFfhErod8ZADMqpy2nvhGbZpe3a78W6iyEpYlOdTfoe0hbguLbqsylLZjS7PNcB3uj99fN
	1y8/7XmfAxjl9NVv7DLssYXNaXWypm5eiaVfsTAZB1r9zR4HEI8aPefaG+gtp7LjogwRZbysXAM9H
	ZFrX7LPaWt/Tu4DVljioxu5aqQpceTpY+xHnxeSlJD9e5GJPdA3XtYY36u3VYixDyzV98Mz0RPcAC
	QO10r6gtP9GwpVa5XQoALS44YOk2hO4EJTgxGopqDbB16j0vrJVVQ3ZxOBRlQejhYNUfmOAib1DD2
	/w2neVGpNIKap+RSv/bA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii9bP-00074U-07; Fri, 20 Dec 2019 04:09:23 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii9bM-00073r-8G
 for linux-mediatek@lists.infradead.org; Fri, 20 Dec 2019 04:09:21 +0000
Received: by mail-qk1-x742.google.com with SMTP id x129so6566975qke.8
 for <linux-mediatek@lists.infradead.org>; Thu, 19 Dec 2019 20:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iWH2rtI+yo+f6Uui9r4utAB0db9s0smuFWVbuUxv/60=;
 b=Ge7vJSYdnt7deD6kR9fLEvZNkE16NR9RLAQVmVdh5o+lyvc2n4VcUt3iIWoIebvnaQ
 4qovegTLVPk4Tdp3Bw65X6UM1HludsBNsvoxkk5P6L1rTqJRQ2Z1QHXr2KxV7RjHYpS7
 aIIno4goROur4619EjBV4jXY5IGKj7lq66+NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iWH2rtI+yo+f6Uui9r4utAB0db9s0smuFWVbuUxv/60=;
 b=DStWN+D43tTrm2QfDR21RfkcOIEXv062yOImRAxmCvQOEAuio98iUgl3KLr40Z5V3k
 73EsFzvdzyD+WMI9efVcaXxRfpFyKVSLv/TIEmGcDK8TXG9XJL0eBKwAPWIMI5rI52I7
 c7Xj3e9UmzMwR07bRBGqhTAlP5Vdxd5ydPovovEzBpPD6tanBEk6/0Ixd8osqj7mTMo/
 gWUabRiq1xUY2Zv43QpceYfX4sZxQzxKaqCbgpEbbUTBI4h6uzfykk0I5feGHyeoL1A/
 8xkQgE1HCAYmw98ihG/5iW10BOsFSsap9rgoorvB1nijhLGvcru1osS2nJQL7Tq4+MUb
 +psQ==
X-Gm-Message-State: APjAAAU8vP7Spqnt3h45jeNEiCXbN0sDccy8U4eZY2Llr4fuNYd2OTPz
 O17ZVSWyM+XqPmynQS17MgRlcWAHUv3KIV0G0OjlMQ==
X-Google-Smtp-Source: APXvYqyKlFLkKf97nbSI3FdciNJl4vfBubiJ5SkVtcJcYc3HIVAvB6w/kPk0zMeJU+zuW03LhaGoMPxI3g4/KGpiJKk=
X-Received: by 2002:ae9:e103:: with SMTP id g3mr4794526qkm.353.1576814959140; 
 Thu, 19 Dec 2019 20:09:19 -0800 (PST)
MIME-Version: 1.0
References: <1576813564-23927-1-git-send-email-weiyi.lu@mediatek.com>
 <1576813564-23927-5-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1576813564-23927-5-git-send-email-weiyi.lu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 20 Dec 2019 12:09:08 +0800
Message-ID: <CANMq1KBk179u67S0VKHr_Ymh3mcd6yddJKNhvChjW7=QMe0xMQ@mail.gmail.com>
Subject: Re: [PATCH v11 04/10] soc: mediatek: Add multiple step bus protection
 control
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_200920_298496_D2A3A266 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Fan Chen <fan.chen@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 20, 2019 at 11:46 AM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> Both MT8183 & MT6765 have more control steps of bus protection
> than previous project. And there add more bus protection registers
> reside at infracfg & smi-common. Also add new APIs for multiple
> step bus protection control with more customized arguments.
> And then use bp_table for bus protection of all compatibles,
> instead of mixing bus_prot_mask and bus_prot_reg_update.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

I think this looks much better, thanks!

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  drivers/soc/mediatek/Makefile         |   2 +-
>  drivers/soc/mediatek/mtk-scpsys-ext.c | 101 +++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-scpsys.c     | 117 +++++++++++++++++++++-------------
>  drivers/soc/mediatek/scpsys-ext.h     |  67 +++++++++++++++++++
>  4 files changed, 240 insertions(+), 47 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mtk-scpsys-ext.c
>  create mode 100644 drivers/soc/mediatek/scpsys-ext.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
