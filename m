Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FBBC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 09:09:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 670F66128D
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 09:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 670F66128D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpUtqazxma4BSLLRGfS/095j4XAGk9WWhgTx1zIoJnw=; b=VUexLdwzgZGuyl
	dwzCtk+ouk+jg1C7x6Ftwnl1yE30SoeIJeQVnIAp7HUwL8nBai6zVtf0rXq9B7kHjsfFyCbLYdYzR
	Rzbxjs8q83wRTlviTtt2o2Dxcecdc9IoOD1b4plArDwhRcS64JcTUXdtu/NnOnD9Uu5uvQ8MGOLSP
	Zgx9rwQDJaRGuqqv5IxE7NWNDq2RfSnYN8nk2QYLnN58ww/jyqaGDQmTvMe7E4wIBEppvvjOE4Jqb
	wUydV4jrTxbtXUGMOq/TGFg41e30wZMspbzbMQ3Zvp10OEKeIflOwU9co9rPJo8mKD/pBMy/Q52SA
	Do6LXt06MEqkfTKxNXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3xMk-0003HS-PJ; Thu, 15 Jul 2021 09:09:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3xLy-00031v-VM; Thu, 15 Jul 2021 09:08:24 +0000
X-UUID: 686357a0492f40b1b5a40ac342f17235-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5Vp4W2/Ny8DxFGMeFsFqnZWdoZ/YLg3aa30w5ATY3pY=; 
 b=Da+kzPk12bG3nvR1b1un2ft9YwfuAkaTA85zU8t4T6mRqffk9VbBLrIDBv/Ce0L5cZMD9kdIfu8q5ykIJoWlMdRoBgJrzz+fpzXhdT2BubysfdL55oCAmOPqDCBYDOUTKR9yBP7EJpqoWX+qBiNKe76SlcEe8BNe4MQ4CFhPk1k=;
X-UUID: 686357a0492f40b1b5a40ac342f17235-20210715
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 18087264; Thu, 15 Jul 2021 02:08:19 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 02:08:17 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 17:08:16 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 17:08:15 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH v3 05/13] usb: common: add helper to get
 role-switch-default-mode
Date: Thu, 15 Jul 2021 17:07:50 +0800
Message-ID: <1626340078-29111-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1626340078-29111-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1626340078-29111-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_020823_034265_1181AF7C 
X-CRM114-Status: GOOD (  13.65  )
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

Add helper to get "role-switch-default-mode", and convert it
to the corresponding enum usb_dr_mode

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~3: no changes
---
 drivers/usb/common/common.c | 20 ++++++++++++++++++++
 include/linux/usb/otg.h     |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index 347fb3d3894a..c9bdeb4ddcb5 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -200,6 +200,26 @@ enum usb_dr_mode usb_get_dr_mode(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(usb_get_dr_mode);
 
+/**
+ * usb_get_role_switch_default_mode - Get default mode for given device
+ * @dev: Pointer to the given device
+ *
+ * The function gets string from property 'role-switch-default-mode',
+ * and returns the corresponding enum usb_dr_mode.
+ */
+enum usb_dr_mode usb_get_role_switch_default_mode(struct device *dev)
+{
+	const char *str;
+	int ret;
+
+	ret = device_property_read_string(dev, "role-switch-default-mode", &str);
+	if (ret < 0)
+		return USB_DR_MODE_UNKNOWN;
+
+	return usb_get_dr_mode_from_string(str);
+}
+EXPORT_SYMBOL_GPL(usb_get_role_switch_default_mode);
+
 /**
  * usb_decode_interval - Decode bInterval into the time expressed in 1us unit
  * @epd: The descriptor of the endpoint
diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
index 7ceeecbb9e02..6475f880be37 100644
--- a/include/linux/usb/otg.h
+++ b/include/linux/usb/otg.h
@@ -128,5 +128,6 @@ enum usb_dr_mode {
  * and returns the corresponding enum usb_dr_mode
  */
 extern enum usb_dr_mode usb_get_dr_mode(struct device *dev);
+extern enum usb_dr_mode usb_get_role_switch_default_mode(struct device *dev);
 
 #endif /* __LINUX_USB_OTG_H */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
