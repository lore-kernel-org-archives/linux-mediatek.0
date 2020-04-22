Return-Path: <SRS0=Y6KA=6G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E63C2BA19
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 00:46:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74CEC206E9
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 00:46:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eTJDkpFH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XXLAHVjC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74CEC206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EVChGggQqKjH7owFm887LL3rtCYh9JaflIh1/I24iBE=; b=eTJDkpFH+DHHXh
	gX49C/8G5gRmhzJ7qJK+9Lw832Id/NZCIjPTIh1sHDfJwbIPy9zlW6cny3H+891RVZzjgRuqrTAog
	rcxsa43B8TRpwTSskb6crgHL9hRTSqi1tfYW43qGCmtwjy9f0Tfds5kYe06Dn/uVwTGsrPzMc4oT6
	PkLhQqy22eCJPNcm3MLEW0tC+aKKx0CLww5hSBULQQYmu1SQXQ6JjR8QSFaHoiaIc0OkFUaDuTKSG
	2dpuGn1zoTiS0/YlgfdOr8LpqoCe+9WAGt4conxhLV1I5hctRH/FHjSiyTnVawcn8JJu4CYN+IQxC
	M0HZlFWV3eJ058GSqpBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jR3XA-0008LQ-V2; Wed, 22 Apr 2020 00:46:36 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR3X8-0008Kd-Q2
 for linux-mediatek@lists.infradead.org; Wed, 22 Apr 2020 00:46:36 +0000
Received: by mail-vs1-xe35.google.com with SMTP id 1so470755vsl.9
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Apr 2020 17:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DXWORpjRxTkR+i2fu0N9aGTa6+ZQqTZNmK158+3pxDo=;
 b=XXLAHVjCxmQ0g6P2WSs/mW+8skAgEVSeb5nc/EBOC+NLqjYIAm5C09vy+AXo9NYmfF
 NuHUkcuMDH0a1DRZzGjmt54BElkiJlno6nBpxUT0EPKcmqSA4/bYO2WbY7dzaNrsqOn5
 cyDQd1ZAV0QjIHtu5L4OU2ziPMQrf7AdumzEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DXWORpjRxTkR+i2fu0N9aGTa6+ZQqTZNmK158+3pxDo=;
 b=Op9YzUZ6AbrWdrZz1iqE0MU2YlKAD2jYr6oDHHB005pi4Ym3I+3EWUojJhFaEi99tD
 bNnW1m1kaFSdWOudw+UJ4NlgURfPBbyC4q4bja0OjuT9kt9HwIUWlCI7psJyCtcynHW0
 Oujg3NP7KiHg3371QWWo2q39YAZP6y8rcGZOjgDwbTY+Ify63fhX3WpaKpNnNuQjjuWZ
 ZCnXjFlHAMeT6rqta/psJdFMbfo3BuU3WShplOJ6RzfZSho6svlZ5xWC9pHInxX3NaNN
 kSshFK2b0VYG2LXZR70G456lBFjjH24tv1qkTsBX4QgbQgg+TQwrTk2jvftTPoBMFcrv
 Qb7A==
X-Gm-Message-State: AGi0PuZ1HHKhB/fCnVXpVv5zMcsqoCHb0n52TWjVZednSUkGoMbUVpin
 ynxKB+MGw9NOAnC5MTEGRGg7sO668eg=
X-Google-Smtp-Source: APiQypJ2rXHbG4ylMxREGtAQSit8zrYAEuW/GQ+jzduQ8c2A8Ksfi5kCvaNyN/pdKUZXL/d4qXWgdQ==
X-Received: by 2002:a67:ea93:: with SMTP id f19mr8504167vso.216.1587516391241; 
 Tue, 21 Apr 2020 17:46:31 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id p73sm1202150vke.13.2020.04.21.17.46.31
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 17:46:31 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id c24so284414uap.13
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Apr 2020 17:46:31 -0700 (PDT)
X-Received: by 2002:ab0:592c:: with SMTP id n41mr14287181uad.73.1587516064329; 
 Tue, 21 Apr 2020 17:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200421110520.197930-1-evanbenn@chromium.org>
 <e81737bc-9461-0fdb-245f-d88bdde8f0ee@roeck-us.net>
In-Reply-To: <e81737bc-9461-0fdb-245f-d88bdde8f0ee@roeck-us.net>
From: Evan Benn <evanbenn@chromium.org>
Date: Wed, 22 Apr 2020 10:40:37 +1000
X-Gmail-Original-Message-ID: <CAKz_xw0wAN4rG8xF1Y7amshoECJAjiWNDFQ5GQHPAbCfXi1bDg@mail.gmail.com>
Message-ID: <CAKz_xw0wAN4rG8xF1Y7amshoECJAjiWNDFQ5GQHPAbCfXi1bDg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor
 Calls.
To: Guenter Roeck <linux@roeck-us.net>, Simon Glass <sjg@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_174634_869073_8A875B14 
X-CRM114-Status: UNSURE (   9.34  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Rob Herring <robh@kernel.org>,
 Anson Huang <Anson.Huang@nxp.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Valentin Schneider <valentin.schneider@arm.com>, devicetree@vger.kernel.org,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Olof Johansson <olof@lixom.net>, Julius Werner <jwerner@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Subject says v2. This is confusing, at the very least.
>
> Guenter

Apologies! I am using the patman script, it threw this message that I
did not understand: 'Change log for unknown version v3'.
And I did not spot the issue in the emails before send. Not sure why
patman worked for v2 and v3 but not v4... I will take a look.

Evan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
