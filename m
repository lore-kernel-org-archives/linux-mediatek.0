Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44336C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:37:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10DC4206DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f8KJ1f5c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZxQBzAmi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10DC4206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qVGLt3ieFgmsBEO+ginHD5CcEiC1H8zupQ/War23ZAA=; b=f8KJ1f5cnmZS54J3SWNpZ5KLJ
	dmvhdSSs8uAGRDJzA19xO8bPl7lbkSyD/7SQioKlBGEgyDZhl33hVkJDIFSXDz+znlqFUCsqlI4Ly
	hp24eebL5zftQKQHXiH0iIKHC3BuEnMuaugsGlkOijxZY4H9fbkNmrhISdE6eYfmq/kj1c1GSB0NY
	sDMUKnbSA2qyjzgLTpSD885YKelqhW4azyJH/wZm1cBz1o0TP1Tzbjuslky33aAEfj3+YHVSSzQy3
	sRCBcm5ExINoPqHq0bRe8/aLY7ECBPSq4n7izdS0HXQxBzSCWoPe/4SsXlOIAT1YIFly9pjXS3Tyn
	gR2eBdSHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jslup-00073e-UV; Tue, 07 Jul 2020 11:37:35 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jslum-00071b-Qm
 for linux-mediatek@lists.infradead.org; Tue, 07 Jul 2020 11:37:33 +0000
Received: by mail-lj1-x241.google.com with SMTP id h22so42328333lji.9
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2020 04:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OnCd1YAPjG2Ik+wSQkHZosL6QWVa11jN4YE6zzRMrv0=;
 b=ZxQBzAmi25Zp6vi/k2z/1OssFAAw4KoH6gUCTpfVD1ZM+K879D7B1UIQA1+cYHb0vq
 JmPpN97k3pMzkijiQy9NvqBrQktnRzols67yxfeAVCMCpoKCZVaPuqgGNTTKCs3nyBQ4
 1wIgcqKPw1dt4fMUp/lBnXTMWSQEu8TbmXzDJVNfwbg3PHoGQ3CrD3qWYQZtHy6WntgD
 Evd8VHYB+ivGSvcUfOUP5nf82hsdhNVL8Xm2EnOMUWeLuDdllosFDWhirQOjR1wu+4dw
 auTq2pWgQlkzGmvldemqEllSLI1WT0Hlu4AYAGKL/MuSV4C1t7xqfCVIq1kTnb9Jb+L/
 YXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OnCd1YAPjG2Ik+wSQkHZosL6QWVa11jN4YE6zzRMrv0=;
 b=ooaWPxGavCjRwfE+3RT8rlHTFLE0NRie77oCmUwM5hHjVH4ObzFOOuEo7xJD14nqpo
 U9n+3tlnJYfKHz5JPqxQMmJnm//IFt3ob/0JY7zrezHHawTMcZrG6UdBueReD5TwZ9/R
 PGtnVxgJdSXBU1yMUY4YEbR4D+zWafZC9F2eBM0kHA5KaasF5thCiWyMLtPpNxEWRyTD
 jMn2t/+RT3Nt9LbbJR8hn8h1/pvCe7mjsrA0dO0Jw4bWluCZ5xmIM9Nc6zD6L5sXwWws
 t6N0BIIyZ50asrAGOdD9lHCRlEg3k/CcUqc/mK/Q4BL+fCVRZdcnHnfEL/iUcX7UkxXt
 7wQw==
X-Gm-Message-State: AOAM532IdYwucdKYl6aoCylNYkjfYTWLQXDbpPLISiOGOn4LjgfA/Voe
 grVMuwGQ2b2J+8AWfYFm2RksLUFq/zrTMYP4GZ1MOA==
X-Google-Smtp-Source: ABdhPJwP9hKdzcTYu5+7+gkCXic4cOTdr0VXL+Zzwrh1whoWKZc3WZtCAHkFv6JpcmVTdMaJuMYRFm8FqSC3eqGZGt8=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr8538176ljj.283.1594121851218; 
 Tue, 07 Jul 2020 04:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
 <1592480018-3340-5-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1592480018-3340-5-git-send-email-hanks.chen@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jul 2020 13:37:20 +0200
Message-ID: <CACRpkdaDVzEjwrRbUjEPdGqVOHrLYaYSA6uVc4t_sY_A-0S-dg@mail.gmail.com>
Subject: Re: [PATCH v6 4/7] pinctrl: mediatek: add pinctrl support for MT6779
 SoC
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_073732_969122_5D95922D 
X-CRM114-Status: UNSURE (   6.73  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
 Loda Chou <loda.chou@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mars Cheng <mars.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 18, 2020 at 1:34 PM Hanks Chen <hanks.chen@mediatek.com> wrote:

> This adds MT6779 pinctrl driver based on MediaTek pinctrl-paris core.
>
> Acked-by: Sean Wang <sean.wang@kernel.org>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
