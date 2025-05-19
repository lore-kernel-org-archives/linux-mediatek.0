Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EBDC2D0CD
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 May 2025 12:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EpdBgejYVJKNVZb7Ea+4U11+FF4jlmF5wfvFxHHhnI=; b=D+Ye65eVjhrQUqkPc20xYtX5Wf
	eVvIRRek6KXaVm4jCSkfoHB8sD+xxXrhUofMibuIuZBW4O+t0B2ufa08BO+A6I/zUDcH6J2PTqXly
	Jc/d7s15KOxSLr41iqAkDk+tnaxJr7fe6/CwR0oBAeoD/+Ub/drtTbs15UE+PvrtZV7yTeCAe6IRz
	iiBj4A2o1RR025865rChpkstK/6b/EQQViD5dxfJUQqnutQdSoi2xLMfj8aQAckA/qC3QGlsNR/iP
	ozHfw5swDZyyCjhtlrFjj/uTq8Jkc8jnzgHZYpmGsq3EXZF8mGtMayMloOeuCA7Mzgd9ncrfJigMk
	kQ8U/xkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzSN-000000097jD-12UK;
	Mon, 19 May 2025 12:18:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzNW-000000096kR-2WJ6;
	Mon, 19 May 2025 12:13:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 032B4450CC;
	Mon, 19 May 2025 12:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD9FC4CEE4;
	Mon, 19 May 2025 12:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747656837;
	bh=f23eUtT7BEUA7/nRp9QvcwG51LrVKaiTyUgVJZIeJsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ol4GBUuX5cs+yypqjzDTvI3hT5PWV7jWmATikdbSM/bjN5ivwqom0uOTRZj8F7lsP
	 Gl2haMmESPnp3/vUIMl+Q0i+Sq7U9nfXvifBwKKbRKW1ZWkCi3gmZmHv/VBCwrnoF2
	 ULP8tcmf/zEwYk1xHvv+IaXVSqm5fjLcu+qtWs8Ulrm+QMEM1FzAAglsCQNoSF8r1U
	 X/pS7HJQPojUt89f5hocTfyyAbrVcJdMCTEWEt7j2YoQ0WDYufDyZP7LyQp0facjEQ
	 Q578vBREYq48EL5lNSZSEyEUCAJnCcYyXSH0pgGL01jT1+Rjxpv+Z5vFSykbOtsscZ
	 HbffsaY+LZiEw==
Date: Mon, 19 May 2025 13:13:54 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/3] net: airoha: ppe: Disable packet
 keepalive
Message-ID: <20250519121354.GH365796@horms.kernel.org>
References: <20250516-airoha-en7581-flowstats-v2-0-06d5fbf28984@kernel.org>
 <20250516-airoha-en7581-flowstats-v2-3-06d5fbf28984@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516-airoha-en7581-flowstats-v2-3-06d5fbf28984@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_051358_656438_E4A34091 
X-CRM114-Status: UNSURE (   8.54  )
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

On Fri, May 16, 2025 at 10:00:01AM +0200, Lorenzo Bianconi wrote:
> Since netfilter flowtable entries are now refreshed by flow-stats
> polling, we can disable hw packet keepalive used to periodically send
> packets belonging to offloaded flows to the kernel in order to refresh
> flowtable entries.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


