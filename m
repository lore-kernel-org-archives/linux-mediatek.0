Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD263FF886F
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2026 01:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iH/p+QtR2LkX7EPSpsttq7TDnYDbp0jfIyCaRYZNvX4=; b=QDaRE8a4w2f93rcjwId3T3dn78
	e9lkXarMczkbsgA0SoljtOdaUpuu5xAPere+skyfFau5ERKmw4vCv/6SO2Z9qDydKgT4s1gKc5uNy
	PBYPMTDCqOo97fFxcq5CV+IYS6l62OFG5xOsFCGtsxgXfbTYHHBJ8U9wCmDfAb92PkTyY6SRGSW+G
	VTAatkTHJNrUTEAXvqxMVcTsviiP7C8+GZUCUCf+fsG2yv6CCiBsm99b9ByF7LORXGkb/pTLwXXje
	jnZU2mvhE2hUVvjf8iRYP+68K4spwwDzy51eb6E4mjiDpGnNst/IEtCsy6rQRL9ULkp1w8dE3jIS1
	2f7aWL9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIcPS-00000006CqT-0bT9;
	Fri, 01 May 2026 01:11:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIcPQ-00000006CqE-19zB;
	Fri, 01 May 2026 01:11:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EF3F60142;
	Fri,  1 May 2026 01:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B61C2BCB3;
	Fri,  1 May 2026 01:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777597871;
	bh=iH/p+QtR2LkX7EPSpsttq7TDnYDbp0jfIyCaRYZNvX4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kjs1zysKsB5u7Ub6LZJvdV9NON1tf33hwhMQ7GdozOwBN+QXknDE1Wwy9vbibNOOs
	 t/xyBX7jJmN0uGNNj4oscsFZb+JVUp4ZSDf2tsDmxtPinpCoakaV2W9rlh/5AigPby
	 L3Oumpzq5ZSiZo0//SAWrAV17vh+udSPf7Tsjr+Ywt6FYKKT/vEtzbdcLqtPAIcz+t
	 xcXXKPCI5eaAhxpT22ulz8aJH88a/xuZlRqjQvX7J2q/WKM46Rj7HEbpa55FbmKAmd
	 FA+Ha2MjzPe3gzRpQo7ihrFSSwvGUdjCHxsjbtFQ2jgO/YwoazmJuPsYaJU0W74q/w
	 UGw1BRjVAjKNg==
Date: Thu, 30 Apr 2026 18:11:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: airoha: Introduce
 airoha_fe_get()/airoha_qdma_get() register read helpers
Message-ID: <20260430181109.68c65940@kernel.org>
In-Reply-To: <20260429-airoha_fe_get-airoha_qdma_get-v2-1-909e791f1dc0@kernel.org>
References: <20260429-airoha_fe_get-airoha_qdma_get-v2-1-909e791f1dc0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 29 Apr 2026 12:54:32 +0200 Lorenzo Bianconi wrote:
> Add airoha_fe_get() and airoha_qdma_get() as utility routines for reading
> a masked field from a specified register.
> This is a non-functional refactor, no logical changes are introduced to
> the existing codebase.

Doesn't apply AFAICT.
If this is because of the net -> net-next merge - please avoid posting
patches which will cause a conflict on merge.

