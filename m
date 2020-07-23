Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF80C433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 10:16:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BB8E2065F
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 10:16:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AXxZK3ry"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BB8E2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LBzUWrx6NPsUddAD/l75YDkzq24+Qj+l4FyB93VMhwE=; b=AXxZK3ryIEban/n2X3VrVOvnR
	1r9PwpqU0u1VGxhCRaneuejXQ0Gmsm8bpIp25VZswtAEaTSx1+r23IVCxuBfTiARReV7xbIxxuswA
	JcYDhBI3yUIwyWUATaJO1KBow9cT5DmfpYvxpCRxbm3/HsVHYHbjJxPDeL/Qj8OGMd3WRirVwqGT/
	BXDZa4Nz1vm/AZ4WMPGfLQ6kE/GY13cIRo9Ylp/YIiVG8m/bo5rPRNWcbTL8GlMpjBZR/FHW0hG+V
	8VS4Zlfr8zL27QXEWiJGXnJF+YUZJc6nb7Xh6EFBs5jAiecRnRpGZN0I+Ghrc+g29xXgtQ78enl6p
	HwCSJv11A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyYHL-00060Z-9Y; Thu, 23 Jul 2020 10:16:43 +0000
Received: from mail-ej1-f65.google.com ([209.85.218.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyYHH-0005zY-Eo; Thu, 23 Jul 2020 10:16:40 +0000
Received: by mail-ej1-f65.google.com with SMTP id a1so5753643ejg.12;
 Thu, 23 Jul 2020 03:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dnWqbbfyoTOE1v2/nsDrkVQKi2TdYuhkczsrtV9Tj/A=;
 b=aoPWDnDOQ6hDWs7Bo/nBxg4oPOLatLDllUtbIuiKx2NhpXamQf//V+kSKB42sFgUSO
 fytJpcToDjk7AnOl/lv5sAm75gzW7lwqUsNiiB0FCdnFhv0Ea5DKK2LsNxiIPBFub10H
 ZgQL1hqEWZttV8ThAFOQ8JuKqCe/XHtUV4+kb5MBwGb8SBJ+cvx/zqdOmoTAuzhTqBvM
 tz7Xo0cwBnCXhrGtPe8XBLFmfFKfY8V7j7KC4bgQ4It5HA28fccg96yZQvRTn9qnUP+G
 DlLeRF4F3TukOv8T0zom5GvED+zUZITXEuJVWHTQQk/TWyi5qZ2Rwiz9g5+J9MJof9EU
 OG1A==
X-Gm-Message-State: AOAM532O3KFgg2Z1b69fIQ1XZxQkBdhXRMAztroY3L5XqW1KVKJ1+ItO
 dsJtZID2QXZwxKmyQOI4vU0=
X-Google-Smtp-Source: ABdhPJxFOO+eX3VP5KW+75n2zsTc3LGcB7+QqfGOKNwpQ7g2yIGn/n4uVf5RddsxBNhVVCNRNqRwLw==
X-Received: by 2002:a17:906:2e83:: with SMTP id
 o3mr3639213eji.261.1595499398253; 
 Thu, 23 Jul 2020 03:16:38 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id ah1sm841926ejc.43.2020.07.23.03.16.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jul 2020 03:16:37 -0700 (PDT)
Date: Thu, 23 Jul 2020 12:16:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 19/23] memory: omap-gpmc: Enclose macro statements in
 do-while
Message-ID: <20200723101634.GD30472@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-20-krzk@kernel.org>
 <CAK8P3a3emZd=Tz5JhxevkX3OJMMEn_2Nb+_LQtGZJ9-GWNpd2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3emZd=Tz5JhxevkX3OJMMEn_2Nb+_LQtGZJ9-GWNpd2g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_061639_538768_4C10AB8B 
X-CRM114-Status: GOOD (  23.30  )
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
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Markus Mayer <mmayer@broadcom.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Olof Johansson <olof@lixom.net>, Thierry Reding <thierry.reding@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 11:09:40AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > do-while is a preferred way for complex macros because of safety
> > reasons.  This fixes checkpatch error:
> >
> >     ERROR: Macros starting with if should be enclosed by a do - while
> >         loop to avoid possible if/else logic defects
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> This is an improvement, but the macro still has other issues that
> are just as bad as the one you address:
> 
> - Using the # operator to avoid the "" in the invocation seems confusing

I guess it was useful for debugging.

> - it implicitly uses the 'cs' and 't' variables of the calling function instead
>   of passing them as arguments.

Actually another reason to convert it to just a function.

> - it calls 'return -1' in a function that otherwise uses errno-style
>   return codes, so this gets interpreted as EPERM "Operation not
>   permitted".

The users of this macro also do it (gpmc_cs_set_timings()) so this
wrong practice is consistent with the driver. :)

> 
> I would probably just open-code the entire thing and remove the
> macro like:
> 
> ret = 0;
> ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  0,  3, 0, t->cs_on,
> GPMC_CD_FCLK, "cs_on");
> ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  8,  12, 0,
> t->cs_rd_off, GPMC_CD_FCLK, "cs_rd_off");
> ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  16,  20, 0,
> t->cs_wr_off, GPMC_CD_FCLK, "cs_wr_off);
> ...
> if (ret)
>      return -ENXIO;a

I like this approach because it also removes the 'return' from macro
which is not desired.

> 
> Of maybe leave the macro, but remove the if/return part and use
> the "ret |= GPMC_SET_ONE(...)" trick to avoid some of the problems.

I could probably then keep it as a function.  This would be the safest
and remove most of the problems here.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
