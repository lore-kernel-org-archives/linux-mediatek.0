Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC77C433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:47:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D6BF20888
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:47:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PFKg5qrL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uCb0Ybss"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D6BF20888
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4ustqG0TrCvugUISCh+t5SU2Qrn+AEWazhj1uU4HEtk=; b=PFKg5qrLvaB71RJISIQcWnEaM
	vRzu71BIjBZumDHsQDdwv5dCzK5ocXVV4AA7CSwAeL8xJ6qLGlRP15wA9VZ6rSf2E7MZ8bwgnWUjV
	hhA1jV9c1SfDxmkriF+HlQo/0t0HZUO6HNbbQ6zziJsTtD5FkexFJkk2WgFnRBuRYAejBdXUCRsIV
	M9310U46hb4RVrnaZNGDOlpOC2hpaDUjOBrvG+y/Bth+88WqDosIr9R1/HBUS9HkZHkJKDW9gVtmO
	WelswEjZBhMuaFUFM0aRShn8oNcoVwG10Rl41jCQvnowidANnaFbLEWGQYUe/2OFlBvmFHD6RiqtS
	Jo9vTbdpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyVwo-0001yA-T1; Thu, 23 Jul 2020 07:47:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyVwN-0001jz-Jo; Thu, 23 Jul 2020 07:47:00 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DADC20714;
 Thu, 23 Jul 2020 07:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595490414;
 bh=4iYyh6rnCkjmg0Jl97F2/t3wJU7hgdpNH+O82sawC4I=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=uCb0YbsssDeYyPjazgj2Eg5nT2ZqjWedeNLj8BVJzhnONFKHJIim4J0VjN5s/zQzg
 KhbHsswo2EiP5cvMTGtlIaplNCKfuX+AG31X+yBQwYpg9qZJR/qZs5G/gMJfFRMszv
 i6J8IP7okIcQWmov17e4x7IkxZP+sr7NnvcuDNAI=
Date: Thu, 23 Jul 2020 09:46:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC PATCH 00/23] memory: Cleanup, improve and compile test
 memory drivers
Message-ID: <20200723074659.GA1325176@kroah.com>
References: <20200723073744.13400-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723073744.13400-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_034655_762316_CBB1A4FE 
X-CRM114-Status: GOOD (  15.97  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux-tegra@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-omap@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, soc@kernel.org, arm@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Markus Mayer <mmayer@broadcom.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Olof Johansson <olof@lixom.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 09:37:21AM +0200, Krzysztof Kozlowski wrote:
> Dear All,
> 
> The drivers/memory directory contains generic code (of_memory.c) and a
> bunch of drivers.  Changes to generic code were coming usually through
> different trees with the driver code.
> 
> Over last days, memory drivers grew in numbers but not necessarily in
> quality.  They lacked compile testing and code cleanup.  Also lacked
> maintainer.
> 
> I would be happy to take care about this part.

No objection from me, thanks for steping up to do this.

> If there are no objections, the patches could go either to Linus or to
> arm-soc (most of drivers are ARM specific).

None from me!

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
