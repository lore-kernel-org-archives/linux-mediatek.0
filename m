Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E25C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cx2dSAJ3rw454UALYSUuj1A7NZpurvPrQvtS7kFqSJw=; b=aD9y34rDqofjWf
	xwSkBd/qfXOUzV8fVgik1a5Da6k2hSFeY+4upeu/16uZqIHICm429aO1jAyrDKu+UFOvVaMxlxb3e
	CpyY9Fov9MHgql+36i2aSm3DI/m+s/7wk5M/Td9lsP+Fz4CNnyIe5NbUPFqkPW5vCjiQxXvX8Gx6u
	t+R4rmijw4gskkBTr6nNdJ4XagdpSb0T8pnJnEV3z3/6cawwP2cgvEK5GMzC/NaoK9W5dHpgCuLrL
	hmr1ZSVfXsIGPHpppsLoCMwgTCADHKcrFbQHQR0NRgXFlWPZIdsFn0hARVId2LAsQCommNx/dha1M
	Po0vEHVQ2YT6Fr7/1hDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njFQS-00CuUz-Ci; Tue, 26 Apr 2022 07:15:56 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njFQP-00CuTY-36
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 07:15:54 +0000
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2eba37104a2so172932347b3.0
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 00:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W48mPmCEODAeKCo4cYR/TrFD4JfPLTSWRwhqTfeCiJA=;
 b=gb90e2Jc05v2CZzab1gHuWlQZ7mOLM72uzZFGtD2dQ9ITduk47VqRyMZSqLQBpMOdA
 nFLeuRNpSqERdwglV+kmc4yo4Q1h4a/lvVcQQQimgkzRm1zMQHkM/eHTlmBATFoWbcYf
 yi57ZBCATFUH0Z7H/An1LTnNVoGM6AkOemwmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W48mPmCEODAeKCo4cYR/TrFD4JfPLTSWRwhqTfeCiJA=;
 b=2ZIwgLI6vXzMbcqeiUdsut8pyPWCOBPGNFckapE/6czBZ071H7vvis71vgPUPNTAVr
 0p3AQi5AMJEx8A4ndDZ+I6hjSilIBhoaU6DLUiUBFpjZpAmfL/p2K1CNBbfPbvKqFQVW
 zBEmH7cEITHy0PYIQUfD3XKYik4L09Z4u+1Yf5DrXGlb2tJgvMdi6XKarKXzNs1JwsDe
 P86Qgautnw6AD6u1GaCpM6iC4Huj37zZipx5PgcY8wrCk7owI4LjNigIPHzac9oh7Cij
 9RA6ddeAQD65MWEL8D0O5rw4EOYFy14ZwBITWQ80AzIHISlRfFErjGA2l39cIloycAMA
 9UyA==
X-Gm-Message-State: AOAM530/cnlkO5y6ci+fqkcdnPJG3Pi8RGQmaH4KQ8f5No+0D4S4tSIi
 Kv5zSgYnSQqOv3PtPPu/cVXwGDXyYtLZo5Y5fIOntw==
X-Google-Smtp-Source: ABdhPJz7mWph1YxLYcWICwibet7gNS3uzR3x+TVoftrHCaq7u1jn0mZA1c/96IclyLrgvQXvXMO9rZu6QlzK9rbUOSE=
X-Received: by 2002:a81:ad1f:0:b0:2f4:da5b:5133 with SMTP id
 l31-20020a81ad1f000000b002f4da5b5133mr20961896ywh.105.1650957350928; Tue, 26
 Apr 2022 00:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220420102044.10832-1-roger.lu@mediatek.com>
 <7hczhbe3wn.fsf@baylibre.com>
 <3d463c8b099fdb1c9a0df9e615a8ca1d8a034120.camel@mediatek.com>
 <7hsfq6ql4v.fsf@baylibre.com>
 <d67d5f4f2ec96ade2398e7c0897dbb16bf5fb145.camel@mediatek.com>
 <ca127f7f-0620-1c03-4f39-206945b0e612@gmail.com>
In-Reply-To: <ca127f7f-0620-1c03-4f39-206945b0e612@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 26 Apr 2022 15:15:39 +0800
Message-ID: <CAGXv+5HtMVCUdV=kNfOTCp3-1gEzTWtZ1xapgw=L-C2nTC0yag@mail.gmail.com>
Subject: Re: [PATCH v24 0/7] soc: mediatek: SVS: introduce MTK SVS
To: Matthias Brugger <matthias.bgg@gmail.com>, Roger Lu <roger.lu@mediatek.com>,
 Kevin Hilman <khilman@kernel.org>,
 =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <rex-bc.chen@mediatek.com>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Fan Chen <fan.chen@mediatek.com>, 
 HenryC Chen <HenryC.Chen@mediatek.com>,
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>, 
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Guenter Roeck <linux@roeck-us.net>, Jia-wei Chang <jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_001553_201425_7955E8C4 
X-CRM114-Status: GOOD (  36.95  )
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

On Fri, Apr 22, 2022 at 11:38 PM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
>
>
> On 22/04/2022 04:24, Roger Lu wrote:
> > Hi Kevin,
> >
> > On Thu, 2022-04-21 at 12:41 -0700, Kevin Hilman wrote:
> >> Hi Roger,
> >>
> >> Roger Lu <roger.lu@mediatek.com> writes:
> >>
> >>> On Wed, 2022-04-20 at 16:22 -0700, Kevin Hilman wrote:
> >>
> >> [...]
> >>
> >>>> That being said, it would be really nice to see an integration tree
> >>>> where this was all tested on mainline (e.g. v5.17, or v5.18-rc)
> >>>>
> >>>> For example, I can apply this to v5.18-rc2 and boot on my mt8183-pumpkin
> >>>> board, it fails to probe[1] because there is no CCI node in the upstream
> >>>> mt8183.dtsi.
> >>>>
> >>>> I'm assuming this series is also not very useful without the CPUfreq
> >>>> series from Rex, so being able to test this, CCI and CPUfreq together on
> >>>> MT8183 on a mainline kernel would be very helpful.
> >>>>
> >>>> Kevin
> >>>>
> >>>> [1]
> >>>> [    0.573332] mtk-svs 1100b000.svs: cannot find cci node
> >>>> [    0.574061] mtk-svs 1100b000.svs: error -ENODEV: svs platform probe
> >>>> fail
> >>>
> >>> Just share. I've tested this series on below two platforms and it works as
> >>> expected.
> >>> - mt8183-Krane (kernel-v5.10)
> >>> - mt8192-Hayato (kernel-v5.4)
> >>
> >> Unfortunately testing on v5.4 and v5.10 with lots of other additional
> >> out-of-tree patches does not give much confidence that this series works
> >> with upstream, especially when I've given a few reasons why it will not
> >> work uptream.
> >>
> >> The examples I gave above for CCI and CPUs/cluster disable are good
> >> examples, but another one I forgot to mention is the dependency on Mali.
> >> The SVS driver will never probe because it also depens on a "mali" node,
> >> which doesn't exist upstream either (but panfrost does, and acutually
> >> loads/probes fine on v5.17/v5.18) so this should be fixed to work with
> >> upstream panfrost.
> >>
> >> IMO, in order for this to be merged upstream, it should at least have
> >> some basic validation with upstream, and so far I have not even been
> >> able to make it successfuly probe.  To do that, you will need to either
> >> provide a list of the dependencies for testing this with mainline
> >> (e.g. CCI series, CPUfreq series, any DT changes), or even better, an
> >> integration tree based on recent mainline (e.g. v5.17 stable, or
> >> v5.18-rc) which shows all the patches (in addition to this series) used
> >> to validate this on mainline.
> >
> > No problem. We'll find a machine that can be run correctly with recent mainline
> > (e.g. v5.17 stable, or v5.18-rc) and add patches (CCI series + CPUfreq series +
> > any DT changes) to test this SVS series. Thanks very much.
> >
>
> Thanks Roger. I'll wait until this got tested with upstream Linux, before I will
> apply all the patches.

Hi everyone,

I've put together an integration test branch:

https://github.com/wens/linux/commits/mt8183-cpufreq-cci-svs-test

This branch is based on next-20220422 and includes the following series:

- ANX7625 DPI support v2
  https://lore.kernel.org/all/20220422084720.959271-1-xji@analogixsemi.com/
- MTK SVS v24
  https://lore.kernel.org/all/20220420102044.10832-1-roger.lu@mediatek.com/
- MTK cpufreq v4
  https://lore.kernel.org/all/20220422075239.16437-1-rex-bc.chen@mediatek.com/
- PM / devfreq core patches from
  http://git.kernel.org/chanwoo/h/devfreq-testing
  PM / devfreq: Export devfreq_get_freq_range symbol within devfreq
  PM / devfreq: Add cpu based scaling support to passive governor
  PM / devfreq: passive: Reduce duplicate code when passive_devfreq case
  PM / devfreq: passive: Update frequency when start governor
- CCI devfreq v2
  https://lore.kernel.org/all/20220408052150.22536-1-johnson.wang@mediatek.com/

And some patches of my own to fix some errors. See the last handful of
patches including and after the fixup! one.

This was tested on Juniper (Acer Chromebook Spin 311) that has MT8183.
Looking at the mcu_*_sel clocks from /sys/kernel/debug/clk/clk_summary ,
it does seem like things are happening, though I'm not sure how to
thoroughly test this, especially SVS.

Hope this unblocks things for everyone involved.


Regards
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
