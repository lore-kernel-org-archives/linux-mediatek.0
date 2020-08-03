Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1630C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 02:51:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6967B206E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 02:51:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a89++bPJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UHzdkA44"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6967B206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=shg/9qfVLbonpKRTwa5j5cGLEwbcOv/7cFh8yEvmpTU=; b=a89++bPJRV4jJ3lcibKLOgZiX
	HFRTSeo1/xkWrBMveGVkD9TbK3vsxQrhfMDW5Gk6S+L4ZtSf3HWqdZXpzS8hub/dDB6Hnq/5N2otc
	YMzPoO72L7Ezmkb8kDLBytugz2amsCYDVnEYmV5B1iEVfdsF8N5cz9KKchrxd/x0Yrcdzd9UYKCZG
	fg7K+IjodyhZqlG07mQzp+9D/4C4dRjXaaqStNswn4jTenpoxnQjkE6nZp0yczBFh2hDwYPOwZTSH
	N/UIATmBKIRqFnCX9NSedvdQZtioLL+j4VaQW8iu4/VBO1lSE2w+jI4A1YToXF10FH+U3lsOBe88q
	nQIesceKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2QZY-0001Up-Qv; Mon, 03 Aug 2020 02:51:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2QZV-0001UN-AA; Mon, 03 Aug 2020 02:51:30 +0000
X-UUID: 632a8efe74f4403cb38a5ea326113974-20200802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UYxwZ0P+q+fKx3RTeT/v3epewQ6EV5HJGSldwskUAqU=; 
 b=UHzdkA44Co+OQSB6RlQL3xmy952zFquuL18GOL962l+6fdEK4ouC3KqcArKsmn+/92NpH1EI3wGvAMeW1iJ9hvgxQr4X/PZeaRuR8Z82uftb2wPYhNoRNCsNPHPRgDVZLRG3n1/d/0r9b7vqfNuoSF4f4qXM2mQRkOi9IUTbisY=;
X-UUID: 632a8efe74f4403cb38a5ea326113974-20200802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1439667345; Sun, 02 Aug 2020 18:51:19 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Aug 2020 19:41:15 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 10:41:01 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 10:40:56 +0800
Message-ID: <1596422456.22971.1.camel@mtkswgap22>
Subject: Re: [PATCH] acpi: fix 'return' with no value build warning
From: Neal Liu <neal.liu@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 3 Aug 2020 10:40:56 +0800
In-Reply-To: <CAJZ5v0gk9a-PVr4+zerNWdBORyC563K8XgUdgxENAQ+Y5-85tg@mail.gmail.com>
References: <1596166744-2954-1-git-send-email-neal.liu@mediatek.com>
 <1596166744-2954-2-git-send-email-neal.liu@mediatek.com>
 <CAJZ5v0gk9a-PVr4+zerNWdBORyC563K8XgUdgxENAQ+Y5-85tg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_225129_564699_B3DA1DDE 
X-CRM114-Status: GOOD (  21.23  )
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

On Fri, 2020-07-31 at 13:33 +0200, Rafael J. Wysocki wrote:
> On Fri, Jul 31, 2020 at 5:39 AM Neal Liu <neal.liu@mediatek.com> wrote:
> >
> > Fixing CFI issue which introduced by commit efe9711214e6 is
> > incomplete.
> > Add return value to fix return-type build warning.
> >
> > Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> 
> Applied with edited subject and changelog, but ->
> 
> > ---
> >  drivers/acpi/processor_idle.c |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
> > index 6ffb6c9..6870020 100644
> > --- a/drivers/acpi/processor_idle.c
> > +++ b/drivers/acpi/processor_idle.c
> > @@ -664,11 +664,11 @@ static int acpi_idle_enter_s2idle(struct cpuidle_device *dev,
> >                 struct acpi_processor *pr = __this_cpu_read(processors);
> >
> >                 if (unlikely(!pr))
> > -                       return;
> > +                       return -EFAULT;
> 
> -> there is no point returning an error code here, so I've made it
> just return 0.

return 0 is not matched with the meaning of contexts, but it's fine for
this patch.
Thanks !

> 
> >
> >                 if (pr->flags.bm_check) {
> >                         acpi_idle_enter_bm(pr, cx, false);
> > -                       return;
> > +                       return 0;
> >                 } else {
> >                         ACPI_FLUSH_CPU_CACHE();
> >                 }
> > --

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
