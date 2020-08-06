Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B9DC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 14:08:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B7E2310F
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 14:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mSj4MVcw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="B8RRnKd3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50B7E2310F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5VEXkwgFYtIeZXd0vfkzgK/J3jTnIRh/9I+Y78VR+4k=; b=mSj4MVcwCOl1oAwHqMteow0uf
	B/bXsDGsdHacAYSoTiSeUO7dmKXr9LF/3kZsWfVUTUO30hEkyzorYxrmZhS4jD97wja/X3kBLCIRO
	4b+vDjI1M9JBO0X7g1nb74ZdKdG9E4d4/PCkpvesR/eFZhZu1lWe8BtyWxKaC8jDrjlLOFwfqcG+U
	6xI7Op6OQqMm0mMyqxn55PjLeSLPASXnWFqRFIgCRiDNRJVFp13yOdZZ0FAZq2/OX5Q0g76gksKZc
	xsjet6BjJXNNotJE8l5rs2iJ7AexMju4IuA8J1qd3CzwNJ+NrF5oVba4x1gKsmBg3yh2HRLMFkW+8
	G6RMcFaWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3gZH-0000iU-Ft; Thu, 06 Aug 2020 14:08:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3gZE-0000hq-KO; Thu, 06 Aug 2020 14:08:25 +0000
X-UUID: f3cfdcd43d714207b8e0b7cde6925de1-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3gLQcEfwtJI1Q0Ph3JAitnDfiUoVRJTnHH6hq25dato=; 
 b=B8RRnKd3HPHMdUq3sU1Y/9nIiP7NlY9nDLUnwXh8mJ+Uh4dCfC49erokAyAV8aeJ80pn9xeTomcWvJT1eyrcLK0DSf01b+QgrU1bpnnwKIrKknwJsTjD5DmPlnkOgfDBZ7f6AoJUKzklvwjDxVfiSTgmbYYOz+6SBhPMxqXTuzo=;
X-UUID: f3cfdcd43d714207b8e0b7cde6925de1-20200806
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1628766620; Thu, 06 Aug 2020 06:08:16 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 07:08:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 22:08:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Aug 2020 22:08:11 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <daniel@0x0f.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH 0/2] irqchip: irq-mt58xx: Add mt58xx series interrupt
Date: Thu, 6 Aug 2020 22:07:39 +0800
Message-ID: <20200806140739.31501-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAFr9PX=Gk9h6ASi6saBLhoZ45g-WqCzDQo2XWT033fJykFSY_g@mail.gmail.com>
References: <CAFr9PX=Gk9h6ASi6saBLhoZ45g-WqCzDQo2XWT033fJykFSY_g@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_100824_887795_EDC5228C 
X-CRM114-Status: GOOD (  18.48  )
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
Cc: devicetree@vger.kernel.org, alix.wu@mediatek.com, jason@lakedaemon.net,
 maz@kernel.org, yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Daniel Palmer <daniel@0x0f.com>

> Hi Mark-PK,
> 
> Your driver seems to be for the same interrupt controller IP that is
> present in MStar's TV and camera SoCs and now SigmaStar's SoCs.
> I sent a series[0] for a driver very similar to yours but for the
> MStar SoCs. Do you know if it would be possible to confirm if they are
> the
> same thing? MediaTek bought MStar a few years ago so it seems likely
> but I have no hard information.
> 

Yes, it's for the same interrupt controller IP.

> If they are the same thing could we work on making one series that
> supports both use cases?

Sure, and I think the irq controller driver should support both use cases.
So how about keep the MTK version driver?
I'll send patch v2 after -rc1 as I mentioned in the previous mail,
and keep you posted.
And any suggestion is welcome. :)

> It's also possible that if the interrupt controller is the same some
> other things like the SPI NOR controller etc are also common and
> working
> on a single driver for those would save us both time.
> 

I'm not sure about that.
I'll check the patches you contributed and confirm with our driver owners.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
