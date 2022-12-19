Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DEAC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Dec 2022 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ml4OJSsnYdjz2on2dlIK+cF2l/IAgGUuzkZZxYV+MM=; b=wU/RPEi7x67XwLzNa0EAZdGD+Q
	1GetDoprp1jov1ZFFhzT1REfJXVNlZrcjYiHHvESFWeIuA92gMxj+Fj/5bKgd251sUR2P+KD9nIZd
	sZvHtJ5WrJlUw+x8U48UU09twY6Zy8S5uUHUrfE9wt0rjlrnWzh5srDDYnGBVE+uSR3So5Ac6oDXg
	hGNxb+G6qtlrqUnb4BZr4ctKFeINvjHjLY+jLRq3e+AwdvttzNvpzny+fYWbmBT9meG6suTlp0G1T
	XblD0ldzxYnzj9t7GIczaE5so+6BGvkx5omknYGKDRIorIAxXwHLI9KVTAXbcubQ1xzdtcVpe9k2N
	hE4G/bRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7IUe-00Fi0t-L6; Mon, 19 Dec 2022 15:55:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7HEC-00EnkF-4W; Mon, 19 Dec 2022 14:34:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 78E2160FC5;
	Mon, 19 Dec 2022 14:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02B0C433D2;
	Mon, 19 Dec 2022 14:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671460490;
	bh=WvJqO+O9grYq3EdoFlvoFSVrzmjasbVzPIMXkFDko5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kHe6ZJtxRtmtfLTJ5dVTtz4MVEHrFRTi560vMdS8UG+0T3/vmISvveOiFj0GChCdH
	 /9lC+DhEhV2ckHUcx72Aw3/SO6eYtWQDU/h7NOdpmQsiNnl2+I6S0MckSSgSCG24M3
	 4c+wK/I20d+J9OFJNp5rlkH5SLEf/CGHhpnAI0V9GDPdxB0rN+hp2glAkfXn47vU/H
	 Jznqxs2npEa/d0iFS+1LVNYblIj/UAQMY/lQhN/3M0eDo/YndakK3Na1UxH7WwoqqU
	 5tIlEdteMfRmlFm/j/NQzU/+US+Zj6F9joU/4FZMS4+xJn+g/r3edAWRXVUhfADZRh
	 ECISyfxMnaIzQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1p7HEr-0000VP-MV; Mon, 19 Dec 2022 15:35:33 +0100
Date: Mon, 19 Dec 2022 15:35:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>, yj.chiang@mediatek.com,
	phil.chang@mediatek.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] irqdomain: Fix irqdomain->revmap race
Message-ID: <Y6B2tTQCLXz/Oytt@hovoldconsulting.com>
References: <20221219130620.21092-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219130620.21092-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_063452_268459_08A9C9A1 
X-CRM114-Status: GOOD (  14.87  )
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

On Mon, Dec 19, 2022 at 09:06:15PM +0800, Mark-PK Tsai wrote:
> The irqdomain->revmap(_tree) of a shared irq can be race updated
> as following, which result in an unexpected irq mapping:
> 
> ---------------------------------------------------------------
> (2 threads parse the same hwirq fwspec in the same time.)
> 
> Thread A 			Thread B
> irq_create_fwspec_mapping
> irq_find_mapping						Thread A: virq = 0, alloc a new irq_desc
> 				irq_create_fwspec_mapping
> 				irq_find_mapping		Thread B: virq = 0, alloc a new irq_desc
> irq_domain_alloc_irqs
> irq_domain_insert_irq						domain->revmap[hwirq] = irq_data(virq x)
> 				irq_domain_alloc_irqs
> 				irq_domain_insert_irq		domain->revmap[hwirq] = irq_data(virq x + 1)
> 
> virq = x			virq = x + 1
> ---------------------------------------------------------------
> 
> The virq x can't work because the revmap[hwirq] was
> overridden by thread B.
> 
> It seems both hierarchy and non-hierarchy irq domain have the same
> problem because the code from irq_find_mapping to revmap update are
> not protected by a same lock.
> 
> Do you have any suggestion about how to fix it properly?

This is being fixed here:

	https://lore.kernel.org/lkml/20221209140150.1453-1-johan+linaro@kernel.org/

Johan

