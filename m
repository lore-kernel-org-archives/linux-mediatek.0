Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164A8C5519F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:03:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACFA02137B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vFUw6HuO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="mv7jqd2j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACFA02137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=82rEK1c78FcPfnQGK1sJs4Qk7HLQtDQOBnoEZ6jzZjY=; b=vFUw6HuOwHBS3EeKjM4AfHtcu
	e3r7MAbs2nz7T4yKLw6+SrTpz7wMZXq3/Mtuh9G7CclL5G4s3rnFde/0ybMKH6kySbLOycibV9lEj
	v4OLpEFuVMifB0wahs7rH+Pxe6s3eIAGdFcuxG1LafqJ1CBVLZ/58jS329IPQgtx8+VN86s2w/L8I
	BGBA0Tpg6KZS42m11s0jr6efXnnZP+veHQY2zJcCGfA5iNAGK5aOYgkjzOh8r75bQ/6tf2+wnJ5x7
	mAg+t2jv4LtqeCfRxauk7GhCCs4ADfh/oQ/Ki7xaerSm9ioQ8UIsefIzmznjC+AXCiCHyLSo7UAw5
	4GJa4dVAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh28U-0006x5-DO; Mon, 23 Nov 2020 03:03:26 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh28S-0006vi-Bs
 for linux-mediatek@lists.infradead.org; Mon, 23 Nov 2020 03:03:25 +0000
Received: by mail-io1-xd30.google.com with SMTP id i9so16533409ioo.2
 for <linux-mediatek@lists.infradead.org>; Sun, 22 Nov 2020 19:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cmZ2kkoeLoaVXWsbBzaDLLnsyKzK7HyWpB00+aI5R04=;
 b=mv7jqd2joqZTqXkI4wFOSBKjG7mjGzwc8NaV90PMqDA/DN8tf+ynMKFWkB0YE5Xdtu
 XwDb7MsRyYVJ31vIHzOxIdkKAuYop1oDNg2T3wdLwpn4t3bR4jiFCzi50pZH4CDb614G
 Qr/UNiKI8pabdnGpSCMyBP7x4BVvwNOw2GpgtWJlxyNdFWg5QGJtwz0saIFfU/EKpiI2
 4m7tBqqLiuDTB7I2VMH4Px+fD09edrqypQCe2O4OFa8Ko9EqMSOIsN5awSVLurciXmeh
 TBwObMWQGtRNet6CeLTeDRDEA11rp3RXV9fyts+WDXHvnjn7np2Y7SyikX1ABWRu6rii
 gBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cmZ2kkoeLoaVXWsbBzaDLLnsyKzK7HyWpB00+aI5R04=;
 b=dBzgMZNEbxKR8ZwVrRP4PICDQGHhvwWJZ17hM4TzeP74Bv4y4bSUZ9JXLMeyjTYnRi
 2kP7TMtU881lrHzakD4C/gaUHUl7IFPw0m//OxJDDXQI769c4056qPkIzsVwhbFVEaIE
 lOmROv2lj7y+3WpNuD0krG+kTy/lHas/ZRGT0UAgHWebFC66RZXy5ebZyPE5LBceKk13
 pQECcvDXVE92H7eo2AshTcurrNl/eTVAKnJGnUDW4e8JLZmzdBqTXasCDGXMtoXvxufr
 FGeOaT7usmi3Lz6yKS05ilBZQEmgDHZ5VobrlELzplMU1I4zUDay3fsVfIJmMbMHIoZa
 RxZQ==
X-Gm-Message-State: AOAM532xsgJX/4qjrdAi0ydKBm1p7aKm0UeNPiWohRY2FAOwogF7FEqZ
 BA9BF6Hs7PINa7ItxpSEhGuNL2LfO5x39ctJLA3jSg==
X-Google-Smtp-Source: ABdhPJwptrKso09cemQUc5m/nxPNPk7xqo4MYznakzCuHAhqaRV7MRIz8vyAnBx+NtiZFKXMuZapIY5faME+27pSUxI=
X-Received: by 2002:a02:5e45:: with SMTP id h66mr10874397jab.126.1606100600165; 
 Sun, 22 Nov 2020 19:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20201116084413.3312631-1-tzungbi@google.com>
 <20201116084413.3312631-4-tzungbi@google.com>
 <20201120235020.GI4137289@xps15>
In-Reply-To: <20201120235020.GI4137289@xps15>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 23 Nov 2020 11:03:09 +0800
Message-ID: <CA+Px+wXor-iCk98JfSx8pph10=WdkjGRNacY-FBGAX3xh9x71g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc/mediatek: read IPI buffer offset from FW
To: Mathieu Poirier <mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_220324_476940_1987B3B0 
X-CRM114-Status: UNSURE (   8.70  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Nov 21, 2020 at 7:50 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Here you are breaking all the current implementation with a firmware image that
> doesn't have a .ipi_buffer section name.  I'm not against this change but you need
> to make sure you don't break anything else with your changes.

Thanks for your review.  And yes, this change could break MTK SCP when
working with legacy firmware.  We'll make sure the new firmware in
MT8183 also contains the .ipi_buffer section to not really break
anything.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
