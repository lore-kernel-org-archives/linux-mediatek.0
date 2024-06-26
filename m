Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F101C27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 17:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ips9LKfIKk2gftFQJ4aGGOOr8WjuNVuCguVgK1bZCII=; b=rV1C7DsGbPNDNH9SDaBrRf2YmB
	B8XP0IqTg12ysWjUoXBgvmxvvWWPD4L43mrL6VmOCiMWHdOjCZgjY8Qng01ml3AMjGDIphPcfZCGt
	waCfg05hMyJ5wrv1EkJKAbBn1N5PXko7PWg4n3vDqWc5IW1qe7j5XXkKDYf3vXRfXtZFyBueGLovx
	2Iaacr+0YgMHmkckOqexrx7820dOeYHIFZTWIYot/6N2P+qD44/SdZ3iceihOOAxhUbqe25F3jvUB
	NshYLQrKgmlvOJhMeJym4gkeS1V7omBM8VIvCWt/lshsMf4dlrL2u1yV7/NNSfsKobsABnKtyUgd6
	DN+/j3Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWCJ-00000007iiQ-2WqC;
	Wed, 26 Jun 2024 17:12:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWC7-00000007ig7-0ULA;
	Wed, 26 Jun 2024 17:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ips9LKfIKk2gftFQJ4aGGOOr8WjuNVuCguVgK1bZCII=; b=AsKI3NkMkZM/E+8d+ogyXSVqb6
	E2Kt2EBPYgyXV4BsxMJytCoSTynkI4nDQHyOwvnAdpbjnPa7rt3/88wP73qJpyCfgE2pLhgPgFoyG
	jmTplXmvbMrobvZ+17hYKPnhXONxr6ueguLs70kKRgj/uxgHdjzTXmn872eteiYbi4bc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sMWBh-0013m9-S2; Wed, 26 Jun 2024 19:12:05 +0200
Date: Wed, 26 Jun 2024 19:12:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexander Duyck <alexander.duyck@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v9 00/13] First try to replace page_frag with
 page_frag_cache
Message-ID: <d2601a34-7519-41b6-89c6-b4aad483602b@lunn.ch>
References: <20240625135216.47007-1-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625135216.47007-1-linyunsheng@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_101231_175617_0D068B2C 
X-CRM114-Status: UNSURE (   6.17  )
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

Silly nitpick, but maybe for the next version you change the Subject:
to Tenth try to replace page_frag with page_frag.... :-)

   Andrew

