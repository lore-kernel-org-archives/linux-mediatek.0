Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A53E6FE49
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 23:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gOv4+PXHcISx1FgSRbSk44f968oeYy/3CMM+F4Cj6c=; b=p07l2sSLnF9qPAu3QiKuyXDEYQ
	kCWhS7jl6bIXbHYeu7n7pEaT5ixb3DFOF2MrxzyLcPPPeomewjVP4do4HQcK6Tz2gmixJiMHnQkZ1
	XxEMFPu/d9o/vhROuQ+Gsii3/GgxB5GoqzsD4lrD6x8TcrUiN/PMvoRhkkUoXlky3cRb972YiWT63
	sV7kyDXkYJFoZeqXg/HIt718uSHPn7FVxOtKdShEpXkBxpu9zJ2yX1WoctccekPift75WzIYnfY3y
	LLahg7SNnr68vk/Dj8/qyhE1CRFPyPKDuwFHsBurn561+odplT1ASfrmy7anoJSbfTpQk38uu4FZ3
	MYV41luQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smiM7-0000000Drck-2i1L;
	Fri, 06 Sep 2024 23:27:07 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smiL7-0000000DrSU-1yZR;
	Fri, 06 Sep 2024 23:26:05 +0000
Date: Fri, 6 Sep 2024 16:26:05 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Chunhui Li <chunhui.li@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
	Petr Pavlu <petr.pavlu@suse.com>, kernel test robot <lkp@intel.com>,
	Xion Wang <xion.wang@mediatek.com>
Subject: Re: [PATCH v3 1/1] module: abort module loading when sysfs setup
 suffer errors
Message-ID: <ZtuPjYaA54RmY279@bombadil.infradead.org>
References: <20240906115748.5367-1-chunhui.li@mediatek.com>
 <20240906115748.5367-2-chunhui.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906115748.5367-2-chunhui.li@mediatek.com>
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

On Fri, Sep 06, 2024 at 07:57:48PM +0800, Chunhui Li wrote:
> When insmod a kernel module, if fails in add_notes_attrs or
> add_sysfs_attrs such as memory allocation fail, mod_sysfs_setup
> will still return success, but we can't access user interface
> on android device.
> 
> Patch for make mod_sysfs_setup can check the error of
> add_notes_attrs and add_sysfs_attrs
> 
> Acked-by: Luis Chamberlain <mcgrof@kernel.org>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409010016.3XIFSmRA-lkp@intel.com/
> Signed-off-by: Xion Wang <xion.wang@mediatek.com>
> Signed-off-by: Chunhui Li <chunhui.li@mediatek.com>

Please add a Fixes: tag.

  Luis

