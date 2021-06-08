Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83109C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:09:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AFA36127A
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AFA36127A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZHLZmmkQ4F2gOY3tOCNv4uajrE5OwDjcqgQRRjw94OM=; b=qiyf3hwrbULZLS
	yGMWyjWWB+E8J1XCWguUxDoZaynXpXRABw6UBLPlfQ6EsKSYD41OKZotyj09YrnaUU0QTAyW8pRCp
	QSMBaPBQaQkHsIW/uSNO3OzgnLt99r7r6lZBQRcAFJL2fqlGpsazAVUgcH9uyNnK7k6z7DQb6+G1y
	mYMrQUC3odAO6q0PjUa+SzZT6FR6ProQ2bOv3X4t5lT6eRVu4qJteBDIqSrTPDgnKpkBohyCJB/oX
	g0lE5AqxLvyEAyaFenXJW/9Uc2RWjwm/ShQzHh7DZ2rD+PYFYo6pM/wM0hrryEhdxPH8x4r/tDVvu
	J7bxHsITaDL68wdVaGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqWnE-006y0a-71; Tue, 08 Jun 2021 08:09:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqWmM-006xiH-T1; Tue, 08 Jun 2021 08:08:08 +0000
X-UUID: 18c28e33b8e74287ad02b6a7f82ad0dc-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=A/McRtS4xRmeHy3oNldK9xfL9eXu2mI6OBHkJ5QplN4=; 
 b=ou7Zj3hWc96fhbDHZpp5+RZQU60zF6zvp8wab3v00ijtyrmbg02JHit+TZYYnJwozcdM4FvYRMlY9+ldSXnDYbS/6/VE0guB+ejMT9QhJ33laJI/CkcjwISCb0axXSSzMEWKjXdmXVIyVrnaO95tpF23ijYzUG2MdIx+7c9enfs=;
X-UUID: 18c28e33b8e74287ad02b6a7f82ad0dc-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1000760707; Tue, 08 Jun 2021 01:08:04 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 00:58:11 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:58:09 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 15:58:08 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH 14/23] usb: common: add helper to get role-switch-default-mode
Date: Tue, 8 Jun 2021 15:57:40 +0800
Message-ID: <1623139069-8173-15-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_010806_971151_ED56B13F 
X-CRM114-Status: GOOD (  13.05  )
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
index 69f1b6328532..1550b8e5f039 100644
--- a/include/linux/usb/otg.h
+++ b/include/linux/usb/otg.h
@@ -128,5 +128,6 @@ enum usb_dr_mode {
  * and returns the correspondig enum usb_dr_mode
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
