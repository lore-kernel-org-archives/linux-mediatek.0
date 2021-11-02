Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F2BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 02:50:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7578D60EE9
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 02:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7578D60EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XH4vysBOkp4JfC0Fv6HfrprnRSgo6COxZexbNxuXc4I=; b=S73Csgj5F20ajL
	b6G5iKyPWG38jlYQge2zWweOmRQ/Bh+zTFR2RHayXPi7sLIuM/mCOS/+3nKKrBji7l78mvyoNEL4h
	6NV6u895KKtSXXFvfgDAz2B/AYwfZ5CTr/Y/ejlCPozBWsUl5ergT6DVK6lUgH5Td6PGFKHFhcxMB
	TjCTmVf6YFev9nQH6+5hqrtCg38buZVowTJ1VaO2/btt/XkD51TJpVH7LvRhIi/GDEj2oGnH9eVVq
	fAlxQjxoPka+yiYaMak3CMCNgvob2Fmo0TdE0dfvgNn9OusZSH+Me/lIkwykQpNBoEVjlF8bcVViO
	35AlDg9enTusC0XNFRiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhjsp-000KSH-FX; Tue, 02 Nov 2021 02:50:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhjsU-000KNn-R2; Tue, 02 Nov 2021 02:50:24 +0000
X-UUID: 57f48e147ede42c9a314667a7464edb6-20211101
X-UUID: 57f48e147ede42c9a314667a7464edb6-20211101
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2097395139; Mon, 01 Nov 2021 19:50:21 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Nov 2021 19:50:19 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 2 Nov 2021 10:50:06 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Nov 2021 10:50:06 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] usb: xhci-mtk: fix random remote wakeup
Date: Tue, 2 Nov 2021 10:50:04 +0800
Message-ID: <20211102025004.29156-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102025004.29156-1-chunfeng.yun@mediatek.com>
References: <20211102025004.29156-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_195022_908404_3736D176 
X-CRM114-Status: GOOD (  13.29  )
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

Some platforms, e.g. 8183/8192, use low level latch way to keep
wakeup signal, it may latch a wrong signal if debounce more time,
and enable wakeup function earlier.
                   ____________________
ip_sleep      ____/                    \_____________
                           ___________________
wakeup_signal ____________/                   \______
                      _______________________________
wakeup_en     _______/
                      ^     ^
                      |(1)  |(2)
latch wakeup_signal mistakenly at (1), should latch it at (2);

Workaround: delay about 100us to enable wakeup, meanwhile decrease
debounce time.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index adc5debcde88..91a664e8810d 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -245,11 +245,12 @@ static int xhci_mtk_host_disable(struct xhci_hcd_mtk *mtk)
 	/* wait for host ip to sleep */
 	ret = readl_poll_timeout(&ippc->ip_pw_sts1, value,
 			  (value & STS1_IP_SLEEP_STS), 100, 100000);
-	if (ret) {
+	if (ret)
 		dev_err(mtk->dev, "ip sleep failed!!!\n");
-		return ret;
-	}
-	return 0;
+	else /* workaound for platforms using low level latch */
+		usleep_range(100, 200);
+
+	return ret;
 }
 
 static int xhci_mtk_ssusb_config(struct xhci_hcd_mtk *mtk)
@@ -300,7 +301,7 @@ static void usb_wakeup_ip_sleep_set(struct xhci_hcd_mtk *mtk, bool enable)
 	case SSUSB_UWK_V1_1:
 		reg = mtk->uwk_reg_base + PERI_WK_CTRL0;
 		msk = WC0_IS_EN | WC0_IS_C(0xf) | WC0_IS_P;
-		val = enable ? (WC0_IS_EN | WC0_IS_C(0x8)) : 0;
+		val = enable ? (WC0_IS_EN | WC0_IS_C(0x1)) : 0;
 		break;
 	case SSUSB_UWK_V1_2:
 		reg = mtk->uwk_reg_base + PERI_WK_CTRL0;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
