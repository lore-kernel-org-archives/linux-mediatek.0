Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB52C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 13:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARod+ZkF74LwJN04qxg9qNlEnp5M0k3ecVEAQgSrB3g=; b=aTDyVdeSMNN+QO
	YjRucbPIk/RuAx0ezb3/opzZif7vlRgw4tSPPt7OyDhiRhbsi0GHu80JyG+fO1ZuH0hxo5EkIdXys
	Vs7/w1f/GnzfrqKATJHIt3C8poeeilFrK4uaGoVUh6ix7MCkQbY9lo0BatCcwcsZKRBQT1Jn5GWMz
	3y4UV/84McgCA+FGqqgQ2aTFVzQ7/mNbMYJeYrXvWpy2GEws/XzEymEuFbeZVtPN/Wp4Z9mwo4UOi
	CpazdYMp+2I7Kvk+T4c3bbXjTkGVjRLgdEwGwhl32b4d16Lc5VtzY/dibE0OqFYfl+lL07L5s/YEH
	sJLNbXHiLM+HQz1TY+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEWIU-009PeM-KR; Mon, 31 Jan 2022 13:00:42 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEWIQ-009Pbr-1T
 for linux-mediatek@lists.infradead.org; Mon, 31 Jan 2022 13:00:39 +0000
Received: by mail-il1-x129.google.com with SMTP id i1so11286810ils.5
 for <linux-mediatek@lists.infradead.org>; Mon, 31 Jan 2022 05:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sartura-hr.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dSdj6+/sfksSA1uArlRQHiUhIJOWxGXX+eQ0rGayhu4=;
 b=J1xqT4WdO+z9nBPjGXWQQTsijFA3X8Ksw+wJJXK/vOuUo/cQKQcSRkP5Omdgcy5luX
 +YmdWF7nH2oHD1AnotOBWD3ovK3VpPU/K7wYAp8uClL91ZxAzVa2hL2bQbhUcWw4D3q2
 kb4ruW5s2SjojUtylRCcErcbp0cbk0B9pLObgbOW3Kc83ER/eeONMSyt0LXa/LL0RzaT
 HExbqB9d3n0761mfKYbc5JGfZZmn/sXQNPq7E7YSVI6UIIT70VvQWmV7bEUwLMgwIYWE
 CqfWaOtTiweXrQPG8s0Pc8aV+XmKDXybEJnzIYgKIzgBMgl9vO3kyxcoZkgdOiROC2+B
 i5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dSdj6+/sfksSA1uArlRQHiUhIJOWxGXX+eQ0rGayhu4=;
 b=tjxaHM8p9MzulVtlD4hTQQbk3JleyehETe7KVQYySQOzzi3FX6g/XjTpnSS99BFdvB
 8Sblt/epNVDwNtLcgNM6CuDrFxqH3p71RS/O4ksoUkNsKgm4MktCcqmbsnvSzQ3l/x0Z
 CYGadCYQJjM6NixFxEHkYRLZm2HOlLnzCM8HuKweU4raGhaqaYn/LEIOGZvuCdcInI5E
 HrHlHFcZg9d6+IPiMdo+Ogq72mTaUfG+gkXCvSTiNgjoqVP+mwPHT47xwXrpelTVEwzj
 ij9GWkz/bBMmsZwp2fCD4Kb5ArGgxfqwNOm2RbvBt85PdQg9+ue+c/xNUR0YARZTf2QY
 J5cQ==
X-Gm-Message-State: AOAM532sUMI+BdIosPYe/o8wGbk2kNzSrwTX7HdkfFJIYcHw5lkXwl+Y
 IDLb1lq/UTo2IvnsNpppqDppkysdztFEm+Pzjfj03ZfcYdg=
X-Google-Smtp-Source: ABdhPJzz9PBIZoI54/Sn7+tK+W6MwqqxsuFaxpqQ+8QZ+g2GlJrc0cvmg6zXfBoXxvr8tHXNTYJYIUAxBAWDvjNcVUE=
X-Received: by 2002:a92:8e0d:: with SMTP id c13mr11729336ild.159.1643634036343; 
 Mon, 31 Jan 2022 05:00:36 -0800 (PST)
MIME-Version: 1.0
References: <20220130145116.88406-1-nbd@nbd.name>
 <20220130145116.88406-4-nbd@nbd.name>
 <CAKQ-crhDHXZptWr5rO5Rb9JttQREoPqE4YO-6nzC2OWc-z06_g@mail.gmail.com>
 <04c91b4e-e7c8-ac6a-f60a-0453a49122fa@nbd.name>
In-Reply-To: <04c91b4e-e7c8-ac6a-f60a-0453a49122fa@nbd.name>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 31 Jan 2022 14:00:25 +0100
Message-ID: <CA+HBbNE5nRmFAR44gYMW+Uqi_5e4s+4wBGoQTUbnhC0Pdkc6iw@mail.gmail.com>
Subject: Re: [PATCH v9 03/13] ARM: Add basic support for Airoha EN7523 SoC
To: Felix Fietkau <nbd@nbd.name>
Cc: Luka Perkov <luka.perkov@sartura.hr>, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 John Crispin <john@phrozen.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_050038_128171_1E6B2AA2 
X-CRM114-Status: GOOD (  23.41  )
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

On Mon, Jan 31, 2022 at 1:57 PM Felix Fietkau <nbd@nbd.name> wrote:
>
>
> On 31.01.22 11:51, Luka Perkov wrote:
> > Hello Felix,
> >
> > On Sun, Jan 30, 2022 at 3:56 PM Felix Fietkau <nbd@nbd.name> wrote:
> >>
> >> From: John Crispin <john@phrozen.org>
> >>
> >> EN7523 is an armv8 based silicon used inside broadband access type devices
> >> such as xPON and xDSL. It shares various silicon blocks with MediaTek
> >> silicon such as the MT7622.
> >>
> >> Add basic support for Airoha EN7523, enough for booting to console.
> >>
> >> The UART is basically 8250-compatible, except for the clock selection.
> >> A clock-frequency value is synthesized to get this to run at 115200 bps.
> >>
> >> Signed-off-by: John Crispin <john@phrozen.org>
> >> Signed-off-by: Bert Vermeulen <bert@biot.com>
> >> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> >> ---
> >> index 000000000000..ea23b5abb478
> >> --- /dev/null
> >> +++ b/arch/arm/mach-airoha/airoha.c
> >> @@ -0,0 +1,16 @@
> >> +// SPDX-License-Identifier: GPL-2.0-or-later
> >> +/*
> >> + * Device Tree support for Airoha SoCs
> >> + *
> >> + * Copyright (c) 2022 Felix Fietkau <nbd@nbd.name>
> >> + */
> >> +#include <asm/mach/arch.h>
> >> +
> >> +static const char * const airoha_board_dt_compat[] = {
> >> +       "airoha,en7523",
> >> +       NULL,
> >> +};
> >> +
> >> +DT_MACHINE_START(MEDIATEK_DT, "Airoha Cortex-A53 (Device Tree)")
> >
> > Since this is Cortex-A53 core is there a reason why this is not placed
> > within arm64 directory?
>  From what I can tell, it's a stripped-down core that only runs in
> 32-bit mode.

Hmm, this is new for me that you could do that to an ARMv8 (A53) core.
I know that you can run ARMv7 code but not that you can reduce it to
32 bit only.

Regards,
Robert
>
> - Felix



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
