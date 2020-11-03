Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2430C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 14:23:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0260222280
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 14:23:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="066fVe6m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QalBqNAl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oNuU5EJE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0260222280
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LB4OVFE3uDK8PipzG2oI/ZcXwwpLj/Zd8203omp0ZhU=; b=066fVe6mhXkSJoOBgQAbUQvMl
	Nm4LWlWLJqCUiMaDZWfi2/JTDLiJxr1b842aQOD5BUgPlCLwgBJqvS2NbIAKS4VNYOqh3p1LNaieD
	CeS6WJHHuqMxldt8RXJZ2Z+w5rkZ9uL5R62jsJF19A1QN5qncjq56Ay+g5SnJre/gUG4q31xMPI+H
	8WPzNhph1133aq8H0Qm4KztwWzFg/y1GOPxN4I7eQ8WT/SCua/rB5o8XfhwTK3448p99HwSM+0ycc
	mZYd/pCyDxIBT8vo1t/51Q3nir461KYxx+klIgrWZ+hwURMbVLZ9Um+vsr1u2sMokqZWanrhdkCCP
	6UvfpbNYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZxDI-0005Tc-Kq; Tue, 03 Nov 2020 14:23:08 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZxDD-0005SF-TI
 for linux-mediatek@lists.infradead.org; Tue, 03 Nov 2020 14:23:05 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604413382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zQk/S97ZspWiP1IuSwnWiJWHXBzyWFTe6e9hOnmA6WE=;
 b=QalBqNAlxHCvA00U58wEBxzceCcxe6LuAsBqou0YkPb69sAg6Dc5SsXKt0KflY23a9gqio
 HjzxxXFDEHPOtciZQw7z+k5kphA/aRZGpa5uBtMVlQwoKXVBP3fE2E4wMcWTv73gVzfg+Q
 Zg9dyWFt9POExqgBYBMYAHFscyYePzEwiWooI/iG1S94360E+p9lSWzbLJ3DvjlAf5ZT8i
 ieX0nGBK1p8OOBdsEvZZENvT755t6QTkbZKGBhG9jvVJIuVnS40MoXHNI5k+F+5+Lu+oyP
 PmvKmP4enLYz+aSV3PAhqcxvI8VG/x5iMkt4IzUR1/P9jmQiuzCpDHxaMV0lfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604413382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zQk/S97ZspWiP1IuSwnWiJWHXBzyWFTe6e9hOnmA6WE=;
 b=oNuU5EJETbCC1hnFqgqleMG/b4FxXNvPyqRgnq0lRnt8yGGAJfGSdQPnE3oHZ+jbyiRbFu
 og17+KydbVPoo1Ag==
To: Marc Zyngier <maz@kernel.org>
Subject: Re: Aw: Re: [PATCH] pci: mediatek: fix warning in msi.h
In-Reply-To: <41e2e3ea115aa8cbbb9a5c313dca0210@kernel.org>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org> <1604253261.22363.0.camel@mtkswgap22>
 <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
 <87k0v4u4uq.wl-maz@kernel.org> <87pn4w90hm.fsf@nanos.tec.linutronix.de>
 <df5565a2f1e821041c7c531ad52a3344@kernel.org>
 <87h7q791j8.fsf@nanos.tec.linutronix.de>
 <877dr38kt8.fsf@nanos.tec.linutronix.de>
 <901c5eb8bbaa3fe53ddc8f65917e48ef@kernel.org>
 <87k0v27mve.fsf@nanos.tec.linutronix.de>
 <41e2e3ea115aa8cbbb9a5c313dca0210@kernel.org>
Date: Tue, 03 Nov 2020 15:23:02 +0100
Message-ID: <874km634ft.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_092304_213393_FEEBC117 
X-CRM114-Status: UNSURE (   6.89  )
X-CRM114-Notice: Please train this message.
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
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 03 2020 at 11:41, Marc Zyngier wrote:
> On 2020-11-03 10:31, Thomas Gleixner wrote:
> We can do that, although I worried that it isn't 100% reliable:
>
> pci_host_probe() ends up calling pci_add_device(), and will start
> probing devices if the endpoint drivers have already registered
> with the core code, long before the flag gets set.

Bah, you're right. What a mess.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
