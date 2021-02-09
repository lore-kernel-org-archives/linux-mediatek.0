Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F87C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 08:02:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 852C364EB8
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 08:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 852C364EB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/cS64JDyA6JNMmdfS0FbBRibqM19mG4pwzvZQQO7cfs=; b=lJwdIoZO0JPhAKJE7+U0QSRyP
	4z3yLaHQ9aIUgzFNUujuYkIZEWxXocVXz5eoZzz2am7LqEpu0301kOjjne5aoeGwyNEPZFeLbQ/lr
	4QM1PbJbJ04WDlYJiY3wbLPZ+gJ9qhLbJcJKA77zGw3Stqk+OBiIDM5qpbl+xAIJeKBeV+hOCODct
	LRVB7ztKqxp8PFwdkNFgzZFOP6mw5loAychA+sekP0knaUKY31+5imXn2gYQ7dvE3wCjzUuQHK2nZ
	d6c3dF2u33SFM6gdQwe7wTdK5P/0GCsX+a31COHh7epMKNYtUu+dZGL0O3RCU4SAWelMuAR6X4TLg
	98Mc8COuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Nyk-0007TI-5G; Tue, 09 Feb 2021 08:02:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Nyh-0007Sd-Fr
 for linux-mediatek@lists.infradead.org; Tue, 09 Feb 2021 08:02:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B682164EAA;
 Tue,  9 Feb 2021 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612857750;
 bh=VP8ceEIvn1ysrhFp17x56L8iFwhfmAy/mrq9jhOUt3Y=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=VeCNaeMg09GJ2/tA4WC1SvpfYBXilJBPZC4eJ0+Pfef6J1wEi3v75imdYcexj6ncm
 C9glmzicqjhRsJ6xf5G2ZK9W1dJY5Nv81r6s7splkQqSg7kMC4cE+ZkWBrj5noxrFG
 f2FyBLH1eVxmtWCBm7L3Hm17UZXuY9zDM5q6BF938pssyfywBYM+M+1yC/ZXTZu5AB
 vW7AXF3/n8YdASMkYhQgIIBX5fM9Jr3qnH3qjRQ0bS6gu/nEQmdmB8y2MDrzuwxXGr
 oCvc2N+eJ2APfznL/i9/JqnGteHDbwRb44H55WniKtTMz7JWZKdu1J8e8kpcHlWJDP
 vckbMQIRmtSkw==
MIME-Version: 1.0
In-Reply-To: <20210125170819.26130-3-laurent.pinchart@ideasonboard.com>
References: <20210125170819.26130-1-laurent.pinchart@ideasonboard.com>
 <20210125170819.26130-3-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] clk: mediatek: mux: Update parent at enable time
From: Stephen Boyd <sboyd@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org
Date: Tue, 09 Feb 2021 00:02:29 -0800
Message-ID: <161285774959.418021.15519651953415527868@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_030231_606830_86D34A09 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Phi-Bang Nguyen <pnguyen@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-mediatek@lists.infradead.org, Weiyi Lu <weiyi.lu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Laurent Pinchart (2021-01-25 09:08:19)
> The mux clocks don't always correctly take the new parent into account
> when the parent is updated while the clock is disabled. Set the update
> bit when enabling the clock to force an update of the mux.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
