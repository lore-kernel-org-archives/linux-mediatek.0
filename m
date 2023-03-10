Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163C8C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 08:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7g81XRiKNyIBTp5oUvq6xFiCldKiPwESDbwSoupQ7g=; b=J0Zj0tjDB/VF2ZXJ57+oSbpVGf
	PAQwOprEdTyCD5jphF5I+Ru4YT+8NuBv9x+uaNmzqXvBzvEQbRdWaGuCz4966hf6vM/Bzw4nsifdr
	OPjGub1J65REgQ8gemEU4jHPriJXd0P4KpThtuxJ6FT6Q+b6ypR+ySVGcgF+0/PApv2+NztXD//hW
	V33a40K/s+yhdhNJW87os9Q/W3/p2OYKlCBJbH7f3LGiNFWdmreCZJtFCAnde8hUJ1EvKyMSKnbZz
	0sF8G5bNwdzf9+SH2GEKMv5ORnzSGB6LbvkInS1FsFbTqmp4tLUN3jk1cw99QYUQhvfDwg4RgOeeK
	dt8LNgKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYPr-00DlT3-Cy; Fri, 10 Mar 2023 08:47:55 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYPY-00DlN9-Lb; Fri, 10 Mar 2023 08:47:38 +0000
Received: by mail-qt1-f178.google.com with SMTP id d7so4891304qtr.12;
        Fri, 10 Mar 2023 00:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678438055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7g81XRiKNyIBTp5oUvq6xFiCldKiPwESDbwSoupQ7g=;
        b=rNqRhYtVi2/Y7B4obboFDW6HGrQq1YeMsSTjQnfZcSqA+Z+wz80Tdmqn6tW1Xo6TVv
         3pM59EPE54937zd1bdB+boDKVspNhtKoOvtCMNYeeuJd3abX15j9w4Aok6tUoYI7GvBt
         SGPGlDOVy7QwD7pR6sLsf/0tZzEKw1w4O3vrGgTTJiymlAcHSEEGM1xHgAKsRUG20/jU
         jK69rak79kON/m+mOSbjnOMLxcRzO4cEbcF2mnFA4haxLDJkByWM9lt6jstiE8USDG+/
         3HGLW1tvQoTPQ3Sk9EZfcY1YkwEbBoxcGd6uQrpOEwbfULEd/KoOBCPS+jq2riI0gy5z
         SfhQ==
X-Gm-Message-State: AO0yUKXx+XAc860es+O9Coxnk7tzqgHIL7dg4tn2JIOYSDp/TeGLUYVS
	I3kxTiFINKjTMclKVOBZEG6Kia375WY0VA==
X-Google-Smtp-Source: AK7set8c0mAAQT71vtrang/DmLQxGsrVAY0BeLnvXGe+cTHG5C3G07/KG7EDIijOEnxnrlB6wGn7bQ==
X-Received: by 2002:ac8:5dce:0:b0:3bf:e2ff:4c35 with SMTP id e14-20020ac85dce000000b003bfe2ff4c35mr13585932qtx.1.1678438054896;
        Fri, 10 Mar 2023 00:47:34 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id f4-20020a37d204000000b0073b967b9b35sm929015qkj.106.2023.03.10.00.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:47:33 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-53d277c1834so84609807b3.10;
        Fri, 10 Mar 2023 00:47:32 -0800 (PST)
X-Received: by 2002:a81:af4b:0:b0:533:91d2:9d94 with SMTP id
 x11-20020a81af4b000000b0053391d29d94mr16108471ywj.5.1678438052584; Fri, 10
 Mar 2023 00:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20230303092347.4825-1-cheng-jui.wang@mediatek.com> <20230303092347.4825-5-cheng-jui.wang@mediatek.com>
In-Reply-To: <20230303092347.4825-5-cheng-jui.wang@mediatek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Mar 2023 09:47:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8qujVdXNfk00s66NF04=A3Z4Gsj7W+OyeeJA=pFmEbQ@mail.gmail.com>
Message-ID: <CAMuHMdU8qujVdXNfk00s66NF04=A3Z4Gsj7W+OyeeJA=pFmEbQ@mail.gmail.com>
Subject: Re: [PATCH 04/10] cpuidle, psci: Push RCU-idle into driver
To: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
Cc: stable@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_004736_724823_CE19FE9C 
X-CRM114-Status: GOOD (  16.97  )
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

Hi Cheng,

On Fri, Mar 3, 2023 at 10:35=E2=80=AFAM Cheng-Jui Wang
<cheng-jui.wang@mediatek.com> wrote:
> From: Peter Zijlstra <peterz@infradead.org>
>
> commit e038f7b8028a1d1bc8ac82351c71ea538f19a879 upstream.
>
> Doing RCU-idle outside the driver, only to then temporarily enable it
> again, at least twice, before going idle is suboptimal.
>
> Notably once implicitly through the cpu_pm_*() calls and once
> explicitly doing ct_irq_*_irqon().
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Tested-by: Kajetan Puchalski <kajetan.puchalski@arm.com>
> Tested-by: Tony Lindgren <tony@atomide.com>
> Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Link: https://lore.kernel.org/r/20230112195539.760296658@infradead.org
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>

Given this patch introduced a so far unresolved regression upstream,
I think it's premature to backport this to stable.

https://lore.kernel.org/all/ff338b9f-4ab0-741b-26ea-7b7351da156@linux-m68k.=
org

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

