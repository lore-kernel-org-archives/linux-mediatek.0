Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CB3CD8C89
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jun 2026 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Zf0m97OgoTucNTnDyhotBDI2qtIuVu0YxmjCd+niLc=; b=ytgUidWag5outmtwCtwkwLAWkY
	cH/TURCGq2kZiZ7qfQLYaABoNsR7KYhQV36YvSgMcspNvx/ITdvMSgpZjTwYd3jiy15vr+w4UeSLF
	cP3q6dkonMjFMtG4BNPMESwUpY4AFWXnnaJEzO0FSMXrg9RL9yKtXLBdHzbJup6qglEorMkaWbTe8
	2NyYgxY7eFb0L/nyFyJ7o3ovqeamvFlWUL7pHFor03jUFtgXKX7K1PgtwVTIUlXowWm934DgTEnjh
	c/2tJ+0Zg6sdCNaG4pcraOEZTHXvG7p4c08oouiBJD+VSI9KajE9ugaDnWQr+xTQWjFG0fvqyzRMz
	GJSdNmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHmm-00000002O4q-1NX0;
	Sun, 07 Jun 2026 17:59:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHmj-00000002O3O-22uq;
	Sun, 07 Jun 2026 17:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/Zf0m97OgoTucNTnDyhotBDI2qtIuVu0YxmjCd+niLc=; b=uOSn24Ne3rG8pgy8ZmDnF7JrgC
	JIQgnG892K+WKMichL5TzfvCURJ6PWDszUyPbZl5imeD5mE8ZLvfMDB/KgsuEVMJ19VnTboJ/khRj
	417BdqDtr3lvgz8RD2ksIIb0aUuvvrKP47szBy7FHlgngGu43eNHFslfAezouo0ctvLQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wWHmb-006UZP-QO; Sun, 07 Jun 2026 19:59:37 +0200
Date: Sun, 7 Jun 2026 19:59:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next v2] net: airoha: add ethtool priv_flags support
 for LAN/WAN and GDM2 loopback
Message-ID: <33c3a87d-ad97-4f6a-8f76-ebab80c496ac@lunn.ch>
References: <20260607-airoha-ethtool-priv_flags-v2-1-742c7aa1e182@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-airoha-ethtool-priv_flags-v2-1-742c7aa1e182@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_105945_526928_7E16E84C 
X-CRM114-Status: UNSURE (   6.03  )
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

> When a GDM3/GDM4 port is set to WAN mode, enable GDM2 loopback to
> support hardware QoS. Conversely, when switching back to LAN mode,
> disable the GDM2 loopback and restore the default forwarding
> configuration.

Why not just use the presence of an off loadable qdisc as the
indicator to change mode?

	  Andrew

