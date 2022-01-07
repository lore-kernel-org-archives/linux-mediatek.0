Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D826C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 01:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWbMa03/u0UYJ4RwuZH4t17LdiDu5wZl9BORVKHUG5g=; b=y5W8S3WXgLw7L6
	tHIFzfEgnnnTWjS4YzGs+GmT7Q5FBZaOycLrWiJa5yTw+Pwy/0tgRk49lZDXcciXnUxgExyjF6tRs
	mvmzJtiZcbhEosyQxJN74qAFISgLKgUP+hpbSCldMqU+VfssFNbv5sfuePZ1Yg1Y5n4kCgLly3vVE
	lfxRwWg0pnnagN6/q+gK3WtwgAwPrtH1pFg/ojmk4A9J1gPL+D9eECVV8k+N0zE51wxse8RgMDosd
	IiOcXzz7jXGSgOYgTpgZ0MuLu/Pylsw2FyjSdGvvrxxJ6HS6XCfxjTf2IQI9NvISOt2gObyOYn42v
	AkgYKT8sfDgrUMPJMh0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5eFd-001oRn-NX; Fri, 07 Jan 2022 01:41:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5eFQ-001oPQ-DC; Fri, 07 Jan 2022 01:40:55 +0000
X-UUID: 1bc2ac425e2c4a61a63f4fa576367f0b-20220106
X-UUID: 1bc2ac425e2c4a61a63f4fa576367f0b-20220106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 581041233; Thu, 06 Jan 2022 18:40:49 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 17:40:47 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Jan 2022 09:40:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 Jan 2022 09:40:46 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <matthias.bgg@gmail.com>
CC: <airlied@linux.ie>, <chunkuang.hu@kernel.org>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <jie.qiu@mediatek.com>,
 <junzhi.zhao@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <llvm@lists.linux.dev>, <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3] drm/mediatek: Fix unused-but-set variable warning
Date: Fri, 7 Jan 2022 09:40:46 +0800
Message-ID: <20220107014046.30492-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220102234633.31709-1-miles.chen@mediatek.com>
References: <20220102234633.31709-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_174052_472736_CD87DEEC 
X-CRM114-Status: GOOD (  10.19  )
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

Hi Matthias,

>> I'm still not happy with the commit subject, I think it is misleading. Clang 
>> only helped to find the bug, but the we are fixing something else, that's not 
>> just a clang warning. But I don't want to nit-pick too much so:
>> 
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> thanks. I think you are right.
> I will change the subject to "drm/mediatek: Fix mtk_cec_mask()", remove the 
> clang part and submit patch v4.

I posted patch v4 https://lore.kernel.org/linux-mediatek/20220103054706.8072-1-miles.chen@mediatek.com/
without your reviewed-by tag.

Would you mind taking a look at the patch?

Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
