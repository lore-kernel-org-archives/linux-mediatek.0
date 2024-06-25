Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB705C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 23:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YcVdfcwdrzt5k4I1Rn+CNAL1JwxpTitUNgFQYyi7SzQ=; b=V3m1Q4lJ5fsKos12RE4kaq2nSN
	ChykfGaE3K66dX1qFqY3ylSe5l1Vz3aqXQTLrScDz9DAzsNcvPGHgLAoaI6k7M5WgTwMceRJZEjQk
	zXVhAbMKuNjExf4BTGrySDWvB9LRZpk2HarDeZfodo2KRPZlObhpSgHE9QrqAoL3aulP3qShXYeRE
	BusQHiR22yHBxEmoZmN7T4yg5FL8SOEjq0Q77yyzvFJre0m6nGpcGMgK+ZrxjxTgoXlNEgr5aSjYt
	PU9Z0I5IW3BLMvGw7ZPRE7G5hGXKE7FNEbX5bXbE2siW6TAtSjvxEZYrDSWAF5GyYUIQw+A1Y/QkC
	pgnLoXXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMFZA-00000004mTy-1qiy;
	Tue, 25 Jun 2024 23:27:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMFZ3-00000004mRn-16bu;
	Tue, 25 Jun 2024 23:27:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 75AF4CE1FAC;
	Tue, 25 Jun 2024 23:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE0CC32781;
	Tue, 25 Jun 2024 23:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719358021;
	bh=JNPQ2HaQaJA9py3STciE5ETfWcfSH3lkOJTOv3+6uUM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mQPlY/Wpw5JhwkCt00yEbmdNphHDjboo9LK/IUNFYMLlPHJITvlUrhAg02ZqInyKW
	 NMvPpyOv8VBfbExwb/Tnn9s2U0RXSpcMEu3kRMcZpYoss2nOXg3AyRUuTAlLdLgTd3
	 nHRQqM9f6zl4uJ+wfl/DYyXMn4Sl/8FH99mF9sXTrZSAYUC4Mop49fo1y5+OTSimtP
	 ffypwoc11IbMFjDwOCJusBlK70NLoMrW3O4Y9FratPDHTPQItNF+Uj7y5goUgPBa7K
	 ye4kOHv83dmb+B3iYbYVz42Ku6gtnzYvC8vFiuru23KbdmSni7oAHg8p73twu9bcYc
	 gY9OGgub01jQw==
Date: Tue, 25 Jun 2024 16:27:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: <davem@davemloft.net>, <pabeni@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Alexander Duyck
 <alexander.duyck@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next v9 00/13] First try to replace page_frag with
 page_frag_cache
Message-ID: <20240625162700.56587db3@kernel.org>
In-Reply-To: <20240625135216.47007-1-linyunsheng@huawei.com>
References: <20240625135216.47007-1-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_162705_681266_FE7D68B7 
X-CRM114-Status: UNSURE (   8.29  )
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

On Tue, 25 Jun 2024 21:52:03 +0800 Yunsheng Lin wrote:
> V9:
>    1. Add check for test_alloc_len and change perm of module_param()
>       to 0 as Wang Wei' comment.
>    2. Rebased on latest net-next.

Please do not post a new version until you get feedback from Alex
on the previous one. This series consumes all our CI resources,
we can't get important patches tested :|

