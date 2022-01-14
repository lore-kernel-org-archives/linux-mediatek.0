Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823C4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 08:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yC7z3i8NX3qiY/aQUyM7xz5HFOesHFCZ4pl+ZQ1AAI=; b=LeQRpduqiQWBFM
	pbnffUeV4fUzyLcDmWWTxTuYSqv1hIjI+c9gT01kR0hvMVp4aEJIp4AvHv+Xu0239kwBdo8Q6G63i
	W8CApt4wIz5oA5aQPrYcYxrWQk041YtPbT78rOugudd3CU1lZW5ARXzwLicqF8l1t46ZtHlY+ju3/
	4SvbFejLZ5jv4t71f9B6prw/plnLklPAznMx13hSvtgNS8FK8pv1T+qGrIDHbBbDNKAlJu98jTPDL
	wZ/U6Pwn1558Xf4QcdHkjmsgzQsEB3ag+/WwOvkDOdFZcnNMeiLMfyfRYouWSeYSPNn+TZChoKmBv
	HFQD+oYxVqcWlzpq6YDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8I7N-008Icq-MT; Fri, 14 Jan 2022 08:39:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8I7K-008IZZ-VI; Fri, 14 Jan 2022 08:39:28 +0000
X-UUID: 33bdb13c8eb84bc6a548bf6b2468ebfa-20220114
X-UUID: 33bdb13c8eb84bc6a548bf6b2468ebfa-20220114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1887979299; Fri, 14 Jan 2022 01:39:21 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 00:35:13 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 16:35:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 14 Jan 2022 16:35:11 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <wenst@chromium.org>
Subject: Re: [PATCH 3/3] clk: mediatek: support COMMON_CLK_MT8192 module build
Date: Fri, 14 Jan 2022 16:35:10 +0800
Message-ID: <20220114083511.18906-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220114021131.1F7C9C36AEA@smtp.kernel.org>
References: <20220114021131.1F7C9C36AEA@smtp.kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_003927_061008_11339A33 
X-CRM114-Status: UNSURE (   9.24  )
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

Hi,

>Have you tried removing the modules? And then reloading them? I also see

Thanks for the comment.
I did not try it because we do not unload our clk modules.
After testing I understand that the clock driver does not unregister clks so 
we cannot remove then unload it.

I think I have to add some unregister logic to these drivers.

>that mtk_clk_simple_probe() doesn't actually unregister anything, it
>just frees some allocations. Please fix this before making these
>modules.

You meant that mtk_clk_simple_probe() has no unregister logic in error path?

Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
