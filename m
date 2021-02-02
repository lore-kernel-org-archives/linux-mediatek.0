Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBD2C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 10:35:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC11564F58
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 10:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC11564F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E9esLaLbqxjTbsUIertbzgyZOwt6vYfoP1tanpYhwe8=; b=Yc5DyLUM0R0ieB8YbGm67EC28
	PIy6Wd/cFRV09vFcdG6xQQC/Q+6+QCByy167AiM58AgzddxezcxPx3g5WHWMUaX4bnDgUiGoxwQDm
	rTXsHUTGu/qr88Fg1jLimO0t7GJr5vGqdREV4QzktNkuE1id7FBGAnZk38vBQhKGavkt/Xt6KRI8v
	VLZ/PjY07AxRMHbewuENNwI5OHnxOgzX2Df100fz5W0zgrRA0VCHNuEu2hDBQhlO5ZLxvrWnSB5c4
	hPQBJ+tKujEhQqkvmfxzXvCnRPyYnqHsmA8+Hvf1yGAdTx7UxQCXhG6Q5Nr4ogwP5UgtUvW7Z5EOM
	+G5rDJlSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6t1S-0007yR-Bx; Tue, 02 Feb 2021 10:35:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6t1O-0007x6-GK
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 10:34:59 +0000
X-UUID: 54d39d91aab44a5083f9734bcc31120f-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ETNw04MkD48M8ayuzYG6HqFFyqAmWIePOPWmT/d2H+A=; 
 b=UYFjG0m4anIwQaA2DkovYENMeGMlCWukOKCEOJ7hcrFq8YF6ecVx2JTp8ROJlB3YqlGV6CAknoxgtJli6Tg0OH3A+Sg7MGlyyWds7qMxCEAzRrp1h4iM4SeUZNv7LCdzkU5qyqisaNrxhIFTGd1KN2J+bL7GtgntquzcbcU5RcQ=;
X-UUID: 54d39d91aab44a5083f9734bcc31120f-20210202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1980934072; Tue, 02 Feb 2021 02:26:39 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 02:26:32 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 18:26:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 2 Feb 2021 18:26:22 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <Sean.Wang@mediatek.com>
Subject: [PATCH v4 1/2] Bluetooth: btusb: Fine-tune mt7663 mechanism.
Date: Tue, 2 Feb 2021 18:26:17 +0800
Message-ID: <20210202102618.27640-2-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210202102618.27640-1-mark-yw.chen@mediatek.com>
References: <20210202102618.27640-1-mark-yw.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 478DBAC3500F4E265D70071AE3B115A5FB64508969953C7C970862DA57B49D552000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_053458_738067_6358DAF4 
X-CRM114-Status: GOOD (  12.48  )
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
Cc: robin.chiu@mediatek.com, Mark
 Chen <Mark-YW.Chen@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Eric.liang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "mark-yw.chen" <mark-yw.chen@mediatek.com>

Fine-tune read register for mt7663/mt7921.
For mediatek chip spcific wmt protocol, we add more delay to send EP0
In-Token.

Signed-off-by: Mark Chen <Mark-YW.Chen@mediatek.com>
---
 drivers/bluetooth/btusb.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 03b83aa91277..2ba8dd6d3d2d 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3138,6 +3138,7 @@ enum {
 enum {
 	BTMTK_WMT_INVALID,
 	BTMTK_WMT_PATCH_UNDONE,
+	BTMTK_WMT_PATCH_PROGRESS,
 	BTMTK_WMT_PATCH_DONE,
 	BTMTK_WMT_ON_UNDONE,
 	BTMTK_WMT_ON_DONE,
@@ -3153,7 +3154,7 @@ struct btmtk_wmt_hdr {
 
 struct btmtk_hci_wmt_cmd {
 	struct btmtk_wmt_hdr hdr;
-	u8 data[256];
+	u8 data[1000];
 } __packed;
 
 struct btmtk_hci_wmt_evt {
@@ -3252,7 +3253,7 @@ static void btusb_mtk_wmt_recv(struct urb *urb)
 	 * to generate the event. Otherwise, the WMT event cannot return from
 	 * the device successfully.
 	 */
-	udelay(100);
+	udelay(500);
 
 	usb_anchor_urb(urb, &data->ctrl_anchor);
 	err = usb_submit_urb(urb, GFP_ATOMIC);
@@ -3555,9 +3556,9 @@ static int btusb_mtk_reg_read(struct btusb_data *data, u32 reg, u32 *val)
 	return err;
 }
 
-static int btusb_mtk_id_get(struct btusb_data *data, u32 *id)
+static int btusb_mtk_id_get(struct btusb_data *data, u32 reg, u32 *id)
 {
-	return btusb_mtk_reg_read(data, 0x80000008, id);
+	return btusb_mtk_reg_read(data, reg, id);
 }
 
 static int btusb_mtk_setup(struct hci_dev *hdev)
@@ -3575,7 +3576,7 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 
 	calltime = ktime_get();
 
-	err = btusb_mtk_id_get(data, &dev_id);
+	err = btusb_mtk_id_get(data, 0x80000008, &dev_id);
 	if (err < 0) {
 		bt_dev_err(hdev, "Failed to get device id (%d)", err);
 		return err;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
