Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17830C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:52:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4A1F60FC2
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4A1F60FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHgy9GUNW2crsW1xVlmKRtgBIIxU1/FiEqEIkBUAnTA=; b=reGBm99z8Ni0aC
	NNL5j5kv80/tLRAfQCBa76XjkH387ASptXXtkcmBFfoaqFeF5sLg8bH0xXifyCcpqm3VtPGQlZue5
	87B5+R19KYUAI355tUbonpcqJmMFt58S69eXCqcAepI5bAbYqzp2UleyT9HjuG6bUoH+Nh+mGUTcu
	7ChWeDK4WRYTVCXFYRNfTJiiARLXVS8+jt/YvmUMGGuZxPqPiVjU48SO0woVMrSSmxoIocc326D5n
	TqoX8opbYMlkErN0+zXXAycaIAu72UNDjOkumMVnmVZNCOfiF7tC9Y2fyOQSMw2IMvXbjfanHeqaY
	PKb8vv4ycVPvAUPzIh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8SBU-00G1t3-3W; Tue, 27 Jul 2021 18:52:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8S6e-00Fzwq-9r; Tue, 27 Jul 2021 18:47:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDA3A60F6E;
 Tue, 27 Jul 2021 18:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627411627;
 bh=gBJcVXzwtvxyfbyVULU9X8bkoTc/c6NjW5daNvv3bgE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=u7wjvlHT/wfIM7BR2bbJ0ROAeUy0eZVXIoroZX+x15W2vLa6nas/vRg5nYPabXXq7
 iRkkv3nqaEdZO+sQWlaQr6/sBoIG+eluMtvyOVfnHu0MrtsAGkQqaKvi3N3HiMJfWE
 6eaTY88URslX4n74Uv4FCS2ljppJgpoYSGUppe0KHG4KhWQWQqAfTNQLBNZrrRSIAn
 bcsNc9urrpV601N5xSaWRF9/xmlv3ONgSgAZkoRhonxcMKxDwx+IYXBedqrXTCLcQW
 rbw1EYqx46PzQyGbrBzMcS6foS+Q4d0toq8CLY3We96hFABrSddmzCZg936X7GIvw4
 kw0lrFgldJ9+g==
MIME-Version: 1.0
In-Reply-To: <20210716051732.3422-1-miles.chen@mediatek.com>
References: <20210716051732.3422-1-miles.chen@mediatek.com>
Subject: Re: [RESEND PATCH] clk: mediatek: make COMMON_CLK_MT8167* depend on
 COMMON_CLK_MT8167
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, Miles Chen <miles.chen@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>
Date: Tue, 27 Jul 2021 11:47:06 -0700
Message-ID: <162741162663.2368309.2253718954934851461@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_114708_414193_81E3E34F 
X-CRM114-Status: UNSURE (   8.91  )
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

Quoting Miles Chen (2021-07-15 22:17:32)
> I found that COMMON_CLK_MT8167* do not depend on COMMON_CLK_MT8167,
> so it is possible to config:
> 
> CONFIG_COMMON_CLK_MT8167=n
> CONFIG_COMMON_CLK_MT8167_*=y
> 
> Although it does not cause build breaks with such configuration,
> I think it is clearer to make COMMON_CLK_MT8167* depend on
> COMMON_CLK_MT8167.
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
