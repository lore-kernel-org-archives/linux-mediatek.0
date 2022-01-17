Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F49C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 09:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fnbbCUjlbunA1SKhC19k8nkHD2/md0aDipRqg8pg5Og=; b=nGRiaXr7m2BeBf
	cGNWmSnKs5Vu6GiphQkT/8o4PEeiM+MwsiBaIqSyUJA7L0K/kcFVtfiO1xMQXO+ndZ606qKS6fEje
	Jzp3KX2HDx4dzeqLlA/Y2Q2xvNZiEH/6gGsxRsHwlzwnP+OQwppNPd0K1aWS2DORQeeffJfOtQAHH
	n6ttMV/Zri9fXwLMzL2/E1RYXIRBNHP9v3WkqNgH9hXgD45IiI9Jm1XCIPHGKEIZruGMpyKSJzZBP
	JGnCXR37J/M3oI43J6hzCAMa7l1eaF6lfpoQ2fhCTKM1DMDlPJ+v9Kfa6VzzCVNTCGa4es0v8jPor
	fmaaHrvFnWkFA1c5z98Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9O9n-00EEew-Ej; Mon, 17 Jan 2022 09:18:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9O9k-00EEeG-SA; Mon, 17 Jan 2022 09:18:30 +0000
X-UUID: 2909048ce4ed403f97104ea486723a6e-20220117
X-UUID: 2909048ce4ed403f97104ea486723a6e-20220117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1228275003; Mon, 17 Jan 2022 02:18:26 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 01:18:25 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 17 Jan 2022 17:18:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 17 Jan 2022 17:18:17 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <wenst@chromium.org>
Subject: Re: [PATCH 3/3] clk: mediatek: support COMMON_CLK_MT8192 module build
Date: Mon, 17 Jan 2022 17:18:04 +0800
Message-ID: <20220117091807.13628-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220114221930.660B5C36AE9@smtp.kernel.org>
References: <20220114221930.660B5C36AE9@smtp.kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_011828_935953_00605165 
X-CRM114-Status: GOOD (  11.93  )
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

>> I did not try it because we do not unload our clk modules.
>> After testing I understand that the clock driver does not unregister clks
>> we cannot remove then unload it.
>> I think I have to add some unregister logic to these drivers.
>
>Yes

I will do this later.

>
>> >that mtk_clk_simple_probe() doesn't actually unregister anything, it
>> >just frees some allocations. Please fix this before making these
>> >modules.
>> You meant that mtk_clk_simple_probe() has no unregister logic in error pa=
>
>Yes

I post a patch to fix this first:
https://lore.kernel.org/lkml/20220117090030.13064-1-miles.chen@mediatek.com/T/#u

After this, I think that I can use mtk_clk_simple_probe() in other mediatek clk
drivers by submitting some clean up patches.

Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
