Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4EEC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 07:13:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3692C619AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 07:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3692C619AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eoSXdYymfVLdTt9R2PmKFsaxC5rMXFGc1+3RNmpEbuY=; b=N/dBuZONajK9+PByI7r4BVeDz
	d/nzWGyStVLJYBzP8upVpHrGtLxLYXx8TxCw9orkm5S67JP6Vw0YriTIrsISPlti1GnmU3nyXqUuL
	G9JnzKTXZvJqNRQ02Mlj5rCqF8tMtyBrGDwPv2HQNkJ/ILOVvdEyMILApS2rpSfbPrVslgHzLAQEH
	0Tgi+W17KRqJHUwbPaY7teeLKeqtxdKLkPf8z9zVC94XR3wrr0JrBCQ+uIRO7jhk7POUEHJ/LsDR6
	WsGyIk0eU/fzEHPjGJKVGnHUlRCfUS3IS7+9Sn382BTla7pfa4gVOxm8kgfJlr0/TtvAUC69Y5jiI
	cC09W40yQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lObEF-00E6Q1-Ka; Tue, 23 Mar 2021 07:13:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lObE8-00E6Nv-PS; Tue, 23 Mar 2021 07:13:24 +0000
X-UUID: 2b835343c5994c8192773df2491272b8-20210322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RAccarZkV8hoTyKs8UHUFLnbrd64SkravZOuwglg8jk=; 
 b=JRB7CGD3SiiD01YkwKTXv/Wi0Gjgawgkh9n/i1UvZKFBdXqLJBet06a6H8CHQayMPh5uJUjFDcTvzOJ8FZVNQGWVJXDzYBKTHQB7AuSNYgMZCuSZltNm6o8xCp3y0LXKZw2cYb4K7ojYLrXEydQXNR8wqLCZDbsoIyvyGrIm2Gs=;
X-UUID: 2b835343c5994c8192773df2491272b8-20210322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1236146260; Mon, 22 Mar 2021 23:13:16 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 00:03:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 15:03:18 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 15:03:17 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Eddie Hung <eddie.hung@mediatek.com>, "Nicolas
 Boichat" <drinkcat@chromium.org>
Subject: [PATCH v2 11/13] usb: mtu3: add support ip-sleep wakeup for MT8192
Date: Tue, 23 Mar 2021 15:02:53 +0800
Message-ID: <1616482975-17841-11-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1616482975-17841-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1616482975-17841-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 02F9C87FB8E8A7A7065AB363ECCD9788151B206C18A17FA37E66208E14F3C6CD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_071321_542651_D8190AE7 
X-CRM114-Status: GOOD (  12.77  )
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

Add add support ip-sleep wakeup for MT8192, it's a specific
revision, not following IPM rule.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2:
   1. fix typo suggested by Sergei
   2. modify revision format
---
 drivers/usb/mtu3/mtu3_host.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
index 398ce0014606..e3c923e6529f 100644
--- a/drivers/usb/mtu3/mtu3_host.c
+++ b/drivers/usb/mtu3/mtu3_host.c
@@ -30,6 +30,10 @@
 #define WC0_IS_P	BIT(12)	/* polarity */
 #define WC0_IS_EN	BIT(6)
 
+/* mt8192 */
+#define WC0_SSUSB0_CDEN		BIT(6)
+#define WC0_IS_SPM_EN		BIT(1)
+
 /* mt2712 etc */
 #define PERI_SSUSB_SPM_CTRL	0x0
 #define SSC_IP_SLEEP_EN	BIT(4)
@@ -39,6 +43,7 @@ enum ssusb_uwk_vers {
 	SSUSB_UWK_V1 = 1,
 	SSUSB_UWK_V2,
 	SSUSB_UWK_V1_1 = 101,	/* specific revision 1.01 */
+	SSUSB_UWK_V1_2,		/* specific revision 1.02 */
 };
 
 /*
@@ -60,6 +65,11 @@ static void ssusb_wakeup_ip_sleep_set(struct ssusb_mtk *ssusb, bool enable)
 		msk = WC0_IS_EN | WC0_IS_C(0xf) | WC0_IS_P;
 		val = enable ? (WC0_IS_EN | WC0_IS_C(0x8)) : 0;
 		break;
+	case SSUSB_UWK_V1_2:
+		reg = ssusb->uwk_reg_base + PERI_WK_CTRL0;
+		msk = WC0_SSUSB0_CDEN | WC0_IS_SPM_EN;
+		val = enable ? msk : 0;
+		break;
 	case SSUSB_UWK_V2:
 		reg = ssusb->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
 		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
