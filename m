Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E95C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 14:49:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82D5D2075F
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 14:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U4YcHqm1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82D5D2075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1jrBJhkRG4tL0m87I4VGTwZQBM2rmCxsXnuu3HAxB0k=; b=U4YcHqm18DLeCu6UJDftmcWo+
	i8Zr4Q8L66gJbpRoqs0DhQLa1NABfsWgEBhuiQ5pqjGurX4rsniaX2vgNpvmmRNDj380W5QfcbS6p
	TqylMXATKn1MxJjSVY6cAJDmAiYAAXFQipbDTDUZWt92Y7sokIBLUCe7wV7iKZSGybBqOmSHaZvCG
	lnl0R19SlVv6Wj81XoPkIw4a8Pu1WpfdpDXZNBv6+Z9ev7kSeWyZzq/hRX3JtEoZG4kiYY+F6VK/L
	YGdegacCUvnzsRFdTghvgPlkbeX06+4OkfgrCQ5x66jsYuUdrIuYSDGQxELOkILxv5eqI86V97RX4
	Yr3wTxc3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAaFt-0001Wi-Bs; Tue, 25 Aug 2020 14:48:57 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAaFo-0001TW-KB; Tue, 25 Aug 2020 14:48:54 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id E72E3133F5728;
 Tue, 25 Aug 2020 07:31:56 -0700 (PDT)
Date: Tue, 25 Aug 2020 07:48:42 -0700 (PDT)
Message-Id: <20200825.074842.773732876988634467.davem@davemloft.net>
To: sylphrenadin@gmail.com
Subject: Re: [PATCH V4] net: dsa: mt7530: Add of_node_put() before break
 and return statements
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200824200311.GA19436@Kaladin>
References: <20200824200311.GA19436@Kaladin>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 25 Aug 2020 07:31:57 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_104852_928175_30FF96D9 
X-CRM114-Status: GOOD (  12.52  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org, Julia.Lawall@lip6.fr,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org,
 vivien.didelot@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sumera Priyadarsini <sylphrenadin@gmail.com>
Date: Tue, 25 Aug 2020 01:33:11 +0530

> Every iteration of for_each_child_of_node() decrements
> the reference count of the previous node, however when control
> is transferred from the middle of the loop, as in the case of
> a return or break or goto, there is no decrement thus ultimately
> resulting in a memory leak.
> 
> Fix a potential memory leak in mt7530.c by inserting of_node_put()
> before the break and return statements.
> 
> Issue found with Coccinelle.
> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>

Applied, thank you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
