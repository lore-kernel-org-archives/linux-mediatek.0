Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C53EC4708C
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 06:12:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBC59613D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 06:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBC59613D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7CUldb/SYjYgQjmgthgoeuDuvagAQZyI6v4WAWrLeZs=; b=PLbMzjEmSqydXW
	/jBYyzfdYZWNjLnPlxqM2gqPV1sfbXqz8VdJ5e/hJ9U47xo8VJb54M0qLk+FnHRDddCFekq2gTLJK
	cZvcam6UfcuOkFiiiEnxgOFXT1RiF9r3GjXgdaHa8fxuTjftuVonSgte5/oU0x5nhkWjSXEYGRjGP
	R+torgDsLGj82aaCvSr3T/1LhV5KbbHezkuGyOFtR8FaMO/u2YvJ3bUBB7sx1Nu03ECj3h9xMjkVZ
	D4rcPbqskybQtarBJ4v7eG6YDOaYumoQ+Mv0ancajrR1XAVkE9hFEd7siniIT18FXqRawJePrGMkf
	NAzo60ZyrrsgW/Q0l/5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmVj0-00CUOu-4m; Fri, 28 May 2021 06:12:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmViF-00CTzi-Nz; Fri, 28 May 2021 06:11:17 +0000
X-UUID: c05c6b7b44a4415f831e249a5bf968d4-20210527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QPnfK6G7D2hUUfv2h3/zel56Cz29LKQriYvO/EN4IKI=; 
 b=bf0qxOzZRw/zF8TvbfZ2Qjyjcya/z1nkUMnKxH1/nX8Pm6qYA/t8K/FNvDbUHeM8Sw4Hd7dJYBIT0uVdv2XdSiFoUUn9OCRM4lubB5/TNrBVafLSU6DyHn0E/1+Ukcb2ojeYz2QkBNkTRSV0N2JWGYY8mYIqTxwVJQ5SMrD32rM=;
X-UUID: c05c6b7b44a4415f831e249a5bf968d4-20210527
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2000793830; Thu, 27 May 2021 23:11:07 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 23:11:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 May 2021 14:11:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 May 2021 14:11:03 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 2/5] usb: mtu3: remove repeated setting of speed
Date: Fri, 28 May 2021 14:10:57 +0800
Message-ID: <1622182260-23767-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1622182260-23767-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1622182260-23767-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_231115_815056_AE8D14D2 
X-CRM114-Status: GOOD (  12.68  )
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

mtu3_gadget_start() will set speed, no need set it again in
mtu3_gadget_set_speed(), just save the desired speed.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3.h        | 1 -
 drivers/usb/mtu3/mtu3_core.c   | 2 +-
 drivers/usb/mtu3/mtu3_gadget.c | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index a8a7ee11f7b7..531b9c78d7c3 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -425,7 +425,6 @@ void mtu3_ep_stall_set(struct mtu3_ep *mep, bool set);
 void mtu3_start(struct mtu3 *mtu);
 void mtu3_stop(struct mtu3 *mtu);
 void mtu3_dev_on_off(struct mtu3 *mtu, int is_on);
-void mtu3_set_speed(struct mtu3 *mtu, enum usb_device_speed speed);
 
 int mtu3_gadget_setup(struct mtu3 *mtu);
 void mtu3_gadget_cleanup(struct mtu3 *mtu);
diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 2ef528f39ba3..6b5da98de648 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -207,7 +207,7 @@ static void mtu3_intr_enable(struct mtu3 *mtu)
 	mtu3_writel(mbase, U3D_DEV_LINK_INTR_ENABLE, SSUSB_DEV_SPEED_CHG_INTR);
 }
 
-void mtu3_set_speed(struct mtu3 *mtu, enum usb_device_speed speed)
+static void mtu3_set_speed(struct mtu3 *mtu, enum usb_device_speed speed)
 {
 	void __iomem *mbase = mtu->mac_base;
 
diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 38f17d66d5bc..5e21ba05ebf0 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -577,7 +577,7 @@ mtu3_gadget_set_speed(struct usb_gadget *g, enum usb_device_speed speed)
 	dev_dbg(mtu->dev, "%s %s\n", __func__, usb_speed_string(speed));
 
 	spin_lock_irqsave(&mtu->lock, flags);
-	mtu3_set_speed(mtu, speed);
+	mtu->speed = speed;
 	spin_unlock_irqrestore(&mtu->lock, flags);
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
