Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859FAC624A4
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 14:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxueduM2jdpHpFUA5itz4EXdilGmVrtEHz4rhg8u9T8=; b=aXBA9qXhSyepkUh/AeqW5+uR+b
	Q7G8a+9lRO41oAfhc8vwUz0IN3gLNF6dUJrNKqsU+2azEChlshYY+PWh34lGQq8Tc8P69qL5DbIxE
	133WLlJHIRkbM0YLJbzOge7ots8rtt1XnvT1Xu7lzgh97J8AEfDD4abV3ZKc39YHyLec2Au11E99g
	AakFRALCsQHUIDswlUHVtokmA9F1JP8zeJnGcjzyuw/3QHbT4S/sQFSUQGhlxmuE0TFsmZkxzufWm
	pWsYCOu2/NVsU9iPsovS2Ld2gTeqylRv97vltpxvUqR70+mRZs8r8rPAwAcU2HRjs3XZ2orfaRWRA
	AOqrNPxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28Cj-0000000HUMQ-0l1X;
	Thu, 03 Sep 2026 14:14:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28Cg-0000000HUKh-144i;
	Thu, 03 Sep 2026 14:14:11 +0000
Date: Thu, 3 Sep 2026 16:14:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788444845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uxueduM2jdpHpFUA5itz4EXdilGmVrtEHz4rhg8u9T8=;
	b=hQef+cIZdKQ0Q3jkwKG8zUbKIdkgj9a0EPC2xOvVUCEW2vd8qGsbwgC+RGhipC57ysg7d+
	7XQUF5vKGQE3X9tfjbfDoR96xyML77P1wklHhxH4eyDEKaiJpFuCA1BOhpU+RIHg0JpgS7
	NkrsQL6A2KPwSRMzaaxG0Bpl0AkHcDi+z6izxoqnyMYGjMkqD7IGuGaHiwOTWrUzS3fpsQ
	TlpM7q6OQeQfqddPmOknixHkvaZXVOUE4haXQtPjkZqnTCmsqSzIVqEjJEC3e7XkWQEh9t
	8Jct1HQ4dpWbGMG8h9TXZE7l3OEZFZFbj2ioZ79wGN3oSv9ZXYa0ad0vDr0yew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788444845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uxueduM2jdpHpFUA5itz4EXdilGmVrtEHz4rhg8u9T8=;
	b=2j9ImPhK3/So43hE3QV25Jr9ScBylZdCxnq+KoGBJeEMIr6+2tWu7WsK5gZTkQVlKXekZQ
	hRNHEiMXD7qAb/Cg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] USB: mtu3: tracing: fix pointers dereferencing
Message-ID: <20260903141403.3bNG0z7l@linutronix.de>
References: <CGME20260804100540eucas1p24c59c891e91eeeeea8032d1c80312ea3@eucas1p2.samsung.com>
 <20260804100531.88576-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260804100531.88576-1-m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_071410_433080_F799579C 
X-CRM114-Status: UNSURE (   7.49  )
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

On 2026-08-04 12:05:30 [+0200], Marek Szyprowski wrote:
> Commit b5cc230af5e5 ("tracing: Warn when an event dereferences a pointer
> in TP_printk()") added a warning then printing an event dereferences
> a pointer, because it might be already freed that time.
> 
> MTU3 driver is one of the drivers triggering this warning. Fix it by
> storing also the DMA address in the event structure to avoid
> dereferencing gpd_ring pointer during event printing.
> 
> Fixes: 83374e035b62 ("usb: mtu3: add tracepoints to help debug")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Just run into this, made the same fix :)

Sebastian

