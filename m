Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E647C12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 20:30:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF5B6128B
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 20:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BF5B6128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVpPqkszB21njB4gL5goJCHboOjkqze6dF+vUc5IqK8=; b=IUu+puXTtaMz9m
	0EZUAPco33KMm1znaaHqGyIjj633pmXhqY9DtbeCh0xeVROjxil55If9X+uC/uaST0j4NOzl0NBVW
	xpjBALPGZW1zm0EYZ8N4NJmCcjZ4kGmRmd9uovox3AWZExhKnU+35oJsHvsUGHPQ9k57DRr+UBKid
	puDqGl71P2zFyuQvDHltgcL4C70cCCePm1EpBmafo9yR0koKiIhVtTA5xx5HHA+LKAmAiJUL4zyV5
	d/WJUc2QlifhIeH0Jshr/y3MT6srVeMFUUItVHCDBfZohSn/Rum5Tcn9mXlFBRMfRqvGjtkstutMJ
	Hhjk4ri+7CF5mQf211uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4UTR-005DD0-IY; Fri, 16 Jul 2021 20:30:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4UTF-005DBW-D3; Fri, 16 Jul 2021 20:30:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id EEC96613D0;
 Fri, 16 Jul 2021 20:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626467405;
 bh=5vz4OE2lxmunVEJ0iRMslkulT3lfhyspHouxFSewe24=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=EeJcC6N0Wmxlp5m10D6Uf4TErhuwrZDW3RedDr4KU5n0x7Xvi2R7KqDBBCUAiVWrD
 lNKOTnBVSO5vGKuxYAQa/KNVHCLa5+08AziTcMJ/UkKZhlsDhSD+F2Q3VcjPTRSOpP
 DJ0O3n0m0myDB9StUKWSjB/2429cNySdw0nOjlkAbPS2MUTh8cXjJC8B5GBF5A+JSt
 35ZdTlMygWQerXD/1b+qC0aPzfLWUQp62GMlmVeDxQxO5DrhMhNK+kTLQpvp3jEADu
 4cR3ZzTyhTtKVR/GMcAbD+8xv48lg8JnTY2FojeVQ3pQNRYSV/wNtTzmUrJ1cgo7l8
 IiX86Zgz5T7ww==
MIME-Version: 1.0
Subject: Re: [PATCH] mt7530 fix mt7530_fdb_write vid missing ivl bit
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162646740491.5067.9662963030907857977.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 20:30:04 +0000
References: <20210716153641.4678-1-ericwouds@gmail.com>
In-Reply-To: <20210716153641.4678-1-ericwouds@gmail.com>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: sean.wang@mediatek.com, Landen.Chao@mediatek.com, andrew@lunn.ch,
 vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_133005_681172_42CCF160 
X-CRM114-Status: UNSURE (   8.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Fri, 16 Jul 2021 17:36:39 +0200 you wrote:
> From: Eric Woudstra <ericwouds@gmail.com>
> 
> According to reference guides mt7530 (mt7620) and mt7531:
> 
> NOTE: When IVL is reset, MAC[47:0] and FID[2:0] will be used to
> read/write the address table. When IVL is set, MAC[47:0] and CVID[11:0]
> will be used to read/write the address table.
> 
> [...]

Here is the summary with links:
  - mt7530 fix mt7530_fdb_write vid missing ivl bit
    https://git.kernel.org/netdev/net/c/11d8d98cbeef

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
