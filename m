Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D10C43461
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:39:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EF8E207D3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sWFeCvg9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="meF3D7oR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EF8E207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LWvQxH83RObtZwCBQTMZAkdKfxO8CbRUKVVd80awTx4=; b=sWFeCvg9ssgyUwIr9YsYA1J4e
	0V9yrTHsch7QKD4ZVAKVh7IHe3klj5/wGSLmXx4RKfP4XYcw+Zio0YtBznavhNIyLRxpUIJk5mgUN
	iD2FlhAcFTc4x4LoLFRpfY1hc+s8rBIGUT7iWLH43KV8jlnn+K5h65oqcYntYBSJZUSpIle3wMtGl
	Nfa4gWU2po5ElTLYFdjtIQ0yCAzqzoK9Sqnie/we7+r3tpEfYYC0lI2YHcA4u9oIVlVAzVqE4jkAC
	JayNalgUpfN2O5l4nRrO0K3WsNzG6pcPCaDY68cK/fcSSSsLgPwZ4+urVklPicDM49CTxR9mT57wb
	MkTk1CvQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDg5w-0006iZ-BZ; Thu, 03 Sep 2020 03:39:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDg5r-0006gI-Hl; Thu, 03 Sep 2020 03:39:24 +0000
X-UUID: 7ca4ccff0d104383a8ebff4f02329029-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hociBLiC64wu1IzlEev33FmaQGVirv5h4VmmTW9yoM8=; 
 b=meF3D7oRcYuLgAOhGuujO/DDZP1Z9KtTnQb7l/IUO7xLXuhpBwlTfhLjw9WdCScQ4cSqz81d7DDqFBOYCg2pYM1p0EBU+3neqkqrns8hnZO9MrlDqXi8IAdVmf52pY7oXGTktNmmVjh9P7PxZDTFdob+WaqFe9c7p9ScLLiiXUE=;
X-UUID: 7ca4ccff0d104383a8ebff4f02329029-20200902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 166445081; Wed, 02 Sep 2020 19:36:13 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 20:36:11 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 11:36:06 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Sep 2020 11:36:07 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Zhanyong Wang <zhanyong.wang@mediatek.com>
Subject: [RFC PATCH 2/4] usb: xhci-mtk: add mt8192 wakeup
Date: Thu, 3 Sep 2020 11:34:23 +0800
Message-ID: <1599104065-8009-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599104065-8009-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1599104065-8009-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 78442EDDB1CD2F3D493CEF97F4919CCBDEE74B2861E492BE5451E4E9E612BDD72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_233923_702522_C1021B83 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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
 drivers/usb/host/xhci-mtk.c | 9 +++++++++
 1 file changed, 9 insertions(+)
 mode change 100644 => 100755 drivers/usb/host/xhci-mtk.c

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
old mode 100644
new mode 100755
index 4311d4c..d95221f
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
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
