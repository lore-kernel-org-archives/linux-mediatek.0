Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6E7C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 05:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUXPP4WlEEq70hdev6SKk8DEKivmeAgC6IEvp5V3FYQ=; b=q0xaN5fN1mfHx0
	mE0KFdeodzJBC7yRDv5RG+n+l1ZdvAqlA1mkIrCF/PSqDc993PctvKKZNKSnMiNpAgSQdLDZr1MU4
	ViC0zSI9Itlu34dE3iLBXIhq3zMZUoD6SjT3eKsG3LxCeIDEln3kTEXBEsyO/1xHT/ASIVAYPZALQ
	YFL+coqFkwkxuUwYrM5mc9c0umJOdCnCg0il+9X2eIA3caMUFdPT4AQw1B3dxDq+dc5S5/KaG8VTo
	qc2qKRbUZ6RcPEKCt+2Lth8JEcHjheNcAXVMZU/VAtJHxcHMhk4qkmr1/9tOSH1dCjERQf828q1CV
	a+Xz+UMWxru8zI7rqOwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBrmk-002ITN-FZ; Mon, 24 Jan 2022 05:20:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBrmY-002IRc-7N; Mon, 24 Jan 2022 05:20:47 +0000
X-UUID: 7f95a9cceb1049ef94d635f0b3471f40-20220123
X-UUID: 7f95a9cceb1049ef94d635f0b3471f40-20220123
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 354098099; Sun, 23 Jan 2022 22:20:41 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 23 Jan 2022 21:20:40 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 24 Jan 2022 13:20:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 24 Jan 2022 13:20:38 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <sboyd@kernel.org>
CC: <chun-jie.chen@mediatek.com>, <ikjn@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <mturquette@baylibre.com>, <weiyi.lu@mediatek.com>
Subject: Re: [PATCH] clk: mediatek: add unregister logic to
 mtk_clk_simple_probe error path
Date: Mon, 24 Jan 2022 13:20:38 +0800
Message-ID: <20220124052038.6242-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117090030.13064-1-miles.chen@mediatek.com>
References: <20220117090030.13064-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_212046_295638_D220EEB5 
X-CRM114-Status: UNSURE (   6.98  )
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

Hi Stephen,

> Stephen pointed out that there is no unregister logic in
> mtk_clk_simple_probe() error path [1].
> Fix it by adding unregister logic to mtk_clk_simple_probe().

Chen-Yu's work [1] already addresses this problem. So please ignore
this patch.

[1] https://lore.kernel.org/lkml/20220122091731.283592-1-wenst@chromium.org/


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
