Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95836C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 09:45:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41E8661176
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 09:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41E8661176
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UDcClpbeH7FBG9Bl1rMdliaCLX14iclY5yXwMb8ezDo=; b=Nl7xH3l3sNriFA1l0EHdhVwPS
	Fj5bORGiGtBhCDyUmkzIox9xsu9UAHsrfI4ZAVPy2HIdKUgCBZhQf385hWg7rz3p9p2qsF3dlVO4z
	d8QeYOXP8HWTwh1Ry6YewXBMfZyvUVEwwnbUEs1WqRwOEWm0NfLyovBMxipm+cV9b6bX+lcj5Uu/2
	YO52UP44Fhu+kyAkxryGaXBYqpLYx6TcfGTc6BoHhOgBhgsubWMiq92xHqL+/8UuFRGaTK0FSq97w
	eSUn4oO4HQr6erXtagM4+UUGvNS3qGvgBsrpvsbL/0JKO3mchkb3jK9aqokD4fu+V4r5+ZAijtyLi
	G/lotoFXg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lURDd-007Xdp-9Z; Thu, 08 Apr 2021 09:44:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lURDT-007XcO-9r; Thu, 08 Apr 2021 09:44:49 +0000
X-UUID: 615eced178e6440c8ba6a13d265bbc80-20210408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=OATHyuArIUWmVtUiV7GFbuOgvKaqXCx+GVibHUT/9rA=; 
 b=aRzy4cgnYg8osFGKm9S3L4auqXAbe66NbBplkee1wvgPq/vFhsWY2TVcbO9rMr4ai/agFsdUXq5hSrR8+rqd66Tb+CUuiGlAzK1ivX0z70a17DrMZg3UrjfX9YCM8LRaT3jM5Xj7mmozsvZywCeEvJhJCvMNd46pAPHV/jUXhVI=;
X-UUID: 615eced178e6440c8ba6a13d265bbc80-20210408
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 803215177; Thu, 08 Apr 2021 02:44:38 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 02:35:25 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 17:35:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Apr 2021 17:35:23 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Tianping Fang
 <tianping.fang@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, "Ikjoon
 Jang" <ikjn@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 6/6] usb: xhci-mtk: remove unused members
Date: Thu, 8 Apr 2021 17:35:14 +0800
Message-ID: <1617874514-12282-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_104447_855254_951B6D4C 
X-CRM114-Status: GOOD (  10.04  )
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

Now some members about phys and wakeup are not used anymore,
remove them.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 11996edc1967..7940593a3445 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -145,9 +145,6 @@ struct xhci_hcd_mtk {
 	struct regulator *vusb33;
 	struct regulator *vbus;
 	struct clk_bulk_data clks[BULK_CLKS_NUM];
-	struct regmap *pericfg;
-	struct phy **phys;
-	int num_phys;
 	bool lpm_support;
 	/* usb remote wakeup */
 	bool uwk_en;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
