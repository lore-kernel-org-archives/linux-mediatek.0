Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EF2C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 03:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnSNZfnorwxw+9pIlQsrWQ0Fgi2nhjJtNaXOuvFWOqw=; b=AJrXr7MNrGzn8L
	mG4CyP5cV/+6VN8zYwYEisiwy4vDrCWJqV6jwmOkAbZghv3jzmLO6ce16Kz8Lc5fKrPxWacpM99Rh
	/tVIBggFNqtjqY8+1yqzEQl4fB6fnSrkt7/IfuFiiK+wAJSiF3cWFMB2bCJLYvUUw3FwH7UvKwQJI
	AlXhlQdVJ34ybTqOkBSMxZvb1zH9OasRj7+EFGiDSCgHasT9X/XKreP0ErGLmy4e5AkKVA8EaKESP
	nF3xLQVmkvDj+cR9PYBXjQudAeS/dwstPFrk2+kJngfdHHGaX+w2TPNJMc/y4w2vvncHAeGOrxgDm
	S1Vtcqt87CTIZLDLEbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGuHw-008uli-W7; Mon, 07 Feb 2022 03:02:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGuHu-008ukk-2t; Mon, 07 Feb 2022 03:01:59 +0000
X-UUID: 388b431d251d42d8b23aa011f0f00730-20220206
X-UUID: 388b431d251d42d8b23aa011f0f00730-20220206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1041538873; Sun, 06 Feb 2022 20:01:54 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Feb 2022 18:51:52 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Feb 2022 10:51:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Feb 2022 10:51:50 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <miles.chen@mediatek.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH v2 18/31] clk: mediatek: Implement
 mtk_clk_unregister_composites() API
Date: Mon, 7 Feb 2022 10:51:50 +0800
Message-ID: <20220207025150.14725-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220202134834.690675-19-wenst@chromium.org>
References: <20220202134834.690675-19-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_190158_152854_CB231119 
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

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
