Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED05AC2B9F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 08:54:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B065361409
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 08:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B065361409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LHkYO3kuQDBgcxagemAXaRkFpsh44CeZZ0crKqHJhkQ=; b=Ydq+WQudHEKixL
	9eAtA4dKmYrM8ETY7W3dJVYVkHsRgtAXUtqsUZjeDdH6cdOLimfz1cpqjDaXrcM9KCTlruXnAmoBQ
	vv+o5loSMF32Zc4f5cDYT9IM4iRitOXE68YhyN7Y+LlhO0wlNC85XpJutcip2PRvRG2lTUiyGni7t
	rMs0cHCTRRiWWdxpNo9HEZHCehTgaDbRL/SmnpTd/ecmh7LDBWXAd+0u1Ff27D55XIZvBPKN056VT
	2WbbawJObzYAbBiIQY0+3bmHO+Z/NNljR1Dwn+6bdaaPjHeOCcYSj+75emfBF0PgCFA9mCavhFp7Q
	dJwRT0ssPbWGfvusuFPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llSoy-004CGO-2T; Tue, 25 May 2021 08:53:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llSoS-004C14-Ix; Tue, 25 May 2021 08:53:24 +0000
X-UUID: ab6d197bb66d4cc2a933f5992b0326c9-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Q+d5TmFxgYUOTbXeyIucEBVczen+3LmsqBJCeNp4jJw=; 
 b=W+uP7ZPDQAomOXHtTRTciCn1DDgsG7mjJnhSV7MTsN75DhylrCVH3m6naC2XV3R1aFlzQ+dEvRfdtunLVFoD2ubL8FcozDIBKvMEl1Kh2f8OiRuE8qSJcrkEzA58InU8FCNh7BPZldE7lp7CenPswpklSDZ7LFMkc7TLRBXG4PU=;
X-UUID: ab6d197bb66d4cc2a933f5992b0326c9-20210525
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 539246454; Tue, 25 May 2021 01:53:14 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 01:53:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 16:53:09 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 May 2021 16:53:08 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Thierry Reding <treding@nvidia.com>, "Paul
 Cercueil" <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>, "Guenter
 Roeck" <linux@roeck-us.net>, Hans de Goede <hdegoede@redhat.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/2] usb: roles: add helper usb_role_string()
Date: Tue, 25 May 2021 16:53:05 +0800
Message-ID: <1621932786-9335-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9D3C1B779BF25D9D23F9965EFEF3D524173D86C78AC011EFF27669269D1E0E2E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_015320_694316_91588F93 
X-CRM114-Status: GOOD (  11.53  )
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

Introduces usb_role_string() function, which returns a
human-readable name of provided usb role, it's useful to
make the log readable.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/roles/class.c | 9 +++++++++
 include/linux/usb/role.h  | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index 33b637d0d8d9..dfaed7eee94f 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -214,6 +214,15 @@ static const char * const usb_roles[] = {
 	[USB_ROLE_DEVICE]	= "device",
 };
 
+const char *usb_role_string(enum usb_role role)
+{
+	if (role < 0 || role >= ARRAY_SIZE(usb_roles))
+		return "unknown";
+
+	return usb_roles[role];
+}
+EXPORT_SYMBOL_GPL(usb_role_string);
+
 static ssize_t
 role_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
index 0164fed31b06..031f148ab373 100644
--- a/include/linux/usb/role.h
+++ b/include/linux/usb/role.h
@@ -65,6 +65,7 @@ void usb_role_switch_unregister(struct usb_role_switch *sw);
 
 void usb_role_switch_set_drvdata(struct usb_role_switch *sw, void *data);
 void *usb_role_switch_get_drvdata(struct usb_role_switch *sw);
+const char *usb_role_string(enum usb_role role);
 #else
 static inline int usb_role_switch_set_role(struct usb_role_switch *sw,
 		enum usb_role role)
@@ -109,6 +110,11 @@ static inline void *usb_role_switch_get_drvdata(struct usb_role_switch *sw)
 	return NULL;
 }
 
+static inline const char *usb_role_string(enum usb_role role)
+{
+	return "unknown";
+}
+
 #endif
 
 #endif /* __LINUX_USB_ROLE_H */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
