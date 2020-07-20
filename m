Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4756C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 08:22:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B435620709
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 08:22:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GXspWJx+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EmRoRdzv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B435620709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rwJ7bIjvyUdhmrCRCiw2mg9sP6/r1G0yhxAkPhU0avI=; b=GXspWJx+KSrLWpmywPQdWL6Ze
	/JjqiAf9IB7FxebZMOnjGnP8UWzJku5Hqi4lqSuDys0ZXXOi3nfDSDHbBqruIK821pZAshjGIa+G7
	SfB2pDdcoWlU9J6Lb8iHh5j6pFvEx4vmKPJ+A1Km99lvGdCwCgQJO+buuiV0z79MqorJRtH/dFwZm
	827T1ayjxcgIJ02te8Zng9GQhbZX4j0y366yS9d0ez7Z8uhqtknQYcqyvUaTBnxYmGMGx4AFJgDUI
	thqytB2PAO8N9pCTsyOz5I3ovYy75s2LXLZE/qEQcwW1kXShArIEnGaYzHku6cOKvAFVVZ4nerqVL
	psrLaNXiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxR3Y-00043p-Ho; Mon, 20 Jul 2020 08:21:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxR3V-00042d-Hv; Mon, 20 Jul 2020 08:21:50 +0000
X-UUID: e08dad963e614a7f8897b80585bf8fac-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=g1ZpCrFRRkITcy2/cYkX9ggNIKxoHUd6Hg4M3iYk/hs=; 
 b=EmRoRdzvyiJ7YfDfg0xck/kqjw5Cho7iDcNwuZQGo1m0eYKbDVACFpkkAIn20GBwcsoQmV72HdwDiRPFrjSVhK8j4rpejq2ICS8Tx9Dkn9eICK6DOLscXwLM58h0cQIIWgJoVp3bEPbiEKe/WI3aKRrnszzU0WNxQeKlmsE31Zo=;
X-UUID: e08dad963e614a7f8897b80585bf8fac-20200720
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1578997898; Mon, 20 Jul 2020 00:22:13 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 01:21:38 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 16:21:32 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Jul 2020 16:21:33 +0800
Message-ID: <1595233294.8055.0.camel@mtkswgap22>
Subject: Re: [PATCH v2] cpuidle: change enter_s2idle() prototype
From: Neal Liu <neal.liu@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 20 Jul 2020 16:21:34 +0800
In-Reply-To: <1594350535.4670.13.camel@mtkswgap22>
References: <1594005196-16327-1-git-send-email-neal.liu@mediatek.com>
 <1594005196-16327-2-git-send-email-neal.liu@mediatek.com>
 <CAJZ5v0ihB5AJwSRpjaOnXAmciregzxARL5xfudu1h+=_LXaE_w@mail.gmail.com>
 <1594350535.4670.13.camel@mtkswgap22>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_042149_751544_690955D0 
X-CRM114-Status: GOOD (  34.55  )
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
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, Linux PM <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, lkml <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Neal Liu <neal.liu@mediatek.com>,
 Sami Tolvanen <samitolvanen@google.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek
 SoC..." <linux-mediatek@lists.infradead.org>, Linux
 ARM <linux-arm-kernel@lists.infradead.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Gentle ping on this patch.


On Fri, 2020-07-10 at 11:08 +0800, Neal Liu wrote:
> On Thu, 2020-07-09 at 14:18 +0200, Rafael J. Wysocki wrote:
> > On Mon, Jul 6, 2020 at 5:13 AM Neal Liu <neal.liu@mediatek.com> wrote:
> > >
> > > Control Flow Integrity(CFI) is a security mechanism that disallows
> > > changes to the original control flow graph of a compiled binary,
> > > making it significantly harder to perform such attacks.
> > >
> > > init_state_node() assign same function callback to different
> > > function pointer declarations.
> > >
> > > static int init_state_node(struct cpuidle_state *idle_state,
> > >                            const struct of_device_id *matches,
> > >                            struct device_node *state_node) { ...
> > >         idle_state->enter = match_id->data; ...
> > >         idle_state->enter_s2idle = match_id->data; }
> > >
> > > Function declarations:
> > >
> > > struct cpuidle_state { ...
> > >         int (*enter) (struct cpuidle_device *dev,
> > >                       struct cpuidle_driver *drv,
> > >                       int index);
> > >
> > >         void (*enter_s2idle) (struct cpuidle_device *dev,
> > >                               struct cpuidle_driver *drv,
> > >                               int index); };
> > >
> > > In this case, either enter() or enter_s2idle() would cause CFI check
> > > failed since they use same callee.
> > 
> > Can you please explain this in a bit more detail?
> > 
> > As it stands, I don't understand the problem statement enough to apply
> > the patch.
> > 
> 
> Okay, Let's me try to explain more details.
> Control Flow Integrity(CFI) is a security mechanism that disallows
> changes to the original control flow graph of a compiled binary, making
> it significantly harder to perform such attacks.
> 
> There are multiple control flow instructions that could be manipulated
> by the attacker and subvert control flow. The target instructions that
> use data to determine the actual destination.
> - indirect jump
> - indirect call
> - return
> 
> In this case, function prototype between caller and callee are mismatch.
> Caller: (type A)funcA
> Callee: (type A)funcB
> Callee: (type C)funcC
> 
> funcA calls funcB -> no problem
> funcA calls funcC -> CFI check failed
> 
> That's why we try to align function prototype.
> Please feel free to feedback if you have any questions.
> 
> > > Align function prototype of enter() since it needs return value for
> > > some use cases. The return value of enter_s2idle() is no
> > > need currently.
> > 
> > So last time I requested you to document why ->enter_s2idle needs to
> > return an int in the code, which has not been done.  Please do that.
> > 
> > > Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> > > ---
> > >  drivers/acpi/processor_idle.c   |    6 ++++--
> > >  drivers/cpuidle/cpuidle-tegra.c |    8 +++++---
> > >  drivers/idle/intel_idle.c       |    6 ++++--
> > >  include/linux/cpuidle.h         |    6 +++---
> > >  4 files changed, 16 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
> > > index 75534c5..6ffb6c9 100644
> > > --- a/drivers/acpi/processor_idle.c
> > > +++ b/drivers/acpi/processor_idle.c
> > > @@ -655,8 +655,8 @@ static int acpi_idle_enter(struct cpuidle_device *dev,
> > >         return index;
> > >  }
> > >
> > > -static void acpi_idle_enter_s2idle(struct cpuidle_device *dev,
> > > -                                  struct cpuidle_driver *drv, int index)
> > > +static int acpi_idle_enter_s2idle(struct cpuidle_device *dev,
> > > +                                 struct cpuidle_driver *drv, int index)
> > >  {
> > >         struct acpi_processor_cx *cx = per_cpu(acpi_cstate[index], dev->cpu);
> > >
> > > @@ -674,6 +674,8 @@ static void acpi_idle_enter_s2idle(struct cpuidle_device *dev,
> > >                 }
> > >         }
> > >         acpi_idle_do_entry(cx);
> > > +
> > > +       return 0;
> > >  }
> > >
> > >  static int acpi_processor_setup_cpuidle_cx(struct acpi_processor *pr,
> > > diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
> > > index 1500458..a12fb14 100644
> > > --- a/drivers/cpuidle/cpuidle-tegra.c
> > > +++ b/drivers/cpuidle/cpuidle-tegra.c
> > > @@ -253,11 +253,13 @@ static int tegra_cpuidle_enter(struct cpuidle_device *dev,
> > >         return err ? -1 : index;
> > >  }
> > >
> > > -static void tegra114_enter_s2idle(struct cpuidle_device *dev,
> > > -                                 struct cpuidle_driver *drv,
> > > -                                 int index)
> > > +static int tegra114_enter_s2idle(struct cpuidle_device *dev,
> > > +                                struct cpuidle_driver *drv,
> > > +                                int index)
> > >  {
> > >         tegra_cpuidle_enter(dev, drv, index);
> > > +
> > > +       return 0;
> > >  }
> > >
> > >  /*
> > > diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
> > > index f449584..b178da3 100644
> > > --- a/drivers/idle/intel_idle.c
> > > +++ b/drivers/idle/intel_idle.c
> > > @@ -175,13 +175,15 @@ static __cpuidle int intel_idle(struct cpuidle_device *dev,
> > >   * Invoked as a suspend-to-idle callback routine with frozen user space, frozen
> > >   * scheduler tick and suspended scheduler clock on the target CPU.
> > >   */
> > > -static __cpuidle void intel_idle_s2idle(struct cpuidle_device *dev,
> > > -                                       struct cpuidle_driver *drv, int index)
> > > +static __cpuidle int intel_idle_s2idle(struct cpuidle_device *dev,
> > > +                                      struct cpuidle_driver *drv, int index)
> > >  {
> > >         unsigned long eax = flg2MWAIT(drv->states[index].flags);
> > >         unsigned long ecx = 1; /* break on interrupt flag */
> > >
> > >         mwait_idle_with_hints(eax, ecx);
> > > +
> > > +       return 0;
> > >  }
> > >
> > >  /*
> > > diff --git a/include/linux/cpuidle.h b/include/linux/cpuidle.h
> > > index ec2ef63..bee10c0 100644
> > > --- a/include/linux/cpuidle.h
> > > +++ b/include/linux/cpuidle.h
> > > @@ -66,9 +66,9 @@ struct cpuidle_state {
> > >          * suspended, so it must not re-enable interrupts at any point (even
> > >          * temporarily) or attempt to change states of clock event devices.
> > >          */
> > > -       void (*enter_s2idle) (struct cpuidle_device *dev,
> > > -                             struct cpuidle_driver *drv,
> > > -                             int index);
> > > +       int (*enter_s2idle)(struct cpuidle_device *dev,
> > > +                           struct cpuidle_driver *drv,
> > > +                           int index);
> > >  };
> > >
> > >  /* Idle State Flags */
> > > --
> > > 1.7.9.5
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
