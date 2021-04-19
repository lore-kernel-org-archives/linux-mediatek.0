Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A9BC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 08:31:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAAA961107
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 08:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAAA961107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0idu9HNDx+TqXN4REDtrfIe9yHGHaAQ71ec5E0cgGtQ=; b=mRo8Q/ANYqTKXCrSeMSJJ4zql
	w2otncUT5wKtcBBFaecSuZq4lVfnQGKHhgNjI2Qm58QFd/X3bmg74uJ4tMMGtfVyUEMfF0/KJnwAk
	QsVu5hBNGJHqUj7zrOs+5EI0KAgD4ol5wX5wMxyOn9/tSy6KvmAsyo1Cq3KPySg2ChXJULcCfAV1/
	bEMTPy7SEFBtt0vTeVfyIxLucyaCpbvl8rL88gjIx/bqYEXXDJxZvtQ1FXq/9xDAr4oj4rItEkzim
	JogsoFs3B4yq5qf7yqHI5jx3c38GBvw2mkkDu5sbVfZbfD36ORR5qRt+K5LFB5AE96LI29zBckGKq
	5/37XxRsQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYPJi-009QtR-Tm; Mon, 19 Apr 2021 08:31:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYPJh-009QtJ-99; Mon, 19 Apr 2021 08:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CofomMDhzLby6jKPOdJPCFtVEilhHYlHNh+ABC13Dc4=; b=BcMfYk2318LUInropeapxxpxIm
 xS0Fm7RnrNMGmFI2MshNIK78/0roDrbqk1sYT0YA1rf2XbniIMppv3htiSfuLXU6uP/1m6fpAnOMM
 Z/2WvepFRfQxS2gAFyOS43vrkLB18KEVpg5hSyNmqSXG19C68UiVW5WCagGF2pxiaG1dRyItTe7h2
 yaCkTGVCvg40bgU0lpt7UU5f3e1Q0sybrRqS3j6x9SZ91p9f8BSRLq5c16vzV+KERhEhrzoLNTKdY
 rZ2QYoIzzuogsoDg2GaPgt344gAcxBKQC5ElmhRgz9t81C7oGZDhSmBKcrv6PcSXPlpfQuw5Mrq1s
 P+k63lmw==;
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYPJb-00BBoP-JF; Mon, 19 Apr 2021 08:31:36 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 31so8266284pgn.13;
 Mon, 19 Apr 2021 01:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CofomMDhzLby6jKPOdJPCFtVEilhHYlHNh+ABC13Dc4=;
 b=HRlxRoH3IzaYwe3LI1zmqVY9HY+Vu+PCTuOgi9FZTqvGbKVNwNN95X/yMqHaXJ8Z0+
 hz2IuChL/5IpS1BReEFHh0jv5FG1Fgl9e3DWEGP1jyi+tUYFx4NWcTpNm+DMYJvGqXNb
 TztXR5Pm/Zy7gxlfvYVbGRpUWgDuurdFi0bItAkTrERdXsDMORcj8cjVFOg1oAMnGLaF
 2J4vHv6oy6z9HMNWFE3Q0ptnznybN/bgkcN1fuotd1jLBQaSSbvv0UTZbreLPUx95w1C
 uxmN/cDRkJLzba0wsPEKbaK6XLswEYqQGiWOoI2HkrRMRfPivPn0pOS2CKk0jkmMMR1t
 CMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CofomMDhzLby6jKPOdJPCFtVEilhHYlHNh+ABC13Dc4=;
 b=hcm7xY8QO+Ep5eOywumKhUrXfipWRY0ixUAo8ICzsMxhe6BwskMkEtrV/PGYT0jyzM
 2Fe/z5CbPRD48zRJl20J5k0IUyQXwRftkx1y46CT3/HgP6qDpaELRlCkJ69QOAm7wqEc
 dYxeFb3jxOyXZOmuugjnaaFB0X0Vr6d6HJY8mwVGeDLFazM8Tg/xpRreF0nx46F66xmW
 sygxeU51/6M+89KfcKQ9tNpz9Dm1ilMLPggfpNw5d9x0rAk1828BDRreowe1n8xvPDPc
 27QAcz1AHhGXSQhLNf6WIVMctYKfPGQ+++1BnNk3RCT/HR8l6SbvlROFO94K+WertRl5
 2iaA==
X-Gm-Message-State: AOAM530CNdW4poxXAUtHR1a2dbFWjl3micCeBIf1YD2FnSQD8Aezq/f6
 jtkHIRGqzb/0UBWcNurpdyNdx7mNgTjMYxNKSlQ=
X-Google-Smtp-Source: ABdhPJwEl51C2UnztCvtSzBm7xf7+4nT14qMIMlvBAqjBTvaTum9itzOtu905couqLeG+9FMN+5vak02Ac6xffS2hoY=
X-Received: by 2002:a63:cb44:: with SMTP id m4mr10857045pgi.4.1618821090400;
 Mon, 19 Apr 2021 01:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210419052136.2475373-1-tzungbi@google.com>
In-Reply-To: <20210419052136.2475373-1-tzungbi@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 19 Apr 2021 11:31:14 +0300
Message-ID: <CAHp75VfgSaRmqg96KSabmwnf6xQRMM6GQi3XAv-cJb+Lhg91cQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] pinctrl: mediatek: use spin lock in mtk_rmw
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: sean.wang@kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Mark Brown <broonie@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_013131_659343_7D24756B 
X-CRM114-Status: GOOD (  12.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Apr 19, 2021 at 8:32 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Commit 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.") uses
> mutex lock in mtk_rmw.  However the function is possible called from
> atomic context.
>
> For example call trace:

Please, shrink it to the necessary minimum.

>   mutex_lock+0x28/0x64
>   mtk_rmw+0x38/0x80
>   mtk_hw_set_value+0x100/0x138
>   mtk_gpio_set+0x48/0x58
>   gpiod_set_raw_value_commit+0xf4/0x110
>   gpiod_set_value_nocheck+0x4c/0x80
>   gpiod_set_value+0x4c/0x6c
>   max98357a_daiops_trigger+0x8c/0x9c
>   soc_pcm_trigger+0x5c/0x10c
>
> The max98357a_daiops_trigger() could run in either atomic or non-atomic
> context.  As a result, dmesg shows some similar messages: "BUG: sleeping
> function called from invalid context at kernel/locking/mutex.c:254".
>
> Uses spin lock in mtk_rmw instead.

It's nice, but now the question is, can you have this function be
called in a non-IRQ context concurrently with IRQ accessing registers?


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
