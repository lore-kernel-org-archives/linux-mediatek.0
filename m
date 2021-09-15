Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB70AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 01:23:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B486461209
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 01:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B486461209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KL7ze2uIwcj1ExhHKzgjRsgP/qvhnqrwoair5osRzCc=; b=fOoGGfr9iFG8DD
	5LxaOb8PCaF1IxR/Mddm4gZ5jRiUtjTrc4pLP/UBnIwR3Yg2e+4JV44pKktqKt3Djm/DbczeX3ZPt
	ZzBdDsY0kKnGsrifj3uApS1DidM3fQ6Vyw1/ggIB42IqGl4u1FRPpXqCd8WuuoWkAoLZZSMomAA16
	orcx16fC7eJp/CTDoFh1yaVzQJWuRceK8ArXUGqe2SQYEeOrQZp8GgpP/MgcZSiPR3cWPUAQiWgDX
	aH4jSddzdUaa0pzdMnLWH0SDVYRRQkGErlK4AxfPlFeN8VsLoQrT53YZ88mycC6CB9O2ONdnlMNzx
	67AMu6icTHpj7Ugc0E9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQJeN-007o2q-LR; Wed, 15 Sep 2021 01:23:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQJeA-007o0v-By; Wed, 15 Sep 2021 01:23:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAE7A61164;
 Wed, 15 Sep 2021 01:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631669013;
 bh=D47U76My5c2pHGChmPNL7NOk97rufg7hvzHTCYDS3SU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Nkm5mmnXi1Dvl4HgrqqbpLjEtmEkaDSeDuoQ25keKNl9/LIS1ApoQyJ8mW9ngY689
 XCqBVEp8UaBBnNF9+hAQa9Jc1dKouwteTJmYPMWDrvR+Xhwc66L4QvJRGauBwxbNLi
 fpSjkh23hroQkMUF3kafRGN+fsos+Q5ldlnoKMpISmM4mf+59wCypfz4P8Gz2YYUpz
 njVjssYb2VJt/hEs00umY89kLULW8aRZrrf9oZsXCcbj7BHVe62sB9F6GIseasLmjc
 kTkEAmta+ca876djXwaUowQfg4P56Nehhyfk/ffVSUtimfJrKjTA7gvoWwvQVDyF5s
 ql8RCoulPb+nw==
MIME-Version: 1.0
In-Reply-To: <20210901222526.31065-1-miles.chen@mediatek.com>
References: <20210901222526.31065-1-miles.chen@mediatek.com>
Subject: Re: [PATCH v3 0/4] clk: mediatek: modularize COMMON_CLK_MT6779
From: Stephen Boyd <sboyd@kernel.org>
Cc: Wendell Lin <wendell.lin@mediatek.com>,
 Hanks Chen <hanks.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Miles Chen <miles.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>
Date: Tue, 14 Sep 2021 18:23:32 -0700
Message-ID: <163166901247.763609.17762427178197245692@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_182334_489028_E422664F 
X-CRM114-Status: UNSURE (   7.10  )
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

Quoting Miles Chen (2021-09-01 15:25:23)
> This patch set makes COMMON_CLK_MEDIATEK and COMMON_CLK_MT6779*
> be able to built as kernel modules. Necessary symbols are exported
> in this patch.
> 

The subject says 4 patches but there's really only three.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
