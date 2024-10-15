Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC30FD1D88B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lurVBHyTZVTs6Rvu39jJIGHI9M7Fsq+q2m1CYQReI2Y=; b=o0zfRaZCv1e00HASzyPuWFGe2R
	TUn4QPAjt4pyRfWDSyxR326TlpFzndYt3TvfpHyrlxFf34oA1FF+uB+rhnWLOHwjE92s2vC8C/oMp
	QMoWqWDS42rjNkDuBAjSld/DnyIpZRfF1MfKmkxWDCoknwYgHSGygQM2Twos8E8toyTezd8lJQpNL
	86pmCLVFOHmvR/CKTrlLATlbY8ae9mKuOz2frWrTiZPsvq/3OaGvcCvvqEF7W7/DLkt9yEHeNYgVy
	e1X/maJ53PoaUO7dNA/NSIm4gRyKHPrSeSx8ZbnTd7pjX6NVPXcSOg4UgpG4O6M5HE1cKJlSiD9Pj
	t7DuzYWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kl8-00000008w27-3FC3;
	Tue, 15 Oct 2024 16:50:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kjh-00000008vji-2fcn;
	Tue, 15 Oct 2024 16:49:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB6F6A41D0E;
	Tue, 15 Oct 2024 16:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03A3C4CECD;
	Tue, 15 Oct 2024 16:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729010968;
	bh=DcKp5q+RHk+DHa/BFz1tID2TndoFA5bGkqZxw6rymp4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k5a10nqRl3p5qSk2VIfEQoEAxcK2ZtEZPtoeJJmx5hRDfq3oOxVefVb2qoj0XzSe9
	 f9LOPY45DXOpNse0xHNSEvI1GlQPfOtJrYZYnCgkA+QlFCd9o77hDYqGvo8VnkHqVg
	 G4u8/SwPayhuHkUIXz1OStFWR+HgC6RTllpn+NX/27oEJmrkmpsNgZKI0N0bAjrNAO
	 90CEqvroXFuyn7CJ2P7bQrJrfNVAYFrUTibqKX1kwaWOVtTI6H01aVrPGp7uhIwhxz
	 Fv+MKcXKv9y0o6hZj25KMIUC/vG0YnylvLhj0VW2CQvcCmRF0wqLkX0LOOIBdMdkJK
	 xSrQp9IO1+2zQ==
Date: Tue, 15 Oct 2024 09:49:26 -0700
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
Message-ID: <20241015094926.594c9827@kernel.org>
In-Reply-To: <Zw6ZyoJCv0_EOnpf@lore-desk>
References: <20241012-en7581-bql-v2-1-4deb4efdb60b@kernel.org>
	<20241015073255.74070172@kernel.org>
	<Zw5-jJUIWhG6-Ja4@lore-desk>
	<20241015075255.7a50074f@kernel.org>
	<Zw6QUxpdnJtorc_e@lore-desk>
	<20241015090952.6bcb5856@kernel.org>
	<Zw6ZyoJCv0_EOnpf@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_094929_770519_F9347C6C 
X-CRM114-Status: GOOD (  13.94  )
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

On Tue, 15 Oct 2024 18:35:22 +0200 Lorenzo Bianconi wrote:
> > So to be clear I think this patch is correct as of the current driver
> > code. I'm just wondering if we should call airoha_qdma_cleanup_tx_queue()
> > on stop as well, and then that should come with the reset.
> > I think having a packet stuck in a queue may lead to all sort of oddness
> > so my recommendation would be to flush the queues.  
> 
> ack, I will post a fix for this. Do you prefer to resend even this patch? Up to you.

I'll take it. I don't think the stop rework will be a fix.

