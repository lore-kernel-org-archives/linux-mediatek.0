Return-Path: <SRS0=D+wH=IE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE82C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Mar 2021 17:07:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 911A765005
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Mar 2021 17:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 911A765005
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1J1NzFyo/ktR9tDZxpFWhMAZ69KAyOnzqGTM0E6vETo=; b=GzyOZ3kBCSSAdiXlO4bzfs78V
	2kBZTKJM3Nw78BqxynS29apeGuEqO4cv4S20C5ua1Uva4K31qIGj/YvvV+DM910F7jnljWt8ucRHv
	JVs5TWI2N7i80QzBxRoKw+g0OhosdH216K8cu14DpR6X2wjmZAA4kGo5E7OkmPcW+DGfXXdhzLdrt
	SFeQsxX/RO0DK6ZDc9sN8OuG4v22tBv6A1k/u0WN13p8dCV3fmKfRbvJq14n9kZWTW6U3MZyXQxhA
	+SFYkl+kkd6/xc8qMf1BHhE+iapXW9eO4PbbQZJYS2U2rdIAe1CIPiL98pBJRzgetupmu4MEmLd2e
	sEdEtEjew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIaOa-003oDo-9Q; Sat, 06 Mar 2021 17:07:16 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIaOP-003o93-9E
 for linux-mediatek@lists.infradead.org; Sat, 06 Mar 2021 17:07:08 +0000
Received: by mail-qt1-x834.google.com with SMTP id w6so4389628qti.6
 for <linux-mediatek@lists.infradead.org>; Sat, 06 Mar 2021 09:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YpqFU/WH93rAnDj1yFPOUMsML7kE15FG7OpMRmI6VOk=;
 b=lqUa3JgA7vwzlGmAnIReW+CDdgbpUq1hHgrXc7tsb3EAg5ZpHTuO59ZvYQ06oeoCmL
 NFKLBBs4hVllSFacz+T27+DzAV8eufHWwEwuEw6j4I4xAVQ/JXdXPqVeOY5dMjm3A5KS
 rOUoq/Z0GGiHgqFQjmoGzoE57zRpPiVqZCN3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YpqFU/WH93rAnDj1yFPOUMsML7kE15FG7OpMRmI6VOk=;
 b=h63Z5OTJTQDGytFFTSJjVAG0+53oUqWEjrcXJkilbaJYUqA8klmgrmbeSUXD5WZYk1
 kkpS3W/vcppNq/duJvJn+uc0M3jdIEprMwK7jQjCyVKiZu6i1LeYCneUutXgwZZoQQK8
 tNzz18CAmv93g8kmOo1SGvFbUE+q/8jiO2xw5w8gJRZVFuAVurZtg4H6arcJ0o4IhThW
 yNW4gdnlC6NobHWnJPNbeDVq13TR/wuUEj/8LuAnoh3NleTUBCtu5fGWkqav6tVKEEwg
 Akbp9/43MhQ1o1Wd3remTM79dTlAmvAB8ElPSHKfJqqbbG32Ga7ZRwNcx0I23uFNskLa
 lW8A==
X-Gm-Message-State: AOAM531NgfWUSaH51atW4ffuBmz5vVN7dOqZVaR3zxirXCbqRzrxRZGg
 4MAuI+FmAzxs0k9FfhL+cMJzP0S7EXx094kYMiKDPA==
X-Google-Smtp-Source: ABdhPJwJhKkiF/NoD+K9iea6Lhx4ktdxz5R3+GzHT8+pww/oN3UHClY2jcu37KlVeR9ufDL/9rQhi7Iy0vKl0v4zYDg=
X-Received: by 2002:ac8:480e:: with SMTP id g14mr14104704qtq.249.1615050422018; 
 Sat, 06 Mar 2021 09:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20210305120930.14297-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20210305120930.14297-1-mark-pk.tsai@mediatek.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sun, 7 Mar 2021 02:06:51 +0900
Message-ID: <CAFr9PXmDp7UwWnT+49Yciy-gvYiQOd3cus0W_QnGKm-LqziHCg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/irq-mst: Support polarity configuration
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Marc Zyngier <maz@kernel.org>, Daniel Palmer <daniel@thingy.jp>, 
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_170705_710241_ED01BB21 
X-CRM114-Status: GOOD (  10.88  )
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

Hi Mark-PK,

I'm trying to understand the logic behind the changes.
It seems like the polarity of interrupts is always the same between
the MStar intc and the GIC? Low level interrupts are handled in the
mstar intc and become high level interrupts to the GIC?
I think for the Mstar MSC313(e) and SigmaStar chips all of the
internal interrupts are high level so I never noticed this behaviour.
I can't remember seeing anything that handled this in the MStar kernel
code I looked at.
Is this specific to a certain chip or does it apply for everything
with this intc?
The register values being lost if the chip goes into suspend to memory
makes sense for the MStar chips too I think as everything that is not
in the "pmsleep" register group seems to be lost.

Thanks,

Daniel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
