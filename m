Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF14DC3ABD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 May 2025 20:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atTjb5B4Z+rWcdo7ucJxt74SrGio1T7GMMsn+hU1GQ4=; b=Pt/B/siJN6qYl2VWGEPaxBeDmC
	s3Hn8m4qOFU+RPHWTmNJbEkhQLiTDBT1xCIdtylo2Srd+iBYdIZWXZzEiTlJufCaAAVuSzCZ94KLX
	jZ6hz+kk6L20161IpUw9/bUopXqe4KFjrergSU+yLuVpYGoNBwSqPtgqt1aJIOMKt/6kGpxkqhssf
	TyhNTG7vr8kMBywBdja3sTwcAhKJYE3Z7vzquiIUPE9CH9nvUq9785toQauFaXTA0iGj3KgZfSkZd
	m1udPI86gid0+J7lv75qeXKj72iDTzFAGZmqgHqwGOFxE+jwNOcS1HZodsUeKzsT9Xs68FoDU2zpI
	u7GDqQ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG1Zc-00000004Yip-448G;
	Fri, 16 May 2025 20:22:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG1UE-00000004Y0h-1dho;
	Fri, 16 May 2025 20:16:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F3AD5C544B;
	Fri, 16 May 2025 20:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE39CC4CEEF;
	Fri, 16 May 2025 20:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747426613;
	bh=qFF0calRyniBymu6pWsXocIvfCO34tQjr8bYALVmbiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDMK3I8boQcEejsRxDXJqTCEi6T4NZujXSDb8t9AIK+MZRlbYhD3Q3i0JcvQ2i9a4
	 HQdPz0NUy9EfbG6BkA+/E8iuD0Du+Oz4UVjW1LAGNO7+H/aWiQulL1g5wLh4fZZHo0
	 U8sF3hxac5XF5SjsZ68pT4NAxk9COp/6sDC7XSrUJy1RDfSKH6MA59HND6URRtXfCn
	 hXLyjzc0kVoUK7bQSz1z98GhrIOYaLQlijZUuiApAoY/ltvuq+pwFumQNFUFr4g0DS
	 9GSVbeznufmWECsVbsIMFTd6Id0XqMOe+M3VHbsB4a1FTInVFGc+pPvWrRCQPdfkW3
	 oQV/mFrSP6Cag==
Date: Fri, 16 May 2025 21:16:48 +0100
From: Simon Horman <horms@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 4/4] net: airoha: Use dev_err_probe()
Message-ID: <20250516201648.GJ3339421@horms.kernel.org>
References: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
 <bb64aa1ea0205329c377ad32dde46cdf5c232db9.1746715755.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb64aa1ea0205329c377ad32dde46cdf5c232db9.1746715755.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_131654_472118_B7F6F221 
X-CRM114-Status: UNSURE (   8.42  )
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

On Thu, May 15, 2025 at 09:59:38PM +0200, Christophe JAILLET wrote:
> Use dev_err_probe() to slightly simplify the code.
> It is less verbose, more informational and makes error logging more
> consistent in the probe.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Simon Horman <horms@kernel.org>


