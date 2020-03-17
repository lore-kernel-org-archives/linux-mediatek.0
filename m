Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5E7C18E5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 12:30:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8B7420757
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 12:30:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LtiZxBXI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8B7420757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvhHaWgxva65b9BHXqpK4WwiRuGQcj7JQaFJh38KEJI=; b=LtiZxBXIrwR9eo
	FI3QBKbUjam70b1UskCBkH0VVnI3z3egNKIOiWQGGoGX+jBDFfhOWSGSI/Y+9YiTZeQZRhqafqdKO
	/emKU/6IumVaDeeAiHmLyl9gLaO97cqOXqdzExOsY/qOgkDLOaSuG9XbfZ/xp1OP3T+4401WzYKYJ
	N3g29+/sPAE57eUayz7oQOSEWtm+9emnCD87DxpHPm6B2nJxgJzUMHR/Dkc1b/+Sxuy7U9u4HCqWG
	vNcb/fzhkjCD0mnFbpugC2syjJFa3pN++bk8PK5bajAIpN6ueMrPuCiaa7RLOLX/BxRjh/m7Kuaz8
	0swWP1tS9cmGAbsq20Bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEBMo-0007CW-Q2; Tue, 17 Mar 2020 12:30:42 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEBMU-0006tY-Ru; Tue, 17 Mar 2020 12:30:24 +0000
Received: by mail-oi1-f195.google.com with SMTP id k18so21511000oib.3;
 Tue, 17 Mar 2020 05:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7bWIGrmJckT1m6t9quae5+JZV9bgbsoWOVuE/IRPIaU=;
 b=lWd/LjDs4/tPdL73+xqyBFKAsW7rf7sbEjSSd0IBeognoh3axNq14rN0Bs1Gc+pphQ
 n67wFPVNx3TqzXLx9u7vsAAx+l/vO9U0TTG04qiVRTyO3IsK3Rjkm1obS7YsyP8duI37
 bOscn9qxwFLiFm5FiLQYFBTb4QCPZPkDYL+cPiPwgR3jiKAarnS7egTUw4po6DeqQL5b
 jp9i/1nWkbFWA+ASYYP/Y2v3TmpAnlt2aaIzTSbH3Elygx7IiQKGueHD6QDB6hdqgyk1
 eikhL2BAcKLxAsSy1oDYz/yNf6Pfq3aztMFqsIIFf4tVY6fMGpVvIkZLbwb9fMZ37LqC
 TkoA==
X-Gm-Message-State: ANhLgQ2rCTcgz3q7Loqjx6xeygOAswf1UEzuiBQgJ3rSrJ8iRMiP6syZ
 W2B7hvzcosvfmOsGaxZ5R9UhD2DoEpJ6a85bNnA=
X-Google-Smtp-Source: ADFU+vuNAHmuooiafUqKBUMfEczzYmFc/BAx7C+JWZfkPiA2MFSi8dPCdNgJmpF13jUW4ASUOw2odywHhSz6CZpai2U=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr3061324oig.153.1584448221150; 
 Tue, 17 Mar 2020 05:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200316104701.209293-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20200316104701.209293-1-alexandre.belloni@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2020 13:30:10 +0100
Message-ID: <CAMuHMdVy6J1G5P6BQ14D65=pRu-q=+kcN3RV8mjtaZcwBooZyw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc: mt2712: fix build without PM_SLEEP
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_053022_940918_1EA97D72 
X-CRM114-Status: GOOD (  16.41  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Alexandre,

On Mon, Mar 16, 2020 at 11:48 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> Move SIMPLE_DEV_PM_OPS out of #ifdef to fix build issues when PM_SLEEP is
> not selected.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-mt2712.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
> index 432df9b0a3ac..c2709c1602f0 100644
> --- a/drivers/rtc/rtc-mt2712.c
> +++ b/drivers/rtc/rtc-mt2712.c
> @@ -394,10 +394,10 @@ static int mt2712_rtc_resume(struct device *dev)
>
>         return 0;
>  }
> +#endif
>
>  static SIMPLE_DEV_PM_OPS(mt2712_pm_ops, mt2712_rtc_suspend,
>                          mt2712_rtc_resume);

That's 23 more unused pointers in your kernel image.

> -#endif
>
>  static const struct of_device_id mt2712_rtc_of_match[] = {
>         { .compatible = "mediatek,mt2712-rtc", },

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
