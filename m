Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCED6C433EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:10:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 868FD204EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:10:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QJMDcxyY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 868FD204EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CY1BREIQitt3pD3nX80agt7RJIDSwlCewIku3KMOxcY=; b=QJMDcxyY+jQrYMDBiWBLHNlVI
	O0x/eimNt5ZonculambiiE8n+vIZO7JAvnRvgMgZ+tsLw4QFi7GHfGHhDHyeyAGHBeJjkEc22rrk/
	1yFOCJhdREZ/22+2/UNwbEtm/mURlynokH3Ch+0CcV0I90eCgj9bHyzyfLPwAQta5DdXPwyGrV395
	A+pdsVG6UPyJMj4Tnj06DmK1puUTOwNApsoIvfoUTC0ykxd+DtHipZqhtL0uA+CFn4rHgpXvQwfSy
	rtqG7jIm+knqyLADybTYkOpR1cOT9rK7WIAaVILhGJaKoyjPFttdKJSGMmjyCbdHK96rZeDB63BNF
	kDKnHaMZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyXEu-0003Om-NH; Thu, 23 Jul 2020 09:10:08 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyXEq-0003Lg-2h; Thu, 23 Jul 2020 09:10:06 +0000
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MZSJa-1kM8MC2rZu-00WXlz; Thu, 23 Jul 2020 11:09:58 +0200
Received: by mail-qk1-f178.google.com with SMTP id 11so4707323qkn.2;
 Thu, 23 Jul 2020 02:09:57 -0700 (PDT)
X-Gm-Message-State: AOAM533kvvyntk52tOvLJL0VL1Zza6vAHszV9JMaJS/BLPoCnPiAxP01
 97ez5juMWIxkyd7hu+filHhUgAWoDc3rUxCDJw4=
X-Google-Smtp-Source: ABdhPJxSTa5cKHst3O4qitCaV1YQ0tX+BRjglSXj/Cu27GhpJg8d0OcwDlaZbCo1S43Lb3m3S4DuPLbxybObeRblrbk=
X-Received: by 2002:a05:620a:2444:: with SMTP id
 h4mr4289080qkn.352.1595495396053; 
 Thu, 23 Jul 2020 02:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-20-krzk@kernel.org>
In-Reply-To: <20200723073744.13400-20-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Jul 2020 11:09:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3emZd=Tz5JhxevkX3OJMMEn_2Nb+_LQtGZJ9-GWNpd2g@mail.gmail.com>
Message-ID: <CAK8P3a3emZd=Tz5JhxevkX3OJMMEn_2Nb+_LQtGZJ9-GWNpd2g@mail.gmail.com>
Subject: Re: [PATCH 19/23] memory: omap-gpmc: Enclose macro statements in
 do-while
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:bSuViPi0D9TmauHlmwql+oIQjIkTtUsqA+LlitT8AWDNWZzmIKm
 9TIil7dEU++sPgdQSHZn7GNff9DM2Lf4xyaHqS9gj8bdLb3Fs1YWxzdcgxJHZvj29xOtWOd
 ub5eIVTik6VBD1KQo9wdkKAJpHStpAsfaB7ikmJ1N+ipOxozoEiznptU450vmSfLr/5JC4i
 XrndC3GQpFYgYecJwzQSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dQSeuWo28F4=:Mhti1hNc+pj4EsHb7KNwca
 irqQ7Ledfw/p21tPBNamziIzUXVqyA16CwS+3GqCMQ5bZ6vz7aNJqqZTurFwXxK3QnhUeHq1A
 nlkotN4NkEhY5gTuQ/WLTgJq6Fwn2mRN/THtWi8VPFlkmjDZFG7EUwB/XhVBXgRKhYty9i14i
 DoDIZp0y+XZHAebECG3jkCi3NPYk3xWiRwj5enje5hTgSgpUsteUbe1NyIQkBXhxEsSUcqPNs
 wGDfcxAkYhGfa/siD2ZgnRXz7YxIG2Q/iwj95WQAWy8RCA9Z1yt26DyyOuK/3GGHzIfJMQcuA
 ZUsUeUScG6xHOe2u7d8yF1wY/vdBbT56pInILcbZ4q0DhnQVcn9uRBASzpA1WXbpJr932S6/V
 zS8n8qLTdkcDRVvGSPgIQWEy+VG6lkDK5DB3cCAr7Mzs7Tm1cMK/ayIvnUsYiH98OkJbgsHaG
 XI/+6UBNLCZnQEDOfJ3Ixvp30blFmkp7xljpzSbpuqzKKnwL3G74m5yJrJLEnpBVeThUJbTS7
 1nFd/vlT4Sc9KgzUhLFoObm0BYpLDjrnccQvxDUQ8TIKmzd6H5qa9yATqjnrq1dO0ejNRp107
 6TYeqwhCg5/LIK2DtX4iIvvpi2pgUMZM0cZyBSjGnNg19NYLVJ54uVVCpeO4u+9aX0HdzDq6m
 pgISBtFrBdm0+v54809HGMY64X0bWYz270eqBDxeIGcs/9ByrqxTaGEd5vWbvHzILP/EyQBRV
 6adYg08zAswjb0Xi4f7dyNfRjqxbd1yRRoRJNlnFDF9Mhcl6brKUCguTG0+ZTuXuH5aqJ7Qpx
 PjzuKi+s6B7SjnvRXd2ySMOKoL9bDOscteH46Zgu4q8Zjn1+t+6qNQiehSgxDBYFJ+//RPfQD
 TmEEvBeVDWoEe67J/C5H3dRU8KuweBIYCDArZlYkST+Afc1ozwcbsZNBRsb3VOqcEmGqpHYSw
 BqHDHidKpssOhrepTa24pvaujOt8n4BWILsBD40EeBDARIueqXKm0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_051004_488425_B0885F2D 
X-CRM114-Status: GOOD (  15.54  )
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

On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> do-while is a preferred way for complex macros because of safety
> reasons.  This fixes checkpatch error:
>
>     ERROR: Macros starting with if should be enclosed by a do - while
>         loop to avoid possible if/else logic defects
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

This is an improvement, but the macro still has other issues that
are just as bad as the one you address:

- Using the # operator to avoid the "" in the invocation seems confusing
- it implicitly uses the 'cs' and 't' variables of the calling function instead
  of passing them as arguments.
- it calls 'return -1' in a function that otherwise uses errno-style
  return codes, so this gets interpreted as EPERM "Operation not
  permitted".

I would probably just open-code the entire thing and remove the
macro like:

ret = 0;
ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  0,  3, 0, t->cs_on,
GPMC_CD_FCLK, "cs_on");
ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  8,  12, 0,
t->cs_rd_off, GPMC_CD_FCLK, "cs_rd_off");
ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  16,  20, 0,
t->cs_wr_off, GPMC_CD_FCLK, "cs_wr_off);
...
if (ret)
     return -ENXIO;

Of maybe leave the macro, but remove the if/return part and use
the "ret |= GPMC_SET_ONE(...)" trick to avoid some of the problems.

      Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
