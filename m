Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DA0C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 02:40:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FC9020663
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 02:40:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2UywrYXN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZULoZaFg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FC9020663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2jciWLoGcHM2btr/bpqsaYDAqUDZ9Hit9fFqkma7Cs8=; b=2UywrYXNMxqtLHe6n7AOJzIx6
	A5cT/4JIAtASiI9YnxM/Sc3XMbdLaEpBrcJL9rZEAebYIITyjygAxkid4vSnmMxzobaPEPcyUpA8A
	7Vek1itYPw4Kg2oL6Z1OrNDMnvw9BQjHz6vIsF66OqiPCQpq5TPRhVevjmZECDKWT4ssLAbASAdAu
	olo01h0DmzLHGUCY83btmuxKZ+Bh/uDvnOUopE0aA5J+RKTMH/QezSwvPP7I3T2xZ7ngb7PQcl+xC
	ddh3hMNM0pxZstdsNe5Zb+DYwjCm5HQHSFSs54h44XHE4lyrD6bm36srNrDbZGUJ8l+CCzFnhs4mv
	N+g1BJBpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqSfP-0003II-Nc; Wed, 01 Jul 2020 02:40:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqSfN-0003Hm-1i; Wed, 01 Jul 2020 02:40:06 +0000
X-UUID: 6c48470e5b814377833a41149ca397e7-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XoJLKTm3NDdj3w3RtzzMz1926jI4usuO5mIZGP7i8HI=; 
 b=ZULoZaFgfJ7pORj4FtHM8Ges3jP7sY2vvQTNVJBU7YJ8Zwsvvj88ofhU/nz792Uh2xnpkm3/nk6rI6N8df3xiQCsS9TfOjqg1EN5uzQtysiR8vvKrDqcIOffFSLCeSkAoFdFVXIpUeI5Wd3cW0uRKKmip1FyOlBe43DpNI4G7D8=;
X-UUID: 6c48470e5b814377833a41149ca397e7-20200630
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1579403779; Tue, 30 Jun 2020 18:39:48 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 19:39:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 10:39:40 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 10:39:41 +0800
Message-ID: <1593571181.7383.5.camel@mtkswgap22>
Subject: Re: [PATCH] cpuidle: change enter_s2idle() prototype
From: Neal Liu <neal.liu@mediatek.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Wed, 1 Jul 2020 10:39:41 +0800
In-Reply-To: <9963896.lEaLCsxmBZ@kreacher>
References: <1593421540-7397-1-git-send-email-neal.liu@mediatek.com>
 <1593421540-7397-2-git-send-email-neal.liu@mediatek.com>
 <9963896.lEaLCsxmBZ@kreacher>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_224005_252656_E1741276 
X-CRM114-Status: GOOD (  27.45  )
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
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>, linux-tegra@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-pm@vger.kernel.org, Daniel
 Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Neal Liu <neal.liu@mediatek.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-06-29 at 17:17 +0200, Rafael J. Wysocki wrote:
> On Monday, June 29, 2020 11:05:40 AM CEST Neal Liu wrote:
> > Control Flow Integrity(CFI) is a security mechanism that disallows
> > changes to the original control flow graph of a compiled binary,
> > making it significantly harder to perform such attacks.
> > 
> > init_state_node() assigns same function pointer to idle_state->enter
> > and idle_state->enter_s2idle. This definitely causes CFI failure
> > when calling either enter() or enter_s2idle().
> > 
> > Align enter_s2idle() with enter() function prototype to fix CFI
> > failure.
> 
> That needs to be documented somewhere close to the definition of the
> callbacks in question.
> 
> Otherwise it is completely unclear why this is a good idea.
> 

The problem is, init_state_mode() assign same function callback to
different function pointer declarations.

static int init_state_node(struct cpuidle_state *idle_state,
                           const struct of_device_id *matches,
                           struct device_node *state_node)
{
...
        idle_state->enter = match_id->data;
...
        idle_state->enter_s2idle = match_id->data;
}

Function declarations:

struct cpuidle_state {
...
        int (*enter)    (struct cpuidle_device *dev,
                        struct cpuidle_driver *drv,
                        int index);

        void (*enter_s2idle) (struct cpuidle_device *dev,
                              struct cpuidle_driver *drv,
                              int index);
};

In this case, either enter() or enter_s2idle() would cause CFI check
failed since they use same callee.

We try to align function prototype of enter() since it needs return
value for some use cases. The return value of enter_s2idle() is no need
currently.


> > Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> > ---
> >  drivers/acpi/processor_idle.c   |    6 ++++--
> >  drivers/cpuidle/cpuidle-tegra.c |    8 +++++---
> >  drivers/idle/intel_idle.c       |    6 ++++--
> >  include/linux/cpuidle.h         |    6 +++---
> >  4 files changed, 16 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
> > index 75534c5..6ffb6c9 100644
> > --- a/drivers/acpi/processor_idle.c
> > +++ b/drivers/acpi/processor_idle.c
> > @@ -655,8 +655,8 @@ static int acpi_idle_enter(struct cpuidle_device *dev,
> >  	return index;
> >  }
> >  
> > -static void acpi_idle_enter_s2idle(struct cpuidle_device *dev,
> > -				   struct cpuidle_driver *drv, int index)
> > +static int acpi_idle_enter_s2idle(struct cpuidle_device *dev,
> > +				  struct cpuidle_driver *drv, int index)
> >  {
> >  	struct acpi_processor_cx *cx = per_cpu(acpi_cstate[index], dev->cpu);
> >  
> > @@ -674,6 +674,8 @@ static void acpi_idle_enter_s2idle(struct cpuidle_device *dev,
> >  		}
> >  	}
> >  	acpi_idle_do_entry(cx);
> > +
> > +	return 0;
> >  }
> >  
> >  static int acpi_processor_setup_cpuidle_cx(struct acpi_processor *pr,
> > diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
> > index 1500458..a12fb14 100644
> > --- a/drivers/cpuidle/cpuidle-tegra.c
> > +++ b/drivers/cpuidle/cpuidle-tegra.c
> > @@ -253,11 +253,13 @@ static int tegra_cpuidle_enter(struct cpuidle_device *dev,
> >  	return err ? -1 : index;
> >  }
> >  
> > -static void tegra114_enter_s2idle(struct cpuidle_device *dev,
> > -				  struct cpuidle_driver *drv,
> > -				  int index)
> > +static int tegra114_enter_s2idle(struct cpuidle_device *dev,
> > +				 struct cpuidle_driver *drv,
> > +				 int index)
> >  {
> >  	tegra_cpuidle_enter(dev, drv, index);
> > +
> > +	return 0;
> >  }
> >  
> >  /*
> > diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
> > index f449584..b178da3 100644
> > --- a/drivers/idle/intel_idle.c
> > +++ b/drivers/idle/intel_idle.c
> > @@ -175,13 +175,15 @@ static __cpuidle int intel_idle(struct cpuidle_device *dev,
> >   * Invoked as a suspend-to-idle callback routine with frozen user space, frozen
> >   * scheduler tick and suspended scheduler clock on the target CPU.
> >   */
> > -static __cpuidle void intel_idle_s2idle(struct cpuidle_device *dev,
> > -					struct cpuidle_driver *drv, int index)
> > +static __cpuidle int intel_idle_s2idle(struct cpuidle_device *dev,
> > +				       struct cpuidle_driver *drv, int index)
> >  {
> >  	unsigned long eax = flg2MWAIT(drv->states[index].flags);
> >  	unsigned long ecx = 1; /* break on interrupt flag */
> >  
> >  	mwait_idle_with_hints(eax, ecx);
> > +
> > +	return 0;
> >  }
> >  
> >  /*
> > diff --git a/include/linux/cpuidle.h b/include/linux/cpuidle.h
> > index ec2ef63..bee10c0 100644
> > --- a/include/linux/cpuidle.h
> > +++ b/include/linux/cpuidle.h
> > @@ -66,9 +66,9 @@ struct cpuidle_state {
> >  	 * suspended, so it must not re-enable interrupts at any point (even
> >  	 * temporarily) or attempt to change states of clock event devices.
> >  	 */
> > -	void (*enter_s2idle) (struct cpuidle_device *dev,
> > -			      struct cpuidle_driver *drv,
> > -			      int index);
> > +	int (*enter_s2idle)(struct cpuidle_device *dev,
> > +			    struct cpuidle_driver *drv,
> > +			    int index);
> >  };
> >  
> >  /* Idle State Flags */
> > -- 
> > 1.7.9.5
> > 
> 
> 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
