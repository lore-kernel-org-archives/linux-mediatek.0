Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0056AC43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 08:18:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A996820791
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 08:18:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DevQdh36";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WZAyFRkq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A996820791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uhZSp3Uo3pn+nycG9uZ6uf3aosS6g1OUXbEDZfvQ8zY=; b=DevQdh36eHMAm0TFqff90AeGz
	eniIDLjZPBRxizP9/tDZNU5ZYz9CBXSNEd3Rfw0x2wgdlBIHoy3ecF4h0fQ1fKkm76aTlOjrbioDo
	gLNNIMD+go6xYaNEXCeYRADiNGsjnM0Sv1DYr+4XVtDyLwOxuFcSfLFSHxwm7ME3kKyPLSj74zXyH
	JEecsc3GydGzIUXq+hVkMPWcTZsdWTPksiOc8KbHJDFJmjXZnroKELijfIjjgnsejcECjcrRf/mda
	4gXn0/m2QHsh+SorJJPj6nJv7x5pPUt06GFM8GYnK9FYmT/yH/JUXI8FkFephJszWiod4lRQMRuN8
	Sj06KGdaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE6vC-0006Re-6b; Fri, 04 Sep 2020 08:18:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE6vA-0006Ph-1W; Fri, 04 Sep 2020 08:18:09 +0000
X-UUID: ed65be8d993945d2a036ea442f0a9166-20200904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8rRrbCmdA3reTEcnRumgB1k/g3lTeehQQDEOoft6l6Y=; 
 b=WZAyFRkqGESgqiNjzJnb3RA0PdEM+n1eHQWK9FkN19RiEpp1bEQj6M5mwT7nxxfGsGbAzkU2mx1jhS3mGqNUOqyCxnVOBGKBzS0Z0ilzFnndbY1nMHlIGOVLOKtA5gBI2feKosYfZzppVebNq/uXTgRRw7TUseTXks4c6INc1aY=;
X-UUID: ed65be8d993945d2a036ea442f0a9166-20200904
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1698213443; Fri, 04 Sep 2020 00:17:37 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 01:17:35 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 16:17:30 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Sep 2020 16:17:29 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Zhanyong Wang <zhanyong.wang@mediatek.com>
Subject: [RFC PATCH v2 2/4] usb: xhci-mtk: add mt8192 wakeup
Date: Fri, 4 Sep 2020 16:15:38 +0800
Message-ID: <1599207340-4673-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599207340-4673-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1599207340-4673-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2EBBA91619F7DF239197DD7B7CD12799BA62E7C589CD9089C0DA839B21AE0BD52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_041808_273212_7BD496DA 
X-CRM114-Status: GOOD (  11.93  )
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
v2: no changes
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
