Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3007C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysAoBY06ULbY2kFfcOAgkRV2Jz/ZoDasnoXDgvenqDg=; b=CPuqdQ40WB23O3
	XMGywvP0ODUJx7Z16sGEPMYDc6nA2+6Zc00DK/r9LAVezlrhaWXH84yb4nkhfHBmmcdhF9Og/buDK
	owvFacw+A4OLDLGCCmCGeElfDh00PQknJunmcHE0CEwsWQ7BkKDxCoYbaLbJdbBT5DQQDYWMOIsPP
	i2vuHgzPyos0z33Y1pDKQKu/r9jM22lA0VIu+tw0T3wtvqW1BQiBxxgG2KbZnVvvD4RDBjQCCw0Bq
	KuSRsjST4Lh+MjwB4Ayi6JtdW0O2MLaCQlozNLJyX0so0W90ecRMVD/w4j2NSy33KdbGXQLhfOCum
	LgfGCVLies67X8xsOBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnSW-00C7Vp-B7; Thu, 17 Feb 2022 20:33:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnMC-00C4Qz-N6; Thu, 17 Feb 2022 20:26:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 25FA4B824A4;
 Thu, 17 Feb 2022 20:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8C5C340EB;
 Thu, 17 Feb 2022 20:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129585;
 bh=+s2dZtudwLbzmAWO5qcLZKAFd2wPQHJgj58H0Wg9CWQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=gWgVAkGnjWRWFIDBYhBFwIM1ddEEjBGo+zZEai0RCTE2YNo7JDfAIDXD7F/mON6l+
 Br8ehSXVr2Cm0X4KmrE0sUwOMkZur4rVS9hhjxThS12JG399ZIUTNCwpg1iLhlOWHU
 wIFrmIMbdoZMsUXQXY8o7ag5zarY8yDNyDHOzk/CKwM16wsQjo+JkSnGA4joExxyh/
 BY+CCLFq173ByNFsTguiMa49MbrxO6TKydIiW34UKWDfWN6sHt221U23MSpTDUcyoB
 HGMUOhN1hiQLF3Uyp08Bu6V/+Faf5QWY7sxrEABMMhMty4L+z8a0zpRIr1hG9KMJgW
 cJQ2to6HKUIPA==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-19-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-19-wenst@chromium.org>
Subject: Re: [PATCH v3 18/31] clk: mediatek: Implement
 mtk_clk_unregister_composites() API
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 17 Feb 2022 12:26:24 -0800
User-Agent: alot/0.10
Message-Id: <20220217202625.9B8C5C340EB@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122628_967067_5C9AF030 
X-CRM114-Status: GOOD (  11.02  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:21)
> mtk_clk_register_composites(), as the name suggests, is used to register
> a given list of composite clks. However it is lacking a counterpart
> unregister API.
> 
> Implement said unregister API so that the various clock platform drivers
> can utilize it to do proper unregistration, cleanup and removal.
> 
> In the header file, the register function's declaration is also
> reformatted to fit code style guidelines.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
