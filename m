Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F8EC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 14:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRChljwfPNewECXbNqnidT0LERkgt5Pz3bQD/mxxzEU=; b=0pdMPIqWeeLqgfOO0MFzZ0PZc+
	1KAK76qyKalFYvCLKweMDUWi9au2b2IUPpo3CnHBysPZODp0lubixsKwDarD4IHKtedW7JnHePepX
	oYM/YW+Tsg5I2yPhHldy/VT3wW/k2/mbgnlM2k4HQXE+W8oPkKvEZxYSPq/ZsAqNqVrhfh8t8KW2i
	qnMBZiRgCcjDVdReuRtQ/1cFimZpP3C5aeFn/hrOKpYw8vUH5cqBv2mhq9SLbEkGkbVX7eboRaUOB
	36JqC4Fu5nt4BgqYxrIDVQNtyUOFE202wfVHjReb3u7zbNL9B01gDXwfplxKGAVBdz5M0XAuLOXKP
	5MnijIVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwNdW-00000008kxZ-3pVa;
	Mon, 15 Apr 2024 14:48:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwNdT-00000008kwp-2l2a;
	Mon, 15 Apr 2024 14:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D30E460DFD;
	Mon, 15 Apr 2024 14:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E2EC113CC;
	Mon, 15 Apr 2024 14:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713192522;
	bh=ogpbZ9xNksQ+p1/2BEXp3imOyyJTQHkyfqcNvWF10aA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NHxNZKKIppeBSC3JQu3ygrnZyXklvG7/pkDk/jSlNlpA7gGaLQQqTyDt4sdwUqqCY
	 mPjGWgSv6YacD9SisNO+liVkQ+ezivKaoc6zV4gyOlJStEJay7IBWOCbNhi3EQVJl+
	 nuGFLLfV4d/XM5s7ueWjRbUQeQ7bmPWGwSTuM7StSE6+PCTLCKvQjqpNoIHKAnLdLm
	 nSmovcOLbnT0UQGRF7RPCuuokxTouVBpC+eBsfMfLwY/NVLfh14BcKjUSqYU30lcTW
	 hcXSL3qqiGY38y/nmocNRhe+iqmY4a3OdGvldLdIkliGgBMhnvChHx7Oacp9e8UJFM
	 gsbJZQTzYL8Tw==
Date: Mon, 15 Apr 2024 15:48:34 +0100
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
Subject: Re: [PATCH v10 06/21] virt: geniezone: Add set_user_memory_region
 for vm
Message-ID: <20240415144834.GC2320920@kernel.org>
References: <20240412065718.29105-1-yi-de.wu@mediatek.com>
 <20240412065718.29105-7-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412065718.29105-7-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_074843_803147_0A02E13E 
X-CRM114-Status: GOOD (  19.30  )
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

On Fri, Apr 12, 2024 at 02:57:03PM +0800, Yi-De Wu wrote:
> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> 
> Direct use of physical memory from VMs is forbidden and designed to be
> dictated to the privilege models managed by GenieZone hypervisor for
> security reason. With the help of gzvm-ko, the hypervisor would be able
> to manipulate memory as objects. And the memory management is highly
> integrated with ARM 2-stage translation tables to convert VA to IPA to
> PA under proper security measures required by protected VMs.
> 
> Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
> Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>

...

> diff --git a/drivers/virt/geniezone/gzvm_vm.c b/drivers/virt/geniezone/gzvm_vm.c

...

> +/* gzvm_vm_ioctl() - Ioctl handler of VM FD */
> +static long gzvm_vm_ioctl(struct file *filp, unsigned int ioctl,
> +			  unsigned long arg)
> +{
> +	long ret;
> +	void __user *argp = (void __user *)arg;
> +	struct gzvm *gzvm = filp->private_data;
> +
> +	switch (ioctl) {
> +	case GZVM_SET_USER_MEMORY_REGION: {
> +		struct gzvm_userspace_memory_region userspace_mem;
> +
> +		if (copy_from_user(&userspace_mem, argp, sizeof(userspace_mem)))
> +			return -EFAULT;
> +
> +		ret = gzvm_vm_ioctl_set_memory_region(gzvm, &userspace_mem);
> +		break;
> +	}
> +	default:
> +		ret = -ENOTTY;
> +	}
> +out:

nit: the out label as added here, but it does not seem to be used
     (until [PATCH v10 11/21] virt: geniezone: Add irqfd support).

     Although it probably isn't hurting anything - other than automated
     testing - it would be best to add as part of a patch that uses it.

Flagged by gcc-13 and clang-18 W=1 builds.

> +	return ret;
> +}
> +
>  static void gzvm_destroy_vm(struct gzvm *gzvm)
>  {
>  	pr_debug("VM-%u is going to be destroyed\n", gzvm->vm_id);

...

