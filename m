Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9189C2B9F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 08:56:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A18C16100B
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 08:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A18C16100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfCvlzAWSu5h6hJsvr4Irdb7UID6eym7Rj/lOhNvX8M=; b=ZrIXLYnlV+0ohm
	Ux72/rE67ksM2cHzUdEl0f525UPgZyRcLLDa13HR1a2daqjot/zPHmTwuCfEmitBjsvdqb1YJY7Or
	fWuCDFsMaScDCqZi74COkwMBUsmMwK8urz1PK7m599fYNHW4/ucd5J9YbDzaeAx8+OIUvzVMUKJ7F
	N4tLS3fMU0/QRgdQwxvdabhofvUMQnBwtGvekAnE71/bIXe1PUNuFO/xRs4Lrz8AwRlOxz6KiiQ1o
	dfk7CbbcpKyMT59iRAj1fE2ucK4CF4QR9Vcge5lMzrxLmmO4GxSPmxWISLoYhuD73wpOXOghR6ki+
	HEIYxUDEOjypwUdnoEUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llSrk-004DZy-NO; Tue, 25 May 2021 08:56:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llSqT-004Cvn-Jt; Tue, 25 May 2021 08:55:27 +0000
X-UUID: 2704153462f94f7583acf311ba51ecc9-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xHTcyDobWPIh805bZqSPp7cDAaKUL/6OpGPhJpKrc4w=; 
 b=cW5tOHnxGzzBfnTaC+zpM7++TpMttMUmV7DRN4rYxRdk7DBrr2hmlVvXUAUI+0F4cyrxYLr4hBNo/Y9mCWQK71FHwEB+nMDOSNGV/T3B7qiOgu9nQXMPd30BIVyOxDJGuDkksxAaHQ8L94boKO7eAPJtw7f5Df2dTnR+hQKppdo=;
X-UUID: 2704153462f94f7583acf311ba51ecc9-20210525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1897179374; Tue, 25 May 2021 01:55:20 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 01:53:17 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 16:53:10 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 May 2021 16:53:09 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Thierry Reding <treding@nvidia.com>, "Paul
 Cercueil" <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>, "Guenter
 Roeck" <linux@roeck-us.net>, Hans de Goede <hdegoede@redhat.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/2] usb: common: usb-conn-gpio: use usb_role_string() to
 print role status
Date: Tue, 25 May 2021 16:53:06 +0800
Message-ID: <1621932786-9335-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1621932786-9335-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1621932786-9335-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 775A0B1362276C37A09733E3CEDA3FC8205CFB046EBCE31B5DB8EB0AD349CA1F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_015525_736482_895B8199 
X-CRM114-Status: GOOD (  11.68  )
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

Use usb_role_string() to print role status, make the log readable.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/common/usb-conn-gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index 65d89140cd19..7dbe8baed029 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -83,11 +83,11 @@ static void usb_conn_detect_cable(struct work_struct *work)
 	else
 		role = USB_ROLE_NONE;
 
-	dev_dbg(info->dev, "role %d/%d, gpios: id %d, vbus %d\n",
-		info->last_role, role, id, vbus);
+	dev_dbg(info->dev, "role %s -> %s, gpios: id %d, vbus %d\n",
+		usb_role_string(info->last_role), usb_role_string(role), id, vbus);
 
 	if (info->last_role == role) {
-		dev_warn(info->dev, "repeated role: %d\n", role);
+		dev_warn(info->dev, "repeated role: %s\n", usb_role_string(role));
 		return;
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
