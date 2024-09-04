Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F0BCD37B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kk4gO4tbQk5myT6H6EDFsqisfzOOs2qLr0/0+zkookg=; b=yMhi2m7o2Zpu8n0KXot4j6zTh5
	x584ylRLYBVqm4bXSfmPV5WUVx8VLFAd079Bf3iTU32SogBV9pUIbEy5Unn1KmwuBfYgHuwu2GST3
	wHm37v7Nl0Q60OugMnxsIcV0A7zpm+jOviLVOzU5wme19HPpilT6GNEef89v3qpCqw9bRpyw/o0nr
	d6KfMtLC3aBdBtej/fngy6FGKaSSOnqiRHp7Slaf5/3SCYmPNHIJMbz0m8O+WdsrqxIPqQNwT1H3o
	EBx1ByTDqu03Vj+f3kgXXY9TZWOytzGtQ7eByHt2iL7aMOspGfQZOPL7QyAcQuXNjcRnrT+4KgKe5
	euptVakw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqsT-00000004l9c-3Oss;
	Wed, 04 Sep 2024 14:20:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqrE-00000004kpP-1aFk;
	Wed, 04 Sep 2024 14:19:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B26BA443D9;
	Wed,  4 Sep 2024 14:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EBAC4CEC2;
	Wed,  4 Sep 2024 14:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725459579;
	bh=oJyojKlM/C+yToRnqM61qH45uf5mvwOG2dI32gxQlVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VsxZhY4V0mf3a2d/nphDZnpSQbeATEFV2iWzKcgNiqFq3MK1wzCFozOuuM96c+hfO
	 o5xvwTy/ZprJM0nwFKHBACbxX33x87jALH/yvWjl/JpEDx0J0AyOOWfqqn5F+ganVO
	 24aZScIodimjbkN4WpJpj+dDukoEyVutGRdBOM0U=
Date: Wed, 4 Sep 2024 16:19:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yenchia Chen <yenchia.chen@mediatek.com>
Cc: stable@vger.kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 6.6 1/1] PM: sleep: Restore asynchronous device resume
 optimization
Message-ID: <2024090420-protozoan-clench-cca7@gregkh>
References: <20240902093249.17275-1-yenchia.chen@mediatek.com>
 <20240902093249.17275-2-yenchia.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902093249.17275-2-yenchia.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_071940_547283_FED80426 
X-CRM114-Status: GOOD (  15.04  )
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

On Mon, Sep 02, 2024 at 05:32:48PM +0800, Yenchia Chen wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> commit 3e999770ac1c7c31a70685dd5b88e89473509e9c upstream.
> 
> Before commit 7839d0078e0d ("PM: sleep: Fix possible deadlocks in core
> system-wide PM code"), the resume of devices that were allowed to resume
> asynchronously was scheduled before starting the resume of the other
> devices, so the former did not have to wait for the latter unless
> functional dependencies were present.
> 
> Commit 7839d0078e0d removed that optimization in order to address a
> correctness issue, but it can be restored with the help of a new device
> power management flag, so do that now.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Yenchia Chen <yenchia.chen@mediatek.com>
> ---
>  drivers/base/power/main.c | 117 +++++++++++++++++++++-----------------
>  include/linux/pm.h        |   1 +
>  2 files changed, 65 insertions(+), 53 deletions(-)

Why does this need to be backported?  What bug is it fixing?

confused,

greg k-h

