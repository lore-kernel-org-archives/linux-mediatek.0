Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC90CC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:20:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97255204FD
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:20:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LdzMp3cB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="RCqGu7tx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97255204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sh/OHdUh943zpB6H5dsCk/YOIA7loJy8eWWMpfP3f28=; b=LdzMp3cBOQNjbw4rX0zbDk9MZ
	nRWDgQ7cXxwWNApsY7c6fVNKQff3nP8S6d0eD3z7VvWuoHb8fmwV5EsW1jMO2Vf7uuHQYbd57KM+E
	/50Ibim7dDr2dXVn4drS6nBsRMcman0We4QtziUmEQDnzdBdnik9tTYOVXbv9fYvnIPLl6jhj2Oyi
	EFQ6/K5HFV0DA4hCtfhZqRoH0X4d0mgiYfzfvaGIUcJfjgvuyfoqxDY/2/3DuoNRT+wnYwMS8abRd
	3jUcz+FlA0Uopzk2yPmMq3qH3b+6WGxDKEZgwo4pIWp1H5FoX0TZKlYgh60L99YPa9zXrVwh5L9a8
	Vo76U1k4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3ct1-0005Ti-FF; Thu, 06 Aug 2020 10:12:35 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3csz-0005Sy-Ja
 for linux-mediatek@lists.infradead.org; Thu, 06 Aug 2020 10:12:34 +0000
Received: by mail-wm1-x342.google.com with SMTP id t14so9115951wmi.3
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2020 03:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sVXbFojH/0R1sh5NGJY6hM5Fv6yHchdFYqFYRJiPcsk=;
 b=RCqGu7txZxmTvjk8hFf9VCO6P0oOQtU9w1qLjI9bgEqPurJEc5ppShIfh23PTPqZOF
 Rx4V3jSS2vqgcGVkhDFvZIr71G3bon5/yAvpGu8v4V3+H8kAyNOvxjumBbk9gU8dCboq
 XiuD6bY5nCpwm0ePducl8RnH1HsiCdyzM5SwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sVXbFojH/0R1sh5NGJY6hM5Fv6yHchdFYqFYRJiPcsk=;
 b=sUj9gE54d2IbAQveeKszqz1R9p+PTydbPYvY/0xKZP978DSmgn1o76gqOuJLlL8SdP
 WQ8KUFeUlPX4oBy3k5IsTFtqayZNeDHHV5944fVQPnnPCw4KdPN6PJsYqxSdXI3/8h/N
 kD8bz8JcGHYr3rzo05FD/LsOgYahzm0MkaRq2ijn3oBq971ZLIBN1q7b72MgmdycNLhC
 HBJQi6zfgAuTSU/RXkgmv89dPzgOoVmmZG3TWec+PAZN+xdJNzOWz1DfePCqJtkfQ+Y6
 9QGfBObfF7oprqAE8xBB7uDWmcAF/zi0DmZTQ8hcHlv53VS2FeCuhmGbosXCnKE2MGFL
 wwHg==
X-Gm-Message-State: AOAM531rlJOuI4gbeqhmnDJIdDtnuOBxbbGe+KQL0cBWyJMwsfF0cIX0
 isOuJ7cRWNQVSr+imlVMFBFq1IZiFEr4gSEZv/nK4g==
X-Google-Smtp-Source: ABdhPJzlXXZln0onZBt7l5va/GB6ImScyHaiS3RfhGoDY/VOeSuREACSW8Vh6oIT4OB38N29lX47wSMOiyyn3mPjIOY=
X-Received: by 2002:a1c:2646:: with SMTP id m67mr7719681wmm.137.1596708752740; 
 Thu, 06 Aug 2020 03:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200803062214.24076-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20200803062214.24076-1-mark-pk.tsai@mediatek.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 6 Aug 2020 19:12:21 +0900
Message-ID: <CAFr9PX=Gk9h6ASi6saBLhoZ45g-WqCzDQo2XWT033fJykFSY_g@mail.gmail.com>
Subject: Re: [PATCH 0/2] irqchip: irq-mt58xx: Add mt58xx series interrupt
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_061233_649732_4113C4D2 
X-CRM114-Status: GOOD (  11.03  )
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
Cc: DTML <devicetree@vger.kernel.org>, alix.wu@mediatek.com,
 jason@lakedaemon.net, Marc Zyngier <maz@kernel.org>, yj.chiang@mediatek.com,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 tglx@linutronix.de, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mark-PK,

Your driver seems to be for the same interrupt controller IP that is
present in MStar's TV and camera SoCs and now SigmaStar's SoCs.
I sent a series[0] for a driver very similar to yours but for the
MStar SoCs. Do you know if it would be possible to confirm if they are
the
same thing? MediaTek bought MStar a few years ago so it seems likely
but I have no hard information.

If they are the same thing could we work on making one series that
supports both use cases?
It's also possible that if the interrupt controller is the same some
other things like the SPI NOR controller etc are also common and
working
on a single driver for those would save us both time.

[0] - https://lore.kernel.org/linux-arm-kernel/20200805110052.2655487-1-daniel@0x0f.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
