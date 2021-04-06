Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15855C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 01:02:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD1DD613E9
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 01:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD1DD613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5mK26E8SZUXpm2FB/iZMLE88c0FPVmILul8CUOYErrk=; b=cllABlzmQGv97nrbNtlKwHFFY
	Ijvc1NsAFB6HFecmcuH7awQ3eXwFOkkB9sZRZ9/dTLAg/RkzT+uOrjGu/IZEdK9HMjQK+asRDjoCW
	89hpPzKGSf4+jRluaYJ0F9bWcjiUcvQdtDtSaVXeClsRNbT0LWzhyHxjM6hLk7hhordm6iZV8LA7N
	PEplJMcLRerpWvCgZZsVTPpc9Ms9Lmyj9NGnP+D6M5/sk9Tm39HzfOcNwYYk4JrrHcsfTXlDyovn1
	EidNu3gWO+YEHaa/0M1rts8WMGPsfX5AyaKIbV8ZwpfABjB8Hk8p0msOxdXiMvnveV0J3f2kEGtGN
	zUAKu3OQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTa6G-0017CN-VQ; Tue, 06 Apr 2021 01:01:49 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTa63-0017B6-Cy
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 01:01:37 +0000
Received: by mail-lj1-x22b.google.com with SMTP id u9so14492146ljd.11
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Apr 2021 18:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5zVKmQWoY5kDCFVTKphIi89O5naAa9hmJVDmMhUdz3Q=;
 b=QegWQwg8yFEvjEQfCigibIGZ4Y4SYCt82rKXcB7nZdTouPX1K6tx0HwrMnL7qNUP5A
 iQHl4FMr64tDr0GroFsiVKYVYlrhoihPg0Sj4TxCkAQZsRt0silaTlbK6bWEm+pwPiGW
 Mry4qd38bWVMl92hpz6pwjc6VScW/Ph1BYcms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5zVKmQWoY5kDCFVTKphIi89O5naAa9hmJVDmMhUdz3Q=;
 b=WytBQKc2Ug6AIKHFN4cxweWxCkn2XGp14Sqt9vAruQ22nhQoCEv5KT4RYeRXtHt6bf
 S/J4Zwfy2w1rsQfGaBDCPuUPCDZaUuZ2zdS9g1Id5TCVAUyquzGmtNElEEnvOstYYoX1
 zn8gmru/k8I1x7QIILGljfp3Sq8yaLsJMf6k1+VEQTZjSntEkWlDOQpoXtzebeXirB3B
 bzwKhZERCyn6ZlidjMYSkr9eVXREJCfugT/ijR4opfo6YmkFGCE/VfsHSR8rZkeBJTTr
 OnygmsdSlvUTcOtXgjd2Ihtc5VRvx5ra5gkmroljvJcmw5lvdZ1Wmw4XBf8aA0Pq58oK
 1mqA==
X-Gm-Message-State: AOAM5326zD6U+RG3t/rhlu1vO/u48lR+27TrVNrXl5/Xt47puiUSjD0w
 LmjERBqAhEtN8xNaxgqtsjx/QzgaPHpU9Q==
X-Google-Smtp-Source: ABdhPJz9sUI7iN4hhYMh8dIe+gHNn1s1g+/B1+WeYoK/zde/SElJNsz18OY8ZfzYHjf/H9RGiWQrCw==
X-Received: by 2002:a2e:9989:: with SMTP id w9mr16970912lji.163.1617670893015; 
 Mon, 05 Apr 2021 18:01:33 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50])
 by smtp.gmail.com with ESMTPSA id d11sm2026353ljj.79.2021.04.05.18.01.31
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Apr 2021 18:01:32 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id w28so20006565lfn.2
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Apr 2021 18:01:31 -0700 (PDT)
X-Received: by 2002:ac2:4e88:: with SMTP id o8mr2166614lfr.552.1617670891135; 
 Mon, 05 Apr 2021 18:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210325123446.v2.1.I1d9917047de06715da16e1620759f703fcfdcbcb@changeid>
 <049946ac-5263-21ee-9651-7295f0bcf387@linaro.org>
 <CAP8nV8rv6bKARZ31fVqcjVgMe+5UyVG8UAyNsm1hDCP2BbRSgw@mail.gmail.com>
 <67eed9a2-2b97-be1b-3290-948da662ea65@linaro.org>
In-Reply-To: <67eed9a2-2b97-be1b-3290-948da662ea65@linaro.org>
From: Evan Benn <evanbenn@chromium.org>
Date: Tue, 6 Apr 2021 11:01:04 +1000
X-Gmail-Original-Message-ID: <CAKz_xw1ZSuvqnBHDRVLAV3FZKuen0F9L+gjjP=Hedo6G74ow4w@mail.gmail.com>
Message-ID: <CAKz_xw1ZSuvqnBHDRVLAV3FZKuen0F9L+gjjP=Hedo6G74ow4w@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/clocksource/mediatek: Ack and disable
 interrupts on shutdown
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Evan Benn <evanbenn@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Stanley Chu <stanley.chu@mediatek.com>,
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Julia Lawall <Julia.Lawall@lip6.fr>, Yingjoe Chen <yingjoe.chen@mediatek.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, LKML <linux-kernel@vger.kernel.org>, 
 Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_020135_553286_CE37C40C 
X-CRM114-Status: GOOD (  13.06  )
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

On Sat, Apr 3, 2021 at 1:15 AM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> >
> > That said I am happy to upload that version if people think it is better.
>
> IMO, it is not in the normal flow to disable/enable the interrupts.

Hi Daniel, no problem.

I will upload the suspend/resume version. Please note the similar fix
to the other timer in this file:

https://patchwork.kernel.org/project/linux-mediatek/patch/1614670085-26229-2-git-send-email-Fengquan.Chen@mediatek.com/

Is doing the same ack/disable.

>
> Does this timer belong to an always-on power domain ?
>

I'm not sure sorry, the datasheet does not seem to say. Maybe mediatek
can answer.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
