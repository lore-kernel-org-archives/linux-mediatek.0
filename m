Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D57C3DA4B
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 10:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ue/rbI5Apd/9nBLRQjIQDhI53TSMmSDSeg1WQSuCo/s=; b=sCTcbbfIwxmNsIp26YMIRB9ctL
	stlIV1SG29vaFiT7j6geGUeBLl/UiSzOdxcqvF0vXI0pNG1uhuGgLjQiyZgU8IvRKJ74nkzmsvqHL
	ZM1/AdULqYUZ7Tu49RG8OOsDl5lHqMqdc2j3pinOOK/MFSeGG8RQq9f202UqPR2K+CFiHGuWwA+Eb
	3o6n2UXo6nn7Xtz33wbiHSluMZMtM7M4D7xoukIIMc33dtoKAQKoNsa0hVMKd4dXRd9sUtV/UKH+j
	kInNUs53Y5ie99NboJQOtcANc+xFra0aiMO9Iy6KFjA8dX2Nxc9wc7y0cGaS6KfMOBdaAtf9nXVSb
	LeaAU6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU25o-0000000DVcC-3UPv;
	Wed, 17 Jul 2024 10:41:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU25N-0000000DVRT-4Ayp;
	Wed, 17 Jul 2024 10:40:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DC6B3CE16B8;
	Wed, 17 Jul 2024 10:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC61DC32782;
	Wed, 17 Jul 2024 10:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721212835;
	bh=f4QTDJ/98bjwtE4iNzhNPLwgyjpQJs6s0kCqNM7Tmgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMVi5BS3WUgFHjRurxYBd/JLcA6UrxmzE1cJaFQE55On4GmBfKQIHmKQcsPAN1qmY
	 ijjvScowH1myNYumQ1WcIZ2CdlYxs3hPRASc4w12NotCyXWbiDi7X/BzwMyOIRPoxt
	 ol2L7qDCuZ8CJmYsZ5L47Q2wn/Duu5yY51so3p0zmuBAE6XcskHrAxbcRhKyTxyAVL
	 OzqxPQYNkGuI6cIljgIspFBFbRNSpSFyjZJ+4yxAapx6PD85gdkUTlMnlJHetuy9EW
	 uiNMxosOde4pCX+shmCCqUq6bkGcAxjUJnkw4SXhJ0mdh1MEDJgoudYQbzXgGkcSLh
	 p1ivBFadfFyMw==
Date: Wed, 17 Jul 2024 11:40:30 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	lorenzo.bianconi83@gmail.com
Subject: Re: [PATCH net] net: airoha: Fix NULL pointer dereference in
 airoha_qdma_cleanup_rx_queue()
Message-ID: <20240717104030.GJ249423@kernel.org>
References: <7330a41bba720c33abc039955f6172457a3a34f0.1721205981.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7330a41bba720c33abc039955f6172457a3a34f0.1721205981.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_034038_530762_1DCC3D06 
X-CRM114-Status: UNSURE (   8.12  )
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

On Wed, Jul 17, 2024 at 10:47:19AM +0200, Lorenzo Bianconi wrote:
> Move page_pool_get_dma_dir() inside the while loop of
> airoha_qdma_cleanup_rx_queue routine in order to avoid possible NULL
> pointer dereference if airoha_qdma_init_rx_queue() fails before
> properly allocating the page_pool pointer.
> 
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


