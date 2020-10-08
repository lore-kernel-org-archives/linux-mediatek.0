Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D970EC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 21:45:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D07222241
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 21:45:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pgupfCkj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jf5UvwT1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D07222241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pLPEQsPsxrtAdcOgXyigb6qK8T9KF/X6O3g2iFZDNdU=; b=pgupfCkjpIVL4nYGjc/Hc6Lpo
	4ohiNj8tq5AgXGmFv7mIh2qWYOK6n7n2yr7lkWVz7psYJGpYWVJmYsMlNuakZ3ufVUYC0ASTlcwQI
	mgZ6WBQgoDqYpiPtpabINvSV8VCjkcrqKNdlEIZJHnYwgh5I9Zglw8eFD+1MtCfyJ25D1CMugaPxv
	HwnwyaFdSJMiprEmNnpzGjIBnLvDGMjvay2as6OCNc/aAJKBAojiQUEKkMRvL5J5LFeFCKRd20eRp
	9m9granlgR+/GiPegtyKcZzY5522uKrDFWFPz2xiGmkBAmKoZT81IQBOqpXuYnYeQmsg6An//o8Mj
	mhrfonXng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQdjI-0007WD-Tu; Thu, 08 Oct 2020 21:45:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQdjA-0007SO-TO; Thu, 08 Oct 2020 21:45:33 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BBB522242;
 Thu,  8 Oct 2020 21:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602193531;
 bh=acPOXKWxQK71x24n0bkPFRaychK49IqbjS5n1k657kw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=jf5UvwT1xBndSzwHStjafcOQgXmyJ1Sv4BUGIrEtDj6x//IFU56u4p/pB0MndwRVZ
 u16hA9qXSWsJU4D2hh5ycBuUOMAvV/i4SBm9UGds1FG/SuzAqEJtK6en3yQ5BqOKpg
 dSXS9Yj1pY4x6oJPoR1x0aLZN3Z0IuC1Ne8iPJdw=
MIME-Version: 1.0
In-Reply-To: <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
 <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
Subject: Re: [PATCH v10 3/3] clk: mediatek: add UART0 clock support
From: Stephen Boyd <sboyd@kernel.org>
To: Hanks Chen <hanks.chen@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 08 Oct 2020 14:45:30 -0700
Message-ID: <160219353021.310579.9991189060182082188@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_174533_042222_678D63CD 
X-CRM114-Status: UNSURE (   8.71  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 Andy Teng <andy.teng@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Loda Chou <loda.chou@mediatek.com>, mtk01761 <wendell.lin@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Hanks Chen (2020-07-30 06:30:16)
> Add MT6779 UART0 clock support.
> 
> Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
> Signed-off-by: Wendell Lin <wendell.lin@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
