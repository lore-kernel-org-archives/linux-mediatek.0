Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8007CC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 16:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+H8ZWEPoXWQ124x0RSfNkSfZwzKtOth/M9l2/BoQt4Y=; b=S8AQH9wk13RZAEMOGZEhgcNmKY
	kSYh0IbJJN7CG8mVkVW49gLmdtPitpUJ3HWkROphEtOwmztqwRvsdB9OKW3tTPRdf3LMVTygAIdaF
	WZiyndwqgqFsKX20O4/ZyGv8YMhFJ3s8lv0bnKDT4Ssb/Y1W+FFcgNBCoHfE7D3LENIr1lIaknCiG
	OY3jMgPSYSr8tPMzybTe8JVYAOy3UBBppCkkrAHI38yaRh+rI2aKpmbv+NCs+vCCa629+e/dpK/Q9
	GsJiWdIrBy+teB1CC2a62RaPJxYxihCtF19d0loKsNKyxlr0AXBtVKzjpHFrYNaH3/9HipDh3RYWW
	a3l80YWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPFr-000000095Dc-1MsC;
	Mon, 15 Apr 2024 16:32:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPFn-000000095Bw-0Wm0;
	Mon, 15 Apr 2024 16:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 05BBBCE0E5D;
	Mon, 15 Apr 2024 16:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B94C113CC;
	Mon, 15 Apr 2024 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713198740;
	bh=Wsb9mO0IMUs6XyEA7C68rG60ROTwki5oNLgFkNQGVfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hDAALKxniYNrhPk7bGdZS6/mD+2lHE9dUHGMqBLvm6ZfPtEwssQoA88x2UurOeeN2
	 ltpjL7kJB+XXWqoHe229s83KYjjbNhr9s8SHH4V8sYGTU8jYDxwjJPZj6AePV4lA8b
	 ucSkbhHoj6CaQkA14qENjkLbGPeW4JGeF4hFAiuWTTcfNQAY1HQduj3z9VMS9GkycQ
	 DI7pojk9FqjWIQKB9JOzHezwyg3iSRcpIh6jRjb4u7T+xoW+knmBlCsRpL4PjkuKxt
	 3I4/YTgREcipydZmtPp5swjdQqI1Yiru8u7SZ6TNxrZoamRL8MZrxxYxDTBcD05esc
	 hq8v/xfZ4MvHQ==
Date: Mon, 15 Apr 2024 17:32:12 +0100
From: Simon Horman <horms@kernel.org>
To: Yi-De Wu <yi-de.wu@mediatek.com>
Cc: Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>,
	Willix Yeh <chi-shen.yeh@mediatek.com>,
	Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Subject: Re: [PATCH v10 19/21] virt: geniezone: Provide individual VM memory
 statistics within debugfs
Message-ID: <20240415163212.GE2320920@kernel.org>
References: <20240412065718.29105-1-yi-de.wu@mediatek.com>
 <20240412065718.29105-20-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412065718.29105-20-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_093223_623124_8864E774 
X-CRM114-Status: GOOD (  17.48  )
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

On Fri, Apr 12, 2024 at 02:57:16PM +0800, Yi-De Wu wrote:
> From: "Jerry Wang" <ze-yu.wang@mediatek.com>
> 
> Created a dedicated per-VM debugfs folder under gzvm, providing
> user-level programs with easy access to per-VM memory statistics for
> debugging and profiling purposes. This enables users to effectively
> analyze and optimize the memory usage of individual virtual machines.
> 
> Two types of information can be obtained:
> 
> `cat /sys/kernel/debug/gzvm/<pid>-<vmid>/protected_hyp_mem` shows memory
> used by the hypervisor and the size of the stage 2 table in bytes.
> 
> `cat /sys/kernel/debug/gzvm/<pid>-<vmid>/protected_shared_mem` gives
> memory used by the shared resources of the guest and host in bytes.
> 
> For example:
> console:/ # cat /sys/kernel/debug/gzvm/3417-15/protected_hyp_mem
> 180328
> console:/ # cat /sys/kernel/debug/gzvm/3417-15/protected_shared_mem
> 262144
> console:/ #
> 
> More stats will be added in the future.
> 
> Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
> Signed-off-by: Liju-Clr Chen <liju-clr.chen@mediatek.com>
> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>

...

> diff --git a/drivers/virt/geniezone/gzvm_vm.c b/drivers/virt/geniezone/gzvm_vm.c

...

> @@ -398,6 +409,113 @@ static void setup_vm_demand_paging(struct gzvm *vm)
>  	}
>  }
>  
> +static int debugfs_open(struct inode *inode, struct file *file)
> +{
> +	file->private_data = inode->i_private;
> +	return 0;
> +}

nit: Coccinelle suggests that simple_open() can be used in place
     of the debugfs_open() implementation above.

...

> +static const struct file_operations hyp_mem_fops = {
> +	.owner = THIS_MODULE,
> +	.open = debugfs_open,
> +	.read = hyp_mem_read,
> +	.llseek = no_llseek,
> +};
> +
> +static const struct file_operations shared_mem_fops = {
> +	.owner = THIS_MODULE,
> +	.open = debugfs_open,
> +	.read = shared_mem_read,
> +	.llseek = no_llseek,
> +};

...

