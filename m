Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861BCC7EE24
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 10:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7GzoTaph3PJwwLQgPyik4Eh+bbnZRkPzskpAeL6aSA=; b=o2QhJ5kYNdYNqHXdK2X1Ewgz6d
	LmORq8xlrLTp0+eXcoPLY1IQyKg4CsGaaXkHfgmcOt6EZFaPDYHsPpg17B8foKAqBK7ihnLeGtEDZ
	NC8PKqXG66dQE7BqFZ2Viry8UQhIvPHBU8G9epVRKY9SE2vmd7V9hNsgVuhfIQFhEkWUt0NOMSp73
	kCPvehXIHETMikU7aaVApX1xPMW6nUIStMoADqErGT/cE8jnQGXJySy1ux6Kcgr8gbpdZZnQH87t2
	uVC7fr8bKNx7vacmngZi1Aj674fO8gSfLJjYW13WxejoUdvOKfZSDduA5DcduhW4otAhlhnArMe4d
	bcjgWLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q51mu-006U5g-1O;
	Fri, 02 Jun 2023 10:13:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q51ms-006U3w-0x
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jun 2023 10:13:39 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685700812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M7GzoTaph3PJwwLQgPyik4Eh+bbnZRkPzskpAeL6aSA=;
	b=GG3G5mL0bgKlxf6U+FJBDL6Q1lUEIKeL4TxsOPB4fSfBkk/fcfVyWWUUtHTLjysXvihtjX
	dg/Seh5PS7j7QK8kubfn/HKaB7/ZGg32l+FqXnwtp/F2PYanop+GXVgwZaSB6EkgPisrPn
	ggoMEaq4XMMOL2r2rylrdWLpFiOqzEBJD+mv+6BjNvwaq7B/HZguez5Q5EooMkyH84lBZv
	14tq4SpYgp3gpUBXRKME+aWk0wr+c912N7Vn4rkCZf0UoVV8TlTC8NMG7Z6UCJViu5Ts2o
	knwkQycTe/KoOm1C4W6hDbK2YxTF4GgwTOyOwQ4sVhhYA2FZ8QmEQGHOl0OasA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685700812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M7GzoTaph3PJwwLQgPyik4Eh+bbnZRkPzskpAeL6aSA=;
	b=mZtG4RT88sue4AZKYDqVM5VkrPwnXz/sPSOFAK7alYyAi80FpCRuwryq9FZ70KRmumsdmx
	VsglgIllqcsaEDDA==
To: Chen-Yu Tsai <wenst@chromium.org>, Tony Lindgren <tony@atomide.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>,
 Dhruva Gole <d-gole@ti.com>, Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Johan Hovold <johan@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-omap@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?=
 <nfraprado@collabora.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v12 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
In-Reply-To: <20230602083335.GA181647@google.com>
References: <20230525113034.46880-1-tony@atomide.com>
 <20230602083335.GA181647@google.com>
Date: Fri, 02 Jun 2023 12:19:28 +0206
Message-ID: <87a5xii33r.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_031338_475103_7B4AA399 
X-CRM114-Status: UNSURE (   5.99  )
X-CRM114-Notice: Please train this message.
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

On 2023-06-02, Chen-Yu Tsai <wenst@chromium.org> wrote:
> This patch, in linux-next since 20230601, unfortunately breaks
> MediaTek based Chromebooks. The kernel hangs during the probe of the
> serial ports, which use the 8250_mtk driver.

Are you sure it is this patch? Have you bisected it?

Unfortunately next-20230601 also brought in a series that added
spinlocking to the 8250 driver. That may be the issue here instead.

For 8250 bug reports we really need to bisection.

John Ogness

