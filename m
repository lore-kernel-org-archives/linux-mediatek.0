Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC135C71157
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jun 2025 01:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J75SlLYXLlBO7wssiAHVyOJ7VlFCCM338jXDoIyXWaw=; b=l6vKCB5ne/BIu3ctH7TYOR/Dy7
	5wsAomt9JIm/xyDLmeUtLZWcDvzKZHAP7FXnNVZOEj9tpWaln1Oo5j7/HPF/cLTX++mDak8h/AxsV
	OlouFOHhkao9lHKs0JUsgx0LfDPWETmTBTOIQ80hVLfjCYEO2H7tlsNtdhn4oYfgWBfTKwTo27QcC
	DRk+kvWnOlwS/0a+e0+R927EuOW1T1tCmK7iVNwiIjFeu07UVmaxTMwUGPgB1MbPG0Ut65lVgDNta
	4YyfrMi7bUmOCPHjFdq/+7tJxnA6PhRLnZDLcCEZ6J6mdaEwy0fUVry1ztua5ohHOGdSImXD+PtX3
	ThBUKoHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhjb-00000008lNC-0ucv;
	Wed, 18 Jun 2025 01:37:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhfT-00000008kxc-0Ou5;
	Wed, 18 Jun 2025 01:32:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C8B7C5C5F61;
	Wed, 18 Jun 2025 01:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98AE9C4CEE3;
	Wed, 18 Jun 2025 01:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750210366;
	bh=J75SlLYXLlBO7wssiAHVyOJ7VlFCCM338jXDoIyXWaw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nPnWAZjJQtcvGlZzCEcQjxYV2v10yVc7Zn2RCEHfikH8DNB3Eyjh9Hm5QoXwLEAY/
	 ocyCCrqfe0gqLkezku9M1RQ+j9NDTL0YyIuDN/RrJ8bGM8fr1nr89Gdg3x2ICcpmua
	 wFRtpwrvqex4w9Mdu/bKK0Xka5I8f1o+ecz/u8zAM76dSdN2+LQpgg1o4N6iz7CVzw
	 D6hDHsuZ8sHxT2zmiLpemMQM1Tz/sf+VJoS48p9LNpGU5i251C3AFXHsUEYbus21uw
	 30Aj+mEV3VK5iOALierPJ/1mYh3xe9Q5YLjd5xbhWZOB651M2ORglP3j1Ev0STPJeM
	 ztGHcgsEtoEUw==
Date: Tue, 17 Jun 2025 18:32:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/2] net: airoha: Improve hwfd
 buffer/descriptor queues setup
Message-ID: <20250617183244.641d9cd3@kernel.org>
In-Reply-To: <20250616-airoha-hw-num-desc-v2-0-bb328c0b8603@kernel.org>
References: <20250616-airoha-hw-num-desc-v2-0-bb328c0b8603@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_183247_185657_C9EB4625 
X-CRM114-Status: UNSURE (   6.35  )
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

On Mon, 16 Jun 2025 15:45:39 +0200 Lorenzo Bianconi wrote:
> Compute the number of hwfd buffers/descriptors according to the reserved
> memory size if provided via DTS.
> Reduce the required hwfd buffers queue size for QDMA1.

Same question regarding target tree, FWIW

