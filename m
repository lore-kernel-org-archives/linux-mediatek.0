Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F038CC76196
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 07:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/3HUyB2hGBpLX9jjbXCovHPkV0vXO26F83Inp9UT+c=; b=r512N15wnxI3sSqFsYwN8xrmGN
	hYQ/y05qzhQqGfKley1IvBW0IT/7y3Q8j77Ec+74YuQX1cZvmfVFgjKz3rc/ed0S35k5LEDFiIXNf
	67LnJiY4PuKYSph+JHjbRB0IISTXIb/URxeasD3DusKCs/K5zzGuq6sXfLTkcfYmRUTh7G68PR3jT
	8f2hdIJqkO57n0IGvSKCErhEV6UDCj1QHKwtOleyt66RN+cvYXAm5K9Hzjt2cgZ5cCffwshhpGzGT
	e9PkoAPIKVVG1RKQFrX4JXyqG5fWKqczi+mBPDeXFKtTD+YgN9rdLzQo+mFGfcCF157bH1LF4m0jb
	rJYwfFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piVhx-009wAa-0j;
	Sat, 01 Apr 2023 07:31:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piVht-009w8Y-0M;
	Sat, 01 Apr 2023 07:31:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7427C60B27;
	Sat,  1 Apr 2023 07:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FB3C433EF;
	Sat,  1 Apr 2023 07:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680334280;
	bh=yxotTr0zxaGom3LBZw261sC0CICDm5riK9vwoxtg8fI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YDZZkNj/ugAPkECw5o55NFCzhC1nKjEsKo6S66MmE4Nr/9kth8qcaifk2eruc6gDn
	 VND7aobYaFwBgoNM5vYwWZD5bXsNa+cLOkPVcCEe7D/1CDjXYd5+k88r5+L9p6XUSb
	 BBcSg49N5+ODSeDgGg+AfnkPaxWWLILASu7lU5RVzrQkPGjZRL2bp1O05vcini2+Xg
	 IAez82XW369FhiRTKX1vIk54kTT1J/1ar2+R6cyjf17g8XiZqjLA1zfqD8sGKlsPzs
	 pyb/6BqJLzdtwFPwUVyUC8k3dd9pWvOvMW+fO9sA/rAUXiaUG9MLoMef37W8mILuw5
	 7/mok8SgrjMxQ==
Date: Sat, 1 Apr 2023 09:31:16 +0200
From: Simon Horman <horms@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: use be32 type to store be32
 values
Message-ID: <ZCfdxGS1Bj5LullK@kernel.org>
References: <20230401-mtk_eth_soc-sparse-v1-1-84e9fc7b8eab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230401-mtk_eth_soc-sparse-v1-1-84e9fc7b8eab@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_003125_214744_CA483942 
X-CRM114-Status: GOOD (  13.66  )
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

On Sat, Apr 01, 2023 at 08:43:44AM +0200, Simon Horman wrote:
> Perhaps there is a nicer way to handle this but the code
> calls for converting an array of host byte order 32bit values
> to big endian 32bit values: an ipv6 address to be pretty printed.
> 
> Use a sparse-friendly array of be32 to store these values.
> 
> Also make use of the cpu_to_be32_array helper rather
> than open coding the conversion.
> 
> Flagged by sparse:
>   drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c:59:27: warning: incorrect type in assignment (different base types)
>   drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c:59:27:    expected unsigned int
>   drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c:59:27:    got restricted __be32 [usertype]
>   drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c:161:46: warning: cast to restricted __be16
> 
> No functional changes intended.
> Compile tested only.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>

Sorry, I forgot to tag this for net-next.
I can repost if needed, after an appropriate pause.

