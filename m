Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD412C369A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 19:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUlKKPlBNcX+ovv1QVnpgE0TYv5pOjsAO1cQONG28sc=; b=ALZpPndk7HGwC6CclFGbzl9P+z
	yXot+hFNkVS2LbgpIMfNxwWSjHuuMYw87grKDf+g8d+/QCwAtC7iAUYCIxH+e0Go8Ccx/4AZGIL4W
	RDy9vXQhwgsGF2ap7PbGOsTKcnz2hJ/Tq92VpLJSJWcn4Mzp4Re2d45PinS4tuKMtj0zD8ZWHsv4W
	QM0rMd4Aie1Tl04HqEXwTU9O5+2iqA80jsfnQpZUMy1MWSo91evmB8YFU7HatDzEVgOLta8jHZnd3
	DsaUUhTgYv4WU2lxpGnESqN2h7WnShwqBCQRykb12SGK3X7hoiPgCbHimx+s9eDs78DLxQXnYCAzo
	mZPgXXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ED6-00000005BTB-3uFZ;
	Tue, 08 Apr 2025 19:02:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2E8Z-00000005AiV-1W1D;
	Tue, 08 Apr 2025 18:57:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C808A49124;
	Tue,  8 Apr 2025 18:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6491BC4CEEA;
	Tue,  8 Apr 2025 18:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744138649;
	bh=Zq46Qr2znB6f0M/kcECH5HtNBXx3KTiGDsDx+biqMDM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GxI+86hHJtfLXQhDGT5iJDwd1kK9NkNKGbdjoKj+gBEg8cwlt1HRH0bOs2wjsFSL6
	 vyflJKROprk1sJBReSSPx1sPx1PUz8vCbXU9+/c1r+CymLUnnLnXOuyfyNCH81xGU4
	 HfcEsOy3e54nmGckI2o8/amiEWhEGoQ6jKZlOfRN9D/jjVA1jk9cwSsqe36CaUsUMh
	 3vRb4GuIXAMzor4aQsl9GFvJDYxV/8Yq7sYt5ItfIqQutsAdcWqtoQ51+rkghqQv/a
	 y98nL9s5PkHlrseLMkIafN7+xIBpz/z+XDTXYEvYgnvxNlGLfrnN0Ff49rrFg6WMbo
	 L+yKsHus4UpWw==
Date: Tue, 8 Apr 2025 11:57:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Michal Kubiak <michal.kubiak@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] net: airoha: Add l2_flows rhashtable
Message-ID: <20250408115727.6b7468b3@kernel.org>
In-Reply-To: <Z_VTpBhntxXPncsv@lore-desk>
References: <20250407-airoha-flowtable-l2b-v1-0-18777778e568@kernel.org>
	<20250407-airoha-flowtable-l2b-v1-1-18777778e568@kernel.org>
	<Z/VCYwQS5hWqe/y0@localhost.localdomain>
	<Z_VTpBhntxXPncsv@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_115731_464317_6822036B 
X-CRM114-Status: GOOD (  11.01  )
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

On Tue, 8 Apr 2025 18:49:40 +0200 Lorenzo Bianconi wrote:
> > I didn't find any usage of L4 flow type in the series.
> > Is that reserved for future series? Shouldn't it be added together with
> > its usage then?  
> 
> FLOW_TYPE_L4 is equal to 0 so it is the default value for
> airoha_flow_table_entry type when not set explicitly.
> It is done this way to reduce code changes.

That seems quite unintuitive. Could you init explicitly for the
benefit of people reading this code?

