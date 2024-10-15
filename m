Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FD5D1D86E
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 14:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xNghHW5lZHEgfsYoTDddVRZY0cAsmokTjRai6i8cG0=; b=qecUTrZIz+USkFDRVYBtCQ0gy8
	Cit9LjK03pdvaeGWDSjuyf4B6Jd2Llvd3tl8/hiSjbN7Inebd8RTFm9ptfGbnYoJN7dZuNMJWp5zp
	Ql1js0rtW167nmnEa34bT9uPax/41OMiIBbdmuhRt8Ryor29ktiGaBL2bwBFSM/TqYgWofBAWUcPE
	bcFD4CjFwVdglf280sBfXbxHZNznZkZdPn52Qd7DoJtinfkmVK6mZc9chUzYFcdREekXABciktSkU
	XfMO9gMLoZEPS4Pn4sXC4ZYy3mYZ8a4GsyyeXKSCMC0T4oJCi44J1BM7LGFwrn4hN9/2xNDe8xsTJ
	09esi1Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ixk-00000008bBY-1ibs;
	Tue, 15 Oct 2024 14:55:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0iuw-00000008aJu-0uxz;
	Tue, 15 Oct 2024 14:52:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 79BB0A431CF;
	Tue, 15 Oct 2024 14:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAFEC4CEC6;
	Tue, 15 Oct 2024 14:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729003977;
	bh=ULeqHrjM6cbbb/s4qCgU3Og1jHFr033Dqlv56eFagKE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SRQL9w0SZlfryymgG1uvMKHL6/+N8g2/+6xim/qUoXxzPvLDCvsEfXBp7uKJpf+x5
	 soKHGgyzAnC8DrtIG5Dv0sqWxym/2OsWLimZyPgAInZ/xbuMWR9UfEdAhbbJmS/n9s
	 /5rQrcndHIJV3L0AkOxxYK0jGmigK7JZ8YiTT/ukTyUU0tr13I7j/jE4s8oxtRdTK8
	 RoY9t1hSjvl4FE7OKA3fRi4trdrNCzK7ctWuFKb56adtMZ9gMURKiW+OH8FvftMBJt
	 v/d5cHjmzSeflwm5+rhSg9KChnjfg87h0Zw5GFqspKbgDsVPpQyBOAMMzX8CV/Yrly
	 UPrhu1WDT5sYQ==
Date: Tue, 15 Oct 2024 07:52:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH net-next v2] net: airoha: Implement BQL support
Message-ID: <20241015075255.7a50074f@kernel.org>
In-Reply-To: <Zw5-jJUIWhG6-Ja4@lore-desk>
References: <20241012-en7581-bql-v2-1-4deb4efdb60b@kernel.org>
	<20241015073255.74070172@kernel.org>
	<Zw5-jJUIWhG6-Ja4@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_075258_354045_3C8F7103 
X-CRM114-Status: GOOD (  15.96  )
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

On Tue, 15 Oct 2024 16:39:08 +0200 Lorenzo Bianconi wrote:
> On Oct 15, Jakub Kicinski wrote:
> > On Sat, 12 Oct 2024 11:01:11 +0200 Lorenzo Bianconi wrote:  
> > > Introduce BQL support in the airoha_eth driver reporting to the kernel
> > > info about tx hw DMA queues in order to avoid bufferbloat and keep the
> > > latency small.  
> > 
> > TBH I haven't looked at the code again, but when I looked at v1 I was
> > surprised you don't have a reset in airoha_qdma_cleanup_tx_queue().
> > Are you sure it's okay? It's a common bug not to reset the BQL state
> > when queue is purged while stopping the interface.  
> 
> So far airoha_qdma_cleanup_tx_queue() is called just in airoha_hw_cleanup()
> that in turn runs just when the module is removed (airoha_remove()).
> Do we need it?

Oh, thought its called on stop. In that case we're probably good
from BQL perspective.

But does it mean potentially very stale packets can sit on the Tx
ring when the device is stopped, until it's started again?

