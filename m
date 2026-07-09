Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB1AC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 17:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pV70xEOvQyB3ukvmw0oiht/Cdcq4jFyt2B8YWj7CXI=; b=n/tErVpmaqzSLdhZQK0EfMB914
	Tg7NgfUTpj0kSB6YvcPxNZPGUjgyya2mpne7v2+KQuAOPxHfWsTAh08/fG/txb1y74veAgo/N9rnq
	XaUOU5PAYXwklh/dPzfA3ckVG1+3h9Cs80LFc/9kALpYbLwovc7ZuzRPoWtzLUb7tJ9coOHDHPQ27
	y454/Kbi+syfV3lybHz8Ed6vR2TbFpd2pgieGpVrKURs3YcGq6dtIqlgLbNm3tcKlyd9NUce/nNdS
	3qfUyedvys35oJEs5j1RDZd2ubeOLFt+eoREUQBNTzC28fEsI0QLYE86uMUyZTSKaA7WimL9NC2/I
	iuHT05fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsJD-000000036Y8-3pvC;
	Thu, 09 Jul 2026 17:13:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsJB-000000036Xv-3II5;
	Thu, 09 Jul 2026 17:13:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3DBCC61381;
	Thu,  9 Jul 2026 17:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7581F000E9;
	Thu,  9 Jul 2026 17:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617189;
	bh=1pV70xEOvQyB3ukvmw0oiht/Cdcq4jFyt2B8YWj7CXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QkSi7MVBWoMXoAzvPr4vFBO+UOTmSx0mkflKFEeuc7vobI3Jbqwu5iTWL1GvopSRb
	 f4SlmQRhVJ8Qf6+C/iSIVrvPXdD+Ljz2j6xRwtWg9/kepoLUkLXmEYxmZhveT5Jj9C
	 Jz2h/abnW5jgGd4+eLH0B0I7QOLliL74pkqi4mQGHVbb7rEMimQcdFoJfp4tpyrSmJ
	 7xA1/u/t8BH6C05HeazzEhfzzDQys5AJfYhBW4dJ1peg07TbJnnsxcqD9yTlpSJbqe
	 TrXWLB0qzD8ycP7cfZbGHGQXIXc9fFUchp9KMuguNs3eMWg9EWdm3RNhKnQkBKDvXY
	 9w7A9xnz+l+NA==
Date: Thu, 9 Jul 2026 18:13:04 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: fix ETS channel derivation in
 airoha_tc_setup_qdisc_ets()
Message-ID: <20260709171304.GV1364329@horms.kernel.org>
References: <20260704-airoha-ets-handle-fix-v1-1-42516b3549a1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704-airoha-ets-handle-fix-v1-1-42516b3549a1@kernel.org>
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

On Sat, Jul 04, 2026 at 04:21:38PM +0200, Lorenzo Bianconi wrote:
> Derive the hardware QoS channel from opt->parent instead of opt->handle
> in airoha_tc_setup_qdisc_ets(). The ETS qdisc handle is either
> user-specified or auto-allocated by qdisc_alloc_handle() and bears no
> relation to the HTB leaf classid that identifies the hardware channel.
> HTB derives the channel from TC_H_MIN(opt->classid), and ETS is always
> attached as a child of an HTB leaf, so its opt->parent matches that
> classid. Using opt->handle instead can cause two ETS qdiscs on different
> HTB leaves to collide on the same hardware channel, corrupting scheduler
> configuration and stats.
> 
> Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


