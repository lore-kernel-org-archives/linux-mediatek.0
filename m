Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55466C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 09:35:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC0362310D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 09:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC0362310D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3PKTw6GrAIIgPZoomUreNRAmTCfXWF1+Fuoawloy4zU=; b=a5J7ShqwWJW08I3Or9Jeinamr
	R7DVDmTFydE0BUK/syd9c1bO7YKbUSnhNpWohDJ7RM+YTfwuoo+yw9cyBzbZK0LqVvkPwUWagMuBD
	S1DQHFMBV1gJeUqHB3K+JiXrN9USJ3QQFihpmK6wrLedcx2fUCXur0zxA2aKfkWUHXx7dCKqMYXj8
	onfi1Gj30JGMsFCUESqJeExVf/6FsfIl2sSmcsWTDkc3+Aa2muAAosWSrY3hHDU36IVcC30bLPdUy
	74wxmtq7YS2NEySA5hlKk0NM/lddq4olxbvk4VZ7AHDCJYIjzh7ISUFvDHMU9IqHQkmLwuPAoImjY
	EPudESMFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kre4P-000100-4S; Tue, 22 Dec 2020 09:35:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kre4M-0000ym-T4
 for linux-mediatek@lists.infradead.org; Tue, 22 Dec 2020 09:35:04 +0000
X-UUID: 4d700e380cd5415d8f883eb81ffe0ffc-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0udAgotjlx7o/05+IGtAmYI5uIG+TbNG645Wdw5h9C4=; 
 b=PkvLktjm41hrXS2uWmPc1+hFjlgpMY9fsOft+2p+exk8sbhAQ9dkqdXk6l6Ng6XeHt2UG7Ah4djpBAoTutTG3AZHOEQXu5NFOkVJUQDSJR1cSS2igvoSuCqqqA40b1auJBAkoPm+FI5oY5ebZLTadevj1kPssF0tHrxNKehjxiw=;
X-UUID: 4d700e380cd5415d8f883eb81ffe0ffc-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1496282493; Tue, 22 Dec 2020 01:34:58 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 01:34:56 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 17:34:53 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Dec 2020 17:34:51 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Subject: [RFC PATCH v3 2/5] usb: xhci-mtk: add mt8192 wakeup
Date: Tue, 22 Dec 2020 17:34:39 +0800
Message-ID: <1608629682-8535-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1608629682-8535-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1608629682-8535-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4E19E506E984517EAF04F3A002C9AD4C689C86BC3D595BD82BBCC7BDB91C627F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_043503_150049_AE07331E 
X-CRM114-Status: GOOD (  10.67  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Zhanyong Wang <zhangyong.wang@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Zhanyong Wang <zhanyong.wang@mediatek.com>

need to add wakeup solution as V3
since not support presently.

Signed-off-by: Zhanyong Wang <zhanyong.wang@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v3: no changes
---
 drivers/usb/host/xhci-mtk.c | 9 +++++++++
 1 file changed, 9 insertions(+)
 mode change 100644 => 100755 drivers/usb/host/xhci-mtk.c

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
old mode 100644
new mode 100755
index 8f321f39ab96..565ce4c16206
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -68,9 +68,13 @@
 #define SSC_IP_SLEEP_EN	BIT(4)
 #define SSC_SPM_INT_EN		BIT(1)
 
+/* mt8192 etc */
+#define SSC_IP_SLEEP_EN_V3	BIT(6)
+
 enum ssusb_uwk_vers {
 	SSUSB_UWK_V1 = 1,
 	SSUSB_UWK_V2,
+	SSUSB_UWK_V3,
 };
 
 static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
@@ -305,6 +309,11 @@ static void usb_wakeup_ip_sleep_set(struct xhci_hcd_mtk *mtk, bool enable)
 		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
 		val = enable ? msk : 0;
 		break;
+	case SSUSB_UWK_V3:
+		reg = mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
+		msk = SSC_IP_SLEEP_EN_V3 | SSC_SPM_INT_EN;
+		val = enable ? msk : 0;
+		break;
 	default:
 		return;
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
