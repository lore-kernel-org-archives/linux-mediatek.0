Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6CBC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 15:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aq26IvfRiT1r58+nIEcWaZRUEz9OvWg+TkXxigQPu+Q=; b=WIMSsq2oFK4hk3
	Brjpc8F4YByvM5kDVYz8vBamlhFl3scv6A0/UD+d3nQuwmv/LkIKrgIySGpfafckfsXWSrvrJ6PlW
	2ARcM2zibmMw6YlinC/2E40Vu8PjZrP0OsfJCkri9+GQcKs2OyMOKmb7ag7gWlndsSRE1NCJBuzAC
	gVBNzZX57kDLrwNMxHinOuk4foHRONbeOt+ii0XSCNU/lwO7672QA70ar198ebAAFAbt9Qd+rL6uj
	Dy2HQc8GJXQZSUHv8ZDPyvBoFhJFaUs+urvw59VfEOuYbc4FiCpJDefpdFGXaw/2zBlp7AG8j6exz
	pgnk3ls4VIw+aSxXPuRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx9aq-00Ecqs-0P; Tue, 14 Dec 2021 15:19:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx9Zk-00EcGC-V1; Tue, 14 Dec 2021 15:18:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 610E86156F;
 Tue, 14 Dec 2021 15:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CDBC34606;
 Tue, 14 Dec 2021 15:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639495123;
 bh=EtXNCqqEF5z7tNX4x034w1DmPhsexirc5bJSadieaTU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oVm5vp4S50b4rGVhdHXirrlW9wzjjz4QmXBPKuTPQVSv/iN+1KZIYc+ukAokyG3NL
 5EYAUnXwYT8ooc8tJFGmtoEDjqtHvO/PwLht9tW7rIei49/5ZuWUxgnlpm7jakwUu4
 RuZaKfNUYRG5L0hCu6TcCcKyzOWrAVuaD+FuRTe4jxKgYgYc9svs4ZyN6qkE8nUKwS
 BBukGp4WcOJykx+A28YWnsysRITIEDLDwZiQ5HX90vpD9G0x8B4JfDDHdcfWMZtmGM
 APhy0y3yr6Hpsir8HXkbr5sLUFrMdYOmyezphCTsrTIhyRE4DNECZMowppwfbBJRHo
 peKqoXbWSIPFw==
From: Will Deacon <will@kernel.org>
To: yf.wang@mediatek.com
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Guangming.Cao@mediatek.com, linux-mediatek@lists.infradead.org,
 iommu@lists.linux-foundation.org, wsd_upstream@mediatek.com,
 Libo.Kang@mediatek.com, linux-kernel@vger.kernel.org, robin.murphy@arm.com,
 matthias.bgg@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH v3] iommu/io-pgtable-arm-v7s: Add error handle for page
 table allocation failure
Date: Tue, 14 Dec 2021 15:18:17 +0000
Message-Id: <163949313634.2865984.16870619152235318237.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207113315.29109-1-yf.wang@mediatek.com>
References: <20211207094817.GA31382@willie-the-truck>
 <20211207113315.29109-1-yf.wang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_071845_091144_7AFB5BC9 
X-CRM114-Status: UNSURE (   9.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 7 Dec 2021 19:33:15 +0800, yf.wang@mediatek.com wrote:
> From: Yunfei Wang <yf.wang@mediatek.com>
> 
> In __arm_v7s_alloc_table function:
> iommu call kmem_cache_alloc to allocate page table, this function
> allocate memory may fail, when kmem_cache_alloc fails to allocate
> table, call virt_to_phys will be abnomal and return unexpected phys
> and goto out_free, then call kmem_cache_free to release table will
> trigger KE, __get_free_pages and free_pages have similar problem,
> so add error handle for page table allocation failure.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/io-pgtable-arm-v7s: Add error handle for page table allocation failure
      https://git.kernel.org/will/c/a556cfe4cabc

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
