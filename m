Return-Path: <SRS0=a7PR=N3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A823C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Sep 2021 20:43:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 299DB60F90
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Sep 2021 20:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 299DB60F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYMOYiKqwTXzDg46JRpY3uziq1inMK6So3/zMTA8A/I=; b=Noyst/PdJK13dy
	0K9+MJprA7tjrlmRBbdZZil2UJ6bESoUnQSbpBbnTu6EJVbi9BY6ZGHvs+rtJKhashqqXTImF3GUC
	oQYxDIWIlYQS6SJkNrdd6+aRSF0Bh/AaO3NA85F3ffDnsRd8y2Io8sC7j61BvZQYmUicAkoIBqMNc
	1ow3gycFN3KNxQOk/Qw/rNXvjraTWIcSWlLCdDSBdf5JMr9KVKRixrVsF5eoBk7GfPurgwpvKOLnQ
	gJoUc2fMXH7L6GcwGrGeKDfo80jerdz/8soWr7RY9JAaSlvHcG0IK2VroJpOCbFs2PubtlG8wACAL
	Un91tBep4uhnC3C7b54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMyyT-00GPa3-RR; Sun, 05 Sep 2021 20:42:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMyyH-00GPYe-5l; Sun, 05 Sep 2021 20:42:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FB1C61056;
 Sun,  5 Sep 2021 20:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630874552;
 bh=3RhW5zQAPc9DSXeyV3jspga968FiWVdlv+nl633JKww=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=l5p5VpM4b0zgKohLXah+4+4etd7+vYtfWBu9UhaIcgZB/VlxZTrrUbLcGSD46s77I
 InXynCL2bUWUV1scqBcMfoToywDYPxWaowQkNtC1CReZcVxNZvyKZ5mgA4Bg71jx1W
 csWJSQhvtB50GqSLv7oGeJJNzOTe4bBFwDDVjYhcGDKvbjSvOuXQMZqlvP4nhkhQca
 Vd5gfBnsU94m8wnLgKEyGITSaDaDYCjSY/HRS3N3CLk8MaH9fHBWe2hEH+xJ1C0wlw
 kvtqZ4c0G96MhkJNEDAE3WNkcJQGSvorXdGFnNrzoOnSRYB1jLOoYhERXBzgS7HY+B
 cxV3m5FoNAhwg==
MIME-Version: 1.0
In-Reply-To: <20210904235418.2442-1-miles.chen@mediatek.com>
References: <20210904235418.2442-1-miles.chen@mediatek.com>
Subject: Re: [PATCH v3] clk: imx: use module_platform_driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, Miles Chen <miles.chen@mediatek.com>
To: Abel Vesa <abel.vesa@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Sun, 05 Sep 2021 13:42:30 -0700
Message-ID: <163087455086.405991.14496690646389782129@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_134233_271241_16B57AFA 
X-CRM114-Status: UNSURE (   5.18  )
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

Quoting Miles Chen (2021-09-04 16:54:18)
> Replace builtin_platform_driver_probe with module_platform_driver_probe
> because CONFIG_CLK_IMX8QXP can be set to =m (kernel module).
> 
> Fixes: e0d0d4d86c766 ("clk: imx8qxp: Support building i.MX8QXP clock driver as module")
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> 
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
