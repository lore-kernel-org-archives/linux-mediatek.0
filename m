Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E6BC433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 05:20:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38A696102A
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 05:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38A696102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pCmkdBOlW5uBIBUmPY5YgvUr6S4YVp89gRlHL8Q+9MA=; b=Pxk3yKvBakq/2EJtG+X7TdGoV
	maD9H0tFuQB0aelzbJff5iN+eDb5+E6d7IQ584LyO20NohG8otFaSuN7wyuEWUhp8MBi7Aa7FoxlC
	ucvadyvq59ENSeDUvJl1TLPBTM9BVpRBydDHw9LHyJt/0Gmm9HouH6Zuz68hojjXr5kBy2iwnkhAP
	z/TBq5OwO/KfZmc4hs+L4LYDjFJGq7FLkUAZB2kMaa+1GRZ05rf1um4D7VUXGbuzUzTDG8xAiSQZJ
	mpPoSSUtpLEHvZoZAyWT43tHHd/yZW0N8BOEMmnZ9i4uyrQJFeuUeaZZ1m6N9lJhm7UctZmgXmjN8
	Q/7IMZwSw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV62z-002Djj-2M; Sat, 10 Apr 2021 05:20:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV62n-002Dhv-6E; Sat, 10 Apr 2021 05:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=TdnV7ploCt97Wq8AY62rYREnf3mFASpW9KBwsMtCtMI=; b=yzN2CxL8TfcdlOK6Xf1K5604oF
 S5uG8vQuH1CTGJ1eEXpYUr4hrjV2tYnPIGf50yOiSegjo2gDMbddSwdMLkNO5/OtCwOIIGbbPMS/g
 FWxFxsN8s/pKb25ol7btda6Lm11e+AYS4WCcJ6ru0hUui6CVim5AgJPHZmMwkugkRqWdBHHpJwnVf
 3gPGZCVVA3VO74x1vAOnhcU1y68Gs91GLyETVNEqyTEZLQo+HvxKPGFCB/mStaneW7k4XMXVKsT8E
 lTBab/tAfpvXo+WiFVxS8gzYjYDuqGjsgDOGQxqyVHxEs2z6NvlJOj9WrZJ42qjR93HSToVRYq/r2
 4aWWbnsg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV62k-004wQF-7g; Sat, 10 Apr 2021 05:20:27 +0000
X-UUID: b63bebe15f97460d9aa3154ecadebfed-20210409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TdnV7ploCt97Wq8AY62rYREnf3mFASpW9KBwsMtCtMI=; 
 b=LQ7WBY7JlQabFhrX8TGWOWkwX0z8VX0CI2IJBsxDmtQofv+36/mC8Ea5RqXYXp2NaOF3IDmSL+AYNMu+k9Sb5SGw1Co5Ef0nFD2fhIz0ePp6g+8tLEpMYtSMVh2K+qJo2pE+uhBi8c02hwQ5bTGk4fKlcTQCgm4AAg2f2Q6koDs=;
X-UUID: b63bebe15f97460d9aa3154ecadebfed-20210409
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 48433483; Fri, 09 Apr 2021 22:20:24 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 22:10:22 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 13:10:21 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Apr 2021 13:10:20 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek
 <pavel@ucw.cz>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Tianping Fang
 <tianping.fang@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, "Ikjoon
 Jang" <ikjn@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 5/5] usb: xhci-mtk: remove unused members
Date: Sat, 10 Apr 2021 13:10:06 +0800
Message-ID: <1618031406-15347-5-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618031406-15347-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1618031406-15347-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_222026_303324_0E1F510C 
X-CRM114-Status: GOOD (  10.82  )
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
v2: no changes
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
