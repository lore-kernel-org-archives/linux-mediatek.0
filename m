Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082C6C71136
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jun 2025 00:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyMpJogwVQ/tZ73qOYdz6EzgKEWG6zTOwJhhnHthPQM=; b=WLvBroMxOx+yBrAY8NXJ2qUjm7
	KFM42RKAvrz+s2RoEzCz+UFteiPgPWX8ZNCDkUXT4Qnalgdk+gc572bBJRiN8qzKLw7mhhoUDmM89
	8KcONuIsHfwJ1StHQXVEpla1DHv2ZMq3jJFA/W1wWap9YSgMk5hP/UNEjSxq3e/lFSRZhYgWl6sbn
	2m/bXqzDnGaJJLtUHP2KiQujXqqmBpxbjTbcHnvNgThCR6zLXm8slxRpYruXY+w4u+CwTqlb9kvic
	VOUbmKzOSogqj1liI9nS4q4BwtV1rdthMhncmpBPG+hy9S1mMQ9I6qDI9D+8Q2RGYf4XSK4LWATSz
	oi8XPTwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRgFI-00000008ezX-0COf;
	Wed, 18 Jun 2025 00:01:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReqC-00000008WMu-23kY;
	Tue, 17 Jun 2025 22:31:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF4AA5C5576;
	Tue, 17 Jun 2025 22:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE23CC4CEE3;
	Tue, 17 Jun 2025 22:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199498;
	bh=daWIuCnKOqJxZjDHibvmOWaePziSzoIYshMdU3ihRCQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OlDv6axZhMMRiln0sTMZjX+4xP3daKbFPzNgMsZXR73qzPxX9Djhcknu1eFzKfrq0
	 hDkf/EwKs7v+MyOU5hxueGOLLj4bb+jMK1IaQJP6//3OJ5lv+jxDbTpCKWMJj9uLtS
	 9JfHonaUVBUsUvObWK2dBHSzHjIzmgrMHGfdumwWNV83weAdEyLdFjpNEyDJ8TA3Qz
	 uWKS209HY9QM/ibGkEBrKqOYroAvdzPt29gyHBXQLa4WaS3orfXpFLtvV8ZwzAdRzq
	 XdO1SSLN6jEd3JNJzcPrNlj0JZhDEnvunKqpAlHtFX/+igsEDHAi9J9J9WIK498NeA
	 EUHTwOEQYDeSw==
Date: Tue, 17 Jun 2025 15:31:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Always check return value from
 airoha_ppe_foe_get_entry()
Message-ID: <20250617153131.56a783c4@kernel.org>
In-Reply-To: <20250616-check-ret-from-airoha_ppe_foe_get_entry-v1-1-1acae5d677f7@kernel.org>
References: <20250616-check-ret-from-airoha_ppe_foe_get_entry-v1-1-1acae5d677f7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_153140_572730_891E810A 
X-CRM114-Status: UNSURE (   8.21  )
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

On Mon, 16 Jun 2025 12:27:06 +0200 Lorenzo Bianconi wrote:
> Subject: [PATCH net-next] net: airoha: Always check return value from airoha_ppe_foe_get_entry()
> 
> airoha_ppe_foe_get_entry routine can return NULL, so check the returned
> pointer is not NULL in airoha_ppe_foe_flow_l2_entry_update()
> 
> Fixes: b81e0f2b58be3 ("net: airoha: Add FLOW_CLS_STATS callback support")

Looks like the commit under fixes is in net, is the tree in the subject
wrong?

