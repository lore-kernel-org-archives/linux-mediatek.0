Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1884C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 09:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBq3SC4yJvPS9NCScp5q8d54pk3E+OjtsP70ijlIDXc=; b=WFWq4e1N138MF7
	LysDshq2JKdLy4YIM/NTB90mULdTO1hBGWs17Fzhom1p7sT75xOd811ACgJA8e1mZZUcoMqSddg6h
	XWvqM6sMOeOa8w9aALRNWn8soywkw43COJYiw5jtEFbiIsziE75RhduaJlgue2zSA+DyHnTT7NUM4
	ngeipkoPIvznaXSkZxx9E83lRRhIQxVsCH2anpV8s2B4uXr2U+mbJKeuLtd8cDvtw8Oho+vJlxLKZ
	J2rOKXvsAy6bestKROWvmgRZrDut5VTjgOO971N3+pUDKFZ8uDxxdlXINIipnrcPZsyD8P54HPYtc
	9x/cPpWkvqX+Q4ND2HPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msM2L-007xI2-EP; Wed, 01 Dec 2021 09:36:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msM2H-007xH6-20; Wed, 01 Dec 2021 09:36:23 +0000
X-UUID: 9098a5cc98744aa2806ad07c726bcedb-20211201
X-UUID: 9098a5cc98744aa2806ad07c726bcedb-20211201
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 866981627; Wed, 01 Dec 2021 02:36:16 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Dec 2021 01:33:28 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 1 Dec 2021 17:33:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Dec 2021 17:33:21 +0800
From: <miles.chen@mediatek.com>
To: <zhou1615@umn.edu>
CC: <kjlu@umn.edu>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <miles.chen@mediatek.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
 <wendell.lin@mediatek.com>
Subject: Re: [PATCH] clk: mediatek: mt6779: Fix a NULL pointer dereference in
 clk_mt6779_top_probe()
Date: Wed, 1 Dec 2021 17:33:21 +0800
Message-ID: <20211201093321.31312-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211130173634.212143-1-zhou1615@umn.edu>
References: <20211130173634.212143-1-zhou1615@umn.edu>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_013621_129802_474DDA82 
X-CRM114-Status: GOOD (  15.26  )
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

Hi Qingyang,

> Fix this bug by adding a check of clk_data.
> 
> Another way to fix this bug is to add a check of clk_data in
> mtk_clk_register_muxes(), which may solve many similar bugs but could
> cause potential problems to previously correct cases as the API is changed.
> 
> This bug was found by a static analyzer. The analysis employs
> differential checking to identify inconsistent security operations
> (e.g., checks or kfrees) between two code paths and confirms that the
> inconsistent operations are not recovered in the current function or
> the callers, so they constitute bugs.
> 
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
> 
> Builds with CONFIG_COMMON_CLK_MT6779=y show no new warnings,
> and our static analyzer no longer warns about this code.
> 
> Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
>

thanks,
Reviewed-by: Miles Chen <miles.chen@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
