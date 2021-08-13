Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5894C19F39
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 06:32:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D1CF610CC
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 06:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D1CF610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6UlIJNcvvlBxIKl8ucl7UNhBH1tD/SBgf6xWa0dfTk=; b=iy2rXCgbfdzo6s
	1XRl5c1bbyPB5KGilT4O7dO+vkR5yjar7qei+7rocYD//cWx6ZX8FYGfPXTti38WDP3QFgxnT3LBb
	goOREVLuMk7RKUuYeUED77E97OO0IGvSe0wwIr6O+nkcXYczTY7vjqcBJ90SvcfXNyqlU6++klaMz
	as5UOjdZCwZRLRVeGLGZDNUCwaQY40+oQWoQu102AWRBi0Jl0m9kszJ4AM9Yh60hm2NSS2CGUnQZ2
	MONuzF4CVYwE2EI6nWeq5PNU3zpEm+47qGMGPOqr+ik5pyhvQiswahzhobDNldPKkcQWpflspPyIS
	cEZR72vYaLWSpZn2iVDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEQjp-00BpiM-JZ; Fri, 13 Aug 2021 06:32:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEQjY-00Bpcc-1p; Fri, 13 Aug 2021 06:32:03 +0000
X-UUID: 4a1249e4dc324b68b836729fe8f10a64-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9mLEVI002F+J8BOYPLut+Hy/C42J4PLVNEpOogLWMak=; 
 b=CWSZ0kSmgCTYbhzaB+Dv1mSpPl1g6djdVMwzgFfbmGMaxMU662Zymm2lIUXrjDvKy7Oq06vSnRfmbNofE6NhoqdtjQMerRGuErhVkuuZLoETFtuQ2wz6IbAp1pzPweAVnjHWt5NxaFmkwYghU9EVLc53jSpvvT2M0J037OoHFDk=;
X-UUID: 4a1249e4dc324b68b836729fe8f10a64-20210812
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 210483902; Thu, 12 Aug 2021 23:31:59 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 23:31:57 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 13 Aug 2021 14:31:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Aug 2021 14:31:54 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>
CC: Pawel Laszczak <pawell@cadence.com>, Al Cooper <alcooperx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Yang Yingliang <yangyingliang@huawei.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>,
 <linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, <stable@vger.kernel.org>
Subject: [PATCH v3 3/7] usb: mtu3: fix the wrong HS mult value
Date: Fri, 13 Aug 2021 14:30:49 +0800
Message-ID: <1628836253-7432-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1628836253-7432-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1628836253-7432-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_233200_140051_6584B714 
X-CRM114-Status: GOOD (  11.67  )
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

usb_endpoint_maxp() returns actual max packet size, @mult will
always be zero, fix it by using usb_endpoint_maxp_mult() instead
to get mult.

Fixes: 4d79e042ed8b ("usb: mtu3: add support for usb3.1 IP")
Cc: stable@vger.kernel.org
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: fix invalid email format for stable
v2: split two patch [v2 2/7],[v2 3/7] suggested by Felipe
---
 drivers/usb/mtu3/mtu3_gadget.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 635ad277cb13..a399fd84c71f 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -64,14 +64,12 @@ static int mtu3_ep_enable(struct mtu3_ep *mep)
 	u32 interval = 0;
 	u32 mult = 0;
 	u32 burst = 0;
-	int max_packet;
 	int ret;
 
 	desc = mep->desc;
 	comp_desc = mep->comp_desc;
 	mep->type = usb_endpoint_type(desc);
-	max_packet = usb_endpoint_maxp(desc);
-	mep->maxp = max_packet & GENMASK(10, 0);
+	mep->maxp = usb_endpoint_maxp(desc);
 
 	switch (mtu->g.speed) {
 	case USB_SPEED_SUPER:
@@ -92,7 +90,7 @@ static int mtu3_ep_enable(struct mtu3_ep *mep)
 				usb_endpoint_xfer_int(desc)) {
 			interval = desc->bInterval;
 			interval = clamp_val(interval, 1, 16) - 1;
-			mult = (max_packet & GENMASK(12, 11)) >> 11;
+			mult = usb_endpoint_maxp_mult(desc) - 1;
 		}
 		break;
 	default:
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
