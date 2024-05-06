Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E4AC10F16
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 09:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QAxLpV8Ulm6XSkEM6iEN9trdiWGUMcTKbu/e6WBDXs=; b=DetCVW6H1h7oPIHuVktuRfRF7P
	xeQAFtMtAdM86dM3XljNdxXAg2upjsv6VIjc4QjQf+Mr/DSw22UdwzkHRM4eOa0To0wirFYTmSqq2
	9KPpESs41Wl64klp+s+E1OuNwFnYHMzowzigxw55ifH/mCxOAyUJ2xZ/VAZMBrs63RvAVISWM1piJ
	zo7nZilyuqhfgx3jss0nuR0D5oqVMzR5lONDMmVibvp5Yy8sjq6HBoUMY8bLUhH9dyUxUbpKsCxTk
	VH//JbaiGA21/gooTnG3NdU9fymFxOYMR0WKm6QQQ4eZNY0ONBe+fwPYiDSkZfsTs9M9a3rItvvTT
	09YQTyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3v2i-00000006sHN-3eZT;
	Mon, 06 May 2024 09:53:56 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3v2f-00000006sDi-0nkt
	for linux-mediatek@lists.infradead.org;
	Mon, 06 May 2024 09:53:55 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-de45385a1b4so1527236276.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 May 2024 02:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714989226; x=1715594026; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+QAxLpV8Ulm6XSkEM6iEN9trdiWGUMcTKbu/e6WBDXs=;
        b=LKSx5kSRf4cSmdGEGGMXyKAkr2VpvtJRyE1xYKOuxlckIvKPmS6M8vBOGEfYrklUEN
         vNGZrh3PrGCNTyL0wd3y8dKG6NlnL3Qfiqto90MJ9ClBMiQSdp5ZW14k49FvNu9bXjKb
         HzoZnkdkWP6dhaxVoDf3JXPzH0UELjVbH3FCaUlgDS8Ep+/PcRaTbHrQZlvbkUvab9cz
         vV061risHY0O3lKA5VSaTvlsHOAtDGEDqU7IWcresiaY+YkUIfw+Ea8GEUmeWq42/QLS
         EC/KLs73FBCHQv1h2/ONwM/dym7MShUJTsf9YWSXu/lERlb4qp8lKkeuY5Xsta3+vfDZ
         8viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714989226; x=1715594026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QAxLpV8Ulm6XSkEM6iEN9trdiWGUMcTKbu/e6WBDXs=;
        b=pmIinii+Ttz3yIX+HXm1bfDDnMHw69YSVWXTZiSVdHh3DVcy52JjhQtmbc/SIVhr26
         T65gP0xz0NgtCfMIM8oPfYupJQ3qoxOo/zSPVw4Ce+XTrzYCBq2RNBydIDmTUfDg7n+A
         3EBDr+97++CL+w8ATok4aOsYNVHwaCUHcSyZjRmN4xeUhgnUQLYFw5snjf06S+IhyoNu
         G26n0E8AW2t3keWld7k0zYcH9IuQnP+pqeMoVxTb/yxeJjMFNjCmkGCPsm4KBMhBoRzS
         XQ/2C7wNQ8Rln8JeiL1Eixhxnt6m3PWzKJ2Kddnkuj8N3vCEvYZQeX8Vr+kEOJ221O8Z
         fyrA==
X-Forwarded-Encrypted: i=1; AJvYcCUlytNgRTefmDOMuvNho2cJbUOwBe5k9kXjfAnTh9VM/Qj8n8rm8b5G8nOqveWHvQqsSgAYlCJggbsSLwGDzlKholRFq3aKpT71pf/0NYLwfF9F
X-Gm-Message-State: AOJu0YzK/5bbBfx09TWN9CSAfARRr9xulgyWVea+UYbHegd/nj6lgROz
	IjPmWXZyh/sKoAeeePvMteWERLrHmgyiiemsVQjkw5aBkKy1A9f1jPbqzN+PlCTMZDjMoq8xHRj
	c9hH6ABPJ7d1VcKB15awTk0JRRYtjDWb44BGRrw==
X-Google-Smtp-Source: AGHT+IGSwWq3kcMhDPYwLGMvb2VmZpLlIPgu2aLzNR6aw7HDS8bxYfuqGRSKESVoTayXVIVa/xKszOolJjH7jDjlksc=
X-Received: by 2002:a25:910:0:b0:de6:dcd:20ae with SMTP id 16-20020a250910000000b00de60dcd20aemr9515456ybj.27.1714989226469;
 Mon, 06 May 2024 02:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAPDyKFoB+r7KMdbV-svz9d=WdPm1Zvd6oZppzbsPDWqX7YN_Kw@mail.gmail.com>
 <20240506033644.10538-1-Joe.Zhou@mediatek.com>
In-Reply-To: <20240506033644.10538-1-Joe.Zhou@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 6 May 2024 11:53:10 +0200
Message-ID: <CAPDyKFrAp5SHL32LkZZA_nXekSa0HVVW2nQzMi9aOPnd90+N5A@mail.gmail.com>
Subject: Re: [PATCH] mmc: race condition between "sdcard hot plug out" and
 "system reboot"
To: "Joe.Zhou" <Joe.Zhou@mediatek.com>
Cc: Peng.Zhou@mediatek.com, Sharp.Xia@mediatek.com, Sophie.Wang@mediatek.com, 
	Wey.Zhang@mediatek.com, linux-mediatek@lists.infradead.org, 
	linux-mmc@vger.kernel.org, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_025353_452038_FFB2C149 
X-CRM114-Status: GOOD (  19.78  )
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

On Mon, 6 May 2024 at 05:36, Joe.Zhou <Joe.Zhou@mediatek.com> wrote:
>
> From: Joe Zhou <Joe.Zhou@mediatek.com>
>
> > Thanks for your patch!
>
> > Doesn't commit 66c915d09b94 ("mmc: core: Disable card detect during
> > shutdown") take care of this problem?
>
> > Kind regards
> > Uffe
>
>
> Dear Ulf,
>      Thank you for your replay!
>
>      I think that commit66c915d09b94 ("mmc: core: Disable card detect during shutdown") doesn't reslove this issue.
>      1. Issues may asise in the following processing.
>      sdcard hot pulg out:                                  SyS_reboot:
>      CPU0                                                  CPU1
>      _mmc_detect_change() {
>      ......
>      mmc_schedule_delayed_work(&host->detect, delay)
>      #Step1: call delay work &host->detect
>          mmc_rescan()
>          {
>           .......
>               #Step2: detect SD card removed
>               mmc_sd_detect() {                              ......
>                                                              _mmc_stop_host (.pre_shutdown)
>                                                             {
>               ......                                        #Step3:_mmc_stop_host() cancel detect use sync
>                                                             cancel_delayed_work_sync(&host->detect)
>                                                             #Step4: wait delay work complete
>                                                             }
>                  if (err) {
>                  #Step5: host->card is NULL
>                  mmc_sd_remove(host);                        ......

Via mmc_sd_detect() we are also calling device_del(card) and
mmc_detach_bus(). In other words, when _mmc_stop_host() has been
completed, the struct device corresponding to the card should have
been unregistered and host->bus_ops should be NULL.

In the later phase, mmc_bus_shutdown() seems to be called, which is
weird in the first place as the struct device should have been removed
from the bus. Then, even if that is the case, the host->bus_ops should
be NULL, thus it should rather lead to NULL pointer dereference splat
when accessing host->bus_ops->shutdown() callback.

What am I missing here?

>                                                             #Step6: wait delay work complete
>                                                             mmc_sd_suspend (.shutdown)
>                                                             {
>                                                              ......
>
>                                                             #Step7:_mmc_sd_suspend claimed host
>                                                             mmc_claim_host(host);
>                                                             #Step8: use host-card(NULL pointer)
>                                                             if (mmc_card_suspended(host->card))
>                                                              ......
>                                                             }
>                  mmc_claim_host(host);
>                  mmc_detach_bus(host);
>                 }
>              }
>           }
>        ......
>       }
>
>      2. And in the version that includes the patch, we have reproduced the issue.

Can you please send a detailed log-splat of what is happening?
Otherwise I may not be able to help.

>
> Best regards,
> Joe

Kind regards
Uffe

