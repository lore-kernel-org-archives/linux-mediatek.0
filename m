Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811EFC4828D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 22:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCEeQampurfb6m4YBec/B+qr7aDGIeBOrjfqfm9kqiQ=; b=U23nXHuMA+kgk6dPLRPJYkOjYr
	yFAZIFS24zivsvf+dWvEzFcL/zmWznvxonXfOXpkn5Ze6zpPU0tUaDcGf1DSv+O8IzcQxiATwHILB
	9sddVGWHXTagdOIT1dwgGYvCmJ3TTTRvUX4jS0BUFtIf5DlEzgVyLm2u2m3auCJOpVzGiOTvUMPBo
	xe2ZhIm183VxiWDqF+3M8k5bbXLEEkcb21gT26c/mD99MmggDjGCcRph2zO1rRu8Sd7dH2Xq3AIfm
	rIU4zO/mfs4lzv/Glt38d9wlle6hnbcCApU0gCD8DrX0TLH/8kk0Omzee5V7VLBbjxLm9XiRTjQge
	3iArk1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVfEz-00000009UXY-099G;
	Thu, 01 Feb 2024 22:09:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVfEv-00000009UVz-1czb;
	Thu, 01 Feb 2024 22:08:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0CE1621B5;
	Thu,  1 Feb 2024 22:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE09C433C7;
	Thu,  1 Feb 2024 22:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706825336;
	bh=iV3KjpkcbMu1j2TsrqeOlRj9zSxIctyG0myc+z6mDpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t5A+sGbn3gCifVerFEU+iZKak4tSKAUnolMChaJ0RkBrOUD/4KXiyjQhavKJFabnp
	 OXbGNcWyOJDB0oQOUl7jpXdPrWICHR9CU0qQdLs/QEHoXIS/lPm215viqn1O2kdKQV
	 vA3968AM4loaEeu4wgqesQ6TRs2LcqOO33Eixu2y4VlqtKQ7oohXTkHSeO3nJvahtU
	 5gHMUdzwCvgq7Gy+gO9EPZ+5/8IIR6wg6tqUBLsfOO1ki4xVYXhpH560ywJTITzzSQ
	 84UlHknB4RmvXAzgJjrRT48hYFO4zvgA78Ovsxc2rCD5QiXKwI7q5u5xQ/j/xu9YTY
	 7gxjvMB5Hpq7Q==
Date: Thu, 1 Feb 2024 15:08:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Mike Isely <isely@pobox.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] media: pci: sta2x11: Fix Wcast-function-type-strict
 warnings
Message-ID: <20240201220853.GA2240065@dev-arch.thelio-3990X>
References: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
 <20240128-fix-clang-warnings-v1-1-1d946013a421@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240128-fix-clang-warnings-v1-1-1d946013a421@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_140857_494558_99416A5F 
X-CRM114-Status: GOOD (  17.99  )
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

On Sun, Jan 28, 2024 at 02:12:20AM +0000, Ricardo Ribalda wrote:
> Building with LLVM=1 throws the following warning:
> drivers/media/pci/sta2x11/sta2x11_vip.c:1057:6: warning: cast from 'irqreturn_t (*)(int, struct sta2x11_vip *)' (aka 'enum irqreturn (*)(int, struct sta2x11_vip *)') to 'irq_handler_t' (aka 'enum irqreturn (*)(int, void *)') converts to incompatible function type [-Wcast-function-type-strict]
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

I wonder if the media tree cares about reverse Christmas tree order for
variables?

> ---
>  drivers/media/pci/sta2x11/sta2x11_vip.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
> index e4cf9d63e926..0a3827575753 100644
> --- a/drivers/media/pci/sta2x11/sta2x11_vip.c
> +++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
> @@ -757,7 +757,7 @@ static const struct video_device video_dev_template = {
>  /**
>   * vip_irq - interrupt routine
>   * @irq: Number of interrupt ( not used, correct number is assumed )
> - * @vip: local data structure containing all information
> + * @data: local data structure containing all information
>   *
>   * check for both frame interrupts set ( top and bottom ).
>   * check FIFO overflow, but limit number of log messages after open.
> @@ -767,9 +767,10 @@ static const struct video_device video_dev_template = {
>   *
>   * IRQ_HANDLED, interrupt done.
>   */
> -static irqreturn_t vip_irq(int irq, struct sta2x11_vip *vip)
> +static irqreturn_t vip_irq(int irq, void *data)
>  {
>  	unsigned int status;
> +	struct sta2x11_vip *vip = data;
>  
>  	status = reg_read(vip, DVP_ITS);
>  
> 
> -- 
> 2.43.0.429.g432eaa2c6b-goog
> 

