Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698ADCAC5A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uavfl09fN9AVn82uyKjpGR6V8byWIIElxwbENxXgHVU=; b=Cr5wm0f70KVDgveIH2cjP5L6Xa
	LIUiyzS4k2B7joxVIbaQozov9J25q1KZIL4r4btXOjh59/OCtfk2G6E6HOqjkGqIuwzEkypew6chC
	aldffAObzc20HxR7OUT5i1nQAHLZjxUh2xIHzgG9xyUD08eviLaUYlJLcWpfN5PZBfmdjMCO3ipIx
	qle0y58lzSiPlf9CKtfk7FlHm7a3F/Z3qIG9Yqspaz1Kjhz5LjWwuEbPqB+VhJtPveHR7dM1aQPsZ
	mOSj7iGvKWT1WQeYt6QlCzcsGJfTXnEARX9QqhpAQYJvypRdNp7OuKtzWpZkbJka/YaldgKMb74PT
	+fKXdCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1jGw-000000087Ge-2Wut;
	Thu, 25 Sep 2025 10:32:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1jGv-000000087Fb-111C;
	Thu, 25 Sep 2025 10:32:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DC59604AC;
	Thu, 25 Sep 2025 10:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BECC4CEF4;
	Thu, 25 Sep 2025 10:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758796340;
	bh=H0egUGOW0b1bAE1bsFhjDgTj6KHri5hPJSZHFp91dpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBRtAL2qA90G4Zo+RkcTXU1ZR91Vntlh9LPbRZAAzauuiFHCyOHUSu4qBvgEZuZNu
	 IwEr50QnrurnaiXuafZVIuHRsRwYo1UwXvbft7a2+8hJAS7hOpFB7+c0PpaOFT4KHm
	 JMrEb5qDcMP7nziyjQfmecxy+IXnBuVRxsnV4yRkt8vGF4ikbr/GLV6UgZRc+pN4uh
	 jc4OE2Cor+jhPnzjnAlux3eItUbznRXxBt+hsc7aGlU7z34hGkrtFKyVGvW16CKNvn
	 pFUcRG9OIaO8ihFWqO80nIhSGeoSZr5r9Ccz9i2nHFsnLkwLLFy0aROfdsBoCSsWMD
	 18U07S8gqD67A==
Date: Thu, 25 Sep 2025 11:32:16 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: npu: Add a NPU callback to
 initialize flow stats
Message-ID: <20250925103216.GF836419@horms.kernel.org>
References: <20250924-airoha-npu-init-stats-callback-v1-1-88bdf3c941b2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-airoha-npu-init-stats-callback-v1-1-88bdf3c941b2@kernel.org>
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

On Wed, Sep 24, 2025 at 11:14:53PM +0200, Lorenzo Bianconi wrote:
> Introduce a NPU callback to initialize flow stats and remove NPU stats
> initialization from airoha_npu_get routine. Add num_stats_entries to
> airoha_npu_ppe_stats_setup routine.
> This patch makes the code more readable since NPU statistic are now
> initialized on demand by the NPU consumer (at the moment NPU statistic
> are configured just by the airoha_eth driver).
> Moreover this patch allows the NPU consumer (PPE module) to explicitly
> enable/disable NPU flow stats.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


