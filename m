Return-Path: <SRS0=+2Q0=DW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981FBC433E7
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 21:30:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13DF520759
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 21:30:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nHxrWb9J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLtRCMeN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13DF520759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DRvuzZTtm2IHRB/iCl513I9EVUrnJt+dMWWpDPDG+jc=; b=nHxrWb9JqV8uqPxdOcWEATyN3
	JkObESBihlqgwg6g2AWtdJY/On/ukE8e2js2mOxSuzfCVzJQbda/6EhbKjWrXAXuUwjDnSsN0YHNa
	RtgVbmGrYKkvz1SjvfAKsYngq0WYfCzexRiHBoea0+7N9Do3HFjOKAzNrT3Ema7RIXOzKDDTknPYv
	zyQDXDDEsii9F8BMtUn5ZCE5U9UE+T8YsCWteVYwOF8L0n41gx1HongcekoQjubqXJKjKh9YZbcF6
	JlbJlX5LHLxEKU/2VBHJeRrlyaTbW49Q7biAuwSH0+leQk8Xt6FmMfwcEAornul+T/TtgU7Ic4uem
	0zxIzVE2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTAow-0005pl-Gz; Thu, 15 Oct 2020 21:29:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTAos-0005oh-9S; Thu, 15 Oct 2020 21:29:55 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DABCE20759;
 Thu, 15 Oct 2020 21:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602797393;
 bh=CiUCwxHbHrlvIPc9xjyS/u2IK6Z/5M3q0g1e1W+9hk0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hLtRCMeNiiJh736Fdf8BT7P39glGuBhH0fYhrvMgv7E8C7EfbEPbgq+2lZnmAEoJu
 hxdfe4FWFeRmvdBMMdi3ApvL0L/IU5SAflKDFYCoC5HS2qe/qiASWKDeDS+dZyc0j2
 sMs1jQuG0M3a+MDYFYuLmrX4gx35vQx2YQ5VDnec=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=hot-poop.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kTAoo-001Uc3-Rd; Thu, 15 Oct 2020 22:29:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Palmer <daniel@thingy.jp>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] irqchip: MST_IRQ should depend on ARCH_MEDIATEK or
 ARCH_MSTARV7
Date: Thu, 15 Oct 2020 22:29:47 +0100
Message-Id: <160279736145.714857.6241201517458761558.b4-ty@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014131703.18021-1-geert+renesas@glider.be>
References: <20201014131703.18021-1-geert+renesas@glider.be>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tglx@linutronix.de, geert+renesas@glider.be,
 daniel@thingy.jp, mark-pk.tsai@mediatek.com, jason@lakedaemon.net,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_172954_449750_550FF9E6 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 14 Oct 2020 15:17:03 +0200, Geert Uytterhoeven wrote:
> The MStar interrupt controller is only found on MStar, SigmaStar, and
> Mediatek SoCs.  Hence add dependencies on ARCH_MEDIATEK and
> ARCH_MSTARV7, to prevent asking the user about the MStar interrupt
> controller driver when configuring a kernel without support for MStar,
> SigmaStar, and Mediatek SoCs.

Applied to irq/irqchip-next, thanks!

[1/1] irqchip/mst: MST_IRQ should depend on ARCH_MEDIATEK or ARCH_MSTARV7
      commit: 61b0648d569aca932eab87a67f7ca0ffd3ea2b68

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
