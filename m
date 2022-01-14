Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC25C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 08:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZwzULJvp97LhoYWpQAE8paEHDlB2SclffjTomoisjO0=; b=FTNTeeV10WNNtr
	vdmMuKzkj+J2X4Vi0CEYbA81hEwyMIeN5DrbLDxtbJI9EN2KxJx4nhTut8uURYnfId44TXlJB8xrh
	MKHUBU/OSltc4vbWGSV0CVKFSZQ5Qz/hvXWL5NqbUdEjyYy2sRfnsE+MOuV5jWtvc9q/h+kv0L3/1
	lsRWgEflN3il2A1hoHXJZjmGSOyiHEoB5g5DZZwz20UKrTj7nnvdmx5PjOyTPF6j3gmGMfJPUgmrq
	sWbqycgXv4TVxgc0CR7a3QSSgLWYX5HnyxwNR/IyuQWcd9ED1X36JjEkaNuFcHZeTUqJFk1C6RzPL
	QF1VHI5nYy7OOt0R7ehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8I4N-008HdN-4Y; Fri, 14 Jan 2022 08:36:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8I4J-008HcO-6O; Fri, 14 Jan 2022 08:36:21 +0000
X-UUID: 0a1f229c03d04eda8990725258c5374d-20220114
X-UUID: 0a1f229c03d04eda8990725258c5374d-20220114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 947165651; Fri, 14 Jan 2022 01:36:15 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 00:36:13 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 14 Jan 2022 16:36:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 14 Jan 2022 16:36:11 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <wenst@chromium.org>
Subject: Re: [PATCH 1/3] clk: mediatek: export mtk_clk_simple_probe
Date: Fri, 14 Jan 2022 16:36:10 +0800
Message-ID: <20220114083611.19633-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220114021206.43FB7C36AEA@smtp.kernel.org>
References: <20220114021206.43FB7C36AEA@smtp.kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_003619_265415_E51BCC2D 
X-CRM114-Status: UNSURE (   6.63  )
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

> Please send a cover letter for multi-patch series.

Sorry for that, I will submit a cover letter in next version.

Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
