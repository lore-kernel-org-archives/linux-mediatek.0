Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D40C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 04:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KRcJIrMzxJG0c3++4DFKI3bqDEkoP+vf0haDGfbSXo=; b=n7i766ITuvN2EJ
	z304oSF03COszG0RbSWpfIHYR6q5SSf8POgv9yHjh2OGrLuqbJhkUO2a/qHrbBfREotLjh5zw2o+P
	TgmQ5nMCs0p5GbIW7TY9HlVFMEl3hw/nSNaZ4sB2G4SJlZ0SsEh/2wHdA6Wr6BNY05YafJ1rHd5SU
	Kt56bIXDAosvPrYpSRcUBSjusM/nq9v2eYusUCYqKbrj1NCkymhS46L5UoPFhZECXrJ6BJ5k90/CV
	9ImM00RvTnWkZGsHQ5pv6sAL3dpiaPDNtiBrmey/j6E6i0f2TwixVTibYOiQ3U9IECGSKqYVxT2Nj
	GrYb57/zsJe9oIsB+QsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwyrP-005mQH-Gy; Fri, 03 Jun 2022 04:24:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwyrF-005mNq-2U; Fri, 03 Jun 2022 04:24:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A8EFEB82155;
	Fri,  3 Jun 2022 04:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43D8C385A9;
	Fri,  3 Jun 2022 04:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654230257;
	bh=VcPv64F+arj4pM7sQW/MRMnr268G7RMioGuGKmtHk1w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HDBMkA0+jEtpi4t7vOKaGdzUkAsaY00BCPd5wU8y2xAN7CY0ONP/UwmBqk/AMmdgR
	 e/LoAEKtxBkQT4uawhQ/n/sSOnNkltOL+tpo2ADh9bJVIziT1sUkiLRo+/boOnIWXa
	 a+Hbb8MzmeNEy4DzOVgykKB6ecY1KvdFDD+AXpiQ08FVTbSVuGAdQDb9eoCDmfI2ES
	 dpCjtC3fLce7y2dz/X/gwjSWGhGTUmdrn0CjBVwsx4fnotxRIE8GDLV/tR/Fo1snSd
	 8Hq9ywuDwFzujTwvttyy8W8w4I6CubEqL/bsmMRwcEuNi8mhUM0qulhjIfN4tay8BR
	 0zp/prdI3fN7g==
Date: Thu, 2 Jun 2022 21:24:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chen Lin <chen45464546@163.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, alexander.duyck@gmail.com
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: fix misuse of mem alloc
 interface netdev_alloc_frag
Message-ID: <20220602212415.71bc5133@kernel.org>
In-Reply-To: <1654229435-2934-1-git-send-email-chen45464546@163.com>
References: <1654229435-2934-1-git-send-email-chen45464546@163.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_212421_310456_D2776687 
X-CRM114-Status: UNSURE (   8.38  )
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

On Fri,  3 Jun 2022 12:10:35 +0800 Chen Lin wrote:
> -		ring->data[i] = netdev_alloc_frag(ring->frag_size);
> +		if (ring->frag_size <= PAGE_SIZE)
> +			ring->data[i] = netdev_alloc_frag(ring->frag_size);
> +		else
> +			ring->data[i] = kmalloc(ring->frag_size, GFP_KERNEL);

Is it legal to allocate pages with kmalloc()? I mean they will end up
getting freed by page_frag_free(), not kfree().

Also there's more frag allocations here, search for napi_alloc_frag().


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
