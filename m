Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5D0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 06:00:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E39861037
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 06:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E39861037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pe0g3wjJKdiXboqxlhzGbsvMM6P0d0KKa3BQTJmcC+Y=; b=PKWAffthc6Aweo
	QwAhgQPYNHU69nEiCBxqGGN7oX5rs5e/txqf4H5Jhce5h2CYxx1DO7aZefVW1nMWZ6mcpc14dEfUz
	hNTd+AB6aCh7Tyyt/t31QBItpJI21tW7OvlcIoa3RfWCq06wrr1pYM3ZjTLr1pjTdAyieN6jmzPb8
	DrNemN83wy7DLPUxUNcBG6aPBIqYhukVTL3JXyPawkK9WVlnlE0GIWIgOAAJy/p95rN/8DHyB9duK
	h+C4pQ3BrAhoqSjwDiesKpATfywY55zdf3cYwvvwvN1Kbnew4QnJYQwLA/OO30LL+At+juuU9r/ee
	onvCOLo5oRVW6oKFBlng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1misGj-00Afc3-MD; Fri, 05 Nov 2021 06:00:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1misGW-00AfXw-TC; Fri, 05 Nov 2021 05:59:54 +0000
X-UUID: 5cc9ee6a125e4807a60f417874286705-20211104
X-UUID: 5cc9ee6a125e4807a60f417874286705-20211104
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2135656743; Thu, 04 Nov 2021 22:59:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Nov 2021 22:59:47 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 5 Nov 2021 13:59:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 5 Nov 2021 13:59:46 +0800
From: <miles.chen@mediatek.com>
To: <sboyd@kernel.org>
CC: <abel.vesa@nxp.com>, <festevam@gmail.com>, <kernel@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-imx@nxp.com>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <s.hauer@pengutronix.de>, <shawnguo@kernel.org>,
 <wsd_upstream@mediatek.com>
Subject: Re: [PATCH v3] clk: imx: use module_platform_driver
Date: Fri, 5 Nov 2021 13:59:32 +0800
Message-ID: <20211105055932.3432-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <163087455086.405991.14496690646389782129@swboyd.mtv.corp.google.com>
References: <163087455086.405991.14496690646389782129@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_225952_977805_D1527426 
X-CRM114-Status: UNSURE (   6.92  )
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

From: Miles Chen <miles.chen@mediatek.com>

Hi Stephen,

>> Fixes: e0d0d4d86c766 ("clk: imx8qxp: Support building i.MX8QXP clock driver as module")
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Thanks for doing the review, I cannot find this patch in clk-imx tree,
Would you pick this patch, please?

Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
