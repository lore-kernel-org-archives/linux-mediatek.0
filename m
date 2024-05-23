Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4499C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 19:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=uosf8zJX/OrVrpzgWdisB0fvzDFsKDb8UYB9Oox95ds=; b=FF4rRqcvinINbU
	tELWGBPdNh56QVuHPgiNRQ3FGcptsRbKtlQxCCfTm+ehMDqwNFJ1szwBhAKSJU+iP4e8Bo9oVEhAY
	wP0Uwei9kxY4AjfPSDiPd0bImtM4sMuLMIxydXPqfdKGX66gnwodwl907Igs9y+WW6aCfS0skeohr
	ibGTojXLoHr7obXi0C4dHey4hq95mI4zfDKy2h/KooXkEiwgl6BNIgmlKYBH0B1yotF3M5MtI8DUg
	0LcEBamt36PrjY0qPcXPU2dNUBAQqXM8QIA3MTj+eUTqZ0wLLFN529h47adeMpKIgflCI7CJ4ld2t
	Joc2O/9ecuxuyVqetDxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAEOm-00000007BLz-2qJT;
	Thu, 23 May 2024 19:46:48 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAEOe-00000007BKQ-2MiJ;
	Thu, 23 May 2024 19:46:45 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716493597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=uosf8zJX/OrVrpzgWdisB0fvzDFsKDb8UYB9Oox95ds=;
	b=BP4BAo/B69jc8ERVWFG98sNHLN1mENEzNZNBioaIc8i+Z2nQvyDhWBpGZ7Q8bSagQvkp0r
	Qkoi9ly8VwbHcND/epo5p1JbpdIcYEl8tlsHT3u4xHypR3RHOL7tG0w8bz2Hs1dJWWmU4f
	9xsJRC4V8XwLgNg3s+4rrrW0j57j58gUKlsP0mm4TFoC4IEnh+vHVVLtKkBKChvC4BS5PP
	x3QInGMT3WmYjyr3TGr2x/BzBXD64Poz1/wfVeDDy//JS+wnJmjvWB0xYZfjR1BtJyVed4
	Cr4QI2aVIO72pN618+SVkrXSP15TSfdaEaa+FZckgMIw022PRgqfwsae1NffWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716493597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=uosf8zJX/OrVrpzgWdisB0fvzDFsKDb8UYB9Oox95ds=;
	b=KIpZqn5taXmZz3LONsNtK4wwCWpj93R/8rFGP6l7jO5arnhLumMZWFiopXw87IZFZtKX1z
	eYmvNXSkHlMUZVDA==
To: "dicken.ding" <dicken.ding@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: wsd_upstream@mediatek.com, hanks.chen@mediatek.com,
 ivan.tseng@mediatek.com, cheng-jui.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, "dicken.ding"
 <dicken.ding@mediatek.com>
Subject: Re: [PATCH 1/1] irq: Fix uaf issue in irq_find_at_or_after
In-Reply-To: <20240523113949.10444-1-dicken.ding@mediatek.com>
Date: Thu, 23 May 2024 21:46:36 +0200
Message-ID: <87cypcfh0j.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_124640_904019_C1C3EDD2 
X-CRM114-Status: GOOD (  14.51  )
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

On Thu, May 23 2024 at 19:39, dicken.ding wrote:
> The function "irq_find_at_or_after" is at the risk of use-after-free
> due to the race condition between the functions "delayer_free_desc"
> and "irq_desc_get_irq". The function "delayer_free_desc" could be
> called between "mt_find" and "irq_desc_get_irq" due to the absence
> of any locks to ensure atomic operations on the "irq_desc" structure.
>
> In this patch, we introduce a pair of locks, namely "rcu_read_lock"
> and "rcu_read_unlock" to prevent the occurrence of use-after-free in
> "irq_find_at_or_after".

Please read Documentation/process/maintainers-tip.rst and the general
documentation how changelogs should be written.

Something like this:

  irq_find_at_or_after() dereferences the interrupt descriptor which is
  returned by mt_find() while neither holding sparse_irq_lock nor RCU
  read lock, which means the descriptor can be freed between mt_find()
  and the dereference.

  Guard the access with a RCU read lock section.

Hmm?

> --- a/kernel/irq/irqdesc.c
> +++ b/kernel/irq/irqdesc.c
> @@ -160,9 +160,15 @@ static int irq_find_free_area(unsigned int from, unsigned int cnt)
>  static unsigned int irq_find_at_or_after(unsigned int offset)
>  {
>  	unsigned long index = offset;
> +	unsigned int irq = nr_irqs;
> +
> +	rcu_read_lock();
>  	struct irq_desc *desc = mt_find(&sparse_irqs, &index, nr_irqs);
> +	if (desc)
> +		irq = irq_desc_get_irq(desc);
> +	rcu_read_unlock();
>  
> -	return desc ? irq_desc_get_irq(desc) : nr_irqs;
> +	return irq;

I wrote guard above because that's what should be used for this:

  	unsigned long index = offset;
  	struct irq_desc *desc;

        guard(rcu)();
        desc = mt_find(&sparse_irqs, &index, nr_irqs);
	return desc ? irq_desc_get_irq(desc) : nr_irqs;

Thanks,

        tglx

