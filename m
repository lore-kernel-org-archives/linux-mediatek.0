Return-Path: <SRS0=DMob=CA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A30CC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2020 04:48:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 368432078D
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2020 04:48:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XiqKCfLz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="E04jO1Xa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 368432078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PqNdB7D1YOB6ZY1z0UMSgNMITAzcGkWVuOsnUmhHEvM=; b=XiqKCfLzGRwGAK3v5pjKNhKeG
	58aqmt/hMTlkLwVdh2jFRmv1/y5ha8JkPiF8S4xgTaPY9nTKcHL3jNM2VYg4kPs5z3ayH45De+1KQ
	0LV1jJStWyxFeTde4yHi9giFRgJRiKd736NfBxLJBamIa6xshTGQLrPRM7YwneQkcBEWkCC6toa5m
	Ewz6FR54ydQdC7bXjQf1cL+DGaqGy7y+NDHWM57DJG76kP36Sy9Bz+sTjVQgEXbvUWbgu38iIY/uU
	53RbVArTF8zNYu0apS6ZhP6TkBWAmK/JJI/0FVwfuHfFBCprWiKSpATTMSjd25WFPC+p5cDPq2jN7
	988jww3fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9LSA-0005K9-IJ; Sat, 22 Aug 2020 04:48:30 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9LS7-0005JM-Hj
 for linux-mediatek@lists.infradead.org; Sat, 22 Aug 2020 04:48:29 +0000
Received: by mail-wm1-x344.google.com with SMTP id k8so3615441wma.2
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2020 21:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8EpfXuOfl5Lc4X03a/2NthXamDtm3ZTxJlpaERf1P2M=;
 b=E04jO1XaLwTEoC5F7ckK/3aQt1ozC0Fcmt/b8GJiWlnGHUdQBoV46zHaqX8lhyuA6t
 61+o8lWe+YunryUin42fuZz646fxNWnJy0TAxA/h6js4kvJ1SF9qesCf7SuIuuoB8HGl
 AVSzLN/Orw0rBpLQpmsY/cxB9ued9UHWTnUR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8EpfXuOfl5Lc4X03a/2NthXamDtm3ZTxJlpaERf1P2M=;
 b=m/3g3o6N0hZtgL5wcZ6EGdXOJXD6QRMGkbKOoy/70yhv9dkALwh0/kJ5yt4hbZYXMX
 pcfo5TSeGhCf2ERTF8ohVmk4GmkeMxgnAUwqJYnRVsFzusTZSrL7DzivgtUHiRgdN4dB
 unDAiqP5kkFVfeiR5lINfqyD/HrZOqQLIIYF0fkXcyAY6qC7xiwx5urP0g2fb8wUEc+8
 BiGCi6decUYe2XmrRtBJisPuYxGfMDQ2MuCsEeqy+UyKi2doj7qG2I4GLbgLIxzec7Tn
 mU84KuJdz8m2gZ3q8B0WK11wYdZfDMyo7AvOegMIvUHAYeIEJ20bd9xTgz18xRxFlDDw
 GW3Q==
X-Gm-Message-State: AOAM533CWiaP/KThK/atEUxAA1EZMCl5XvdSilcVKfNA6af6LpZqqZhi
 JUNYDNTE1TAE6d2FYyTrQQa/wQlUkMiB8SNuWAJ+bA==
X-Google-Smtp-Source: ABdhPJw7xCkJoXDkG4cyA0Eab/W2Nf7VdU8EymJP8iNVywtv1/Z8GU515lX7IbfzvyLf86zSlVJwlLuih6meBwQ3rx0=
X-Received: by 2002:a7b:c10d:: with SMTP id w13mr6535376wmi.2.1598071704261;
 Fri, 21 Aug 2020 21:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200819034231.20726-1-mark-pk.tsai@mediatek.com>
 <20200819153757.28993-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20200819153757.28993-1-mark-pk.tsai@mediatek.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 22 Aug 2020 13:48:13 +0900
Message-ID: <CAFr9PXni=BmDY6_iuJPnYb3d6XB1VrxE6WP3YtSBxT6NciZMMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] irqchip: irq-mst: Add MStar interrupt controller
 support
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200822_004827_817801_D6658B3C 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: DTML <devicetree@vger.kernel.org>, alix.wu@mediatek.com,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mark-PK,

On Thu, 20 Aug 2020 at 00:38, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>
> Add MStar interrupt controller support using hierarchy irq
> domain.
>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

I've integrated this version into my MStar/SigmaStar tree and tested
on an MStar MSC313E
based board (BreadBee) and I'm happy to say it seems to be working:

$ cat /proc/interrupts
          CPU0
17:       1219     GIC-0  29 Level     arch_timer
18:          0     GIC-0  30 Level     arch_timer
21:          0     GIC-0  42 Level     arm-pmu
24:          0  mst-intc  44 Level     1f002400.rtc
30:          0  mst-intc   2 Level     1f006000.wdt
31:          0  mst-intc   0 Level     1f006040.timer
32:          0  mst-intc   1 Level     1f006080.timer
33:          0  mst-intc  12 Level     1f0060c0.timer
34:          0  mst-intc  40 Level     1f200400.bdma
35:       3977  mst-intc  41 Level     1f200400.bdma
37:        196  mst-intc  34 Level     ttyS0
40:          0  mst-intc  30 Level     soc:usbphy@0
<snip>

So here's my tested by:

Tested-by: Daniel Palmer <daniel@thingy.jp>

I don't think your series contained an update to MAINTAINERS.
If/when you add this could you add my address above as a reviewer so
I'm in the loop if anyone makes changes to this going forward?

Thanks,

Daniel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
