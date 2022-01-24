Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924FCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/tJXOeJGo1lGyNGmVY3nxIkUNVCX7I26ss3onz+YYB0=; b=YbXS86YWzQc9IT
	c7HuX3J8Mjg6aYx/7GgFV/UIYqaDENl6JE52HlcRP5qbn1iKg9EwU55FGnNYPOQWL9medid4Nhsp+
	npoU2ym3gIMb478zAZ1sQAeIoxhYUiOqDGNfFSigf08qWvf3d1lXS74+OM9+fXJTRdEFJO7vIYSaO
	o+OPM7MVH3q0meNf4VEeBg4AwZlxjMzOtkvCERYwnH6PGTP8OYaqwl8fYLn1q7PLeojRX8YAELLJ1
	z9NxVIMG1+FG6FsJksoyPiSySflC1KyJol92jpM+I9FlUuufWICGzNbJnxYruVye8Cxxrnpi7X468
	Qzu5LtAFoFkj2+B1MqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC1tO-003vi1-9I; Mon, 24 Jan 2022 16:08:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC1pt-003uNA-MX; Mon, 24 Jan 2022 16:04:55 +0000
X-UUID: 24ae8aa0133e4618b3d90f88361fb9db-20220124
X-UUID: 24ae8aa0133e4618b3d90f88361fb9db-20220124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1141115229; Mon, 24 Jan 2022 09:04:47 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Jan 2022 08:04:46 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 25 Jan 2022 00:04:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 25 Jan 2022 00:04:38 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 02/31] clk: mediatek: gate: Consolidate gate type clk
 related code
Date: Tue, 25 Jan 2022 00:04:38 +0800
Message-ID: <20220124160438.17755-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-3-wenst@chromium.org>
References: <20220122091731.283592-3-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_080453_800569_1197333B 
X-CRM114-Status: GOOD (  12.33  )
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

> Right now some bits of the gate type clk code are in clk-gate.[ch], but
> other bits are in clk-mtk.[ch]. This is different from the cpumux and
> mux type clks, for which all of the code are found in the same files.
> 
> Move the functions that register multiple clks from a given list,
> mtk_clk_register_gates_with_dev() and mtk_clk_register_gates(), to
> clk-gate.[ch] to consolidate all the code for the gate type clks.
> 
> This commit only moves code with minor whitespace fixups to correct
> the code style. Further improvements, such as internalizing various
> functions and structures will be done in later commits.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
