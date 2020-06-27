Return-Path: <SRS0=2fNz=AI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62FAC433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 11:08:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72F0521655
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 11:08:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rk2mxckl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wFdzUa7p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72F0521655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u0VYkVLPosDjjF3ko+K/amcZM/PYCYAJ10kN4yNH++4=; b=Rk2mxcklb0SREN06s1zgLhBTK
	+tOxADIR60GDkxrp/tfxlOH+8HpHoK6s4WyOhWc1+l/9zYarz/BshldUNGFIq8lXuaJtXzqQojBVw
	6yW+/qs6ATvuUVhKYeUGJrx+fCVIJAOvGaFS+2Gxs81dx4E5GcHZnrvPiK3Kgoi9bFqSoawL7uFLh
	fIt+TI01tkQB7Wp4lgKPleRINByqsnKIUHpjvusj76uUEZ+PlrLq+uxpiBRGbKw0hbmofqMpWngyR
	yfV3LnALFXHHWKilN3Mhr9aYYk/pDnPxETObWTXUJ6H8LrQOq3wLdjEtDC76SdO8DqetwYQoRdzO6
	7vsAUJzpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp8hC-0004Uy-BE; Sat, 27 Jun 2020 11:08:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp8h4-0004Su-8m; Sat, 27 Jun 2020 11:08:23 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AB2A20B80;
 Sat, 27 Jun 2020 11:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593256101;
 bh=VNdAAGYLRyag3MwdJZ0VrV51pye7OyQAfy2JLn/IyDQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wFdzUa7pKHXxg1BXLmnmt/J4Y/yCDsaa6UQIAOXYDNhkhNlK3N2e96oqKnQtYtkQf
 N2l7mpPh1+yWvS9lepwuzribE7XpQYPO1ZlwNZ4drDOCgDKRuouZZetzyJoKaYPM0m
 0biPzPAF9UNVVEzlaJJW6ZTrardb5D+P7HxCt7IE=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jp8h1-006s0z-L5; Sat, 27 Jun 2020 12:08:19 +0100
From: Marc Zyngier <maz@kernel.org>
To: Jason Cooper <jason@lakedaemon.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RESEND PATCH] irqchip/irq-mtk-sysirq: replace spinlock with
 raw_spinlock
Date: Sat, 27 Jun 2020 12:08:01 +0100
Message-Id: <159325548742.93134.3774851842783687845.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615074445.3579-1-brgl@bgdev.pl>
References: <20200615074445.3579-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jason@lakedaemon.net, matthias.bgg@gmail.com, brgl@bgdev.pl,
 tglx@linutronix.de, andrew.perepech@mediatek.com,
 linux-mediatek@lists.infradead.org, stephane.leprovost@mediatek.com,
 linux-arm-kernel@lists.infradead.org, pedro.tsai@mediatek.com,
 bgolaszewski@baylibre.com, fparent@baylibre.com, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Pedro Tsai <pedro.tsai@mediatek.com>,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 15 Jun 2020 09:44:45 +0200, Bartosz Golaszewski wrote:
> This driver may take a regular spinlock when a raw spinlock
> (irq_desc->lock) is already taken which results in the following
> lockdep splat:
> 
> =============================
> [ BUG: Invalid wait context ]
> 5.7.0-rc7 #1 Not tainted
> -----------------------------
> swapper/0/0 is trying to lock:
> ffffff800303b798 (&chip_data->lock){....}-{3:3}, at: mtk_sysirq_set_type+0x48/0xc0
> other info that might help us debug this:
> context-{5:5}
> 2 locks held by swapper/0/0:
>  #0: ffffff800302ee68 (&desc->request_mutex){....}-{4:4}, at: __setup_irq+0xc4/0x8a0
>  #1: ffffff800302ecf0 (&irq_desc_lock_class){....}-{2:2}, at: __setup_irq+0xe4/0x8a0
> stack backtrace:
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.7.0-rc7 #1
> Hardware name: Pumpkin MT8516 (DT)
> Call trace:
>  dump_backtrace+0x0/0x180
>  show_stack+0x14/0x20
>  dump_stack+0xd0/0x118
>  __lock_acquire+0x8c8/0x2270
>  lock_acquire+0xf8/0x470
>  _raw_spin_lock_irqsave+0x50/0x78
>  mtk_sysirq_set_type+0x48/0xc0
>  __irq_set_trigger+0x58/0x170
>  __setup_irq+0x420/0x8a0
>  request_threaded_irq+0xd8/0x190
>  timer_of_init+0x1e8/0x2c4
>  mtk_gpt_init+0x5c/0x1dc
>  timer_probe+0x74/0xf4
>  time_init+0x14/0x44
>  start_kernel+0x394/0x4f0
> 
> [...]

Applied to irq/irqchip-5.9:

[1/1] irqchip/irq-mtk-sysirq: Replace spinlock with raw_spinlock
      commit: 6eeb997ab5075e770a002c51351fa4ec2c6b5c39

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
