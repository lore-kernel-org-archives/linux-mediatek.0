Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997DBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 00:45:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C9046108B
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 00:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C9046108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWTz7p6VFx1JVz6K34QNkU9by7aomXtEkSL1N2nTB04=; b=kVd00olNEBhUJV
	nsDCOTp9YRETuWRJjmTb8yrl1OYto6x01VswPaMsL4XJU5xZE3/yX8R0vhAAyABpvMr6huUGGrvMH
	VdC3gcNahA6iZogsXuRhUJZGR7kuG9ZWJlZ8vuV7qCOpqlq3zP6l+rPd/syHcIzPddS3bzjQpZ+2u
	7QGxqYahZA4+3HpsiQ7LPZa/H1V1/5wRpXX759NSwI+blfeAVApfw+oTP9qN55TNyKKKOSoVMez0V
	X2J3zkcoEQHTJOX/MQhiCP3hKKIn313p/Dg+5lNC0prcG6NaZ9Wa3wPO+0CgSYoqLove9EFUG6ImT
	gJxqxTmNj75sfaqi7uHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbBLN-004nnC-Oq; Fri, 15 Oct 2021 00:45:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbBLA-004nl0-Oy; Fri, 15 Oct 2021 00:44:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49747610D1;
 Fri, 15 Oct 2021 00:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634258692;
 bh=YFpJ7iKpvybwT0EOJSs+FXxVB2B6kd+iVy4X1DpohAo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=V5TtEeM8jFsgcGcuBW6Yi1RHRqq5/oODbkcc0S4WZpeDexJoHVu3ALcgDZyVJc1MG
 6CIwbC2ZR/3XLrdymbDNipPSk307O8nLu4ExPCEqf7T6DuC4dGH1UFDDUS1K6ERb2T
 1FU+l30gsJiFr/LU5tlArESe1Zc83JYofkMviOGkSPLROoTuRjzOjCKU8NiJSHrEzM
 WwhRnZzp6kBGQijR6YkXHuo2opcUTWULpQIbqcuso3n/atWh9U44xCkgoGk+LizOe1
 dITQE1VW/HLdoxFCv4xBimgyntfX45zGjTRzA9d5i9nOMflmRAW+pSJCtFPm4hxUED
 bPJ1w67C9pkNg==
MIME-Version: 1.0
In-Reply-To: <20211005065948.10092-1-mark-pk.tsai@mediatek.com>
References: <20211005065948.10092-1-mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH] clk: make clk_core_lookup faster by using clk name hash
From: Stephen Boyd <sboyd@kernel.org>
Cc: mark-pk.tsai@mediatek.com, yj.chiang@mediatek.com, matthias.bgg@gmail.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, mturquette@baylibre.com
Date: Thu, 14 Oct 2021 17:44:51 -0700
Message-ID: <163425869104.1688384.2477307279117424281@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_174452_849413_8F57FA68 
X-CRM114-Status: UNSURE (   4.40  )
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

Quoting Mark-PK Tsai (2021-10-04 23:59:49)
> Compare hash value before strcmp the full name to make
> clk_core_lookup faster.
> 
> It make clk driver probe 30 percent faster on the platform
> have 1483 registered clks and average clock name length 20.

Why is clk_core_lookup() a fast path for you?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
